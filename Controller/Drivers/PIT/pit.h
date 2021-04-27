#pragma once
#include <stdint.h>

typedef enum
{
    PIT_JOYSTICK_CH = 0,
    PIT_TFT_CH,
    PIT_CH_CNT
} PIT_eChannels;

//#define PIT_CH0_TIMEOUT   (1UL)  /* 1 ms  */
#define PIT_CH0_TIMEOUT   (10UL) /* 10 ms */
#define PIT_CH1_TIMEOUT   (10UL) /* 10 ms */

#define PIT_TIMEOUT_MS(x) (240000UL * (x))


void PIT_vInit(void);
void PIT_vTimerLoad(const uint32_t ulChannel, const uint32_t ulTimerVal);
