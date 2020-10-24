#include "hmi.h"
#include "FreeRTOS.h"
#include "task.h"


void vHmiTask(void *const pvParam)
{
    while (1)
    {
        vTaskDelay(pdMS_TO_TICKS(100));
    }
}
