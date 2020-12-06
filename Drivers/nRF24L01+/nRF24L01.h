/**
 * nrf24l01.h
 * Driver for NRF24l01.
 */
#ifndef NRF24L01_H_
#define NRF24L01_H_

/* System headers */
#include <stdint.h>

/* Device vendor headers */

/* User headers */
#include "spi.h"

/* Global defines */

/* Commands */
#define R_REGISTER                  (0x00U)    /* Read command and status registers */
#define W_REGISTER                  (0x20U)    /* Write command and status registers - power down/standby modes only */
#define R_RX_PAYLOAD                (0x61U)    /* Read RX-payload */
#define W_TX_PAYLOAD                (0xA0U)    /* Write TX-payload */
#define FLUSH_TX                    (0xE1U)    /* Flush TX FIFO */
#define FLUSH_RX                    (0xE2U)    /* Flush RX FIFO */
#define REUSE_TX_PL                 (0xE3U)    /* Reuse last transmitted payload */
#define R_RX_PL_WID                 (0x63U)    /* Read RX payload width */
#define W_ACK_PAYLOAD               (0xA8U)    /* Write Payload to be transmitted together ACK packet */
#define W_ACK_PAYLOAD_NOACK         (0xB0U)    /* Disable AUTOACK in specific packet */
#define NOP                         (0xFFU)    /* No Operation to read STATUS register */

/* Registers */
#define CONFIG                      (0x00U)    /* Configuration Register */
#define EN_AA                       (0x01U)    /* Enable Auto Acknowledgement */
#define EN_RXADDR                   (0x02U)    /* Enabled RX Addresses */
#define SETUP_AW                    (0x03U)    /* Setup of Address Widths (common for all data pipes */
#define SETUP_RETR                  (0x04U)    /* Setup of Automatic Retransmission */
#define RF_CH                       (0x05U)    /* RF Channel */
#define RF_SETUP                    (0x06U)    /* RF Setup Register */
#define STATUS                      (0x07U)    /* Status Register */
#define RX_ADDR_P0                  (0x0AU)    /* Receive address data pipe 0 */
#define RX_ADDR_P1                  (0x0BU)    /* Receive address data pipe 1 */
#define RX_ADDR_P2                  (0x0CU)    /* Receive address data pipe 2 */
#define RX_ADDR_P3                  (0x0DU)    /* Receive address data pipe 3 */
#define RX_ADDR_P4                  (0x0EU)    /* Receive address data pipe 4 */
#define RX_ADDR_P5                  (0x0FU)    /* Receive address data pipe 5 */
#define TX_ADDR                     (0x10U)    /* Transmit address */
#define RX_PW_P0                    (0x11U)    /* RX Payload Width Pipe 0 */
#define RX_PW_P1                    (0x12U)    /* RX Payload Width Pipe 1 */
#define RX_PW_P2                    (0x13U)    /* RX Payload Width Pipe 2 */
#define RX_PW_P3                    (0x14U)    /* RX Payload Width Pipe 3 */
#define RX_PW_P4                    (0x15U)    /* RX Payload Width Pipe 4 */
#define RX_PW_P5                    (0x16U)    /* RX Payload Width Pipe 5 */

/* Register bits */
#define CONFIG_MASK_RX_DR(x)        (((uint8_t)(((uint8_t)(x)) << 6)) & 0x40U)
#define CONFIG_MASK_TX_DS(x)        (((uint8_t)(((uint8_t)(x)) << 5)) & 0x20U)
#define CONFIG_MASK_MAX_RT(x)       (((uint8_t)(((uint8_t)(x)) << 4)) & 0x10U)
#define CONFIG_EN_CRC(x)            (((uint8_t)(((uint8_t)(x)) << 3)) & 0x08U)
#define CONFIG_CRCO(x)              (((uint8_t)(((uint8_t)(x)) << 2)) & 0x04U)
#define CONFIG_PWR_UP(x)            (((uint8_t)(((uint8_t)(x)) << 1)) & 0x02U)
#define CONFIG_PRIM_RX(x)           (((uint8_t)(((uint8_t)(x)) << 0)) & 0x01U)

