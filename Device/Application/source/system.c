/* System includes */
#include <string.h>

/* Application includes */
#include "atmel_start.h"
#include "system.h"
#include "logWriter.h"
#include "throttle.h"
#include "gyro.h"

/* Driver includes */
#include "spi.h"
#include "sdcard.h"
#include "rtc.h"
#include "pwm.h"
#include "twi.h"
#include "dma.h"
#include "nRF24L01.h"
#include "twi.h"
#include "mpu-6050.h"

/* RTOS includes */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"


TaskHandle_t        xStartupTask;
TaskHandle_t        xCommTask;
TaskHandle_t        xJournalTask;
TaskHandle_t        xRtcTask;
TaskHandle_t        xThrottleTask;
TaskHandle_t        xGyroTask;

QueueHandle_t       xTsQ;
QueueHandle_t       xJobQueue;
QueueHandle_t       xTwiQueue;
SemaphoreHandle_t   xTwiSema;


extern void commTask(void *pvArg);
extern void startupTask(void *pvArg);
extern void RTC_vTask(void *pvArg);
extern void throttle_vTask(void *pvArg);
extern void throttleTask(void *pvArg);
extern void vGyroTask(void *pvArg);


static void Sys_vInit(void);
static void Sys_vCreateEvents(void);


/**
 * @brief   Startup task.
 *
 * @param   None
 *
 * @retval  None
 */
void startupTask(void *pvArg)
{
    (void)pvArg;
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
    assert(xRet == pdPASS);
    
    xRet = xTaskCreate(Journal_vErrorTask,
                       "Journal",
                       TASK_JOURNAL_STACK_SIZE,
                       NULL,
                       TASK_JOURNAL_STACK_PRIORITY,
                       &xJournalTask);
    assert(xRet == pdPASS);
    
    xRet = xTaskCreate(RTC_vTask,
                       "RTC",
                       TASK_RTC_STACK_SIZE,
                       NULL,
                       TASK_RTC_STACK_PRIORITY,
                       &xRtcTask);
    assert(xRet == pdPASS);
    
    xRet = xTaskCreate(throttleTask,
                       "Throttle",
                       TASK_THROTTLE_STACK_SIZE,
                       NULL,
                       TASK_THROTTLE_STACK_PRIORITY,
                       &xThrottleTask);
    assert(xRet == pdPASS);
    
    xRet = xTaskCreate(vGyroTask,
                       "Gyro",
                       TASK_GYRO_STACK_SIZE,
                       NULL,
                       TASK_GYRO_STACK_PRIORITY,
                       &xGyroTask);
    assert(xRet == pdPASS);
    
    /* startupTask can now be deleted */
    vTaskDelete(NULL);
}


void commTask(void *pvArg)
{
    (void)pvArg;
    uint8_t     ucStatus;
    xJobStruct *pxJob = NULL;

    while (1)
    {
        /* Dequeue new item from the job queue */
        (void)xQueueReceive(xJobQueue, &pxJob, portMAX_DELAY);

        /* Job should always have a subscriber so we can notify when job done */
        assert(pxJob->xSubscriber != NULL);

        switch (pxJob->ulType)
        {
            case RF_SEND:
                nRF24L01_vSendPayload((const char *)pxJob->pucData, pxJob->ulLen);
                xTaskNotifyGiveIndexed(pxJob->xSubscriber, 4);
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
                    Journal_vWriteError(RF_ERROR);
                }
                break;
            default:
                /* Something went wrong real bad */
                Journal_vWriteError(RF_BAD_JOB);
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
    /* Initialize communications */
    DMA_Init();
    SPI0_Init();
    nRF24L01_vInit();

    /* Initialize sensors */
    TWI0_vInit();
    MPU6050_vInit();

    /* Initialize motor control */
    PWM_Init();

    /* Start RTC last so it won't notify non-existent task */
    RTC_vInit();
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
    assert(xTsQ != NULL);

    xJobQueue = xQueueCreate(JOB_QUEUE_SIZE, sizeof(xJobStruct *));
    assert(xJobQueue != NULL);
    
    xTwiQueue = xQueueCreate(TWI_QUEUE_SIZE, sizeof(TWI_Msg *));
    assert(xTwiQueue != NULL);

    xTwiSema = xSemaphoreCreateBinary();
    assert(xTwiSema != NULL);
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
    assert(xRet == pdPASS);

    vTaskStartScheduler();

    while (1)
    {
        ; /* Should not get here */
    }
}
