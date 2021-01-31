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

#define DEADZONE_MIN          (THROTTLE_RESOLUTION - (THROTTLE_RESOLUTION / 10))
#define DEADZONE_MAX          (THROTTLE_RESOLUTION + (THROTTLE_RESOLUTION / 10))

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
static bool bCheckDeadZone(uint16_t usAxis);


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


/**
 * @brief   Writer analog axis values to digital PWM
 *          channels to control the DC motors.
 *
 * @param   xAxis   Axis values.
 *
 * @return  None.
 */
static void vThrottle(xAxisStruct xAxis)
{
    uint32_t usLeftThrottle;
    uint32_t usRightThrottle;

    if (bCheckDeadZone(xAxis.usX) == false)
    {
        /* Need to scale duty cycle value (Datasheet Chapter 51.7.41) */
        usLeftThrottle  = ulScale(xAxis.usX) * DUTY_SCALE;
        usRightThrottle = usLeftThrottle;

        /* Calculate steering if joystick moved */
        if (bCheckDeadZone(xAxis.usY) == false)
        {
            /* Positive Y axis means the joystick is turned left.
             * We have to reduce the left motor throttle to steer left.
             * and reduce the right side motor throttle to steer right.
             */
            if (xAxis.usY > THROTTLE_RESOLUTION)
            {
                usLeftThrottle = ulSetSteer(usLeftThrottle, xAxis.usY);
            }
            else
            {
                usRightThrottle = ulSetSteer(usRightThrottle, xAxis.usY);
            }
        }

        vUpdateThrottle(xAxis.usX, usRightThrottle, usLeftThrottle);
    }
    else
    {
        for (eThrottleChannel eCh = THROTTLE_CH_0; eCh < THROTTLE_CH_CNT; eCh++)
        {
            vDisableThrottle(eCh);
        }
    }
}


/**
 * @brief   Calculate steer modifier for a axis.
 *
 * @param   ulThrottle  Throttle value to modify.
 *
 * @param   usSteer     Steer modifier.
 *
 * @param   Steer modified throttle value.
 */
static uint32_t ulSetSteer(const uint32_t ulThrottle, const uint16_t usSteer)
{
    float fSteerPer = ulScale(usSteer) / (float)UINT16_MAX;
    
    return (uint32_t)(ulThrottle * fSteerPer);
}

/**
 * @brief   Downsample axis
 *
 *          Axis value is halved to separate the direction
 *          effectively downsampling the signal. The lower
 *          half is then mirrored so the results correspond
 *          to the joystick value. Finally the signal needs
 *          to be oversampled so we can fit it to a digital
 *          channel later. See below:
 *
 *                          |
 *      What we get:        |   What we want:
 *                          |
 *            y=2^16        |               y=2^16
 *          A               |             A
 *          |               |             |
 *  x=0     |      x=2^16   |   x=2^16    |      x=2^16
 *     <----+---->          |        <----+---->
 *          |               |             |x,y=0
 *          |               |             |
 *          v               |             v
 *            y=0           |               y=2^16
 *                          |
 *
 * @param   usAxis  Axis to scale.
 *
 * @return  Scaled axis value.
 */
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


static bool bCheckDeadZone(uint16_t usAxis)
{
    bool bDeadZone = false;
    if ((usAxis < DEADZONE_MAX) && (usAxis > DEADZONE_MIN))
    {
        bDeadZone = true;
    }
    return bDeadZone;
}