#define EN_AA_ENAA_P5(x)            (((uint8_t)(((uint8_t)(x)) << 5)) & 0x20U)
#define EN_AA_ENAA_P4(x)            (((uint8_t)(((uint8_t)(x)) << 4)) & 0x10U)
#define EN_AA_ENAA_P3(x)            (((uint8_t)(((uint8_t)(x)) << 3)) & 0x08U)
#define EN_AA_ENAA_P2(x)            (((uint8_t)(((uint8_t)(x)) << 2)) & 0x04U)
#define EN_AA_ENAA_P1(x)            (((uint8_t)(((uint8_t)(x)) << 1)) & 0x02U)
#define EN_AA_ENAA_P0(x)            (((uint8_t)(((uint8_t)(x)) << 0)) & 0x01U)

#define EN_RXADDR_ERX_P5(x)         (((uint8_t)(((uint8_t)(x)) << 5)) & 0x20U)
#define EN_RXADDR_ERX_P4(x)         (((uint8_t)(((uint8_t)(x)) << 4)) & 0x10U)
#define EN_RXADDR_ERX_P3(x)         (((uint8_t)(((uint8_t)(x)) << 3)) & 0x08U)
#define EN_RXADDR_ERX_P2(x)         (((uint8_t)(((uint8_t)(x)) << 2)) & 0x04U)
#define EN_RXADDR_ERX_P1(x)         (((uint8_t)(((uint8_t)(x)) << 1)) & 0x02U)
#define EN_RXADDR_ERX_P0(x)         (((uint8_t)(((uint8_t)(x)) << 0)) & 0x01U)

#define SETUP_AW_AW(x)              (((uint8_t)(((uint8_t)(x)) << 0)) & 0x03U)

#define SETUP_RETR_ARD(x)           (((uint8_t)(((uint8_t)(x)) << 4)) & 0xF0U)
#define SETUP_RETR_ARC(x)           (((uint8_t)(((uint8_t)(x)) << 0)) & 0x0FU)

#define STATUS_RX_DR(x)             (((uint8_t)(((uint8_t)(x)) << 6)) & 0x40U)
#define STATUS_TX_DS(x)             (((uint8_t)(((uint8_t)(x)) << 5)) & 0x20U)
#define STATUS_MAX_RT(x)            (((uint8_t)(((uint8_t)(x)) << 4)) & 0x10U)
#define STATUS_RX_P_NO(x)           (((uint8_t)(((uint8_t)(x)) << 1)) & 0x0EU)
#define STATUS_TX_FULL(x)           (((uint8_t)(((uint8_t)(x)) << 0)) & 0x01U)

#define RF_CH_MHZ(x)                (((uint8_t)(((uint8_t)(x)) << 0)) & 0x7FU)

#define RF_SETUP_CONT_WAVE(x)       (((uint8_t)(((uint8_t)(x)) << 7)) & 0x80U)
#define RF_SETUP_RF_DR_LOW(x)       (((uint8_t)(((uint8_t)(x)) << 5)) & 0x30U)
#define RF_SETUP_PLL_LOCK(x)        (((uint8_t)(((uint8_t)(x)) << 4)) & 0x10U)
#define RF_SETUP_RF_DR_HIGH(x)      (((uint8_t)(((uint8_t)(x)) << 3)) & 0x08U)
#define RF_SETUP_RF_PWR(x)          (((uint8_t)(((uint8_t)(x)) << 1)) & 0x06U)

#define RX_PW_PX(x)                 (((uint8_t)(((uint8_t)(x)) << 0)) & 0x3FU)

/* Global variables */


/* Function prototypes */
void      nRF24L01_vInit(void);
void      nRF24L01_vResetStatusFlags(void);
void      nRF24L01_vWriteRegister(const uint8_t ucRegister, const uint8_t ucValue);
void      nRF24L01_vSendCommand(const uint8_t ucCommand);
void      nRF24L01_vWriteAddressRegister(const uint8_t ucRegister, const uint8_t *pucValue, uint32_t ulLength);
void      nRF24L01_vSendPayload(const char *pucPayload, uint32_t ulLength);
uint8_t   nRF24L01_ucReadRegister(const uint8_t ucRegister);
uint8_t   nRF24L01_ucGetStatus(void);
void      nRF24L01_ISR(void);
uint32_t  nRF24L01_ulReadPayload(const char *pucPayload);

#endif /* NRF24L01_H_ */
