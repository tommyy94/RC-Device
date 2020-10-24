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
#include "joystick.h"
#include "hmi.h"
#include "adc.h"
#include "tpm.h"
#include "dma.h"
#include "nRF24L01.h"
#include "pit.h"


/* Global defines */

/* Task priorities */
#define COMMTASKPRIORITY        (7UL)
#define HMITASKPRIORITY         (6UL)
#define JOYSTICKTASKPRIORITY    (8UL)
#define STARTUPTASKPRIORITY     (10UL)

/* Task sizes */
#define COMMTASKSIZE            (128UL)
#define HMITASKSIZE             (64UL)
#define JOYSTICKTASKSIZE        (512UL)
#define STARTUPTASKSIZE         (512UL)

    
/* Global variables */
    

/* Global function prototypes */
void vStartupTask(void *const pvParam);
void vApplicationIdleHook(void);
void vAssertCalled(const uint32_t ulLine, char *const pcFile);
