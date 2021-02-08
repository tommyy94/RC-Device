#pragma once


#define TWI_QUEUE_SIZE  (1UL)
#define TWI_MSG_LIMIT   (2u)


typedef struct
{
    uint8_t     *pucBuf;
    uint32_t     ulLen;
    uint32_t     ulFlags;
} TWI_Msg;

typedef struct
{
    Twihs       *pxInst;
    uint32_t     ulAddr;
    TWI_Msg      pxMsg[TWI_MSG_LIMIT];
} TWI_Adapter;


void TWI0_vInit(void);
void TWI_vXfer(TWI_Adapter *pxAdap, const uint32_t ulCount);
