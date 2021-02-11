/* Device includes */
#include <same70q21b.h>
#include <utils_assert.h>
#include <stdbool.h>

/* RTOS includes */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

/* User includes */
#include "twi.h"
#include "pio.h"
#include "system.h"
#include "logWriter.h"


#define TWI0_PORT       (PIOA)
#define PIN_TWCK0       (1 << 4u)
#define PIN_TWD0        (1 << 3u)
#define TWI_WRITE       (0x00u)
#define TWI_READ        (0x01u)


extern QueueHandle_t      xTwiQueue;
extern SemaphoreHandle_t  xTwiSema;


static void    TWI0_IO_vInit(void);
static void    TWI_vReleaseSlave(Twihs *pxTwi);
static void    TWI_vSetMasterMode(Twihs *pxTwi);
static void    TWI_vSetSlaveMode(Twihs *pxTwi);
static void    TWI_vWriteCR(Twihs *pxTwi, uint32_t ulMask);
static bool    TWI_bWrite(Twihs *pxTwi, const uint32_t ulTarget, TWI_Msg *pxMsg, const uint32_t ulSr);
static bool    TWI_bRead(Twihs *pxTwi, const uint32_t ulTarget, TWI_Msg *pxMsg);
static void    TWI_vWriteTHR(Twihs *pxTwi, const uint8_t ucByte);
static uint8_t TWI_ucReadRHR(Twihs *pxTwi);
static void    TWIHS0_Handler_vEndXfer(TWI_Msg *pxMsg, uint32_t *pulCnt, BaseType_t *pxTaskWoken);


/**
 * @brief   Initialize TWI0.
 *
 * @param   None.
 *
 * @retval  None.
 *
 * Example:
 *
 *   #define ADDR_MPU6050    (0x68)
 *   TWI_Adapter xTwiAdap;
 *   uint8_t     buf1            = { 0x75 };
 *   uint8_t     buf2            = { 0x00 };
 *
 *   xTwiAdap.pxInst             = TWIHS0;
 *   xTwiAdap.ulAddr             = ADDR_MPU6050;
 *   xTwiAdap.pxMsg[0].pucBuf    = &buf1;
 *   xTwiAdap.pxMsg[0].ulLen     = 1;
 *   xTwiAdap.pxMsg[0].ulFlags   = TWI_WRITE;
 *   xTwiAdap.pxMsg[1].pucBuf    = &buf2;
 *   xTwiAdap.pxMsg[1].ulLen     = 1;
 *   xTwiAdap.pxMsg[1].ulFlags   = TWI_READ;
 *   TWI_vXfer(&xTwiAdap, 2);
 */
void TWI0_vInit(void)
{
    TWI0_IO_vInit();

    /**
     * Enable TWI0 clock gating
     * - TWI0 clock = Peripheral clock / 2
     *              = 150 MHz / 2 = 75 MHz
     */
    PMC->PMC_PCR |= PMC_PCR_CMD_Msk | PMC_PCR_PID(TWIHS0_CLOCK_ID) | PMC_PCR_EN_Msk;

    TWIHS0->TWIHS_CWGR = TWIHS_CWGR_CKDIV(1) | TWIHS_CWGR_CHDIV(43) | TWIHS_CWGR_CLDIV(43);
    TWI_vWriteCR(TWIHS0, TWIHS_CR_FIFOEN_Msk | TWIHS_CR_THRCLR_Msk);

    TWIHS0->TWIHS_IER = TWIHS_IER_ARBLST_Msk | TWIHS_IER_UNRE_Msk | TWIHS_IER_OVRE_Msk;

    TWI_vSetMasterMode(TWIHS0);

    NVIC_ClearPendingIRQ(TWIHS0_IRQn);
    NVIC_SetPriority(TWIHS0_IRQn, TWIHS0_IRQ_PRIO);
    NVIC_EnableIRQ(TWIHS0_IRQn);
    
    #define ADDR_MPU6050    (0x68)
    TWI_Adapter xTwiAdap;
    uint8_t     buf1            = { 0x75 };
    uint8_t     buf2            = { 0x00 };

    xTwiAdap.pxInst             = TWIHS0;
    xTwiAdap.ulAddr             = ADDR_MPU6050;
    xTwiAdap.pxMsg[0].pucBuf    = &buf1;
    xTwiAdap.pxMsg[0].ulLen     = 1;
    xTwiAdap.pxMsg[0].ulFlags   = TWI_WRITE;
    xTwiAdap.pxMsg[1].pucBuf    = &buf2;
    xTwiAdap.pxMsg[1].ulLen     = 1;
    xTwiAdap.pxMsg[1].ulFlags   = TWI_READ;
    TWI_vXfer(&xTwiAdap, 2);
}


