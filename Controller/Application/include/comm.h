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
#include "system.h"

/* Global defines */
enum
{
    RF_SEND = 0,
    RF_READ,
    RF_STATUS
};


#define JOB_QUEUE_SIZE    (32u)

typedef struct
{
    uint8_t        pucData[JOB_QUEUE_SIZE];
    uint32_t       ulLen;
    uint32_t       ulType;
    TaskHandle_t   xSubscriber;
} xJobStruct;

#define MAX_QUEUE_SIZE          (32UL)


/* Global variables */
extern TaskHandle_t xCommTask;


/* Global function prototypes */
void vCommTask(void *const pvParam);
