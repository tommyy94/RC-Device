#include <atmel_start.h>


int main(void)
{    
    /* Initializes MCU, drivers and middleware */
    atmel_start_init();

    //SystemCoreClockUpdate();
    
    SCB_EnableICache();
    SCB_EnableDCache();
    
    RTOS_Init();
}


void HardFault_Handler(void)
{
    __BKPT();
}