/**
 * @brief   Transfer messages.
 *
 * @param   pxAdap    Pointer to TWI adapter.
 *
 * @param   ulCount   Transfer count.
 *
 * @retval  None.
 */
void TWI_vXfer(TWI_Adapter *pxAdap, const uint32_t ulCount)
{
    bool bRet;

    /* Sanity check */
    configASSERT((pxAdap->pxInst == TWIHS0) || (pxAdap->pxInst == TWIHS1) || (pxAdap->pxInst == TWIHS2));
    configASSERT((pxAdap->pxMsg->ulFlags == TWI_WRITE) || (pxAdap->pxMsg->ulFlags == TWI_READ));

    for (uint32_t ulK = 0; ulK < ulCount; ulK++)
    {
        if (pxAdap->pxMsg[ulK].ulFlags == TWI_READ)
        {
            bRet = TWI_bRead(pxAdap->pxInst, pxAdap->ulAddr, &(pxAdap->pxMsg[ulK]));
        }
        else
        {
            bRet = TWI_bWrite(pxAdap->pxInst, pxAdap->ulAddr, &(pxAdap->pxMsg[ulK]), ulK);
        }

        if (bRet == false)
        {
            TWI_vReleaseSlave(pxAdap->pxInst);
            xTaskNotify(xJournalTask, I2C_ERROR, eSetBits);
        }
    }

    while ((pxAdap->pxInst->TWIHS_SR & TWIHS_SR_TXCOMP_Msk) == 0)
    {
        ; /* Wait until transmission complete */
    }
}


/**
 * @brief   Configure TWI0 pins as peripheral function and
 *          enable internal pullups.
 *
 * @param   None.
 *
 * @retval  None.
 */
static void TWI0_IO_vInit(void)
{
    PIO_ConfigurePull(TWI0_PORT, PIN_TWCK0 | PIN_TWD0, PIO_PULLUP);
    PIO_vSetPeripheralFunction(TWI0_PORT, PIN_TWCK0 | PIN_TWD0, PIO_PERIPH_A);
}


/**
 * @brief   Write Transmit Holding Register.
 *
 * @param   pxTwi     TWI instance pointer.
 *
 * @param   ucByte    Write value.
 */
static void TWI_vWriteTHR(Twihs *pxTwi, const uint8_t ucByte)
{
    configASSERT((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));

    pxTwi->TWIHS_THR = TWIHS_THR_TXDATA(ucByte);
    while ((pxTwi->TWIHS_SR & TWIHS_SR_TXRDY_Msk) == 0)
    {
        ; /* Wait until data sent */
    }
}


/**
 * @brief   Read Receive Holding Register.
 *
 * @param   pxTwi     TWI instance pointer.
 *
 * @retval  RHR       Register value.
 */
static uint8_t TWI_ucReadRHR(Twihs *pxTwi)
{
    configASSERT((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));
    return TWIHS_RHR_RXDATA(pxTwi->TWIHS_RHR);
}


