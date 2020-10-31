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

/* Global variables */


/* Function prototypes */
void nRF24L01_vInit(void);
void nRF24L01_vResetStatusFlags(void);
void nRF24L01_vWriteRegister(const uint8_t ucRegister, const uint8_t ucValue);
void nRF24L01_vSendCommand(const uint8_t ucCommand);
void nRF24L01_vWriteAddressRegister(const uint8_t ucRegister, const uint8_t *pucValue, uint32_t ulLength);
void nRF24L01_vSendPayload(const char *pucPayload, uint32_t ulLength);
