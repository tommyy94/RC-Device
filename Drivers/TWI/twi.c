/* Device includes */
#include <same70q21b.h>
#include <utils_assert.h>
#include <stdbool.h>

/* User includes */
#include "twi.h"
#include "pio.h"


#define TWI0_PORT       (PIOA)
#define PIN_TWCK0       (1 << 4u)
#define PIN_TWD0        (1 << 3u)
#define TWI_WRITE       (0x00u)
#define TWI_READ        (0x01u)


static void    TWI0_IO_vInit(void);
static void    TWI_vReleaseSlave(Twihs *pxTwi);
static void    TWI_vSetMasterMode(Twihs *pxTwi);
static void    TWI_vSetSlaveMode(Twihs *pxTwi);
static void    TWI_vWriteCR(Twihs *pxTwi, uint32_t ulMask);
static bool    TWI_bWrite(Twihs *pxTwi, const uint32_t ulTarget, TWI_Msg *pxMsg, const uint32_t ulSr);
static void    TWI_vRead(Twihs *pxTwi, const uint32_t ulTarget, TWI_Msg *pxMsg);
static void    TWI_vWriteTHR(Twihs *pxTwi, const uint8_t ucByte);
static uint8_t TWI_ucReadRHR(Twihs *pxTwi);


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
    TWI_vWriteCR(TWIHS0, TWIHS_CR_FIFOEN_Msk);

    TWI_vSetMasterMode(TWIHS0);
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
    /* Sanity check */
    assert((pxAdap->pxInst == TWIHS0) || (pxAdap->pxInst == TWIHS1) || (pxAdap->pxInst == TWIHS2), __FILE__, __LINE__);
    assert((pxAdap->pxMsg->ulFlags == TWI_WRITE) || (pxAdap->pxMsg->ulFlags == TWI_READ), __FILE__, __LINE__);

    for (uint32_t ulK = 0; ulK < ulCount; ulK++)
    {
        if ((pxAdap->pxMsg[ulK].ulFlags == TWI_READ))
        {
            TWI_vRead(pxAdap->pxInst, pxAdap->ulAddr, &(pxAdap->pxMsg[ulK]));
        }
        else
        {
            if (TWI_bWrite(pxAdap->pxInst, pxAdap->ulAddr, &(pxAdap->pxMsg[ulK]), ulK) == false)
            {
                TWI_vReleaseSlave(pxAdap->pxInst);
            }
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
    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2), __FILE__, __LINE__);

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
    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2), __FILE__, __LINE__);

    while ((pxTwi->TWIHS_SR & TWIHS_SR_RXRDY_Msk) == 0)
    {
        ; /* Wait until receiver ready */
    }
    return pxTwi->TWIHS_RHR;
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
 * @retval  bRet      Write success/failure.
 */
static bool TWI_bWrite(Twihs *pxTwi, const uint32_t ulTarget, TWI_Msg *pxMsg, const uint32_t ulSr)
{
    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2), __FILE__, __LINE__);

    bool bRet = true;

    pxTwi->TWIHS_MMR |= TWIHS_MMR_DADR(ulTarget) & ~TWIHS_MMR_MREAD_Msk;
    __DMB();

    /* START bit sent automatically when writing */
    for (uint32_t ulCnt = 0; ulCnt < pxMsg->ulLen; ulCnt++)
    {
        TWI_vWriteTHR(pxTwi, pxMsg->pucBuf[ulCnt]);

        /*  Check if ACK received */
        if ((pxTwi->TWIHS_SR & TWIHS_SR_NACK_Msk) != 0)
        {
            bRet = false;
        }
    }

    /* Send STOP bit if last xfer */
    if (ulSr <= 1)
    {
        TWI_vWriteCR(pxTwi, TWIHS_CR_STOP_Msk);
    }

    return bRet;
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
 * @retval  None.
 */
static void TWI_vRead(Twihs *pxTwi, const uint32_t ulTarget, TWI_Msg *pxMsg)
{
    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2), __FILE__, __LINE__);

    uint32_t ulCnt = 0;

    /* START & STOP on single byte read */
    if (pxMsg->ulLen == 1)
    {
        pxTwi->TWIHS_MMR |= TWIHS_MMR_DADR(ulTarget) | TWIHS_MMR_MREAD_Msk;
        __DMB();
        TWI_vWriteCR(pxTwi, TWIHS_CR_START_Msk | TWIHS_CR_STOP_Msk);
        pxMsg->pucBuf[ulCnt] = TWI_ucReadRHR(pxTwi);
    }
    else
    {
        pxTwi->TWIHS_MMR |= TWIHS_MMR_DADR(ulTarget) | TWIHS_MMR_MREAD_Msk;
        __DMB();
        TWI_vWriteCR(pxTwi, TWIHS_CR_START_Msk);
        for (ulCnt = ulCnt; ulCnt < (pxMsg->ulLen - 1); ulCnt++)
        {
            pxMsg->pucBuf[ulCnt] = TWI_ucReadRHR(pxTwi);
        }

        /* Send STOP before reading the last byte to avoid
         * initiating a unnecessary transaction
         */
        TWI_vWriteCR(pxTwi, TWIHS_CR_STOP_Msk);
        pxMsg->pucBuf[ulCnt] = TWI_ucReadRHR(pxTwi);
    }
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
    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2), __FILE__, __LINE__);
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
    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2), __FILE__, __LINE__);

    pxTwi->TWIHS_CR = TWIHS_CR_CLEAR_Msk;
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
    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2), __FILE__, __LINE__);
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
    assert((pxTwi == TWIHS0) || (pxTwi == TWIHS1) || (pxTwi == TWIHS2), __FILE__, __LINE__);
    pxTwi->TWIHS_CR = TWIHS_CR_MSDIS_Msk | TWIHS_CR_SVEN_Msk;
}
