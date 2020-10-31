/* System headers */

/* Device vendor headers */
#include "MKL25Z4.h"

/* RTOS headers */
#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "event_groups.h"
#include "message_buffer.h"

/* User headers */
#include "system.h"
#include "comm.h"
#include "joystick.h"
#include "hmi.h"
#include "adc.h"
#include "tpm.h"
#include "dma.h"
#include "nRF24L01.h"
#include "pit.h"
#include "spi.h"


/* Global variables */
TaskHandle_t            xCommTaskHandle;
TaskHandle_t            xHmiTaskHandle;
TaskHandle_t            xJoystickTaskHandle;
QueueHandle_t           xTxQueue;
EventGroupHandle_t      xCommEvent;
MessageBufferHandle_t   xSpiTxBuf;
MessageBufferHandle_t   xSpiRxBuf;


/* Local defines */


/* Local function prototypes */
static void vSystemInit(void);
static void vEnableClockGating(void);
static void vCreateQueues(void);
static void vCreateEvents(void);
static void vCreateTasks(void);
static void vCreateSemaphores(void);


/**
 * @brief   Initialize system hardware.
 * 
 * @param   None
 * 
 * @return  None
 */
static void vSystemInit(void)
{
    /* Power up all necessary peripherals */
    vEnableClockGating();

    /* Timers */
    PIT_vInit();

    /* Analog functionalities */
    DMA0_vInit();
    ADC0_vInit();
    
    /* Communications */
    TPM2_vInit();
    SPI1_vInit();
    nRF24L01_vInit();
}


/**
 * @brief   Enable clock gating to modules. Accessing peripheral while disabled generates hard fault.
 * 
 * @param   None
 * 
 * @return  None
 */
static void vEnableClockGating(void)
{
    SIM->SCGC4 |= SIM_SCGC4_SPI1(1);
    SIM->SCGC5 |= SIM_SCGC5_PORTA(1) | SIM_SCGC5_PORTB(1) | SIM_SCGC5_PORTD(1) | SIM_SCGC5_PORTE(1);
    SIM->SCGC6 |= SIM_SCGC6_TPM2(1) | SIM_SCGC6_ADC0(1) | SIM_SCGC6_DMAMUX(1) | SIM_SCGC6_PIT(1);
    SIM->SCGC7 |= SIM_SCGC7_DMA(1);
}


/**
 * @brief   Create FreeRTOS queues.
 * 
 * @param   None
 * 
 * @return  None
 */
static void vCreateQueues(void)
{
    xTxQueue = xQueueCreate(MAX_QUEUE_SIZE, sizeof(MessageQueue *));
    configASSERT(xTxQueue != NULL);

    xSpiTxBuf = xMessageBufferCreate(SPI_QUEUE_SIZE);
    configASSERT(xSpiTxBuf != NULL);

    xSpiRxBuf = xMessageBufferCreate(SPI_QUEUE_SIZE);
    configASSERT(xSpiRxBuf != NULL);
}


/**
 * @brief   Create 8-bit FreeRTOS Event Groups.
 * 
 * @param   None
 * 
 * @return  None
 */
static void vCreateEvents(void)
{
    xCommEvent = xEventGroupCreate();
}


/**
 * @brief   Create FreeRTOS tasks.
 * 
 * @param   pvParameters    FreeRTOS software timers for Motor Task.
 * 
 * @return  None
 */
static void vCreateTasks(void)
{
    BaseType_t xAssert;
    xAssert = xTaskCreate(vCommTask, (const char *)"Comm", COMMTASKSIZE / sizeof(portSTACK_TYPE), NULL, COMMTASKPRIORITY, &xCommTaskHandle);
    configASSERT(xAssert == pdTRUE);
    xAssert = xTaskCreate(vHmiTask, (const char *)"HMI", HMITASKSIZE / sizeof(portSTACK_TYPE), NULL, HMITASKPRIORITY, &xHmiTaskHandle);
    configASSERT(xAssert == pdTRUE);
    xAssert = xTaskCreate(vJoystickTask, (const char *)"Joystick", JOYSTICKTASKSIZE / sizeof(portSTACK_TYPE), NULL, JOYSTICKTASKPRIORITY, &xJoystickTaskHandle);
    configASSERT(xAssert == pdTRUE);
}


/**
 * @brief   Create FreeRTOS semaphores.
 * 
 * @param   None
 * 
 * @return  None
 */
static void vCreateSemaphores(void)
{

}


/**
 * @brief   Initializes OS, core and peripherals. Deleted afterwards.
 * 
 * @param   pvMotorTimers   Handle to motor timers.
 * 
 * @return  None
 */
void vStartupTask(void *const pvParam)
{    
    /* Initialize FreeRTOS components */
    vCreateQueues();
    vCreateSemaphores();
    vCreateEvents();
    
    /* Initialize hardware */
    vSystemInit();
    
    /* Create tasks */
    vCreateTasks();
    
    /* Startup task no longer needed */
    vTaskDelete(NULL);
}


/**
 * @brief   Idle task hook.
 * 
 * @param   None
 * 
 * @return  None
 */
void vApplicationIdleHook(void)
{
    ; /* Do nothing */
}


/**
 * @brief   System error handler.
 * 
 * @param   file    File name where error occurred
 * @param   line    Line where error occurred
 * 
 * @return  None
 */
void vAssertCalled(const uint32_t ulLine, char *const pcFile)
{
    volatile uint32_t ulSetToNonZeroInDebuggerToContinue = 0;
    
    /* Supress -Wunused-parameter */
    (void)pcFile;
    (void)ulLine;

    taskENTER_CRITICAL();

    while (ulSetToNonZeroInDebuggerToContinue == 0)
    {
        ; /* Use debug view to read variables */
    }
    
    taskEXIT_CRITICAL();
}


/**
 * Hard Fault handler.
 */
void HardFault_Handler(void)
{
    __BKPT();
}
