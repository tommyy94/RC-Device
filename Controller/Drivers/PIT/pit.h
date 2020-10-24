#pragma once
#include <stdint.h>

void PIT_vInit(void);
void PIT_vTimerLoad(const uint32_t ulChannel, const uint32_t ulTimerVal);
