#include <same70q21b.h>
#include <utils_assert.h>

#include "spi.h"
#include "system.h"
#include "logWriter.h"


typedef enum
{
    MODE_0,
    MODE_1,
    MODE_2,
    MODE_3,
    MODE_COUNT
} SPI_Mode;


typedef enum
{
    SLAVE_0,
    SLAVE_1,
    SLAVE_2,
    SLAVE_3,
    SLAVE_COUNT
} SPI_SlaveSelect;


__STATIC_INLINE void SPI0_IO_Init(void);
__STATIC_INLINE void SPI_Reset(Spi *spi);
__STATIC_INLINE void SPI_SetMode(Spi *spi, SPI_SlaveSelect slave, SPI_Mode mode);


void SPI0_Init(void)
{
    Pmc *pmc = PMC;
    Spi *spi = SPI0;
    
    /**
     * Enable SPI0 clock gating
     * - SPI0 clock = Peripheral clock / 2
     *              = 150 MHz / 2 = 75 MHz
     */
    pmc->PMC_PCR |= PMC_PCR_CMD_Msk | PMC_PCR_PID(SPI0_CLOCK_ID) | PMC_PCR_EN_Msk;
    
    SPI0_IO_Init();    
    SPI0_DMA_Init();
    
    /* Wait data read before transfer
     * Master Mode
     * Chip Select 1
     */
    spi->SPI_MR = SPI_MR_MSTR_Msk | SPI_MR_PCS_NPCS1;
    
    /* SPI0.CS1 Baud rate = Main clock / 2
     * Serial Clock Bit Rate = f_perclock / SPCK Bit Rate
     *                       = 75 MHz / 16 = ~4.7 MHz (measured 4.5 MHz)
     * NOTE: SCBR should not be 0!
     * 8 bits per transfer
     */
    spi->SPI_CSR[SLAVE_1] = SPI_CSR_SCBR(16) | SPI_CSR_BITS_8_BIT; /* 2.6 MHz */
    assert((spi->SPI_CSR[SLAVE_1] & SPI_CSR_SCBR_Msk) != 0);
    
    /* CPOL = 0, CPHA = 1, SPCK inactive LOW */
    SPI_SetMode(spi, SLAVE_1, MODE_0);
    
    /* Send data only when receive register empty */
    spi->SPI_MR |= SPI_MR_WDRBT_Msk;

    /* Enable error interrupts for:
     * - Overrun error
     * - Mode Fault error
     */
    spi->SPI_IER = SPI_IER_OVRES_Msk | SPI_IER_MODF_Msk;
    
    NVIC_ClearPendingIRQ(SPI0_IRQn);
    NVIC_SetPriority(SPI0_IRQn, SPI0_IRQ_PRIO);
    NVIC_EnableIRQ(SPI0_IRQn);
}


__STATIC_INLINE void SPI0_IO_Init(void)
{
    Pio *piob = PIOB;
    Pio *piod = PIOD;
    const uint32_t spiMask = PIO_ABCDSR_P25_Msk | PIO_ABCDSR_P22_Msk
                           | PIO_ABCDSR_P21_Msk | PIO_ABCDSR_P20_Msk;

    /* Select peripheral function B */
    piod->PIO_ABCDSR[0] |= spiMask;
    piod->PIO_ABCDSR[1] &= ~(spiMask);

    /* Select peripheral function D */
    piob->PIO_ABCDSR[0] |= PIO_ABCDSR_P2_Msk;
    piob->PIO_ABCDSR[1] |= PIO_ABCDSR_P2_Msk;
    
    /* Set peripheral function */
    piod->PIO_PDR = spiMask;
    piob->PIO_PDR = PIO_PDR_P2_Msk;

    /* Enable internal pulldown for MISO */
    piod->PIO_MDER    = PIO_MDER_P20_Msk;
    piod->PIO_PUDR    = PIO_PUDR_P20_Msk;
    piod->PIO_PPDER   = PIO_PPDER_P20_Msk;
    piod->PIO_DRIVER |= PIO_DRIVER_LINE20_HIGH_DRIVE;
    
}


