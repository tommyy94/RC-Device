#include "pio.h"

#include <same70q21b.h>
#include <utils_assert.h>


void PIOD_Handler(void)
{
    Pio *piod = PIOD;

    /* P28 magic number could be replaced */
    if ((piod->PIO_ISR & PIO_ISR_P28_Msk) != 0)
    {
        PIOD_ISR();
    }
}


/* Might want to add non-driver code into the handler
 * so the handler has weak linking.
 */
void PIOD_ISR(void)
{

}


void PIO_EnableIRQ(Pio *pio, uint32_t mask)
{
    pio->PIO_IER = PIO_IER_P(mask);
}


void PIO_DisableIRQ(Pio *pio, uint32_t mask)
{
    pio->PIO_IDR = PIO_IDR_P(mask);
}


void PIO_ConfigurePull(Pio *pio, uint32_t mask, Pio_PullType pull)
{
    assert((pull == PIO_PULLUP) || pull == PIO_PULLDOWN, __FILE__, __LINE__);

    if (pull == PIO_PULLUP)
    {
        pio->PIO_MDER   = mask;
        pio->PIO_PPDDR  = mask;
        pio->PIO_PUER   = mask;
    }
    else /* if PUO_PULLDOWN */
    {
        pio->PIO_MDER   = mask;
        pio->PIO_PPDER  = mask;
        pio->PIO_PUDR   = mask;
    }
}


void PIO_ConfigureIRQ(Pio *pio, PIO_IrqType type, PIO_IrqLevel level, uint32_t mask)
{
    assert((type == PIO_EDGE_IRQ) || (type == PIO_LEVEL_IRQ), __FILE__, __LINE__);
    assert((level == PIO_LEVEL_POSITIVE) || (level == PIO_LEVEL_NEGATIVE), __FILE__, __LINE__);

    if (type == PIO_EDGE_IRQ)
    {
        pio->PIO_ESR |=  mask;
        pio->PIO_LSR &= ~mask;
    }
    else /* if PIO_LEVEL_IRQ */
    {
        pio->PIO_LSR |=  mask;
        pio->PIO_ESR &= ~mask;
    }

    if (level == PIO_LEVEL_NEGATIVE)
    {
        pio->PIO_FELLSR |=  mask;
        pio->PIO_REHLSR &= ~mask;
    }
    else /* if PIO_LEVEL_POSITIVE */
    {
        pio->PIO_REHLSR |=  mask;
        pio->PIO_FELLSR &= ~mask;
    }
}
