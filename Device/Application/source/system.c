/* System includes */
#include <string.h>

/* Application includes */
#include "atmel_start.h"
#include "system.h"
#include "logWriter.h"
#include "throttle.h"

/* Driver includes */
#include "spi.h"
#include "sdcard.h"
#include "rtc.h"
#include "pwm.h"
#include "twi.h"
#include "dma.h"
#include "nRF24L01.h"
#include "twi.h"

/* RTOS includes */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"


TaskHandle_t		    xStartupTask;
TaskHandle_t		    xCommTask;
TaskHandle_t		    xJournalTask;
TaskHandle_t		    xCalendarTask;
TaskHandle_t		    xThrottleTask;

QueueHandle_t		    xTsQ;
QueueHandle_t               xJobQueue;
QueueHandle_t               xTwiQueue;
SemaphoreHandle_t           xTwiSema;


void commTask(void *arg);
void startupTask(void *arg);
void journalTask(void *arg);
void CalendarTask(void *arg);


static void Sys_vInit(void);
static void Sys_vCreateEvents(void);


/**
 * @brief   Startup task.
 *
 * @param   None
 *
 * @retval  None
 */
void startupTask(void *arg)
{
    (void)arg;
    BaseType_t xRet;

    /* Must first create events so they can be called in Sys_vInit() */
    Sys_vCreateEvents();

    /* Must call Sys_vInit() as some drivers call the OS API */
    Sys_vInit();

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
    
    xRet = xTaskCreate(throttleTask,
                       "Throttle",
                       TASK_THROTTLE_STACK_SIZE,
                       NULL,
                       TASK_THROTTLE_STACK_PRIORITY,
                       &xThrottleTask);
    assert(xRet == pdPASS, __FILE__, __LINE__);
    
    /* startupTask can now be deleted */
    vTaskDelete(NULL);
}


void commTask(void *arg)
{
    (void)arg;
    uint8_t     ucStatus;
    xJobStruct *pxJob = NULL;

    while (1)
    {
        /* Dequeue new item from the job queue */
        (void)xQueueReceive(xJobQueue, &pxJob, portMAX_DELAY);

        /* Job should always have a subscriber so we can notify when job done */
        assert(pxJob->xSubscriber != NULL, __FILE__, __LINE__);

        switch (pxJob->ulType)
        {
            case RF_SEND:
                nRF24L01_vSendPayload((const char *)pxJob->pucData, pxJob->ulLen);
                break;
            case RF_READ:
                pxJob->ulLen = nRF24L01_ulReadPayload((const char *)pxJob->pucData);
                xTaskNotifyGiveIndexed(pxJob->xSubscriber, 3);
                break;
            case RF_STATUS:
                ucStatus = nRF24L01_ucGetStatus();
                if ((ucStatus & STATUS_TX_DS(1)) != 0)
                {
                    /* Payload sent - no action needed */
                }
                if ((ucStatus & STATUS_RX_DR(1)) != 0)
                {
                    /* Give event group a notification we have a new payload
                     * so they can order a new job.
                     */
                    (void)xTaskNotifyGiveIndexed(xThrottleTask, 2);
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
    }
}


/**
 * @brief   Initialize drivers and middleware.
 *
 * @param   None
 *
 * @retval  None
 */
static void Sys_vInit(void)
{
    RTC_Init();

    DMA_Init();
    SPI0_Init();
    nRF24L01_vInit();

    TWI0_vInit();

    PWM_Init();
}

/**
 * @brief   Create RTOS events, queues, mutexes, sempahores, etc.
 *
 * @param   None
 *
 * @retval  None
 */
static void Sys_vCreateEvents(void)
{
    xTsQ = xQueueCreate(TS_QUEUE_SIZE, sizeof(struct Calendar));
    assert(xTsQ != NULL, __FILE__, __LINE__);

    xJobQueue = xQueueCreate(JOB_QUEUE_SIZE, sizeof(xJobStruct *));
    configASSERT(xJobQueue != NULL);
    
    xTwiQueue = xQueueCreate(TWI_QUEUE_SIZE, sizeof(TWI_Msg *));
    configASSERT(xTwiQueue != NULL);

    xTwiSema = xSemaphoreCreateBinary();
    configASSERT(xTwiSema != NULL);
}


/**
 * @brief   Initialize RTOS and start the scheduler.
 *
 * @param   None
 *
 * @retval  None
 */
void RTOS_Init(void)
{
    BaseType_t xRet = xTaskCreate(startupTask,
                                  "Startup",
                                  TASK_STARTUP_STACK_SIZE,
                                  NULL,
                                  TASK_STARTUP_STACK_PRIORITY,
                                  &xStartupTask);
    assert(xRet == pdPASS, __FILE__, __LINE__);

    vTaskStartScheduler();

    while (1)
    {
        ; /* Should not get here */
    }
}
