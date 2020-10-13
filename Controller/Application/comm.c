#include "comm.h"
#include "fsl_bitaccess.h"
#include "spi.h"


/* Local defines */
#define COMM_TIMEOUT    (10U)

/* Global variables */
QueueHandle_t      xCommQueue;
TaskHandle_t       xCommTask = NULL;
EventGroupHandle_t xCommEvent;


typedef struct
{
    uint8_t *pxTx;
    uint32_t*pxTxLen;
    uint8_t *pxRx;
    uint32_t*pxRxLen;
} MessageStream;

    
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
    uint8_t txData[] = "Test";
    EventBits_t xEvent;
    MessageStream xMsgStream;
    
    for (;;)
    {
        //nRF24L01_vSendPayload(txData, 4);
        xEvent = xEventGroupWaitBits(xCommEvent, COMM_EVT_MASK, pdTRUE, pdFALSE, portMAX_DELAY);
        if ((xEvent & COMM_EVT_SEND_PAYLOAD) != 0)
        {
            /* Check receiving to struct ! ! ! */
            //if (xQueueReceive(xCommQueue, &xMsgStream, (TickType_t)COMM_TIMEOUT))
            //{
            //    nRF24L01_vSendPayload(xMsgStream.pxTx, *xMsgStream.pxTxLen);
            //}
            nRF24L01_vSendPayload(txData, 4);
        }
        
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
        vTaskNotifyGiveFromISR(xCommTask, &xHigherPriorityTaskWoken);
    }

    /* Clear Timer Overflow Flag */
    BME_OR32(&TPM2->STATUS, TPM_STATUS_TOF(1));

    /* Force context switch if xHigherPriorityTaskWoken is set pdTRUE */
    portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
}
