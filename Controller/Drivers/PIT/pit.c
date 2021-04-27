#include "pit.h"

#include "FreeRTOS.h"
#include "task.h"

#include "MKL25Z4.h"

void (*pvPIT0Callback)(void *);
void (*pvPIT1Callback)(void *);

__STATIC_INLINE void PIT_vClearIrqFlag(const uint32_t ulChannel);
__STATIC_INLINE void PIT_vStopTimer(const uint32_t ulChannel);


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
    PIT->MCR &= ~PIT_MCR_MDIS_MASK;

    /* Clear pending IRQs */
    for (PIT_eChannels eCh = 0; eCh < PIT_CH_CNT; eCh++)
    {
        PIT_vClearIrqFlag(eCh);
    }

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
    const uint32_t ulTimeout = PIT_TIMEOUT_MS(ulTimerVal);

    configASSERT(ulChannel <= PIT_CH_CNT);

    /* Disable timer */
    PIT_vStopTimer(ulChannel);

    /* Load counter */
    PIT->CHANNEL[ulChannel].LDVAL = PIT_LDVAL_TSV(ulTimeout);

    /* Enable interrupts & timer */
    PIT->CHANNEL[ulChannel].TCTRL = PIT_TCTRL_TIE_MASK | PIT_TCTRL_TEN_MASK;
}


/**
 * @brief   Clear channel IRQ flag.
 * 
 * @param   ulChannel   Channel to clear.
 * 
 * @return  None
 */
__STATIC_INLINE void PIT_vClearIrqFlag(const uint32_t ulChannel)
{
    configASSERT(ulChannel <= PIT_CH_CNT);
    PIT->CHANNEL[ulChannel].TFLG = PIT_TFLG_TIF_MASK;
}

__STATIC_INLINE void PIT_vStopTimer(const uint32_t ulChannel)
{
    configASSERT(ulChannel <= PIT_CH_CNT);
    PIT->CHANNEL[ulChannel].TCTRL = 0;
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

    if ((PIT->CHANNEL[PIT_JOYSTICK_CH].TFLG & PIT_TFLG_TIF_MASK) != 0)
    {
        PIT_vClearIrqFlag(PIT_JOYSTICK_CH);
        PIT_vStopTimer(PIT_JOYSTICK_CH);
        pvPIT0Callback(&xHigherPriorityTaskWoken);
    }

    if ((PIT->CHANNEL[PIT_TFT_CH].TFLG & PIT_TFLG_TIF_MASK) != 0)
    {
        PIT_vClearIrqFlag(PIT_TFT_CH);
        PIT_vStopTimer(PIT_TFT_CH);
        pvPIT1Callback(NULL);
    }

    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}
