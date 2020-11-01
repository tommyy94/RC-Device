/**
 * nrf24l01.h
 * Driver for NRF24l01.
 */
#pragma once

/* System headers */
#include <stdint.h>

/* Device vendor headers */

/* User headers */

/* Global defines */

/* Commands */
#define R_REGISTER                  (0x00U)     /* Read command and status registers */
#define W_REGISTER                  (0x20U)     /* Write command and status registers - power down/standby modes only */
#define R_RX_PAYLOAD                (0x61U)     /* Read RX-payload */
#define W_TX_PAYLOAD                (0xA0U)     /* Write TX-payload */
#define FLUSH_TX                    (0xE1U)     /* Flush TX FIFO */
#define FLUSH_RX                    (0xE2U)     /* Flush RX FIFO */
#define REUSE_TX_PL                 (0xE3U)     /* Reuse last transmitted payload */
#define ACTIVATE                    (0x50U)     /* ACTIVATE R_RX_PL_WID, W_ACK_PAYLOAD and W_TX_PAYLOAD_NOACK */
#define ACTIVATE_DATA               (0x73U)     /* Sent after ACTIVATE COMMAND */
#define R_RX_PL_WID                 (0x63U)     /* Read RX payload width */
#define W_ACK_PAYLOAD               (0xA8U)     /* Write Payload to be transmitted together ACK packet */
#define W_ACK_PAYLOAD_NOACK         (0xB0U)     /* Disable AUTOACK in specific packet */
#define NOP                         (0xFFU)     /* No Operation to read STATUS register */

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
#define CONFIG_MASK_TX_DS(x)        (((uint8_t)(((uint8_t)(x)) << 5)) & 0x20UL)
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

/* Global variables */


/* Function prototypes */
void nRF24L01_vInit(void);
void nRF24L01_vResetStatusFlags(void);
void nRF24L01_vWriteRegister(const uint8_t ucRegister, const uint8_t ucValue);
void nRF24L01_vSendCommand(const uint8_t ucCommand);
void nRF24L01_vWriteAddressRegister(const uint8_t ucRegister, const uint8_t *pucValue, uint32_t ulLength);
void nRF24L01_vSendPayload(const char *pucPayload, uint32_t ulLength);
