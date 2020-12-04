/**
 * nrf24l01.c
 * Driver for NRF24l01.
 */
#include <same70q21b.h>
#include <utils_assert.h>

#include <FreeRTOS.h>
#include <task.h>

#include "nRF24L01.h"
#include "spi.h"


/* Local defines */
#define HIGH                        (1UL)
#define LOW                         (0UL)

#define CE                          (27UL)          /* Chip Enable pin        */
#define IRQ                         (1 << 28UL)     /* Interrupt Request pin  */

#define MAX_PAYLOAD_LEN             (32UL)
#define ADDR_LEN_BYTES              (4UL)


/* Local function prototypes */
__STATIC_INLINE void    nRF24L01_vConfigureIRQ(void);
__STATIC_INLINE void    nRF24L01_vConfigureChipEnable(void);
__STATIC_INLINE void    nRF24L01_vSetChipEnable(const uint32_t ulState);
__STATIC_INLINE void    nRF24L01_vStartTransmission(void);
__STATIC_INLINE uint8_t nRF24L01_ucGetRxFifoDepth(void);

/* Function descriptions */

/**
 * @brief   Initialize nRF24L01 and masters peripherals.
 * 
 * @param   None
 * 
 * @return  None
 */
void nRF24L01_vInit(void)
{
    nRF24L01_vConfigureIRQ();
    nRF24L01_vConfigureChipEnable();
    nRF24L01_vSetChipEnable(LOW);

    nRF24L01_vResetStatusFlags();

    /* RF Channel 2450 MHz */
    nRF24L01_vWriteRegister(RF_CH, RF_CH_MHZ(2));

    nRF24L01_ucReadRegister(RF_CH);

    /* Set address width to 4 bytes */
    nRF24L01_vWriteRegister(SETUP_AW, SETUP_AW_AW(2));

    /* Set RX & TX address matching */
    const uint8_t ucTxAddr[ADDR_LEN_BYTES] = { 0x11, 0x22, 0x33, 0x44 }; /* LSB written first */
    nRF24L01_vWriteAddressRegister(RX_ADDR_P0, ucTxAddr, ADDR_LEN_BYTES);
    nRF24L01_vWriteAddressRegister(TX_ADDR, ucTxAddr, ADDR_LEN_BYTES);
    
    /* Enable data pipe 0 */
    nRF24L01_vWriteRegister(EN_RXADDR, EN_RXADDR_ERX_P0(1));

    /* Auto ACK data pipe 0 */
    nRF24L01_vWriteRegister(EN_AA, EN_AA_ENAA_P0(1));

    /**
     * 500 us delay between retries
     * 10 retries
     */
    nRF24L01_vWriteRegister(SETUP_RETR, SETUP_RETR_ARD(1) | SETUP_RETR_ARC(3));

    /**
     * Enable CRC
     * 2 byte CRC
     * Power Up
     * TX mode
     */
    nRF24L01_vWriteRegister(CONFIG, CONFIG_EN_CRC(1) | CONFIG_CRCO(1) | CONFIG_PWR_UP(1));
}


/**
 * @brief   Configure IRQ pin.
 * 
 * @param   None
 *             
 * @return  None
 */
__STATIC_INLINE void nRF24L01_vConfigureIRQ(void)
{
    /**
     * Select GPIO
     * Interrupt on falling edge
     * Enable internal pullup resistor
     */
    //PORTA->PCR[IRQ] = PORT_PCR_MUX(ALT1) | PORT_PCR_IRQC(10) | PORT_PCR_PE(1) | PORT_PCR_PS(1);
    
    /* Configure NVIC */
    //NVIC_SetPriority(PORTA_IRQn, 2);
    //NVIC_ClearPendingIRQ(PORTA_IRQn);
    //NVIC_EnableIRQ(PORTA_IRQn);
}


/**
 * @brief   Configure CE pin as output.
 * 
 * @param   None
 *             
 * @return  None
 */
__STATIC_INLINE void nRF24L01_vConfigureChipEnable(void)
{
    Pio *pio = PIOD;

    /* Select GPIO */
    pio->PIO_PER = PIO_PER_P27_Msk;
    
    /* Configure as output */
    pio->PIO_OER = PIO_OER_P27_Msk;

    /* Set LOW */
    pio->PIO_CODR = PIO_CODR_P27_Msk;
}