/**
 * @brief   Write TWI.
 *
 * @param   pxTwi     TWI instance pointer.
 *
 * @param   ulTarget  Device address to write.
 *
 * @param   pxMsg     Message buffer.
 *
 * @param   ulSr      Repeated Start.
 *
 * @retval  xRet      Write success/failure.
 */
static bool TWI_bWrite(Twihs *pxTwi, const uint32_t ulTarget, TWI_Msg *pxMsg, const uint32_t ulSr)
{
    BaseType_t xRet = pdTRUE;

    configASSERT((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));

    pxMsg->ulFlags = ulSr;
    xRet &= xQueueSend(xTwiQueue, (void *)&pxMsg, NULL);
    configASSERT(xRet == pdTRUE);

    /* START bit sent automatically when writing */
    pxTwi->TWIHS_MMR |= TWIHS_MMR_DADR(ulTarget) & ~TWIHS_MMR_MREAD_Msk;
    __DMB();

    /* Enabling IRQ starts xfer and begin waiting until xfer done */
    pxTwi->TWIHS_IER = TWIHS_IER_TXRDY_Msk;
    xRet &= xSemaphoreTake(xTwiSema, pdMS_TO_TICKS(50));
    configASSERT(xRet == pdTRUE);
    
    return (bool)xRet;
}


/**
 * @brief   Read TWI.
 *
 * @param   pxTwi     TWI instance pointer.
 *
 * @param   ulTarget  Device address to read.
 *
 * @param   pxMsg     Receive buffer.
 *
 * @retval  xRet      Read success/failure.
 */
static bool TWI_bRead(Twihs *pxTwi, const uint32_t ulTarget, TWI_Msg *pxMsg)
{
    BaseType_t  xRet = pdTRUE;
    uint32_t    ulMask = TWIHS_CR_START_Msk;

    configASSERT((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));

    xRet &= xQueueSend(xTwiQueue, (void *)&pxMsg, NULL);
    configASSERT(xRet == pdTRUE);

    pxTwi->TWIHS_MMR |= TWIHS_MMR_DADR(ulTarget) | TWIHS_MMR_MREAD_Msk;
    __DMB();

    /* START & STOP on single byte read */
    if (pxMsg->ulLen == 1)
    {
        ulMask |= TWIHS_CR_STOP_Msk;
    }
    TWI_vWriteCR(pxTwi, ulMask);

    /* Enabling IRQ starts xfer and begin waiting until xfer done */
    pxTwi->TWIHS_IER = TWIHS_IER_RXRDY_Msk;
    xRet &= xSemaphoreTake(xTwiSema, pdMS_TO_TICKS(50));
    configASSERT(xRet == pdTRUE);

    return (bool)xRet;
}


/**
 * @brief   Write control register.
 *
 * @param   pxAdap    Pointer to TWI adapter.
 *
 * @param   ulMask    Mask to write.
 *
 * @retval  None.
 */
static void TWI_vWriteCR(Twihs *pxTwi, uint32_t ulMask)
{
    configASSERT((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));
    pxTwi->TWIHS_CR = ulMask;
    __DMB();
}


/**
 * @brief   Manually generate 9 clock pulses to release the line.
 *
 * @param   None.
 *
 * @return  None.
 */
static void TWI_vReleaseSlave(Twihs *pxTwi)
{
    configASSERT((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));

    pxTwi->TWIHS_CR = TWIHS_CR_CLEAR_Msk | TWIHS_CR_THRCLR_Msk;
    __DMB();
}

/**
 * @brief   Set TWI master mode.
 *
 * @param   pxTwi   Pointer to TWI instance.
 *
 * @retval  None.
 */
static void TWI_vSetMasterMode(Twihs *pxTwi)
{
    configASSERT((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));
    pxTwi->TWIHS_CR = TWIHS_CR_MSEN_Msk | TWIHS_CR_SVDIS_Msk;
}


/**
 * @brief   Set TWI slave mode.
 *
 * @param   pxTwi   Pointer to TWI instance.
 *
 * @retval  None.
 */
