/* Device includes */
#include <same70q21b.h>
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
#define TWI_ERR_MASK    (TWIHS_SR_ARBLST_Msk \
                         | TWIHS_SR_UNRE_Msk \
                         | TWIHS_SR_OVRE_Msk)


extern QueueHandle_t      xTwiQueue;
extern SemaphoreHandle_t  xTwiSema;


static void    TWI0_IO_vInit(void);
static void    TWI_vReleaseSlave(Twihs *pxTwi);
static void    TWI_vSetMasterMode(Twihs *pxTwi);
static void    TWI_vSetSlaveMode(Twihs *pxTwi);
static void    TWI_vWriteCR(Twihs *pxTwi, uint32_t ulMask);
static bool    TWI_bWrite(Twihs *pxTwi, const uint32_t ulTarget, TWI_Msg *pxMsg);
static bool    TWI_bRead(Twihs *pxTwi, const uint32_t ulTarget, TWI_Msg *pxMsg);
static void    TWI_vWriteTHR(Twihs *pxTwi, const uint8_t ucByte);
static uint8_t TWI_ucReadRHR(Twihs *pxTwi);
static void    TWIHS0_Handler_vEndXfer(uint32_t *pulCnt, BaseType_t *pxTaskWoken);
static void    TWI_vFlushTHR(Twihs *pxTwi);


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
    assert((pxAdap->pxInst == TWIHS0)
              || (pxAdap->pxInst == TWIHS1)
              || (pxAdap->pxInst == TWIHS2));

    for (uint32_t ulK = 0; ulK < ulCount; ulK++)
    {
        assert((pxAdap->pxMsg[ulK].ulFlags == TWI_WRITE)
                  || (pxAdap->pxMsg[ulK].ulFlags == TWI_READ));

        if (pxAdap->pxMsg[ulK].ulFlags == TWI_READ)
        {
            bRet = TWI_bRead(pxAdap->pxInst,
                             pxAdap->ulAddr,
                             &(pxAdap->pxMsg[ulK]));
        }
        else
        {
            if (ulK < (ulCount - 1))
            {
                pxAdap->pxMsg[ulK].ulFlags |= TWI_SR;
            }
            bRet = TWI_bWrite(pxAdap->pxInst,
                              pxAdap->ulAddr,
                              &(pxAdap->pxMsg[ulK]));
        }

        if (bRet == false)
        {
            TWI_vReleaseSlave(pxAdap->pxInst);
            Journal_vWriteError(I2C_ERROR);
        }
    }

    while ((pxAdap->pxInst->TWIHS_SR & TWIHS_SR_TXCOMP_Msk) == 0)
    {
        ; /* Wait until transmission complete */
    }

    TWI_vFlushTHR(pxAdap->pxInst);
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
    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));
    pxTwi->TWIHS_THR = TWIHS_THR_TXDATA(ucByte);
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
    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));
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
 * @retval  xRet      Write success/failure.
 */
static bool TWI_bWrite(
    Twihs             *pxTwi,
    const   uint32_t   ulTarget,
    TWI_Msg           *pxMsg)
{
    BaseType_t xRet          = pdTRUE;

    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));

    xRet &= xQueueSend(xTwiQueue, (void *)&pxMsg, NULL);
    assert(xRet == pdTRUE);

    /* START bit sent automatically when writing */
    pxTwi->TWIHS_MMR &= ~TWIHS_MMR_MREAD_Msk;
    __DMB();
    pxTwi->TWIHS_MMR |= TWIHS_MMR_DADR(ulTarget);
    __DMB();

    /* Enabling IRQ starts xfer and begin waiting until xfer done */
    pxTwi->TWIHS_IER = TWIHS_IER_TXRDY_Msk;
    xRet &= xSemaphoreTake(xTwiSema, pdMS_TO_TICKS(50));
    assert(xRet == pdTRUE);

    assert((pxTwi->TWIHS_SR & TWI_ERR_MASK) == 0);

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
static bool TWI_bRead(
    Twihs           *pxTwi,
    const uint32_t   ulTarget,
    TWI_Msg         *pxMsg)
{
    BaseType_t  xRet         = pdTRUE;
    uint32_t    ulMask       = TWIHS_CR_START_Msk;

    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));

    xRet &= xQueueSend(xTwiQueue, (void *)&pxMsg, NULL);
    assert(xRet == pdTRUE);

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
    xRet &= xSemaphoreTake(xTwiSema, pdMS_TO_TICKS(200));
    assert(xRet == pdTRUE);

    assert((pxTwi->TWIHS_SR & TWI_ERR_MASK) == 0);

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
    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));
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
    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));
    TWI_vWriteCR(pxTwi, TWIHS_CR_CLEAR_Msk | TWIHS_CR_THRCLR_Msk);
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
    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));
    TWI_vWriteCR(TWIHS0, TWIHS_CR_MSEN_Msk | TWIHS_CR_SVDIS_Msk);
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
    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2));
    TWI_vWriteCR(TWIHS0, TWIHS_CR_MSDIS_Msk | TWIHS_CR_SVEN_Msk);
}


