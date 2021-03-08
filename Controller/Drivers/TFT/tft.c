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
#define NOP     (0x00u) /* No Operation         */
#define SWRESET (0x01u) /* Software Reset       */
#define RDDID   (0x04u) /* Read Display ID      */
#define RDDST   (0x09u) /* Read Display Status  */
#define SLPIN   (0x10u) /* Sleep In             */
#define SLPOUT  (0x11u) /* Sleep Out            */
#define PTLON   (0x12u) /* Partial Mode On      */
#define NORON   (0x13u) /* Normal Mode On       */
#define INVOFF  (0x20u) /* Inversion Off        */
#define INVON   (0x21u) /* Inversion On         */
#define DISPOFF (0x28u) /* Display Off          */
#define DISPON  (0x29u) /* Display On           */
#define RDID1   (0xDAu) /* ID1 Read             */
#define RDID2   (0xDBu) /* ID2 Read             */
#define RDID3   (0xDCu) /* ID3 Read             */
#define IDMOFF  (0x38u) /* Idle Mode Off        */
#define IDMON   (0x39u) /* Idle Mode On         */


typedef struct
{
    uint8_t   ucCmd;
    uint8_t  *pucParams;
    uint8_t  *pucRecv;
    uint32_t  ulParamCnt;
} TFT_Command;

static SPI_Adapter xSpiAdap =
{
    .eInstance = SPI_TFT
};


static void TFT_IO_vInit(void);
static void TFT_vSetCommandMode(void);
static void TFT_vSetDataMode(void);
static void TFT_vReset(void);

void TFT_SPI_vCallback(const uint32_t ulCnt);
void TFT_vSendCommand(TFT_Command *pxCmd);
static void TFT_vPowerOn(void);


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

    TFT_vPowerOn();
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

void TFT_vSendCommand(TFT_Command *pxCmd)
{
    uint8_t pucBuf[32];

    pucBuf[0]       = pxCmd->ucCmd;
    xSpiAdap.pucTx  = pucBuf;
    xSpiAdap.pucRx  = pxCmd->pucRecv;

    if (pxCmd->ulParamCnt == 0)
    {
        xSpiAdap.ulLen        = pxCmd->ulParamCnt;
        xSpiAdap.pvRxCallback = NULL;
    }
    else
    {
        memcpy(&pucBuf[1], pxCmd->pucParams, pxCmd->ulParamCnt);
        xSpiAdap.ulLen        = pxCmd->ulParamCnt + 1;
        xSpiAdap.pvRxCallback = &TFT_SPI_vCallback;
    }

    TFT_vSetCommandMode();
    SPI_bXfer(&xSpiAdap);
}

void TFT_SPI_vCallback(const uint32_t ulCnt)
{
    if (ulCnt == 1)
    {                                                                                       
        TFT_vSetDataMode();
    }
}


static void TFT_vReset(void)
{
    TFT_GPIO->PCOR |= MASK(TFT_RESET);
}


static void TFT_vPowerOn(void)
{
    uint8_t pucRecv[4];
    uint8_t ucCmdTbl[5] =
    {
        SWRESET, DISPON, SLPOUT, IDMOFF, NORON
    };

    TFT_Command xCmd =
    {
        .pucRecv    = pucRecv,
        .ulParamCnt = 0
    };

    for (uint32_t ulCnt = 0; ulCnt < 5; ulCnt++)
    {
        xCmd.ucCmd = ucCmdTbl[ulCnt];
        TFT_vSendCommand(&xCmd);
    }
}
