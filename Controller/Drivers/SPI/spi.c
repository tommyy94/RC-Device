/**
 * spi.c
 * Driver module for MKL25 SPI peripheral.
 */


#include "spi.h"
#include "fsl_bitaccess.h"


extern SemaphoreHandle_t   xSpiSema;


/* Local defines */
#define MISO                    (1UL)
#define SCK                     (2UL)
#define MOSI                    (3UL)
#define SS                      (4UL)

#define BYTE_OFFSET             (0x01UL)


/* Function descriptions */

/**
 * @brief   Initialize SPI1 peripheral. Manual SS used for full-duplex mode.
 * 
 * @details Baud rate = 48 MHz/(3*2�) = 4 MHz = 250 ns/bit
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
    
    /* Set PTE4 as manual SS */
    PORTE->PCR[SS] = PORT_PCR_MUX(ALT1);
    FGPIOE->PDDR |= MASK(SS);
    FGPIOE->PDOR |= MASK(SS);
    
    /* Select master mode */
    SPI1->C1 = SPI_C1_MSTR_MASK;
    
    /**
     * Select active high clock
     * First edge sample
     */
    SPI1->C1 &= ~(SPI_C1_CPHA_MASK & SPI_C1_CPOL_MASK);
    
    /* Baudrate = Bus clock / ((SPPR + 1) * 2^^(SPR+1)) */
    SPI1->BR = SPI_BR_SPPR(0) | SPI_BR_SPR(1);
    
    /* Enable SPI1 */
    SPI1->C1 |= SPI_C1_SPE_MASK;
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
void SPI1_vTransmitByte(const char ucByte)
{
    while (!BME_UBFX8(&SPI1->S, SPI_S_SPTEF_SHIFT, SPI_S_SPTEF_WIDTH))
    {
        ; /* Wait until buffer empty */
    }
    
    /* Transfer byte */
    SPI1_vSetSlave(LOW);
    
    SPI1->D = ucByte;
    (void)SPI1_ucReadPolling();
    
    SPI1_vSetSlave(HIGH);
}


/**
 * @brief   Transmit message over SPI by polling.
 * 
 * @param   pucTxData   Pointer to data to send.
 * 
 * @param   pucRxData   Pointer to data to receive.
 * 
 * @param   ulLength    Data length
 * 
 * @return  None
 */
void SPI1_vTransmitPolling(char *const pucData, char *const pucRxData, const uint32_t ulLength)
{
    /* Disable TPM2 interrupts just to be sure */
    BME_AND8(&TPM2->SC, ~(uint8_t)TPM_SC_TOIE(1));

    TPM2->CNT = 0;
    TPM2_vStart();
    
    /* Transfer byte */
    SPI1_vSetSlave(LOW);

    for (uint32_t i = 0; i < ulLength; i++)
    {
        while (!BME_UBFX8(&SPI1->S, SPI_S_SPTEF_SHIFT, SPI_S_SPTEF_WIDTH))
        {
            ; /* Wait until TX buffer empty */
        }
        
        SPI1->D = pucData[i];
        pucRxData[i] = SPI1_ucReadPolling();
    }

    while (TPM2->CNT < (TIME_PER_BYTE * ulLength))
    {
        ; /* Wait until transaction done */
    }

    /* Stop TPM2 first to give small overhead for SS */
    TPM2_vStop();
    
    SPI1_vSetSlave(HIGH);

    /* Turn TPM2 interrupts on again */
    BME_OR8(&TPM2->SC, TPM_SC_TOIE(1));
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
