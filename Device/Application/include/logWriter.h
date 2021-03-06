#ifndef LOGWRITER_H_
#define LOGWRITER_H_

#include <stdint.h>
#include "FreeRTOS.h"
#include "task.h"


enum
{
    SPI_ERROR           = (1u << 0),
    SPI_SELFTEST_FAIL   = (1u << 1),
    RTC_SETTIME_ERROR   = (1u << 2),
    DMA_ERROR           = (1u << 3),
    RTOS_ERROR          = (1u << 4),
    RF_ERROR            = (1u << 5),
    RF_BAD_JOB          = (1u << 6),
    JOB_QUEUE_FULL      = (1u << 7),
    THROTTLE_TIMEOUT    = (1u << 8),
    I2C_ERROR           = (1u << 9)
};


typedef struct Diagnostics
{
    uint32_t uptime;            /* Seconds      */
    uint32_t battery;           /* Percentage   */
    uint32_t totalDistance;     /* Kilometers   */
    uint32_t dataTransferred;   /* KB           */
} Diagnostics;


void journalTask(void *arg);


#endif /* LOGWRITER_H_ */
