#ifndef RTOS_START_H
#define RTOS_START_H

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

#include <FreeRTOS.h>
#include <task.h>
#include <semphr.h>

void RTOS_Init(void);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* RTOS_START_H */
