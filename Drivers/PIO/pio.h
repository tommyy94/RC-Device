#pragma once
#include <same70q21b.h>


typedef enum
{
    PIO_PULLUP,
    PIO_PULLDOWN
} Pio_PullType;


typedef enum
{
    PIO_EDGE_IRQ,
    PIO_LEVEL_IRQ
} PIO_IrqType;


typedef enum
{
    PIO_LEVEL_NEGATIVE,
    PIO_LEVEL_POSITIVE
} PIO_IrqLevel;


void PIO_DisableIRQ(Pio *pio, uint32_t pin);
void PIO_EnableIRQ(Pio *pio, uint32_t pin);
void PIO_ConfigurePull(Pio *pio, uint32_t mask, Pio_PullType pull);
void PIO_ConfigureIRQ(Pio *pio, PIO_IrqType type, PIO_IrqLevel level, uint32_t mask);
void PIOD_ISR(void) __attribute__((weak));
