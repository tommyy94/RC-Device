#ifndef SYSTEM_H
#define SYSTEM_H

#include <FreeRTOS.h>
#include <task.h>
#include <semphr.h>
#include <queue.h>


#define TASK_STARTUP_STACK_SIZE			(8192/ sizeof(portSTACK_TYPE))
#define TASK_STARTUP_STACK_PRIORITY		(tskIDLE_PRIORITY + 10)

#define TASK_COMM_STACK_SIZE			(2048 / sizeof(portSTACK_TYPE))
#define TASK_COMM_STACK_PRIORITY		(tskIDLE_PRIORITY + 2)

#define TASK_JOURNAL_STACK_SIZE			(4096 / sizeof(portSTACK_TYPE))
#define TASK_JOURNAL_STACK_PRIORITY		(tskIDLE_PRIORITY + 6)

#define TASK_RTC_STACK_SIZE                     (1024 / sizeof(portSTACK_TYPE))
#define TASK_RTC_STACK_PRIORITY                 (tskIDLE_PRIORITY + 7)

#define TASK_THROTTLE_STACK_SIZE		(2048 / sizeof(portSTACK_TYPE))
#define TASK_THROTTLE_STACK_PRIORITY            (tskIDLE_PRIORITY + 8)

#define TASK_GYRO_STACK_SIZE                    (512  / sizeof(portSTACK_TYPE))
#define TASK_GYRO_STACK_PRIORITY                (tskIDLE_PRIORITY + 5)

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

extern TaskHandle_t         xStartupTask;
extern TaskHandle_t         xCommTask;
extern TaskHandle_t         xJournalTask;
extern TaskHandle_t         xRtcTask;
extern QueueHandle_t        xTsQ;


void sys_vInit(void);

#endif /* SYSTEM_H */