/**
 * @brief   Set CE line high/low.
 * 
 * @param   ulState     HIGH/LOW
 *             
 * @return  None
 */
__STATIC_INLINE void nRF24L01_vSetChipEnable(const uint32_t ulState)
{
    assert((ulState == LOW) || (ulState == HIGH), __FILE__, __LINE__);
    Pio *pio = PIOD;

    /* Figure out whether to set or clear bit
     * Subtract 0 - 1 words from CODR address => pulReg = pio->SODR/CODR
     */
    uint32_t *const pulReg = (uint32_t *)&pio->PIO_CODR - ulState;

    *pulReg = 1 << CE;
}


/**
 * @brief   Pulse CE line high for 10 us to start transmission.
 * 
 * @param   None
 * 
 * @return  None
 */
__STATIC_INLINE void nRF24L01_vStartTransmission(void)
{
    Pio *piod = PIOD;

    /* Send minimum 10 us pulse */
    nRF24L01_vSetChipEnable(HIGH);
    for (uint32_t i = 0; i < 0x800; i++)
    {
        __NOP(); /* ~20 us for testing */
    }
    nRF24L01_vSetChipEnable(LOW);

    PIO_EnableIRQ(piod, IRQ);
}


/**
 * @brief   Reset the given mask of status bits.
 * 
 * @param   None
 *             
 * @return  None
 */
void nRF24L01_vResetStatusFlags(void)
{
    /**
     * Reset data received flag
     * Reset transmission succeeded flag
     * Reset transmission failed flag
     */
    nRF24L01_vWriteRegister(STATUS, STATUS_RX_DR(1) | STATUS_TX_DS(1) | STATUS_MAX_RT(1));
}


/**
 * @brief   Transmit payload.
 * 
 * @note    Message max length 32 bytes.
 * 
 * @param   pucPayload      Payload to send.
 *
 * @param   ulLength        Transaction length
 *             
 * @return  None
 */
void nRF24L01_vSendPayload(const char *pucPayload, uint32_t ulLength)
{
    uint32_t i = 0;
    uint32_t j = 0;

    uint16_t uRxData[MAX_PAYLOAD_LEN] = { 0 };
    uint16_t uTxData[MAX_PAYLOAD_LEN] = { 0 };

    ulLength += 2; /* Allocate 2 bytes for W_TX_PAYLOD */
    configASSERT((ulLength) < MAX_PAYLOAD_LEN);

    /* Transfer 1...32 bytes */
    nRF24L01_vWriteRegister(RX_PW_P0, RX_PW_PX(ulLength));

    nRF24L01_vSendCommand(FLUSH_TX);
    
    nRF24L01_vResetStatusFlags();

    /* Transfer 2 bytes at once so halve the length */
    ulLength = ulLength - (ulLength / 2);

    /* Build message */
    uTxData[i++] = (W_TX_PAYLOAD << 8); /* Lower byte empty */
    for (; i < ulLength; i++)
    {
        uTxData[i]  = (pucPayload[j++] << 8);
        uTxData[i] |=  pucPayload[j++];
    }

    /* Transfer bytes to nRF24L01 */
    SPI0_DMA_TransmitMessage(uTxData, uRxData, ulLength);
    
    nRF24L01_vStartTransmission();
}


/**
 * @brief   Write nRF24L01 register.
 * 
 * @param   ucRegister      Register to write.
 * 
 * @param   ucValue         Value to write.
 * 
 * @return  None
 */
void nRF24L01_vWriteRegister(const uint8_t ucRegister, const uint8_t ucValue)
{
    /* First transfer register, then value */
    uint8_t ucBuf[2];
    uint8_t ucData[2] = { W_REGISTER | ucRegister, ucValue };

    SPI0_DMA_TransmitMessage(ucData, ucBuf, 2);
}


/**
 * @brief   Read nRF24L01 register.
 * 
 * @param   ucRegister      Register to read.
 * 
 * @return  Register value
 */
