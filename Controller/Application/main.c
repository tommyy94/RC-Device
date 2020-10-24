#include "system.h"


/**
 * @brief   The main function.
 * 
 * @param   None
 * 
 * @return  None
 */
int main(void)
{
    TaskHandle_t xHandle;
    BaseType_t xAssert;
    
    /* Startup task creates other tasks */
    xAssert = xTaskCreate(vStartupTask, (const char *)"Startup", STARTUPTASKSIZE / sizeof(portSTACK_TYPE), NULL, STARTUPTASKPRIORITY, &xHandle);
    configASSERT(xAssert);
    
    /* Start multitasking */
    vTaskStartScheduler();
    
    while (1)
    {
        ; /* Should not get here! */
    }
}