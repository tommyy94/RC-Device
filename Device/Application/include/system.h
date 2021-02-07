#ifndef SYSTEM_H
#define SYSTEM_H

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

#include <FreeRTOS.h>
#include <task.h>
#include <semphr.h>
#include <queue.h>


#define TASK_STARTUP_STACK_SIZE			(8192/ sizeof(portSTACK_TYPE))
#define TASK_STARTUP_STACK_PRIORITY		(tskIDLE_PRIORITY + 6)

#define TASK_COMM_STACK_SIZE			(4096 / sizeof(portSTACK_TYPE))
#define TASK_COMM_STACK_PRIORITY		(tskIDLE_PRIORITY + 2)

#define TASK_JOURNAL_STACK_SIZE			(4096 / sizeof(portSTACK_TYPE))
#define TASK_JOURNAL_STACK_PRIORITY		(tskIDLE_PRIORITY + 3)

#define TASK_CALENDAR_STACK_SIZE		(2048 / sizeof(portSTACK_TYPE))
#define TASK_CALENDAR_STACK_PRIORITY            (tskIDLE_PRIORITY + 4)

#define TASK_THROTTLE_STACK_SIZE		(2048 / sizeof(portSTACK_TYPE))
#define TASK_THROTTLE_STACK_PRIORITY            (tskIDLE_PRIORITY + 5)

/* Interrupt priorities
 * Remark: Lower equals higher priority 
 */
#define RTC_IRQ_PRIO        (6u)
#define SPI0_IRQ_PRIO       (7u)
#define XDMAC_IRQ_PRIO      (4u)
#define PIOD_IRQ_PRIO       (5u)
#define TWIHS0_IRQ_PRIO     (7u)

#define JOB_QUEUE_SIZE      (32u)

enum
{
    RF_SEND = 0,
    RF_READ,
    RF_STATUS
};

extern TaskHandle_t         xStartupTask;
extern TaskHandle_t         xCommTask;
extern TaskHandle_t         xJournalTask;
extern TaskHandle_t         xCalendarTask;
extern QueueHandle_t        xTsQ;


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

#endif /* SYSTEM_H */