/**
 * If multiple slaves are connected and require different configurations,
 * the master must reconfigure itself each time it needs to communicate
 * with a different slave
 */
static void SPI_SetMode(Spi *spi, SPI_SlaveSelect slave, SPI_Mode mode)
{
    assert((spi == SPI0) || (spi == SPI1));
    assert(slave < SLAVE_COUNT);
    assert(mode < MODE_COUNT);
    
    /* NOTE: The bit field positions are inverted in the register:
     * CPOL on the LSB side and NCPHA on the MSB side whereas in the datasheet
     * CPOL is represented on left and NCPHA on right in the mode table
     */
    const uint32_t modeTable[MODE_COUNT] =
    {
        SPI_CSR_CPOL_IDLE_LOW  | SPI_CSR_NCPHA_VALID_LEADING_EDGE,  /* Mode 0 */
        SPI_CSR_CPOL_IDLE_LOW  | SPI_CSR_NCPHA_VALID_TRAILING_EDGE, /* Mode 1 */
        SPI_CSR_CPOL_IDLE_HIGH | SPI_CSR_NCPHA_VALID_LEADING_EDGE,  /* Mode 2 */
        SPI_CSR_CPOL_IDLE_HIGH | SPI_CSR_NCPHA_VALID_TRAILING_EDGE  /* Mode 3 */
    };
    
    spi->SPI_CSR[slave] &= ~(SPI_CSR_CPOL_Msk | SPI_CSR_NCPHA_Msk);
    __DMB(); /* Clear register first */
    spi->SPI_CSR[slave] |= modeTable[mode];
}


/* Loop Back Mode connected to SS0 (undocumented) */
bool SPI_SelfTest(Spi *spi, uint8_t *msg, uint8_t *recv, uint32_t len)
{
    bool ret = true;

    /* Enable Local Loopback */
    spi->SPI_MR |= SPI_MR_LLB_Msk;
       
    SPI0_DMA_TransmitMessage(msg, recv, len);
    
    for (uint32_t i = 0; i < len; i++)
    {
        if (msg[i] != recv[i])
        {
            ret = false;
            break;
        }
    }

    /* Disable Local Loopback */
    spi->SPI_MR &= ~SPI_MR_LLB_Msk;
    
    return ret;
}


uint16_t SPI0_vTransmitHalfword(uint16_t const halfword)
{
    Spi *spi = SPI0;

    spi->SPI_CR  |= SPI_CR_SPIEN_Msk;

    /* Clear RX register */
    (void)spi->SPI_RDR;

    /* Transmit character */
    spi->SPI_TDR  = SPI_TDR_TD(halfword);
    while ((spi->SPI_SR & SPI_SR_RDRF_Msk) == 0)
    {
        ; /* Wait until character received */
    }

    spi->SPI_CR  |= SPI_CR_SPIDIS_Msk;

    return spi->SPI_RDR & 0xFFFF;
}

uint8_t SPI0_vTransmitByte(uint8_t const byte)
{
    Spi *spi = SPI0;

    spi->SPI_CR  |= SPI_CR_SPIEN_Msk;

    /* Clear RX register */
    (void)spi->SPI_RDR;

    /* Transmit character */
    spi->SPI_TDR  = SPI_TDR_TD(byte);
    while ((spi->SPI_SR & SPI_SR_RDRF_Msk) == 0)
    {
        ; /* Wait until character received */
    }

    spi->SPI_CR  |= SPI_CR_SPIDIS_Msk;

    return spi->SPI_RDR & 0xFF;
}

__STATIC_INLINE void SPI_Reset(Spi *spi)
{
    spi->SPI_CR |= SPI_CR_SWRST_Msk;
}

void SPI0_Handler(void)
{
    uint32_t status;
    Spi *spi = SPI0;
    BaseType_t xTaskWoken = pdFALSE;

    status = spi->SPI_SR;
    assert((status & SPI_SR_MODF_Msk)  == 0);

    /* Do context switch if higher prio task woke up */
    portEND_SWITCHING_ISR(xTaskWoken);
    if (xTaskWoken != pdFALSE)
    {
        portYIELD();
    }
}
