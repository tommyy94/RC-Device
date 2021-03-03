/**
 * spi.c
 * Driver module for MKL25 SPI peripheral.
 */


/* Device vendor headers */
#include "MKL25Z4.h"
#include "fsl_bitaccess.h"

/* RTOS headers */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"

/* User headers */
#include "spi.h"
#include "defines.h"
#include "system.h"


/* Local defines */
#define MISO0                   (7UL)
#define SCK0                    (5UL)
#define MOSI0                   (6UL)
#define SS0                     (4UL)
#define MISO1                   (1UL)
#define SCK1                    (2UL)
#define MOSI1                   (3UL)
#define SS1                     (4UL)

#define SPI_TIMEOUT_MS          (10UL)

/* SPI is always mapped as a group in the
 * multiplexing table. Should probably follow it.
 */
#define SPI0_PORT               (PORTC)
#define SPI0_GPIO               (FGPIOC)
#define SPI1_PORT               (PORTE)
#define SPI1_GPIO               (FGPIOE)


typedef enum
{
    MODE_0,
    MODE_1,
    MODE_2,
    MODE_3,
    MODE_COUNT
} SPI_Mode;


extern QueueHandle_t      xSpiQueue[SPI_COUNT];
extern SemaphoreHandle_t  xSpiSema[SPI_COUNT];

SPI_Type *pxSpiTable[SPI_COUNT] = { SPI0, SPI1 };

__STATIC_INLINE void SPI0_IO_vInit(void);
__STATIC_INLINE void SPI1_IO_vInit(void);
__STATIC_INLINE void SPI_vSetMode(SPI_Type *const pxSpi, const SPI_Mode eMode);
__STATIC_INLINE void SPI_vSetSlave(SPI_Target eInst, const uint32_t ulState);

static void SPI_IRQHandler(const SPI_Target eInst);


/* Function descriptions */

/**
 * @brief   Configure GPIO for SPI1.
 * 
 * @param   None
 * 
 * @return  None
 *
 * @note    SPI always mapped to ALT2 and ALT5. ALT5
 *          swaps MOSI and MISO.
 *
 * @note    SS   = PTC4
 *          SCK  = PTC5
 *          MOSI = PTC6
 *          MISO = PTC7
 */
__STATIC_INLINE void SPI0_IO_vInit(void)
{
    /* Set clock */
    SPI0_PORT->PCR[SCK0] &= ~PORT_PCR_MUX_MASK;
    SPI0_PORT->PCR[SCK0] |=  PORT_PCR_MUX(ALT2);
    
    /* Set Master Out Slave In */
    SPI0_PORT->PCR[MOSI0] &= ~PORT_PCR_MUX_MASK;
    SPI0_PORT->PCR[MOSI0] |=  PORT_PCR_MUX(ALT2);
    
    /* Set Master In Slave out
     * Enable internal pulldown
     */
    SPI0_PORT->PCR[MISO0] &= ~PORT_PCR_MUX_MASK;
    SPI0_PORT->PCR[MISO0] |=  PORT_PCR_MUX(ALT2) | PORT_PCR_PE(1);
    
    /* Set manual SS */
    SPI0_PORT->PCR[SS0]   &= ~PORT_PCR_MUX_MASK;
    SPI0_PORT->PCR[SS0]   |=  PORT_PCR_MUX(ALT1);
    SPI0_GPIO->PDDR       |=  MASK(SS0);
    SPI0_GPIO->PDOR       |=  MASK(SS0);
}

/**
 * @brief   Configure GPIO for SPI1.
 * 
 * @param   None
 * 
 * @return  None
 *
 * @note    SPI always mapped to ALT2 and ALT5. ALT5
 *          swaps MOSI and MISO.
 *
 * @note    SS   = PTE4
 *          SCK  = PTE2
 *          MOSI = PTE3
 *          MISO = PTE1
 */
__STATIC_INLINE void SPI1_IO_vInit(void)
{
    /* Set clock */
    SPI1_PORT->PCR[SCK1] &= ~PORT_PCR_MUX_MASK;
    SPI1_PORT->PCR[SCK1] |=  PORT_PCR_MUX(ALT2);
    
    /* Set Master Out Slave In */
    SPI1_PORT->PCR[MOSI1] &= ~PORT_PCR_MUX_MASK;
    SPI1_PORT->PCR[MOSI1] |=  PORT_PCR_MUX(ALT5);
    
    /* Set Master In Slave out
     * Enable internal pulldown
     */
    SPI1_PORT->PCR[MISO1] &= ~PORT_PCR_MUX_MASK;
    SPI1_PORT->PCR[MISO1] |=  PORT_PCR_MUX(ALT5) | PORT_PCR_PE(1);
    
    /* Set manual SS */
    SPI1_PORT->PCR[SS1]   &= ~PORT_PCR_MUX_MASK;
    SPI1_PORT->PCR[SS1]   |= PORT_PCR_MUX(ALT1);
    SPI1_GPIO->PDDR       |= MASK(SS1);
    SPI1_GPIO->PDOR       |= MASK(SS1);
}


