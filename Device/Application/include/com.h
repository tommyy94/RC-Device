#pragma once
#include "stdint.h"

enum
{
    RF_SEND = 0,
    RF_READ,
    RF_RESP,
    RF_STATUS
};

enum
{
    JOB_Q = 0,
    THROTTLE_Q,
    GYRO_Q,
    COUNT_Q
};


#define MAX_FRAME_LEN   (32u)


typedef struct
{
    uint8_t   ucCmd;
    uint8_t   ucTarget;
    uint8_t   ucLen;
    uint8_t   pucParam[MAX_FRAME_LEN];
} RF_Struct_t;


void com_vTask(void *pvArg);