uint8_t nRF24L01_ucReadRegister(const uint8_t ucRegister)
{
    /* First transfer register, then value */
    uint8_t ucBuf[2];
    uint8_t ucData[2] = { R_REGISTER | ucRegister, NOP };

    SPI0_DMA_TransmitMessage(ucData, ucBuf, 2);

    /* First element holds status, second the register value */
    return ucBuf[1];
}


/**
 * @brief   Simple wrapper to get RX FIFO depth.
 * 
 * @param   None
 * 
 * @return  RX FIFO length.
 */
__STATIC_INLINE  uint8_t nRF24L01_ucGetRxFifoDepth(void)
{
    return nRF24L01_ucReadRegister(R_RX_PL_WID);
}


/**
 * @brief   Write command to nRF24L01.
 * 
 * @param   ucCommand
 * 
 * @return  None
 */
void nRF24L01_vSendCommand(const uint8_t ucCommand)
{
    SPI0_vTransmitByte(ucCommand);
}


/**
 * @brief   Write to nRF24L01 address register.
 * 
 * @param   ucRegister      Register to write.
 * 
 * @param   ucValue         Value to write.
 * 
 * @param   ulLength        Transaction length
 * 
 * @return  None
 */
void nRF24L01_vWriteAddressRegister(const uint8_t ucRegister, const uint8_t *pucValue, uint32_t ulLength)
{
    assert((ulLength) <= ADDR_LEN_BYTES, __FILE__, __LINE__);

    uint8_t uRxData[MAX_PAYLOAD_LEN] = { 0 };
    uint8_t uTxData[MAX_PAYLOAD_LEN] = { 0 };

    ulLength++; /* "Allocate" 1 byte for W_REGISTER */
    configASSERT((ulLength) < MAX_PAYLOAD_LEN);

    /* Build message */
    uTxData[0] = W_REGISTER | ucRegister; /* Lower byte empty */
    for (uint32_t i = 1; i < ulLength; i++)
    {
        uTxData[i] = pucValue[i - 1];
    }

    /* Transfer bytes to nRF24L01 */
    SPI0_DMA_TransmitMessage(uTxData, uRxData, ulLength);
}


/**
 * @brief   Handle nRF24L01 IRQ.
 * 
 * @param   None
 * 
 * @return  None
 */
void PIOD_ISR(void)
{
    BaseType_t  xRet;
    BaseType_t  xHigherPrioTaskAwoken = pdFALSE;

    static xJobStruct  xJob;
    static xJobStruct *pxJob = &xJob;

    /* Each job needs to have a subscriber, but ISR can't
     * really have one, so just set subscriber xCommTask.
     * Also not processing any data when reading status.
     */
    xJob.xSubscriber = xCommTask;
    xJob.ulType      = RF_STATUS;

    xRet = xQueueSendToFrontFromISR(xJobQueue, &pxJob, NULL, &xHigherPrioTaskAwoken);
    if (xRet != pdTRUE)
    {
        xTaskNotifyFromISR(xJournalTask, JOB_QUEUE_FULL, eSetBits, &xHigherPrioTaskAwoken);
    }

    portEND_SWITCHING_ISR(xHigherPrioTaskAwoken);
}


/**
 * @brief   Read nRF24L01 payload.
 * 
 * @param   pucPayload  Pointer to payload.
 * 
 * @return  ulLength    Payload length.
 */
uint32_t nRF24L01_ulReadPayload(const char *pucPayload)
{
    /* First need to tell RF which register to read,
     * add to array length.
     */
    uint8_t  ucDummy[MAX_PAYLOAD_LEN + 1];
    uint32_t ulLength;

    /* First figure out transaction length */
    ulLength = (uint32_t)nRF24L01_ucGetRxFifoDepth();
    assert(ulLength <= MAX_PAYLOAD_LEN, __FILE__, __LINE__);

    nRF24L01_vSetChipEnable(LOW);

    ucDummy[0] = R_REGISTER | R_RX_PAYLOAD;
    SPI0_DMA_TransmitMessage(ucDummy, (uint8_t *)pucPayload, ulLength + 1);

    nRF24L01_vSetChipEnable(HIGH);

    return ulLength;
}
