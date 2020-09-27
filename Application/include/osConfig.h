#ifndef OSCONFIG_H_
#define OSCONFIG_H_


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

/* Interrupt priorities
 * Remark: Lower equals higher priority 
 */
#define RTC_IRQ_PRIO        (6u)
#define SPI0_IRQ_PRIO       (7u)



extern TaskHandle_t         xStartupTask;
extern TaskHandle_t         xCommTask;
extern TaskHandle_t         xJournalTask;
extern TaskHandle_t         xCalendarTask;
extern QueueHandle_t        xTsQ;
extern QueueHandle_t        xTxQ;
extern QueueHandle_t        xRxQ;
extern SemaphoreHandle_t    spiMutex;


#endif /* OSCONFIG_H_ */