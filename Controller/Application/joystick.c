#include "joystick.h"
#include "comm.h"


#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "event_groups.h"

#include "dma.h"
#include "adc.h"
#include "pit.h"


enum
{
    AXIS_X,
    AXIS_Y,
    AXIS_CNT
};


#define JOYSTICK_TIMEOUT  (15UL)


extern QueueHandle_t       xJobQueue;
extern TaskHandle_t        xJoystickTaskHandle;


void vJoystickTask(void *const pvParam)
{
    (void)pvParam;
    uint32_t      ulNotified;
    BaseType_t    xPassed;
    xJobStruct    xJob;
    xJobStruct   *pxJob = &xJob;
    uint16_t      pusAdVals[AXIS_CNT];

    /* Load timer */
    PIT_vTimerLoad(PIT_CH_0, PIT_CH0_TIMEOUT);

    while (1)
    {
        /* Measure and store raw analog values to RAM */
        ADC0_DMA_vMeasureChannels();

        ulNotified = ulTaskNotifyTakeIndexed(1, pdTRUE, pdMS_TO_TICKS(JOYSTICK_TIMEOUT));
        configASSERT(ulNotified != pdFALSE);
        
        /* Calculate soft average */
        ADC0_vReadChannels(pusAdVals);

        /* Partition the message as we send bytes over SPI */
        xJob.ulLen                 = 0;
        xJob.pucData[xJob.ulLen++] = 0xAA;
        xJob.pucData[xJob.ulLen++] = 0xBB;
        xJob.pucData[xJob.ulLen++] = 0xCC;
        xJob.pucData[xJob.ulLen++] = 0xDD;
        /*
        xJob.pucData[xJob.ulLen++] = (uint8_t)(pusAdVals[AXIS_X] & 0x00FF);
        xJob.pucData[xJob.ulLen++] = (uint8_t)(pusAdVals[AXIS_X] & 0xFF00);
        xJob.pucData[xJob.ulLen++] = (uint8_t)(pusAdVals[AXIS_Y] & 0x00FF);
        xJob.pucData[xJob.ulLen++] = (uint8_t)(pusAdVals[AXIS_Y] & 0xFF00);
        */
        xJob.xSubscriber           = xJoystickTaskHandle;
        xJob.ulType                = RF_SEND;
      
        /* Send values to vCommTask */
        xPassed = xQueueSend(xJobQueue, (void *)&pxJob, NULL);
        configASSERT(xPassed == pdTRUE);
    }
}
