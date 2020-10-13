#pragma once

/* System headers */

/* Device vendor headers */
#include "MKL25Z4.h"

#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "event_groups.h"

/* User headers */
#include "comm.h"
//#include "adc.h"
//#include "tpm.h"
#include "dma.h"
#include "nRF24L01.h"


/* Global defines */
#define MAX_QUEUE_SIZE          (32UL)

/* Task priorities */
//#define ANALOGTASKPRIORITY      (4UL)
#define COMMTASKPRIORITY        (7UL)
#define STARTUPTASKPRIORITY     (10UL)

/* Task sizes */
//#define ANALOGTASKSIZE          (2048UL)
#define COMMTASKSIZE            (256UL)
#define STARTUPTASKSIZE         (1024L)

    
/* Global variables */
extern QueueHandle_t      xCommQueue;
//extern QueueHandle_t      xAnalogQueue;
extern EventGroupHandle_t xCommEvent;
    

/* Global function prototypes */
void vStartupTask(void *const pvMotorTimers);
void vApplicationIdleHook(void);
void vAssertCalled(const uint32_t ulLine, char *const pcFile);
