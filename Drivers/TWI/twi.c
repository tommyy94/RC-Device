/* Device includes */
#include <same70q21b.h>
#include <utils_assert.h>

/* User includes */
#include "twi.h"
#include "pio.h"

#define ADDR_MPU6050    (0x68)
#define PIN_TWCK0       (1 << 4u)
#define PIN_TWD0        (1 << 3u)


static void TWI0_IO_vInit(void);
static void TWI_vReleaseSlave(Twihs *pxTwi);
static void TWI_vSetMasterMode(Twihs *pxTwi);
static void TWI_vSetSlaveMode(Twihs *pxTwi);
static void TWI_vSendStart(Twihs *pxTwi);
static void TWI_vSendStop(Twihs *pxTwi);
void TWI_vWrite(Twihs *pxTwi, uint32_t ulAddr, uint8_t ucData[], const uint32_t ulLen);


void TWI0_vInit(void)
{
    uint8_t buf[3] = { 0xAA, 0xBB, 0xCC}; 

    TWI0_IO_vInit();

    /**
     * Enable TWI0 clock gating
     * - TWI0 clock = Peripheral clock / 2
     *              = 150 MHz / 2 = 75 MHz
     */
    PMC->PMC_PCR |= PMC_PCR_CMD_Msk | PMC_PCR_PID(TWIHS0_CLOCK_ID) | PMC_PCR_EN_Msk;

    TWIHS0->TWIHS_CWGR = TWIHS_CWGR_CKDIV(1) | TWIHS_CWGR_CHDIV(43) | TWIHS_CWGR_CLDIV(43);
    TWIHS0->TWIHS_CR |= TWIHS_CR_FIFOEN_Msk;

    TWI_vSetMasterMode(TWIHS0);

    TWI_vWrite(TWIHS0, ADDR_MPU6050, buf, 3);
}


static void TWI0_IO_vInit(void)
{
    PIO_ConfigurePull(PIOA, PIN_TWCK0 | PIN_TWD0, PIO_PULLUP);
    PIO_vSetPeripheralFunction(PIOA, PIN_TWCK0 | PIN_TWD0, PIO_PERIPH_A);
}


void TWI_vWrite(Twihs *pxTwi, uint32_t ulAddr, uint8_t ucData[], const uint32_t ulLen)
{
    assert(ulAddr <= 0x7F, __FILE__, __LINE__);

    pxTwi->TWIHS_MMR |= TWIHS_MMR_DADR(ulAddr) & ~TWIHS_MMR_MREAD_Msk;
    __DMB();

    /* START bit sent automatically when writing */
    for (uint32_t ulCnt = 0; ulCnt < ulLen; ulCnt++)
    {
        pxTwi->TWIHS_THR = TWIHS_THR_TXDATA(ucData[ulCnt]);
        while ((pxTwi->TWIHS_SR & TWIHS_SR_TXRDY_Msk) == 0)
        {
            ; /* Wait until data sent */
        }

        /*  Check if ACK received */
        if ((pxTwi->TWIHS_SR & TWIHS_SR_NACK_Msk) != 0)
        {
            __BKPT();
        }
    }

    TWI_vSendStop(pxTwi);

    while ((pxTwi->TWIHS_SR & TWIHS_SR_TXCOMP_Msk) == 0)
    {

    }
}


void TWI_vRead(Twihs *pxTwi)
{
    TWIHS0->TWIHS_MMR |= TWIHS_MMR_MREAD_Msk;
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
    /* Configure SCK as GPIO */

    for (uint32_t ulPulse = 0; ulPulse < 9; ulPulse++)
    {
        /* Toggle IO lines to generate pulses */
    }

    /* Configure SCK as peripheral function */
}


static void TWI_vSetMasterMode(Twihs *pxTwi)
{
    pxTwi->TWIHS_CR = TWIHS_CR_MSEN_Msk | TWIHS_CR_SVDIS_Msk;
}


static void TWI_vSetSlaveMode(Twihs *pxTwi)
{
    pxTwi->TWIHS_CR = TWIHS_CR_MSDIS_Msk | TWIHS_CR_SVEN_Msk;
}


static void TWI_vSendStart(Twihs *pxTwi)
{
    pxTwi->TWIHS_CR = TWIHS_CR_START_Msk;
}


static void TWI_vSendStop(Twihs *pxTwi)
{
    pxTwi->TWIHS_CR = TWIHS_CR_STOP_Msk;
}
