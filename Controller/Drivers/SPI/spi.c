/**
 * spi.c
 * Driver module for MKL25 SPI peripheral.
 */


/* Device vendor headers */
#include "MKL25Z4.h"
#include "fsl_bitaccess.h"

#include "defines.h"
#include "system.h"




/* Local defines */
#define MISO                    (1UL)
#define SCK                     (2UL)
#define MOSI                    (3UL)
#define SS                      (4UL)

#define SPI1_TIMEOUT_MS         (10UL)


typedef enum
{
    MODE_0,
    MODE_1,
    MODE_2,
    MODE_3,
    MODE_COUNT
} SPI_Mode;


__STATIC_INLINE void SPI_vSetMode(SPI_Type *pxSpi, SPI_Mode eMode);


/* Function descriptions */

/**
 * @brief   Initialize SPI1 peripheral.
 * 
 * @details Baud rate = 48 MHz/(3*2�) = 4 MHz = 250 ns/bit
 *           Mode 3, MSB first, automatic SS.
 * 
 * @param   None
 * 
 * @return  None
 */
void SPI1_vInit(void)
{    
    /* Disable SPI during configuration */
    SPI1->C1 &= ~SPI_C1_SPE_MASK;
    
    /* Set PTE2 as SPI1_SCK */
    PORTE->PCR[SCK] &= ~PORT_PCR_MUX_MASK;
    PORTE->PCR[SCK] |= PORT_PCR_MUX(ALT2);
    
    /* Set PTE3 as SPI1_MOSI */
    PORTE->PCR[MOSI] &= ~PORT_PCR_MUX_MASK;
    PORTE->PCR[MOSI] |= PORT_PCR_MUX(ALT5);
    
    /* Set PTE1 as SPI1_MISO */
    PORTE->PCR[MISO] &= ~PORT_PCR_MUX_MASK;
    PORTE->PCR[MISO] |= PORT_PCR_MUX(ALT5);
    
    /* Set PTE4 as automatic SS */
    PORTE->PCR[SS] &= ~PORT_PCR_MUX_MASK;
    PORTE->PCR[SS] |= PORT_PCR_MUX(SS);

    /* Select master mode with automatic SS output */
    SPI1->C1 = SPI_C1_SSOE_MASK | SPI_C1_MSTR_MASK;
    SPI1->C2 = SPI_C2_MODFEN_MASK;
    
    /* Baudrate = Bus clock / ((SPPR + 1) * 2^^(SPR+1)) */
    SPI1->BR = SPI_BR_SPPR(0) | SPI_BR_SPR(1);
    
    SPI_vSetMode(SPI1, MODE_0);
    
    /* Enable module & interrupts */
    SPI1->C1 |= SPI_C1_SPIE_MASK | SPI_C1_SPE_MASK;
}


/**
 * @brief   Set SPI mode..
 * 
 * @param   eMode       Selected SPI mode.
 * 
 * @return  None
 */
__STATIC_INLINE void SPI_vSetMode(SPI_Type *pxSpi, SPI_Mode eMode)
{
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


void SPI1_vTransmitISR(uint8_t *const pucTx, uint8_t *const pucRx, uint32_t ulLength)
{
    BME_OR32(&SPI1->C1, SPI_C1_SPTIE_MASK);
}


/**
 * @brief   Read byte from SPI1 receive buffer.
 * 
 * @param   None
 * 
 * @return  SPI1->D     Received byte
 */
uint8_t SPI1_ucReadPolling(void)
{
    while (!BME_UBFX8(&SPI1->S, SPI_S_SPRF_SHIFT, SPI_S_SPRF_WIDTH))
    {
        ; /* Wait until buffer full */
    }
    
    return SPI1->D;
}


/**
 * @brief   Transmit character over SPI by polling.
 * 
 * @param   ucByte      Byte to send.
 * 
 * @return  None
 */
uint8_t SPI1_ucTransmitByte(const char ucByte)
{
    uint8_t ucRet;

    while (!BME_UBFX8(&SPI1->S, SPI_S_SPTEF_SHIFT, SPI_S_SPTEF_WIDTH))
    {
        ; /* Wait until buffer empty */
    }
    
    /* Transfer byte */
    SPI1_vSetSlave(LOW);
    
    SPI1->D = ucByte;
    ucRet = SPI1_ucReadPolling();
    
    SPI1_vSetSlave(HIGH);

    return ucRet;
}


/**
 * @brief   Set SS line high/low.
 * 
 * @param   ulState     HIGH/LOW
 *             
 * @return  None
 */
void SPI1_vSetSlave(const uint32_t ulState)
{
    configASSERT(ulState == LOW || (ulState == HIGH));
    
    /* Figure out whether to set or clear bit */
    const uint32_t *pulReg = (uint32_t *)&FGPIOE->PCOR - ulState; /* Subtract 0 - 1 words from PCOR address => pulReg = FGPIOE->PSOR/PCOR */
    
    /* Perform bitwise operation */
    BME_OR32(&(*pulReg), MASK(SS));
}


/**
 * @brief   SPI1 ISR.
 * 
 * @param   None
 *             
 * @return  None
 */
void SPI1_IRQHandler(void)
{
    /* Must read receive buffer first to avoid overrun */
    if ((SPI1->S & SPI_S_SPRF_MASK) != 0)
    {
        /* Read byte */
        (void)SPI1->D;
    }

    if ((SPI1->S & SPI_S_SPTEF_MASK) != 0)
    {
        /* Write byte */
        SPI1->D = 0;
    }
    
    /* This condition should never occur as SSOE is set 1!
     * Leave check for debugging.
     */
    if ((SPI1->S & SPI_S_MODF_MASK) != 0)
    {
        __BKPT();
    }
}
