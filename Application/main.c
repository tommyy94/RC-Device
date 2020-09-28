#include <atmel_start.h>


int main(void)
{    
    /* Initializes MCU, drivers and middleware */
    atmel_start_init();

    //SystemCoreClockUpdate();
    
    SCB_EnableICache();
    SCB_EnableDCache();
    
    RTOS_Init();
    while (1)
    {
        ; /* Should not get here */
    }
}


void HardFault_Handler(void)
{
    __BKPT();
}
