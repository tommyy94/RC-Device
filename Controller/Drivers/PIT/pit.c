#include "pit.h"

#include "MKL25Z4.h"

#include "FreeRTOS.h"
#include "task.h"


enum
{
    PIT_CH_0 = 0,
    PIT_CH_1,
    PIT_CH_CNT
};


/**
 * @brief   Enable PIT module.
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
    PIT->CHANNEL[0].TFLG  = PIT_TFLG_TIF(1);
    PIT->CHANNEL[1].TFLG  = PIT_TFLG_TIF(1);

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
        /* Clear IRQ flag & restart timer */
        PIT_vTimerLoad(PIT_CH_0, 1000);
    }

    if ((PIT->CHANNEL[PIT_CH_1].TFLG & PIT_TFLG_TIF(1)) != 0)
    {
        /* Clear IRQ flag & disable timer */
        PIT_vTimerLoad(PIT_CH_1, 1000);
    }

    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}
