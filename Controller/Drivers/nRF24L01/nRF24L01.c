/**
 * nrf24l01.c
 * Driver for NRF24l01.
 */


/* Device vendor headers */
#include "MKL25Z4.h"
#include "fsl_bitaccess.h"

/* RTOS headers */
#include "FreeRTOS.h"
#include "task.h"

/* User headers */
#include "nRF24L01.h"
#include "defines.h"
#include "system.h"
#include "spi.h"
#include "tpm.h"

/* Global defines */

/* Global variables */

extern TaskHandle_t         xCommTaskHandle;
extern QueueHandle_t        xJobQueue;


/* Local defines */
#define NRF24L01_PULSE_DURATION     (15UL)

/* Signal edges */
#define CE                          (1UL) /* Chip Enable */
#define IRQ                         (2UL) /* Interrupt Request - active LOW */

#define MAX_PAYLOAD_LEN             (32UL)
#define ADDR_LEN_BYTES              (4UL)


/* Local function prototypes */
__STATIC_INLINE void    nRF24L01_vConfigureIRQ(void);
__STATIC_INLINE void    nRF24L01_vConfigureChipEnable(void);
__STATIC_INLINE void    nRF24L01_vSetChipEnable(const uint32_t ulState);
__STATIC_INLINE void    nRF24L01_vStartTransmission(void);
__STATIC_INLINE void    nRF24L01_vSetTransmitMode(void);
__STATIC_INLINE void    nRF24L01_vSetReceiveMode(void);
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

    /* RF Channel 2450 MHz */
    nRF24L01_vWriteRegister(RF_CH, RF_CH_MHZ(50));

    /* Set RX & TX address matching */
    const uint8_t ucTxAddr[ADDR_40BIT_LEN] = { 0x11, 0x22, 0x33, 0x44, 0x55 }; /* LSB written first */
    nRF24L01_vWriteAddressRegister(RX_ADDR_P0, ucTxAddr, ADDR_40BIT_LEN);
    nRF24L01_vWriteAddressRegister(TX_ADDR, ucTxAddr, ADDR_40BIT_LEN);
    
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
     * RX mode
     * IRQ on RX
     */
    nRF24L01_vSetReceiveMode();
}


/**
 * @brief   Set TX mode.
 * 
 * @param   None
 *             
 * @return  None
 */
__STATIC_INLINE void nRF24L01_vSetTransmitMode(void)
{
    nRF24L01_vSetChipEnable(LOW);
    nRF24L01_vWriteRegister(CONFIG, CONFIG_EN_CRC(1)
                                  | CONFIG_CRCO(1)
                                  | CONFIG_PWR_UP(1)
                                  | CONFIG_PRIM_RX(0)
                                  | CONFIG_MASK_TX_DS(1));
}


/**
 * @brief   Set RX mode.
 * 
 * @param   None
 *             
 * @return  None
 */
__STATIC_INLINE void nRF24L01_vSetReceiveMode(void)
{
    nRF24L01_vWriteRegister(CONFIG, CONFIG_EN_CRC(1)
                                  | CONFIG_CRCO(1)
                                  | CONFIG_PWR_UP(1)
                                  | CONFIG_PRIM_RX(1)
                                  | CONFIG_MASK_TX_DS(1));
    nRF24L01_vSetChipEnable(HIGH);
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
    PORTA->PCR[IRQ] = PORT_PCR_MUX(ALT1) | PORT_PCR_IRQC(10) | PORT_PCR_PE(1) | PORT_PCR_PS(1);
    
    /* Configure NVIC */
    NVIC_SetPriority(PORTA_IRQn, 2);
    NVIC_ClearPendingIRQ(PORTA_IRQn);
    NVIC_EnableIRQ(PORTA_IRQn);
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
    /* Select GPIO */
    PORTA->PCR[CE] = PORT_PCR_MUX(ALT1);
    
    /* Set output */
    FGPIOA->PDDR |= MASK(CE);

    /* Set LOW */
    FGPIOA->PCOR |= MASK(CE);
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
    configASSERT(ulState == LOW || (ulState == HIGH));

    /* Figure out whether to set or clear bit */
    const uint32_t *pulReg = (uint32_t *)&FGPIOA->PCOR - ulState; /* Subtract 0 - 1 words from PCOR address => pulReg = FGPIOA->PSOR/PCOR */

    /* Perform bitwise operation */
    BME_OR32(&(*pulReg), MASK(CE));
}


/**
 * @brief   Pulse CE line low for 10 us to start transmission.
 * 
 * @param   None
 * 
 * @return  None
 */
