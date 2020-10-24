#include "pit.h"

#include "MKL25Z4.h"

#include "FreeRTOS.h"
#include "task.h"


extern TaskHandle_t        xJoystickTaskHandle;


/**
 * @brief   Enable PIT module.
 *          PIT is clocked by bus clock (24 MHz).
 * 
 * @param   None
 * 
 * @return  None
 */
void PIT_vInit(void)
{
    /* Enable module */
    PIT->MCR &= ~PIT_MCR_MDIS(1);

    /* Clear pending IRQs */
    PIT->CHANNEL[PIT_CH_0].TFLG  = PIT_TFLG_TIF(1);
    PIT->CHANNEL[PIT_CH_1].TFLG  = PIT_TFLG_TIF(1);

    NVIC_ClearPendingIRQ(PIT_IRQn);
    NVIC_SetPriority(PIT_IRQn, 5);
    NVIC_EnableIRQ(PIT_IRQn);
}


/**
 * @brief   Load and enable selected PIT timer channel.
 * 
 * @param   ulChannel   Channel to load.
 *
 * @param   ulTimerVal  Timer value to load.
 * 
 * @return  None
 */
void PIT_vTimerLoad(const uint32_t ulChannel, const uint32_t ulTimerVal)
{
    configASSERT(ulChannel <= PIT_CH_CNT);

    /* Disable timer */
    PIT->CHANNEL[ulChannel].TCTRL = 0;

    /* Clear IRQ flag */
    PIT->CHANNEL[ulChannel].TFLG  = PIT_TFLG_TIF(1);

    /* Load counter */
    PIT->CHANNEL[ulChannel].LDVAL = PIT_LDVAL_TSV(ulTimerVal);

    /* Enable interrupts & timer */
    PIT->CHANNEL[ulChannel].TCTRL = PIT_TCTRL_TIE(1) | PIT_TCTRL_TEN(1);
}


#include "spi.h"
/**
 * @brief   Periodical Interrupt Timer Interrupt Request Handler.
 * 
 * @param   None
 * 
 * @return  None
 */
void PIT_IRQHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;

    if ((PIT->CHANNEL[PIT_CH_0].TFLG & PIT_TFLG_TIF(1)) != 0)
    {
        /* Give signal to read user input */
        vTaskNotifyGiveFromISR(xJoystickTaskHandle, &xHigherPriorityTaskWoken);

        /* Clear IRQ flag & restart timer */
        PIT_vTimerLoad(PIT_CH_0, PIT_CH0_TIMEOUT);
    }

    if ((PIT->CHANNEL[PIT_CH_1].TFLG & PIT_TFLG_TIF(1)) != 0)
    {
        /* Clear IRQ flag & disable timer */
        PIT_vTimerLoad(PIT_CH_1, PIT_CH1_TIMEOUT);
    }

    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}
