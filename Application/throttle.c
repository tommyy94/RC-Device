#include "throttle.h"
#include "pwm.h"
#include "logWriter.h"
#include "rtos_start.h"

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"


#define THROTTLE_TIMEOUT_MS   (20ul)

extern QueueHandle_t    xJobQueue;
extern TaskHandle_t     xJournalTask;
extern TaskHandle_t     xThrottleTask;


void throttleTask(void *pvArg)
{
    (void)pvArg;
    uint32_t dummy;
    float       fX;
    float       fY;
    BaseType_t  xRet;
    xJobStruct  xJob;
    xJobStruct *pxJob = &xJob;
    Pwm        *pwm = PWM0;

    PWM_Init();

    while (1)
    {
        /* Wait for payload */
        (void)ulTaskNotifyTakeIndexed(2, pdTRUE, portMAX_DELAY);
        /* TODO: Check for timeout */

        /* Payload received, order read job */
        pxJob->ulType       = RF_READ;
        pxJob->xSubscriber  = xThrottleTask;
        xRet = xQueueSend(xJobQueue, &pxJob, NULL);
        if (xRet != pdTRUE)
        {
            xTaskNotify(xJournalTask, JOB_QUEUE_FULL, eSetBits);
        }

        /* Calculate the new duty cycle (percentage) and update the duty cycle
         * First element is nRF24L01 status byte, ignore it
         */
        fX = (float)(((pxJob->pucData[2] << 8) | pxJob->pucData[1]) / (float)0xFFFF) * 100;
        fY = (float)(((pxJob->pucData[4] << 8) | pxJob->pucData[3]) / (float)0xFFFF) * 100;
        PWM_UpdateDutyCycle(pwm, 0, fX);
        PWM_UpdateDutyCycle(pwm, 2, fY);
    }
}