/**
 * @brief   Set SS line high/low.
 *
 * @param   eInst       SPI instance
 *
 * @param   ulState     HIGH/LOW
 *             
 * @return  None
 */
__STATIC_INLINE void SPI_vSetSlave(SPI_Target eInst, const uint32_t ulState)
{
    FGPIO_Type *pxPort[SPI_COUNT] = { FGPIOC, FGPIOE };

    configASSERT((eInst == SPI_TFT) || (eInst == SPI_RF));
    configASSERT(ulState == LOW || (ulState == HIGH));
    
    /* Figure out whether to set or clear bit:
     * Subtract 0 - 1 words from PCOR address => pulReg = FGPIOE->PSOR/PCOR
     */
    const uint32_t *pulReg = (uint32_t *)&pxPort[eInst]->PCOR - ulState;
    
    /* Perform bitwise operation */
    BME_OR8(&(*pulReg), MASK(SS1));
}


/**
 * @brief   Set SPI mode.
 * 
 * @param   eMode       Selected SPI mode.
 * 
 * @return  None
 */
__STATIC_INLINE void SPI_vSetMode(SPI_Type *pxSpi, SPI_Mode eMode)
{
    configASSERT((pxSpi == SPI0) || (pxSpi == SPI1));
    configASSERT(eMode < MODE_COUNT);

    const uint32_t modeTable[MODE_COUNT] =
    {
        SPI_C1_CPOL(0) | SPI_C1_CPHA(0),  /* Mode 0 */
        SPI_C1_CPOL(0) | SPI_C1_CPHA(1),  /* Mode 1 */
        SPI_C1_CPOL(1) | SPI_C1_CPHA(0),  /* Mode 2 */
        SPI_C1_CPOL(1) | SPI_C1_CPHA(1)   /* Mode 3 */
    };

    pxSpi->C1 &= ~(SPI_C1_CPHA_MASK | SPI_C1_CPOL_MASK);
    pxSpi->C1 |= modeTable[eMode];
}


/**
 * @brief   Initialize SPI0 peripheral.
 * 
 * @details Baud rate = 48 MHz/(3*2�) = 4 MHz = 250 ns/bit
 *          Mode 0, MSB first, manual SS.
 * 
 * @param   None
 * 
 * @return  None
 */
void SPI0_vInit(void)
{    
    /* Disable SPI during configuration */
    SPI0->C1 &= ~SPI_C1_SPE_MASK;
    
    SPI0_IO_vInit();

    /* Select master mode with manual SS output */
    SPI0->C1  =  SPI_C1_MSTR_MASK;
    SPI0->C2 &= ~SPI_C2_MODFEN_MASK;
    
    /* Baudrate = Bus clock / ((SPPR + 1) * 2^^(SPR+1)) */
    SPI0->BR = SPI_BR_SPPR(2) | SPI_BR_SPR(2);
    
    SPI_vSetMode(SPI0, MODE_0);
    
    /* Enable module */
    SPI0->C1 |= SPI_C1_SPE_MASK;

    NVIC_ClearPendingIRQ(SPI0_IRQn);
    NVIC_SetPriority(SPI0_IRQn, SPI0_IRQ_PRIO);
    NVIC_EnableIRQ(SPI0_IRQn);
}



/**
 * @brief   Initialize SPI1 peripheral.
 * 
 * @details Baud rate = 48 MHz/(3*2�) = 4 MHz = 250 ns/bit
 *          Mode 0, MSB first, manual SS.
 * 
 * @param   None
 * 
 * @return  None
 */
void SPI1_vInit(void)
{    
    /* Disable SPI during configuration */
    SPI1->C1 &= ~SPI_C1_SPE_MASK;
    
    SPI1_IO_vInit();

    /* Select master mode with manual SS output */
    SPI1->C1  =  SPI_C1_MSTR_MASK;
    SPI1->C2 &= ~SPI_C2_MODFEN_MASK;
    
    /* Baudrate = Bus clock / ((SPPR + 1) * 2^^(SPR+1)) */
    SPI1->BR = SPI_BR_SPPR(2) | SPI_BR_SPR(2);
    
    SPI_vSetMode(SPI1, MODE_0);
    
    /* Enable module */
    SPI1->C1 |= SPI_C1_SPE_MASK;

    NVIC_ClearPendingIRQ(SPI1_IRQn);
    NVIC_SetPriority(SPI1_IRQn, SPI1_IRQ_PRIO);
    NVIC_EnableIRQ(SPI1_IRQn);
}


/**
 * @brief   Interrupt driven SPI transmit.
 * 
 * @param   pxAdap  Pointer to SPI adapter.
 * 
 * @return  xRet    Xfer ok/fail.
 */
