#include <stdlib.h>
#include <stdbool.h>

#include "throttle.h"
#include "pwm.h"
#include "logWriter.h"
#include "rtos_start.h"

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

#include "utils_assert.h"


#define THROTTLE_TIMEOUT_MS   (20ul)
#define THROTTLE_RESOLUTION   (UINT16_MAX / 2)

#define DUTY_CYCLE_MAX        (0x494)

extern QueueHandle_t    xJobQueue;
extern TaskHandle_t     xJournalTask;
extern TaskHandle_t     xThrottleTask;



typedef struct
{
    uint16_t usX;
    uint16_t usY;
} xAxisStruct;

typedef enum
{
    THROTTLE_CHANNEL0 = 0,
    THROTTLE_CHANNEL1,
    THROTTLE_CHANNEL2,
    THROTTLE_CHANNEL3,
    THROTTLE_CHANNEL_COUNT
} eThrottleChannel;

typedef struct
{
    Pwm             *pxPwm[PWM_CHANNEL_COUNT];
    eThrottleChannel eCh[PWM_CHANNEL_COUNT];
} xChannelMap;

static xChannelMap xChMap =
{
    { PWM0,         PWM0,         PWM0,         PWM1         },
    { PWM_CHANNEL0, PWM_CHANNEL1, PWM_CHANNEL3, PWM_CHANNEL0 }
};


static void vThrottle(xAxisStruct xAxis);
static uint32_t ulScale(uint16_t usAxis);
static void vUpdateThrottle(const eThrottleChannel eCh, const uint32_t ulThrottle);
static void vEnableThrottle(const eThrottleChannel eCh);
static void vDisableThrottle(const eThrottleChannel eChe);


void throttleTask(void *pvArg)
{
    (void)pvArg;
    BaseType_t  xRet;
    xJobStruct  xJob;
    xJobStruct *pxJob = &xJob;
    
    xAxisStruct xAxis;

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

        (void)ulTaskNotifyTakeIndexed(3, pdTRUE, portMAX_DELAY);

        /* First element is nRF24L01 status byte, ignore it */
        xAxis.usX = (pxJob->pucData[2] << 8) | pxJob->pucData[1];
        xAxis.usY = (pxJob->pucData[4] << 8) | pxJob->pucData[3];

        vThrottle(xAxis);
    }
}


static void vThrottle(xAxisStruct xAxis)
{
    uint32_t usLeftThrottle;
    uint32_t usRightThrottle;

    /* Need to scale duty cycle value (Datasheet Chapter 51.7.41)
     *
     * scaledDutyCycle = DUTY_CYCLE_MAX / UINT32_MAX
     *                 = 0.01788
     */
    uint32_t usThrottle = ulScale(xAxis.usX) * 0.01788;

    /* Assume joystick in middle position - no steering */
    float    fSteerPer  = 1.0;
    
    /* Calculate steering if joystick moved */
    if (xAxis.usY != THROTTLE_RESOLUTION)
    {
        fSteerPer = ulScale(xAxis.usY) / (float)UINT16_MAX;
    }
    
    /* Positive Y axis means the joystick is turned left.
     * We have to reduce the left motor throttle to steer left.
     * and reduce the right side motor throttle to steer right.
     */
    if (xAxis.usY > THROTTLE_RESOLUTION)
    {
        usLeftThrottle  = usThrottle * fSteerPer;
        usRightThrottle = usThrottle;
    }
    else
    {
        usRightThrottle = usThrottle * fSteerPer;
        usLeftThrottle  = usThrottle;
    }

    /* Go forward if MSB set (joystick over center)
     * else go backward.
     *
     * Should generate a "dead zone" here for the controller.
     */
    
    if (xAxis.usX == THROTTLE_RESOLUTION)
    {
        for (uint32_t ulCh; ulCh < THROTTLE_CHANNEL_COUNT; ulCh++)
        {
            vDisableThrottle(ulCh);
        }
    }
    else if (xAxis.usX > THROTTLE_RESOLUTION)
    {
        vDisableThrottle(THROTTLE_CHANNEL2);
        vDisableThrottle(THROTTLE_CHANNEL3);

        vUpdateThrottle(THROTTLE_CHANNEL0, usRightThrottle);
        vUpdateThrottle(THROTTLE_CHANNEL1, usLeftThrottle);

        vEnableThrottle(THROTTLE_CHANNEL0);
        vEnableThrottle(THROTTLE_CHANNEL1);
    }
    else
    {
        vDisableThrottle(THROTTLE_CHANNEL0);
        vDisableThrottle(THROTTLE_CHANNEL1);

        vUpdateThrottle(THROTTLE_CHANNEL2, usRightThrottle);
        vUpdateThrottle(THROTTLE_CHANNEL3, usLeftThrottle);
  
        vEnableThrottle(THROTTLE_CHANNEL2);
        vEnableThrottle(THROTTLE_CHANNEL3);
    }
}


static uint32_t ulScale(uint16_t usAxis)
{    
    if (usAxis < THROTTLE_RESOLUTION)
    {
        usAxis = ~usAxis;
    }

    return (uint32_t)((usAxis - THROTTLE_RESOLUTION) << 1);
}


static void vUpdateThrottle(const eThrottleChannel eCh, const uint32_t ulThrottle)
{
    assert(eCh < THROTTLE_CHANNEL_COUNT, __FILE__, __LINE__);
    assert(ulThrottle  <= DUTY_CYCLE_MAX, __FILE__, __LINE__);
    PWM_UpdateDutyCycle(xChMap.pxPwm[eCh], xChMap.eCh[eCh], ulThrottle);
}


static void vEnableThrottle(const eThrottleChannel eCh)
{
    assert(eCh < THROTTLE_CHANNEL_COUNT, __FILE__, __LINE__);
    PWM_Enable(xChMap.pxPwm[eCh], xChMap.eCh[eCh]);
}


static void vDisableThrottle(const eThrottleChannel eCh)
{
    assert(eCh < THROTTLE_CHANNEL_COUNT, __FILE__, __LINE__);
    PWM_Disable(xChMap.pxPwm[eCh], xChMap.eCh[eCh]);
}
