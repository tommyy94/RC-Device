#include "comm.h"
#include "fsl_bitaccess.h"
#include "spi.h"


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
    MessageQueue *pxMsg;
    
    while (1)
    {
        //xEvent = xEventGroupWaitBits(xCommEvent, COMM_EVT_MASK, pdTRUE, pdFALSE, portMAX_DELAY);
        //if ((xEvent & COMM_EVT_SEND_PAYLOAD) != 0)
        //{
            if (xQueueReceive(xTxQueue, &pxMsg, portMAX_DELAY))
            {
                __BKPT();
                //nRF24L01_vSendPayload(xMsg.pucTxData, xMsg.ulTxLen);
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


/**
 * @brief   Sets SPI1 SS line high and stops DMA0.
 * 
 * @param   None
 * 
 * @return  None
 */
void TPM2_IRQHandler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    
    if (BME_UBFX32(&TPM2->STATUS, TPM_STATUS_TOF_SHIFT, TPM_STATUS_TOF_WIDTH))
    {
        /* Cleanup */
        SPI1_vSetSlave(HIGH);
        TPM2_vStop();

        /* Notify task */
        xSemaphoreGiveFromISR(xSpiSema, &xHigherPriorityTaskWoken);
    }

    /* Clear Timer Overflow Flag */
    BME_OR32(&TPM2->STATUS, TPM_STATUS_TOF(1));

    /* Force context switch if xHigherPriorityTaskWoken is set pdTRUE */
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}