static void TWI_vSetSlaveMode(Twihs *pxTwi)
{
    configASSERT((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));
    pxTwi->TWIHS_CR = TWIHS_CR_MSDIS_Msk | TWIHS_CR_SVEN_Msk;
}


void TWIHS0_Handler(void)
{
    BaseType_t      xRet;
    uint32_t        ulStatus;
    const uint32_t  ulErrMask  = TWIHS_SR_ARBLST_Msk | TWIHS_SR_UNRE_Msk | TWIHS_SR_OVRE_Msk;
    BaseType_t      xTaskWoken = pdFALSE;
    static uint32_t ulCnt      = 0;
    static TWI_Msg *pxMsg      = NULL;

    ulStatus = TWIHS0->TWIHS_SR;

    if ((ulStatus & ulErrMask) != 0)
    {
        __BKPT();
    }
    else
    {
        /* Get a new message if not in middle of xfer */
        if (pxMsg == NULL)
        {
            xRet = xQueueReceiveFromISR(xTwiQueue, (void *)&pxMsg, &xTaskWoken);
            configASSERT(xRet == pdTRUE);
        }

        if ((ulStatus & TWIHS_SR_TXRDY_Msk) && (TWIHS0->TWIHS_IMR & TWIHS_IMR_TXRDY_Msk))
        {
            /* Should be in master write mode here */
            configASSERT((TWIHS0->TWIHS_MMR & TWIHS_MMR_MREAD) == 0);

            TWIHS0->TWIHS_THR = TWIHS_THR_TXDATA(pxMsg->pucBuf[ulCnt++]);
        
            /* Perform some last byte special handling */
            if (ulCnt >= pxMsg->ulLen)
            {
                /* Skip STOP if Repeated START */
                if (pxMsg->ulFlags <= 1)
                {
                    TWI_vWriteCR(TWIHS0, TWIHS_CR_STOP_Msk);
                }
                TWIHS0_Handler_vEndXfer(pxMsg, &ulCnt, &xTaskWoken);
            }
        }

        if ((ulStatus & TWIHS_SR_RXRDY_Msk) && (TWIHS0->TWIHS_IMR & TWIHS_IMR_RXRDY_Msk)) 
        {
            /* Should be in master read mode here */
            configASSERT((TWIHS0->TWIHS_MMR & TWIHS_MMR_MREAD) != 0);

            if (ulCnt < (pxMsg->ulLen - 1))
            {
                pxMsg->pucBuf[ulCnt++] = TWI_ucReadRHR(TWIHS0);
            }
            else /* Do last byte handling */
            {
                /* Send STOP before reading the last byte to avoid
                 * initiating a unnecessary transaction
                 */
                TWI_vWriteCR(TWIHS0, TWIHS_CR_STOP_Msk);
                pxMsg->pucBuf[ulCnt] = TWI_ucReadRHR(TWIHS0);

                TWIHS0_Handler_vEndXfer(pxMsg, &ulCnt, &xTaskWoken);
            }
        }
    }

    portEND_SWITCHING_ISR(xTaskWoken);
    if (xTaskWoken != pdFALSE)
    {
        portYIELD();
    }
}


static void TWIHS0_Handler_vEndXfer(TWI_Msg *pxMsg, uint32_t *pulCnt, BaseType_t *pxTaskWoken)
{
    BaseType_t xRet;

    /* Sanity check */
    configASSERT(pxMsg != NULL);

    /* No penalty for disabling both IRQs */
    TWIHS0->TWIHS_IDR = TWIHS_IDR_TXRDY_Msk | TWIHS_IDR_RXRDY_Msk;

    /* Signal subscriber */
    xRet = xSemaphoreGiveFromISR(xTwiSema, pxTaskWoken);
    configASSERT(xRet == pdTRUE);

    pxMsg   = NULL;
    *pulCnt = 0;
}
