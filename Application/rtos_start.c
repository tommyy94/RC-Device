#include "atmel_start.h"
#include "rtos_start.h"

#include "spi.h"
#include "osConfig.h"
#include "logWriter.h"
#include "sdcard.h"
#include "rtc.h"
#include "pwm.h"

#include <string.h>

TaskHandle_t		    xStartupTask;
TaskHandle_t		    xCommTask;
TaskHandle_t		    xJournalTask;
TaskHandle_t		    xCalendarTask;
QueueHandle_t		    xTsQ;
QueueHandle_t		    xTxQ;
QueueHandle_t		    xRxQ;
SemaphoreHandle_t           spiMutex;


void commTask(void *arg);
void startupTask(void *arg);
void journalTask(void *arg);
void CalendarTask(void *arg);


void startupTask(void *arg)
{
    (void)arg;
    BaseType_t xRet;

    PWM_Init();

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
    uint8_t rxData[SPI_QUEUE_SIZE];
    bool spiOk;
    Spi *spi = SPI0;

    SPI0_Init();

    /* Dummy data */
    memset(txData, 0xAA, SPI_QUEUE_SIZE);
    memset(rxData, 0x00, SPI_QUEUE_SIZE);
    
    /* Test SPI before tasking */
    spiOk = SPI_SelfTest(spi);
    if (spiOk != true)
    {
        /* Log error and suspend task */
        xTaskNotify(xJournalTask, SPI_SELFTEST_FAIL, eSetBits);
        vTaskSuspend(NULL);
    }
    
    while (1)
    {
        SPI_TxMessageIrq(spi, txData, rxData, SPI_QUEUE_SIZE);
        
        /* Wait until TX buffer full */
        vTaskDelay(pdMS_TO_TICKS(100));
    }
}


void RTOS_Init(void)
{
    BaseType_t xRet;

    spiMutex = xSemaphoreCreateMutex();
    
    xTsQ = xQueueCreate(TS_QUEUE_SIZE, sizeof(struct Calendar));
    xTxQ = xQueueCreate(SPI_QUEUE_SIZE, sizeof(uint8_t));
    xRxQ = xQueueCreate(SPI_QUEUE_SIZE, sizeof(uint8_t));
    assert(xTsQ != NULL, __FILE__, __LINE__);
    assert(xTxQ != NULL, __FILE__, __LINE__);
    assert(xRxQ != NULL, __FILE__, __LINE__);

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
