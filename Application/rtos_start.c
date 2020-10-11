#include "atmel_start.h"
#include "rtos_start.h"

#include "spi.h"
#include "osConfig.h"
#include "logWriter.h"
#include "sdcard.h"
#include "rtc.h"
#include "pwm.h"

#include "dma.h"

#include "nRF24L01.h"

#include <string.h>

TaskHandle_t		    xStartupTask;
TaskHandle_t		    xCommTask;
TaskHandle_t		    xJournalTask;
TaskHandle_t		    xCalendarTask;

QueueHandle_t		    xTsQ;


void commTask(void *arg);
void startupTask(void *arg);
void journalTask(void *arg);
void CalendarTask(void *arg);



uint16_t src = 0xABCD;
uint16_t dst = 0x0000;

void startupTask(void *arg)
{
    (void)arg;
    BaseType_t xRet;

    DMA_Init();
    //DMA_memcpy(&dst, &src, 1);

    //PWM_Init();

    xRet = xTaskCreate(commTask,
                       "Comm",
                       TASK_COMM_STACK_SIZE,
                       NULL,
                       TASK_COMM_STACK_PRIORITY,
                       &xCommTask);
    assert(xRet == pdPASS, __FILE__, __LINE__);
    
    xRet = xTaskCreate(journalTask,
                       "Journal",
                       TASK_JOURNAL_STACK_SIZE,
                       NULL,
                       TASK_JOURNAL_STACK_PRIORITY,
                       &xJournalTask);
    assert(xRet == pdPASS, __FILE__, __LINE__);
    
    xRet = xTaskCreate(CalendarTask,
                       "Calendar",
                       TASK_CALENDAR_STACK_SIZE,
                       NULL,
                       TASK_CALENDAR_STACK_PRIORITY,
                       &xCalendarTask);
    assert(xRet == pdPASS, __FILE__, __LINE__);
    
    vTaskDelete(NULL);
}


void commTask(void *arg)
{
    (void)arg;
    uint8_t txData[SPI_QUEUE_SIZE];

    SPI0_Init();
    nRF24L01_vInit();

    /* Set test data */
    memset(txData, 0xAA, SPI_QUEUE_SIZE);

    while (1)
    {
        nRF24L01_vSendPayload((const char *)txData, SPI_QUEUE_SIZE);
        
        /* Wait until TX buffer full */
        vTaskDelay(pdMS_TO_TICKS(100));
    }
}


void RTOS_Init(void)
{
    BaseType_t xRet;

    xTsQ = xQueueCreate(TS_QUEUE_SIZE, sizeof(struct Calendar));
    assert(xTsQ != NULL, __FILE__, __LINE__);

    xRet = xTaskCreate(startupTask,
                       "Startup",
                       TASK_STARTUP_STACK_SIZE,
                       NULL,
                       TASK_STARTUP_STACK_PRIORITY,
                       &xStartupTask);
    assert(xRet == pdPASS, __FILE__, __LINE__);

    //SDCard_Test();

    vTaskStartScheduler();
}
