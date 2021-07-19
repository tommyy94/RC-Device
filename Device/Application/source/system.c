/* System includes */
#include <string.h>

/* Application includes */
#include "atmel_start.h"
#include "system.h"
#include "logWriter.h"
#include "throttle.h"
#include "gyro.h"
#include "com.h"

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
QueueHandle_t       xThrottleQueue;
QueueHandle_t       xGyroQueue;
QueueHandle_t       xTwiQueue;
SemaphoreHandle_t   xTwiSema;


extern void com_vTask(void *pvArg);
extern void journal_vErrorTask(void *pvArg);
extern void RTC_vTask(void *pvArg);
extern void throttle_vTask(void *pvArg);
extern void gyro_vTask(void *pvArg);

static void sys_vStartupTask(void *pvArg);
static void sys_vInitHardware(void);
static void sys_vCreateEvents(void);


/**
 * @brief   Startup task.
 *
 * @param   None
 *
 * @retval  None
 */
static void sys_vStartupTask(void *pvArg)
{
    (void)pvArg;
    BaseType_t xRet;

    /* Must first create events so they can be called in Sys_vInit() */
    sys_vCreateEvents();

    xRet = xTaskCreate(com_vTask,
                       "Com",
                       TASK_COMM_STACK_SIZE,
                       NULL,
                       TASK_COMM_STACK_PRIORITY,
                       &xCommTask);
    assert(xRet == pdPASS);
    
    xRet = xTaskCreate(journal_vErrorTask,
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
    
    xRet = xTaskCreate(throttle_vTask,
                       "Throttle",
                       TASK_THROTTLE_STACK_SIZE,
                       NULL,
                       TASK_THROTTLE_STACK_PRIORITY,
                       &xThrottleTask);
    assert(xRet == pdPASS);
    
    xRet = xTaskCreate(gyro_vTask,
                       "Gyro",
                       TASK_GYRO_STACK_SIZE,
                       NULL,
                       TASK_GYRO_STACK_PRIORITY,
                       &xGyroTask);
    assert(xRet == pdPASS);

    /* Must call Sys_vInitHardware() as some drivers call the OS API */
    sys_vInitHardware();
    
    /* sys_vStartupTask can now be deleted */
    vTaskDelete(NULL);
}


/**
 * @brief   Initialize drivers and middleware.
 *
 * @param   None
 *
 * @retval  None
 */
static void sys_vInitHardware(void)
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
static void sys_vCreateEvents(void)
{
    xTsQ = xQueueCreate(TS_QUEUE_SIZE, sizeof(struct Calendar));
    assert(xTsQ != NULL);

    xTwiQueue = xQueueCreate(TWI_QUEUE_SIZE, sizeof(TWI_Msg *));
    assert(xTwiQueue != NULL);
    
    xJobQueue = xQueueCreate(JOB_QUEUE_SIZE, sizeof(RF_Struct_t *));
    assert(xJobQueue != NULL);
    
    xThrottleQueue = xQueueCreate(THROTTLE_QUEUE_SIZE, sizeof(RF_Struct_t *));
    assert(xThrottleQueue != NULL);
    
    xGyroQueue = xQueueCreate(GYRO_QUEUE_SIZE, sizeof(RF_Struct_t *));
    assert(xGyroQueue != NULL);

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
void sys_vInit(void)
{
    BaseType_t xRet = xTaskCreate(sys_vStartupTask,
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
