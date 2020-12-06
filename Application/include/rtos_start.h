#ifndef RTOS_START_H
#define RTOS_START_H

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

#include <FreeRTOS.h>
#include <task.h>
#include <semphr.h>


enum
{
    RF_SEND = 0,
    RF_READ,
    RF_STATUS
};


#define JOB_QUEUE_SIZE    (32u)

typedef struct
{
    uint8_t        pucData[JOB_QUEUE_SIZE];
    uint32_t       ulLen;
    uint32_t       ulType;
    TaskHandle_t   xSubscriber;
} xJobStruct;


void RTOS_Init(void);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* RTOS_START_H */
