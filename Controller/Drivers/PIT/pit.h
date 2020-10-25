#pragma once
#include <stdint.h>


enum
{
    PIT_CH_0 = 0,
    PIT_CH_1,
    PIT_CH_CNT
};


//#define PIT_CH0_TIMEOUT   (24000UL)  /* 1 ms  */
#define PIT_CH0_TIMEOUT   (240000UL) /* 10 ms */
#define PIT_CH1_TIMEOUT   (240000UL) /* 10 ms */


void PIT_vInit(void);
void PIT_vTimerLoad(const uint32_t ulChannel, const uint32_t ulTimerVal);
