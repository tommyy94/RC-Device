/**
 * defines.h
 * This header declares global defines.
 */

#pragma once


/* Bit shifting */
#define SIGNAL_SHIFT                    (5) /* For testing purposes */
#define MASK(pin)                       (1UL << (pin))

/* Signal edges */
#define LOW     (0UL)
#define HIGH    (1UL)


/* Define alternative functions for pins. */
enum AlternativeFunctions
{
    ALT0,
    ALT1,
    ALT2,
    ALT3,
    ALT4,
    ALT5,
    ALT6,
    ALT7,
    RESET
};
