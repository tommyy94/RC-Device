/**
 * comm.h
 * This header handles all communication tasks. 
 */

#pragma once

/* System headers */
#include <stdint.h>
#include <string.h>
#include <stdarg.h>

/* Device vendor headers */
#include "MKL25Z4.h"
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"

/* User headers */
#include "defines.h"
#include "tpm.h"

/* Global defines */
enum
{
    COMM_EVT_SEND_PAYLOAD = (1u << 0),
    COMM_EVT_READ_PAYLOAD = (1u << 1),
    COMM_EVT_GET_STATUS   = (1u << 2),
    COMM_EVT_SET_CHANNEL  = (1u << 3),
    COMM_EVT_RESET        = (1u << 4),
    COMM_EVT_MASK         = 0xF
};


typedef struct
{
    uint8_t  *pucTxData;
    uint32_t  ulTxLen;
    uint8_t  *pucRxData;
    uint32_t  ulRxLen;
} MessageQueue;


/* Global variables */
extern TaskHandle_t xCommTask;


/* Global function prototypes */
void vCommTask(void *const pvParam);
