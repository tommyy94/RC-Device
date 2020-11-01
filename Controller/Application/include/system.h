#pragma once

/* System headers */
#include "stdint.h"

/* Device vendor headers */

/* User headers */


/* Global defines */

/* Task priorities */
#define COMMTASKPRIORITY        (7UL)
#define HMITASKPRIORITY         (6UL)
#define JOYSTICKTASKPRIORITY    (8UL)
#define STARTUPTASKPRIORITY     (10UL)

/* Task sizes */
#define COMMTASKSIZE            (256UL)
#define HMITASKSIZE             (64UL)
#define JOYSTICKTASKSIZE        (512UL)
#define STARTUPTASKSIZE         (512UL)

/* Interrupt priorities */
#define SPI1_IRQ_PRIO           (5UL)

    
/* Global variables */
    

/* Global function prototypes */
void vStartupTask(void *const pvParam);
void vApplicationIdleHook(void);
void vAssertCalled(const uint32_t ulLine, char *const pcFile);
