#include "joystick.h"
#include "adc.h"

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

#include "dma.h"
#include "pit.h"


#define JOYSTICK_TIMEOUT  (10UL)


extern QueueHandle_t       xTxQueue;


void vJoystickTask(void *const pvParam)
{
    MessageQueue  xMsg;
    uint32_t      ulNotified;
    BaseType_t    xPassed;
    uint32_t      ulXaxis;
    uint32_t      ulYaxis;

    /* Load timer */
    PIT_vTimerLoad(PIT_CH_0, PIT_CH0_TIMEOUT);

    while (1)
    {
        ulNotified = ulTaskNotifyTake(pdTRUE, pdMS_TO_TICKS(JOYSTICK_TIMEOUT));
        configASSERT(ulNotified != pdFALSE);
        if (ulNotified != pdFALSE)
        {
          /* Measure and store raw analog values to RAM */
          ADC0_DMA_vMeasure(ADC_BANK_A, ADC_CH_AD8);
          ADC0_DMA_vMeasure(ADC_BANK_A, ADC_CH_AD9);

          /* Read ADC channels */
          ulXaxis = ADC0_usReadChannel(ADC_CH_AD8);
          ulYaxis = ADC0_usReadChannel(ADC_CH_AD9);

          /* Partition the message as we send bytes over SPI */
          xMsg.pucTxData[xMsg.ulTxLen++] = ulXaxis & 0x00FF;
          xMsg.pucTxData[xMsg.ulTxLen++] = ulXaxis & 0xFF00;
          xMsg.pucTxData[xMsg.ulTxLen++] = ulYaxis & 0x00FF;
          xMsg.pucTxData[xMsg.ulTxLen++] = ulYaxis & 0xFF00;
        
          /* Send values to vCommTask */
          xPassed = xQueueSend(xTxQueue, &xMsg, NULL);
          configASSERT(xPassed == pdTRUE);
        }
    }
}
