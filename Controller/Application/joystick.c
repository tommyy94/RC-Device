#include "joystick.h"
#include "adc.h"

#include "FreeRTOS.h"
#include "task.h"

#include "dma.h"


enum
{
    X_AXIS = 0,
    Y_AXIS,
    AXIS_COUNT
};

static uint16_t usJoystick[AXIS_COUNT];

void vJoystickTask(void *const pvParam)
{

    while (1)
    {
        /* This task should be kicked by vHmiTask */

        /* Measure and store raw analog values to RAM */
        ADC0_DMA_vMeasure(ADC_BANK_A, ADC_CH_AD8);
        //ADC0_DMA_vMeasure(ADC_BANK_A, ADC_CH_AD9);

        /* Read ADC channels */
        usJoystick[X_AXIS] = ADC0_usReadChannel(ADC_CH_AD8);
        //joystick[Y_AXIS] = ADC0_usReadChannel(ADC_CH_AD9);
        

        /* Send values to vCommTask */

        vTaskDelay(pdMS_TO_TICKS(10));
    }
}


/* 8 samples could be stored to memory by DMA
 * and the software could average them
 *
 * Conversion could be triggered by a timer
 * to avoid unneeded MCU wakeup
 */
