#include "comm.h"
#include "fsl_bitaccess.h"
#include "spi.h"

#include "FreeRTOS.h"
#include "task.h"
#include "event_groups.h"


/* Local defines */
#define COMM_TIMEOUT    (10U)

/* Global variables */
extern TaskHandle_t         xCommTaskHandle;
extern SemaphoreHandle_t    xSpiSema;

extern QueueHandle_t        xTxQueue;
extern EventGroupHandle_t   xCommEvent;


/* Function descriptions */

/**
 * @brief   FreeRTOS communication task.
 * 
 * @param   pvParam     Unused.
 * 
 * @return  None
 */
void vCommTask(void *const pvParam)
{
    (void)pvParam;
    EventBits_t   xEvent;
    MessageQueue  xMsg;
    MessageQueue *pxMsg = &xMsg;
    
    while (1)
    {
        //xEvent = xEventGroupWaitBits(xCommEvent, COMM_EVT_MASK, pdTRUE, pdFALSE, portMAX_DELAY);
        //if ((xEvent & COMM_EVT_SEND_PAYLOAD) != 0)
        //{
            if (xQueueReceive(xTxQueue, &pxMsg, portMAX_DELAY))
            {
                nRF24L01_vSendPayload(xMsg.pucTxData, xMsg.ulTxLen);
            }
        //}
        
        if ((xEvent & COMM_EVT_READ_PAYLOAD) != 0)
        {

        }
        
        if ((xEvent & COMM_EVT_GET_STATUS) != 0)
        {

        }
        
        if ((xEvent & COMM_EVT_SET_CHANNEL) != 0)
        {

        }
        
        if ((xEvent & COMM_EVT_RESET) != 0)
        {

        }
    }
}