__STATIC_INLINE void nRF24L01_vStartTransmission(void)
{
    /* Send minimum 10 us pulse */
    TPM2->CNT = 0;
    TPM2_vStart();
    nRF24L01_vSetChipEnable(HIGH);
    while (TPM2->CNT < (TEN_MICROSECONDS * 2))
    {
        ; /* Wait until 10 us passed */
    }
    nRF24L01_vSetChipEnable(LOW);
    TPM2_vStop();

    /* Reset TPM2 counter */
    TPM2->CNT = 0;
}


/**
 * @brief   Read nRF24L01 status.
 * 
 * @param   None
 *             
 * @return  nRF24L01 status bits
 */
__STATIC_INLINE uint8_t nRF24L01_ucGetStatus(void)
{
    return SPI1_ucTransmitByte(NOP);
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
    ulLength++; /* Allocate byte for W_TX_PAYLOD */
    
    configASSERT((ulLength) < MAX_PAYLOAD_LEN);
    char ucRxData[ulLength];
    char ucTxData[ulLength];

    /* Transfer 1...32 bytes */
    nRF24L01_vWriteRegister(RX_PW_P0, RX_PW_PX(ulLength));

    nRF24L01_vSendCommand(FLUSH_TX);
    
    nRF24L01_vResetStatusFlags();

    /* Build message */
    ucTxData[0] = W_TX_PAYLOAD;
    for (uint32_t i = 0; i < ulLength - 1; i++)
    {
        ucTxData[i + 1] = pucPayload[i];
    }

    /* Transfer bytes to nRF24L01 */
    SPI1_vTransmitISR(ucTxData, ucRxData, ulLength);
    
    /* Send bytes over the air */
    nRF24L01_vStartTransmission();

    nRF24L01_ucResetStatusFlags();
}


/**
 * @brief   Read nRF24L01 register.
 * 
 * @param   ucRegister      Register to read.
 * 
 * @return  ucRegister      Register value.
 */
uint8_t nRF24L01_ucReadRegister(uint8_t const ucRegister)
{
    /* First transfer register, then value */
    uint8_t ucBuf[2];
    uint8_t ucData[2] = { R_REGISTER | ucRegister, NOP };

    SPI1_vTransmitISR(ucData, ucBuf, 2);

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
    configASSERT(ulLength <= MAX_PAYLOAD_LEN);

    nRF24L01_vSetChipEnable(LOW);

    ucDummy[0] = R_REGISTER | R_RX_PAYLOAD;
    SPI1_vTransmitISR(ucDummy, (uint8_t *)pucPayload, ulLength + 1);

    nRF24L01_vSetChipEnable(HIGH);

    return ulLength;
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
    char ucBuffer[MAX_PAYLOAD_LEN] = { '\0' };

    char ucData[] = { W_REGISTER | ucRegister, ucValue};

    /* First transfer register, then value */
    SPI1_vTransmitPolling(ucData, ucBuffer, 2);
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
    (void)SPI1_ucTransmitByte(ucCommand);
}


/**
 * @brief   Write to nRF24L01 address register.
 * 
 * @note    Blocks task until address written.
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
    configASSERT((ulLength) <= ADDR_40BIT_LEN);

    ulLength++; /* Allocate byte for W_REGISTER */
    char ucRxData[ulLength];
    char ucTxData[ulLength];

    /* Build message */
    ucTxData[0] = W_REGISTER | ucRegister;
    for (uint32_t i = 0; i < ulLength - 1; i++)
    {
        ucTxData[i + 1] = pucValue[i];
    }

    /* Transfer bytes to nRF24L01 */
    SPI1_vTransmitISR(ucTxData, ucRxData, ulLength);
}


/**
 * @brief   PORTA IRQ handler. Triggered when nRF24L01 transmits payload.
 * 
 * @param   None
 * 
 * @return  None
 */
void PORTA_IRQHandler(void)
{
    BaseType_t  xRet;
    BaseType_t  xHigherPrioTaskAwoken = pdFALSE;

    static xJobStruct  xJob;
    static xJobStruct *pxJob = &xJob;

    if (PORTA->ISFR & MASK(IRQ))
    {
        /* Clear status flag */
        PORTA->ISFR = MASK(IRQ);

        /* Each job needs to have a subscriber, but ISR can't
         * really have one, so just set subscriber xCommTask.
         * Also not processing any data when reading status.
         */
        xJob.xSubscriber = xCommTaskHandle;
        xJob.ulType      = RF_STATUS;

        xRet = xQueueSendToFrontFromISR(xJobQueue, &pxJob, &xHigherPrioTaskAwoken);
        if (xRet != pdTRUE)
        {
            __BKPT();
        }        
    }

    /* Force context switch if xHigherPriorityTaskWoken is set pdTRUE */
    portEND_SWITCHING_ISR(xHigherPrioTaskAwoken);
}
