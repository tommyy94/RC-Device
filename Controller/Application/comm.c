#include "comm.h"
#include "fsl_bitaccess.h"
#include "spi.h"
#include "nRF24L01.h"

#include "FreeRTOS.h"
#include "task.h"
#include "event_groups.h"


/* Local defines */

/* Global variables */
extern TaskHandle_t         xCommTaskHandle;
extern QueueHandle_t        xJobQueue;


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
    uint8_t       ucStatus;
    xJobStruct    xJob;
    xJobStruct   *pxJob = &xJob;
    
    while (1)
    {
        /* Dequeue new item from the job queue */
        (void)xQueueReceive(xJobQueue, &pxJob, portMAX_DELAY);

        /* Job should always have a subscriber so we can notify when job done */
       configASSERT(pxJob->xSubscriber != NULL);

        switch (xJob.ulType)
        {
            case RF_SEND:
                nRF24L01_vSendPayload((const char *)pxJob->pucData, pxJob->ulLen);
                break;
            case RF_READ:
                pxJob->ulLen = nRF24L01_ulReadPayload((const char *)pxJob->pucData);
                break;
            case RF_STATUS:
                ucStatus = nRF24L01_ucGetStatus();
                if ((ucStatus & STATUS_TX_DS(1)) != 0)
                {
                    /* Payload sent - no action needed */
                }
                if ((ucStatus & STATUS_RX_DR(1)) != 0)
                {
                    /* Payload received - order a read operation */
                }
                if ((ucStatus & STATUS_MAX_RT(1)) != 0)
                {
                    /* Max retransmits - payload not sent */
                    __BKPT();
                }
                break;
            default:
                /* Something went wrong real bad */
                __BKPT();
                break;
        }

        xTaskNotifyGive(pxJob->xSubscriber);
    }
}
