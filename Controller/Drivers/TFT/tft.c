/**
 * Driver for Sitronix ST7735R
 * display controller.
 */

 /* System includes */
 #include <string.h>

/* User includes */
#include "tft.h"
#include "defines.h"
#include "spi.h"

/* Device vendor includes */
#include "MKL25Z4.h"
#include "fsl_bitaccess.h"

#define TFT_PORT    (PORTC)
#define TFT_GPIO    (FGPIOC)
#define TFT_RESET   (0ul)   /* Active LOW */
#define TFT_DC      (3ul)   /* Control = LOW, Data = HIGH */

/* Command list */
#define RDDID   (0x04u)


static SPI_Adapter xSpiAdap =
{
    .eInstance = SPI_TFT
};


static void TFT_IO_vInit(void);
static void TFT_vSetCommandMode(void);
static void TFT_vSetDataMode(void);

void TFT_SPI_vCallback(const uint32_t ulCnt);


/**
 * @brief   Initialize the TFT driver.
 *
 * @param   None.
 *
 * @return  None.
 *
 * @note    ST7735R SPI settings:
            - Chip Select active LOW.
 *          - MSB first.
 *          - SPI mode 0 (SCK idle low, data on rising edge).
 */
void TFT_vInit(void)
{
    TFT_IO_vInit();

    /* Configure TFT */

}


/**
 * @brief   Initialize RESET andc DC for ST735R.
 *
 * @param   None.
 *
 * @return  None.
 */
static void TFT_IO_vInit(void)
{
    /* Configure IO */
    TFT_PORT->PCR[TFT_DC]     &= ~PORT_PCR_MUX_MASK;
    TFT_PORT->PCR[TFT_DC]     |=  PORT_PCR_MUX(ALT1);
    TFT_GPIO->PDDR            |=  MASK(TFT_DC);
    TFT_PORT->PCR[TFT_RESET]  &= ~PORT_PCR_MUX_MASK;
    TFT_PORT->PCR[TFT_RESET]  |=  PORT_PCR_MUX(ALT1);
    TFT_GPIO->PDDR            |=  MASK(TFT_RESET);

    /* Release the device from reset */
    TFT_GPIO->PDOR            |=  MASK(TFT_RESET);
}

static void TFT_vSetCommandMode(void)
{
    TFT_GPIO->PCOR |= MASK(TFT_DC);
}

static void TFT_vSetDataMode(void)
{
    TFT_GPIO->PSOR |= MASK(TFT_DC);
}

typedef struct
{
    uint8_t   ucCmd;
    uint8_t  *pucParams;
    uint8_t  *pucRecv;
    uint32_t  ulParamCnt;
} TFT_Command;

void TFT_vSendCommand(TFT_Command *pxCmd)
{
    uint8_t pucBuf[32];

    /* NOTE: 1 byte buffer overflow on pxCmd->pucRecv */

    pucBuf[0] = pxCmd->ucCmd;
    memcpy(&pucBuf[1], pxCmd->pucParams, pxCmd->ulParamCnt);

    TFT_vSetCommandMode();
    xSpiAdap.pucTx        = pucBuf;
    xSpiAdap.pucRx        = pxCmd->pucRecv;
    xSpiAdap.ulLen        = pxCmd->ulParamCnt + 1;
    xSpiAdap.pvTxCallback = &TFT_SPI_vCallback;
    SPI_bXfer(&xSpiAdap);
}

void TFT_SPI_vCallback(const uint32_t ulCnt)
{
    if (ulCnt == 1)
    {
        TFT_vSetDataMode();
    }
}
