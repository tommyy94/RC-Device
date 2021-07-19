/* System includes */
#include "string.h"

/* User includes */
#include "com.h"
#include "system.h"
#include "nRF24L01.h"

/* RTOS includes */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"


extern QueueHandle_t       xJobQueue;
extern QueueHandle_t       xThrottleQueue;
extern QueueHandle_t       xGyroQueue;

QueueHandle_t *pxQueueTbl[COUNT_Q] =
{
    &xJobQueue,
    &xThrottleQueue,
    &xGyroQueue
};


static void com_vPackFrame(char pucFrame[], RF_Struct_t *pxRf);
static void com_vUnpackFrame(char pucFrame[], RF_Struct_t *pxRf);
static void com_vTransmitFrame(RF_Struct_t *pxRf);
static void com_vReceiveFrame(RF_Struct_t  *pxRf);



/**
 * @brief   Task responsible for communication with
 *          the remote controller.
 *
 * @param   pvArg   Unused.
 *
 * @return  None.
 */
void com_vTask(void *pvArg)
{
    (void)pvArg;
    BaseType_t     xRet;
    uint8_t        ucStatus;
    RF_Struct_t    xRf;
    RF_Struct_t   *pxRf = NULL;

    while (1)
    {
        /* Dequeue new item from the job queue */
        xRet = xQueueReceive(xJobQueue, &pxRf, portMAX_DELAY);
        assert(xRet == pdTRUE);

        switch (pxRf->ucCmd)
        {
            case RF_RESP:
                com_vTransmitFrame(pxRf);
                break;
            case RF_READ:
                /* This condition not in use at the moment !!! */
                //pxJob->ulLen = nRF24L01_ulReadPayload((const char *)pxJob->pucData);
                break;
            case RF_STATUS:
                ucStatus = nRF24L01_ucGetStatus();
                if ((ucStatus & STATUS_TX_DS(1)) != 0)
                {
                    /* Payload sent - no action needed */
                }
                if ((ucStatus & STATUS_RX_DR(1)) != 0)
                {
                    pxRf = &xRf;
                    com_vReceiveFrame(pxRf);
                    xRet = xQueueSend(*pxQueueTbl[pxRf->ucTarget], &pxRf, NULL);
                    assert(xRet == pdTRUE);
                }
                if ((ucStatus & STATUS_MAX_RT(1)) != 0)
                {
                    /* Max retransmits - payload not sent */
                    Journal_vWriteError(RF_ERROR);
                }
                break;
            default:
                /* Something went wrong real bad */
                Journal_vWriteError(RF_BAD_JOB);
                break;
        }
    }
}


/**
 * @brief   Unpack RF the frame.
 *
 * @param   pxFrame   Pointer to frame.
 *
 * @param   pxRf      Pointer to RF struct.
 *
 * @return  None.
 *
 * @note
 *
 *    RF frame:
 *    o----------------------------------------------o
 *    | SEND/READ  | Target  |  Length  | Parameters |
 *    o----------------------------------------------o
 *
 *    Example:
 *    o--------------------------------------------------------o
 *    | RF_SEND  | RF_THROTTLE  |  4  | 0x00, 0x00, 0xFF, 0xFF |
 *    o--------------------------------------------------------o
 *    | RF_READ  | RF_GYRO      |  0  | NULL                   |
 *    o--------------------------------------------------------o
 */
static void com_vPackFrame(char pucFrame[], RF_Struct_t *pxRf)
{
    pucFrame[0] = pxRf->ucCmd;
    pucFrame[1] = pxRf->ucTarget;
    pucFrame[2] = pxRf->ucLen;

    /* Copy frame to allocated memory area
     * instead of copying the pointer.
     */
    memcpy(&pucFrame[3], pxRf->pucParam, pxRf->ucLen);
}


/**
 * @brief   Unpack RF the frame.
 *
 * @param   pxFrame   Pointer to frame.
 *
 * @param   pxRf      Pointer to RF struct.
 *
 * @return  None.
 *
 * @note
 *
 *    RF frame:
 *    o----------------------------------------------o
 *    | SEND/READ  | Target  |  Length  | Parameters |
 *    o----------------------------------------------o
 *
 *    Example:
 *    o--------------------------------------------------------o
 *    | RF_SEND  | RF_THROTTLE  |  4  | 0x00, 0x00, 0xFF, 0xFF |
 *    o--------------------------------------------------------o
 *    | RF_READ  | RF_GYRO      |  0  | NULL                   |
 *    o--------------------------------------------------------o
 */
static void com_vUnpackFrame(char pucFrame[], RF_Struct_t *pxRf)
{
    pxRf->ucCmd     = pucFrame[0];
    pxRf->ucTarget  = pucFrame[1];
    pxRf->ucLen     = pucFrame[2];

    /* Copy frame to allocated memory area
     * instead of copying the pointer.
     */
    memcpy(pxRf->pucParam, &pucFrame[3], pxRf->ucLen);
}


/**
 * @brief   Transmit RF frame.
 *
 * @param   pxRf      Pointer to RF struct.
 *
 * @return  None.
 */
static void com_vTransmitFrame(RF_Struct_t *pxRf)
{
    char ucFrame[MAX_FRAME_LEN];
    com_vPackFrame(ucFrame, pxRf);
    nRF24L01_vSendPayload(ucFrame, pxRf->ucLen);
}


/**
 * @brief   Receive RF frame.
 *
 * @param   pxRf      Pointer to RF struct.
 *
 * @return  None.
 */
static void com_vReceiveFrame(RF_Struct_t *pxRf)
{
    uint32_t    ulLen;
    char        ucFrame[MAX_FRAME_LEN];

    ulLen = nRF24L01_ulReadPayload(ucFrame);
    com_vUnpackFrame(ucFrame, pxRf);
    assert(ulLen == pxRf->ucLen);
}
