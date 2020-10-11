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

#define CE                          (1UL)       /* Chip Enable */
#define IRQ                         (2UL)       /* Interrupt Request */

#define RXTX_ADDR_LEN               (5UL)
#define MAX_PAYLOAD_LEN             (32UL)
#define ADDR_40BIT_LEN              (6UL)

/* Commands */
#define R_REGISTER                  (0x00UL)    /* Read command and status registers */
#define W_REGISTER                  (0x20UL)    /* Write command and status registers - power down/standby modes only */
#define R_RX_PAYLOAD                (0x61UL)    /* Read RX-payload */
#define W_TX_PAYLOAD                (0xA0UL)    /* Write TX-payload */
#define FLUSH_TX                    (0xE1UL)    /* Flush TX FIFO */
#define FLUSH_RX                    (0xE2UL)    /* Flush RX FIFO */
#define REUSE_TX_PL                 (0xE3UL)    /* Reuse last transmitted payload */
#define R_RX_PL_WID                 (0x63UL)    /* Read RX payload width */
#define W_ACK_PAYLOAD               (0xA8UL)    /* Write Payload to be transmitted together ACK packet */
#define W_ACK_PAYLOAD_NOACK         (0xB0UL)    /* Disable AUTOACK in specific packet */
#define NOP                         (0xFFUL)    /* No Operation to read STATUS register */

/* Registers */
#define CONFIG                      (0x00UL)    /* Configuration Register */
#define EN_AA                       (0x01UL)    /* Enable Auto Acknowledgement */
#define EN_RXADDR                   (0x02UL)    /* Enabled RX Addresses */
#define SETUP_RETR                  (0x04UL)    /* Setup of Automatic Retransmission */
#define RF_CH                       (0x05UL)    /* RF Channel */
#define RF_SETUP                    (0x06UL)    /* RF Setup Register */
#define STATUS                      (0x07UL)    /* Status Register */
#define RX_ADDR_P0                  (0x0AUL)    /* Receive address data pipe 0 */
#define RX_ADDR_P1                  (0x0BUL)    /* Receive address data pipe 1 */
#define RX_ADDR_P2                  (0x0CUL)    /* Receive address data pipe 2 */
#define RX_ADDR_P3                  (0x0DUL)    /* Receive address data pipe 3 */
#define RX_ADDR_P4                  (0x0EUL)    /* Receive address data pipe 4 */
#define RX_ADDR_P5                  (0x0FUL)    /* Receive address data pipe 5 */
#define TX_ADDR                     (0x10UL)    /* Transmit address */
#define RX_PW_P0                    (0x11UL)    /* RX Payload Width Pipe 0 */
#define RX_PW_P1                    (0x12UL)    /* RX Payload Width Pipe 1 */
#define RX_PW_P2                    (0x13UL)    /* RX Payload Width Pipe 2 */
#define RX_PW_P3                    (0x14UL)    /* RX Payload Width Pipe 3 */
#define RX_PW_P4                    (0x15UL)    /* RX Payload Width Pipe 4 */
#define RX_PW_P5                    (0x16UL)    /* RX Payload Width Pipe 5 */

/* Register bits */
#define CONFIG_MASK_RX_DR(x)        (((uint8_t)(((uint8_t)(x)) << 6)) & 0x40UL)
#define CONFIG_MASK_TS_DS(x)        (((uint8_t)(((uint8_t)(x)) << 5)) & 0x20UL)
#define CONFIG_MASK_MAX_RT(x)       (((uint8_t)(((uint8_t)(x)) << 4)) & 0x10UL)
#define CONFIG_EN_CRC(x)            (((uint8_t)(((uint8_t)(x)) << 3)) & 0x08UL)
#define CONFIG_CRCO(x)              (((uint8_t)(((uint8_t)(x)) << 2)) & 0x04UL)
#define CONFIG_PWR_UP(x)            (((uint8_t)(((uint8_t)(x)) << 1)) & 0x02UL)
#define CONFIG_PRIM_RX(x)           (((uint8_t)(((uint8_t)(x)) << 0)) & 0x01UL)

#define EN_AA_ENAA_P5(x)            (((uint8_t)(((uint8_t)(x)) << 5)) & 0x20UL)
#define EN_AA_ENAA_P4(x)            (((uint8_t)(((uint8_t)(x)) << 4)) & 0x10UL)
#define EN_AA_ENAA_P3(x)            (((uint8_t)(((uint8_t)(x)) << 3)) & 0x08UL)
#define EN_AA_ENAA_P2(x)            (((uint8_t)(((uint8_t)(x)) << 2)) & 0x04UL)
#define EN_AA_ENAA_P1(x)            (((uint8_t)(((uint8_t)(x)) << 1)) & 0x02UL)
#define EN_AA_ENAA_P0(x)            (((uint8_t)(((uint8_t)(x)) << 0)) & 0x01UL)

#define EN_RXADDR_ERX_P5(x)         (((uint8_t)(((uint8_t)(x)) << 5)) & 0x20UL)
#define EN_RXADDR_ERX_P4(x)         (((uint8_t)(((uint8_t)(x)) << 4)) & 0x10UL)
#define EN_RXADDR_ERX_P3(x)         (((uint8_t)(((uint8_t)(x)) << 3)) & 0x08UL)
#define EN_RXADDR_ERX_P2(x)         (((uint8_t)(((uint8_t)(x)) << 2)) & 0x04UL)
#define EN_RXADDR_ERX_P1(x)         (((uint8_t)(((uint8_t)(x)) << 1)) & 0x02UL)
#define EN_RXADDR_ERX_P0(x)         (((uint8_t)(((uint8_t)(x)) << 0)) & 0x01UL)

#define SETUP_RETR_ARD(x)           (((uint8_t)(((uint8_t)(x)) << 4)) & 0xF0UL)
#define SETUP_RETR_ARC(x)           (((uint8_t)(((uint8_t)(x)) << 0)) & 0x0FUL)

#define STATUS_RX_DR(x)             (((uint8_t)(((uint8_t)(x)) << 6)) & 0x40UL)
#define STATUS_TX_DS(x)             (((uint8_t)(((uint8_t)(x)) << 5)) & 0x20UL)
#define STATUS_MAX_RT(x)            (((uint8_t)(((uint8_t)(x)) << 4)) & 0x10UL)
#define STATUS_RX_P_NO(x)           (((uint8_t)(((uint8_t)(x)) << 1)) & 0x0EUL)
#define STATUS_TX_FULL(x)           (((uint8_t)(((uint8_t)(x)) << 0)) & 0x01UL)

#define RF_CH_MHZ(x)                (((uint8_t)(((uint8_t)(x)) << 0)) & 0x7FUL)

#define RF_SETUP_CONT_WAVE(x)       (((uint8_t)(((uint8_t)(x)) << 7)) & 0x80UL)
#define RF_SETUP_RF_DR_LOW(x)       (((uint8_t)(((uint8_t)(x)) << 5)) & 0x30UL)
#define RF_SETUP_PLL_LOCK(x)        (((uint8_t)(((uint8_t)(x)) << 4)) & 0x10UL)
#define RF_SETUP_RF_DR_HIGH(x)      (((uint8_t)(((uint8_t)(x)) << 3)) & 0x08UL)
#define RF_SETUP_RF_PWR(x)          (((uint8_t)(((uint8_t)(x)) << 1)) & 0x06UL)

#define RX_PW_PX(x)                 (((uint8_t)(((uint8_t)(x)) << 0)) & 0x3FUL)


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
