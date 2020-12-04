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
__STATIC_INLINE void nRF24L01_vConfigureIRQ(void);
__STATIC_INLINE void nRF24L01_vConfigureChipEnable(void);
__STATIC_INLINE void nRF24L01_vSetChipEnable(const uint32_t ulState);
__STATIC_INLINE void nRF24L01_vStartTransmission(void);

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
 * @brief   Pulse CE line low for 10 �s to start transmission.
 * 
 * @param   None
 * 
 * @return  None
 */
__STATIC_INLINE void nRF24L01_vStartTransmission(void)
{
    /* Send minimum 10 us pulse */
    nRF24L01_vSetChipEnable(HIGH);
    vTaskDelay(1);
    nRF24L01_vSetChipEnable(LOW);
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
    uint16_t uData = ((W_REGISTER | ucRegister)  << 8) | ucValue;

    SPI0_vTransmitHalfword(uData);
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
    SPI0_vTransmitHalfword(ucCommand << 8);
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
    assert((ulLength) <= ADDR_40BIT_LEN, __FILE__, __LINE__);

    uint16_t uRxData[MAX_PAYLOAD_LEN] = { 0 };
    uint16_t uTxData[MAX_PAYLOAD_LEN] = { 0 };
    uint32_t i = 0;
    uint32_t j = 0;

    ulLength += 2; /* "Allocate" 2 bytes for W_REGISTER */
    configASSERT((ulLength) < MAX_PAYLOAD_LEN);

    /* Transfer 2 bytes at once so halve the length */
    ulLength = ulLength - (ulLength / 2);

    /* Build message */
    uTxData[i++] = ((W_REGISTER | ucRegister) << 8); /* Lower byte empty */
    for (; i < ulLength; i++)
    {
        uTxData[i]  = (pucValue[j++] << 8);
        uTxData[i] |=  pucValue[j++];
    }

    /* Transfer bytes to nRF24L01 */
    SPI0_DMA_TransmitMessage(uTxData, uRxData, ulLength);
}
