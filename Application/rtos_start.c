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

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

#include <string.h>


TaskHandle_t		    xStartupTask;
TaskHandle_t		    xCommTask;
TaskHandle_t		    xJournalTask;
TaskHandle_t		    xCalendarTask;

QueueHandle_t		    xTsQ;
QueueHandle_t               xJobQueue;


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
    uint8_t ucStatus;
    xJobStruct  xJob;
    xJobStruct *pxJob = &xJob;

    SPI0_Init();
    nRF24L01_vInit();

    while (1)
    {
        /* Dequeue new item from the job queue */
        (void)xQueueReceive(xJobQueue, &pxJob, portMAX_DELAY);

        /* Job should always have a subscriber so we can notify when job done */
        assert(pxJob->xSubscriber != NULL, __FILE__, __LINE__);

        switch (xJob.ulType)
        {
            case RF_SEND:
                nRF24L01_vSendPayload((const char *)pxJob->pucData, pxJob->ulLen);
                break;
            case RF_READ:
                pxJob->ulLen = nRF24L01_ulReadPayload((const char *)pxJob->pucData);
                break;
            case RF_STATUS:
                ucStatus = nRF24L01_ucGetStatus();
                if ((ucStatus & STATUS_TX_DS(1)) != 0)
                {
                    /* Payload sent - no action needed */
                }
                if ((ucStatus & STATUS_RX_DR(1)) != 0)
                {
                    /* Payload received - order a read operation */
                }
                if ((ucStatus & STATUS_MAX_RT(1)) != 0)
                {
                    /* Max retransmits - payload not sent */
                    xTaskNotify(xJournalTask, RF_ERROR, eSetBits);
                }
                break;
            default:
                /* Something went wrong real bad */
                xTaskNotify(xJournalTask, RF_BAD_JOB, eSetBits);
                break;
        }

        xTaskNotifyGive(pxJob->xSubscriber);
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