bool SPI_bXfer(SPI_Adapter *pxAdap)
{
    BaseType_t xRet;

    /* Share pointer with the IRQ handler */
    xRet = xQueueSend(xSpiQueue[pxAdap->eInstance], (void *)&pxAdap, NULL);
    configASSERT(xRet == pdTRUE);

    /* Start transmitting */
    BME_OR8(&pxSpiTable[pxAdap->eInstance]->C1, SPI_C1_SPIE_MASK);
    BME_OR8(&pxSpiTable[pxAdap->eInstance]->C1, SPI_C1_SPTIE_MASK);

    /* Wait until xfer cplt */
    xRet = xSemaphoreTake(xSpiSema[pxAdap->eInstance], pdMS_TO_TICKS(SPI_TIMEOUT_MS));
    if (xRet == pdFALSE)
    {
        pxSpiTable[pxAdap->eInstance]->C1 = 0;
        __BKPT();
    }

    return (bool)xRet;
}


/**
 * @brief   SPI ISR.
 * 
 * @param   eInst   SPI instance.
 *             
 * @return  None
 *
 * @note    This function is fully re-entrant.
 */
static void SPI_IRQHandler(const SPI_Target eInst)
{
    static uint32_t        ulCnt[SPI_COUNT];
    static SPI_Adapter    *pxAdap[SPI_COUNT] = { NULL };
    BaseType_t             xRet;
    BaseType_t             xHigherPrioTaskWoken = pdFALSE;

    configASSERT((eInst == SPI_TFT) || (eInst == SPI_RF));

    /* Read message buffer if this is a new transfer */
    if (pxAdap[eInst] == NULL)
    {
        ulCnt[eInst] = 0;
        xRet = xQueueReceiveFromISR(xSpiQueue[eInst], (void *)&pxAdap[eInst], &xHigherPrioTaskWoken);
        configASSERT(xRet == pdTRUE);
        SPI_vSetSlave(eInst, LOW);
    }

    /* Must read receive buffer first to avoid overrun */
    if (BME_UBFX8(&pxSpiTable[eInst]->S, SPI_S_SPRF_SHIFT, SPI_S_SPRF_WIDTH) != 0)
    {
        pxAdap[eInst]->pucRx[ulCnt[eInst]] = pxSpiTable[eInst]->D;
        ulCnt[eInst]++;

        if (pxAdap[eInst]->pvRxCallback != NULL)
        {
            pxAdap[eInst]->pvRxCallback(ulCnt[eInst]);
        }

        /* Check if this was the last byte */
        if (ulCnt[eInst] > pxAdap[eInst]->ulLen)
        {
            BME_AND8(&pxSpiTable[eInst]->C1, (uint8_t)~SPI_C1_SPIE_MASK);

            SPI_vSetSlave(eInst, HIGH);
            xRet = xSemaphoreGiveFromISR(xSpiSema[eInst], &xHigherPrioTaskWoken);
            configASSERT(xRet == pdTRUE);

            /* Must reset adapter pointer for next xfer */
            pxAdap[eInst] = NULL;
        }
        else
        {
            BME_OR8(&pxSpiTable[eInst]->C1, SPI_C1_SPTIE_MASK);
        }
    }

    if ((BME_UBFX8(&pxSpiTable[eInst]->C1, SPI_C1_SPTIE_SHIFT, SPI_C1_SPTIE_WIDTH) != 0)
     && (BME_UBFX8(&pxSpiTable[eInst]->S, SPI_S_SPTEF_SHIFT, SPI_S_SPTEF_WIDTH)  != 0))
    {
        BME_AND8(&pxSpiTable[eInst]->C1, (uint8_t)~SPI_C1_SPTIE_MASK);

        pxSpiTable[eInst]->D = pxAdap[eInst]->pucTx[ulCnt[eInst]];

        if (pxAdap[eInst]->pvTxCallback != NULL)
        {
            pxAdap[eInst]->pvTxCallback(ulCnt[eInst]);
        }
    }

    /* This condition should never occur as SSOE is set 1!
     * Leave check for debugging.
     */
    if (BME_UBFX8(&pxSpiTable[eInst]->S, SPI_S_MODF_SHIFT, SPI_S_MODF_WIDTH) != 0)
    {
        __BKPT();
    }

    /* Switch to higher priority task if needed */
    portYIELD_FROM_ISR(xHigherPrioTaskWoken);
}

/**
 * @brief   SPI0 ISR.
 * 
 * @param   None.
 *             
 * @return  None.
 */
void SPI0_IRQHandler(void)
{
    SPI_IRQHandler(SPI_TFT);
}

/**
 * @brief   SPI1 ISR.
 * 
 * @param   None.
 *             
 * @return  None.
 */
void SPI1_IRQHandler(void)
{
    SPI_IRQHandler(SPI_RF);
}
