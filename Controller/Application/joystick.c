#include "joystick.h"
#include "adc.h"

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

#include "dma.h"
#include "pit.h"


enum
{
    AXIS_X,
    AXIS_Y,
    AXIS_CNT
};


#define JOYSTICK_TIMEOUT  (15UL)


extern QueueHandle_t       xTxQueue;


void vJoystickTask(void *const pvParam)
{
    uint32_t        ulNotified;
    BaseType_t      xPassed;
    MessageQueue    xMsg;
    MessageQueue   *pxMsg = &xMsg;
    uint16_t        pusAdVals[AXIS_CNT];

    (void)pvParam;

    /* Load timer */
    PIT_vTimerLoad(PIT_CH_0, PIT_CH0_TIMEOUT);

    while (1)
    {
        /* Measure and store raw analog values to RAM */
        ADC0_DMA_vMeasureChannels();

        ulNotified = ulTaskNotifyTake(pdTRUE, pdMS_TO_TICKS(JOYSTICK_TIMEOUT));
        configASSERT(ulNotified != pdFALSE);
        
        ADC0_vReadChannels(pusAdVals);

        /* Partition the message as we send bytes over SPI */
        xMsg.ulTxLen = 0;
        xMsg.pucTxData[xMsg.ulTxLen++] = (uint8_t)(pusAdVals[AXIS_X] & 0x00FF);
        xMsg.pucTxData[xMsg.ulTxLen++] = (uint8_t)(pusAdVals[AXIS_X] & 0xFF00);
        xMsg.pucTxData[xMsg.ulTxLen++] = (uint8_t)(pusAdVals[AXIS_Y] & 0x00FF);
        xMsg.pucTxData[xMsg.ulTxLen++] = (uint8_t)(pusAdVals[AXIS_Y] & 0xFF00);
      
        /* Send values to vCommTask */
        xPassed = xQueueSend(xTxQueue, (void *)&pxMsg, NULL);
        configASSERT(xPassed == pdTRUE);
    }
}