/**
 * @brief   TWIHS0 IRQ handler.
 *
 * @param   None.
 *
 * @retval  None.
 */
void TWIHS0_Handler(void)
{
    BaseType_t      xRet;
    uint32_t        ulStatus;
    BaseType_t      xTaskWoken = pdFALSE;
    static uint32_t ulCnt      = 0;
    static TWI_Msg *pxMsg      = NULL;

    ulStatus = TWIHS0->TWIHS_SR;
    assert((ulStatus & TWI_ERR_MASK) == 0);
    if ((ulStatus & TWI_ERR_MASK) == 0)
    {
        /* Get a new message if not in middle of xfer */
        if (pxMsg == NULL)
        {
            xRet = xQueueReceiveFromISR(xTwiQueue, (void *)&pxMsg, &xTaskWoken);
            assert(xRet == pdTRUE);
        }

        if ((ulStatus & TWIHS_SR_TXRDY_Msk) && (TWIHS0->TWIHS_IMR & TWIHS_IMR_TXRDY_Msk))
        {
            /* Should be in master write mode here */
            assert((TWIHS0->TWIHS_MMR & TWIHS_MMR_MREAD) == 0);

            if ((ulStatus & TWIHS_SR_NACK) == 0)
            {
                TWI_vWriteTHR(TWIHS0, pxMsg->pucBuf[ulCnt++]);

                /* Perform some last byte special handling */
                if (ulCnt >= pxMsg->ulLen)
                {
                    /* Skip STOP if Repeated START */
                    if ((pxMsg->ulFlags & TWI_SR) != TWI_SR)
                    {
                        TWI_vWriteCR(TWIHS0, TWIHS_CR_STOP_Msk);
                    }

                    TWIHS0_Handler_vEndXfer(&ulCnt, &xTaskWoken);

                    /* Reset msg pointer for next xfer */
                    pxMsg = NULL;
                }
            }
            else
            {
                __BKPT();

                TWI_vWriteCR(TWIHS0, TWIHS_CR_STOP_Msk);
                TWIHS0_Handler_vEndXfer(&ulCnt, &xTaskWoken);

                /* Reset msg pointer for next xfer */
                pxMsg = NULL;
            }
        }

        if ((ulStatus & TWIHS_SR_RXRDY_Msk) && (TWIHS0->TWIHS_IMR & TWIHS_IMR_RXRDY_Msk)) 
        {
            /* Should be in master read mode here */
            assert((TWIHS0->TWIHS_MMR & TWIHS_MMR_MREAD) != 0);

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

                /* Reset msg pointer for next xfer */
                pxMsg = NULL;

                TWIHS0_Handler_vEndXfer(&ulCnt, &xTaskWoken);
            }
        }
    }

    portEND_SWITCHING_ISR(xTaskWoken);
    if (xTaskWoken != pdFALSE)
    {
        portYIELD();
    }
}


/**
 * @brief   Flush transmit holding register.
 *
 * @param   pxTwi   Pointer to TWIHS instance.
 *
 * @retval  None.
 */
static void TWI_vFlushTHR(Twihs *pxTwi)
{
    TWI_vWriteCR(pxTwi, TWIHS_CR_THRCLR);
}


/**
 * @brief   End TWI transaction.
 *
 * @param   pulCnt        Counter pointer.
 *
 * @param   pxTaskWoken   Store force context switch status.
 *
 * @retval  None.
 */
static void TWIHS0_Handler_vEndXfer(
    uint32_t    *pulCnt,
    BaseType_t  *pxTaskWoken)
{
    BaseType_t xRet;

    /* No penalty for disabling both IRQs */
    TWIHS0->TWIHS_IDR = TWIHS_IDR_TXRDY_Msk | TWIHS_IDR_RXRDY_Msk;

    /* Signal subscriber */
    xRet = xSemaphoreGiveFromISR(xTwiSema, pxTaskWoken);
    assert(xRet == pdTRUE);

    *pulCnt = 0;
}
