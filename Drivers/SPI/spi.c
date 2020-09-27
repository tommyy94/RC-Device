#include "spi.h"
#include "osConfig.h"
#include "logWriter.h"

#include <utils_assert.h>



extern QueueHandle_t      xTxQ;
extern QueueHandle_t      xRxQ;
extern SemaphoreHandle_t  spiMutex;

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


void     SPI0_Init(void);
bool     SPI_SelfTest(Spi *spi);
uint32_t SPI_TxMessage(Spi *spi, uint8_t *msg, uint8_t *recv, uint32_t len);
void     SPI_TxMessageIrq(Spi *spi, uint8_t *msg, uint8_t *recv, uint32_t len);
void     SPI_TxByteIrq(Spi *spi, uint8_t byte);

__STATIC_INLINE void SPI0_IO_Init(void);
__STATIC_INLINE void SPI_Reset(Spi *spi);
static void             SPI_SetMode(Spi *spi, SPI_SlaveSelect slave, SPI_Mode mode);
static uint8_t         SPI_TxByte(Spi *spi, uint8_t byte);


void SPI0_Init(void)
{
    Pmc *pmc = PMC;
    Spi *spi = SPI0;
    
    /**
     * Enable SPI0 clock gating
     * - SPI0 clock = Main clock / 2
     */
    pmc->PMC_PCR |= PMC_PCR_CMD_Msk | PMC_PCR_PID(SPI0_CLOCK_ID) |
                   PMC_PCR_EN_Msk | PMC_PCR_GCLKEN_Msk |
                   PMC_PCR_GCLKCSS_MAIN_CLK | PMC_PCR_GCLKDIV(1);
    
    SPI0_IO_Init();
    
    /* Wait data read before transfer
     * Master Mode
     */
    spi->SPI_MR = SPI_MR_MSTR_Msk;
    
    /* SPI0.CS0 Baud rate = Main clock / 2
     * Serial Clock Bit Rate = f_perclock / SPCK Bit Rate
     * NOTE: SCBR should not be 0!
     */
    spi->SPI_CSR[SLAVE_0] = SPI_CSR_SCBR(2);
    assert((spi->SPI_CSR[SLAVE_0] & SPI_CSR_SCBR_Msk) != 0, __FILE__, __LINE__);
    
    /* CPOL = 0, CPHA = 1, SPCK inactive LOW */
    SPI_SetMode(spi, SLAVE_0, MODE_0);
    
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
    Pmc *pmc = PMC;
    Pio *pio = PIOD;
    
    /**
     * Enable PIOD clock gating as we need to control the SS line (Chapter 32.4.3)
     * - PIOD clock = Main clock / 2
     */
    pmc->PMC_PCR = PMC_PCR_CMD_Msk | PMC_PCR_PID(PIOD_CLOCK_ID) |
                   PMC_PCR_EN_Msk | PMC_PCR_GCLKEN_Msk |
                   PMC_PCR_GCLKCSS_MAIN_CLK | PMC_PCR_GCLKDIV(1);
                   
    /* Select peripheral function A */
    pio->PIO_ABCDSR[0] |= PIO_ABCDSR_P22_Msk | PIO_ABCDSR_P21_Msk | PIO_ABCDSR_P20_Msk;
    pio->PIO_ABCDSR[1] |= PIO_ABCDSR_P22_Msk | PIO_ABCDSR_P21_Msk | PIO_ABCDSR_P20_Msk;
    
    /* Set peripheral function */
    pio->PIO_PDR  |= PIO_PDR_P22_Msk | PIO_PDR_P21_Msk | PIO_PDR_P20_Msk;
    
    /* Set SS pin */
    pio->PIO_PER  |= PIO_PER_P12_Msk;     /* PIO control pin    */
    pio->PIO_OER  |= PIO_OER_P12_Msk;     /* Set as output      */
    pio->PIO_SODR |= PIO_SODR_P12_Msk;    /* Set output data    */
}


/**
 * If multiple slaves are connected and require different configurations,
 * the master must reconfigure itself each time it needs to communicate
 * with a different slave
 */
static void SPI_SetMode(Spi *spi, SPI_SlaveSelect slave, SPI_Mode mode)
{
    assert((spi == SPI0) || (spi == SPI1), __FILE__, __LINE__);
    assert(slave < SLAVE_COUNT, __FILE__, __LINE__);
    assert(mode < MODE_COUNT, __FILE__, __LINE__);
    
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


static uint8_t SPI_TxByte(Spi *spi, uint8_t byte)
{
    assert((spi == SPI0) || (spi == SPI1), __FILE__, __LINE__);
    
    while ((spi->SPI_SR & SPI_SR_TDRE_Msk) == 0)
    {
        ; /* Wait until TDR and shift register are empty */
    }
    
    spi->SPI_TDR = (uint32_t)byte;
    
    while ((spi->SPI_SR & SPI_SR_RDRF_Msk) == 0)
    {
        ; /* Wait for data */
    }
    
    return (uint8_t)(spi->SPI_RDR & 0xFF);
}



void SPI_TxMessageIrq(Spi *spi, uint8_t *msg, uint8_t *recv, uint32_t len)
{    
    assert((spi == SPI0) || (spi == SPI1), __FILE__, __LINE__);

    if (xSemaphoreTake(spiMutex, pdMS_TO_TICKS(10)) == pdTRUE)
    {    
        /* Fill TX FIFO then enable IRQ */
        for (uint32_t i = 0; i < len; i++)
        {
            if (xQueueSend(xTxQ, &msg[i], pdMS_TO_TICKS(5)) != pdTRUE)
            {
                xTaskNotify(xJournalTask, SPI_ERROR, eSetBits);
            }
        }

        /* Enable Local Loopback */
        spi->SPI_MR |= SPI_MR_LLB_Msk;

        /* Enable SPI */
        spi->SPI_CR  |= SPI_CR_SPIEN_Msk;
        spi->SPI_IER |= SPI_IER_TDRE_Msk | SPI_IER_RDRF_Msk;
    
        /* Fill RX FIFO then disable IRQ */
        for (uint32_t i = 0; i < len; i++)
        {        
            if (xQueueReceive(xRxQ, &recv[i], portMAX_DELAY) != pdTRUE)
            {
                xTaskNotify(xJournalTask, SPI_ERROR, eSetBits);
            }
        }

        /* Disable SPI */
        spi->SPI_IDR |= (SPI_IDR_TDRE_Msk | SPI_IDR_RDRF_Msk);
        spi->SPI_CR  |= SPI_CR_SPIDIS_Msk;
    
        /* Disable Local Loopback */
        spi->SPI_MR &= ~SPI_MR_LLB_Msk;

        xSemaphoreGive(spiMutex);
    }
    else
    {
        xTaskNotify(xJournalTask, SPI_ERROR, eSetBits);
    }
}


uint32_t SPI_TxMessage(Spi *spi, uint8_t *msg, uint8_t *recv, uint32_t len)
{
    uint32_t i;
    
    assert((spi == SPI0) || (spi == SPI1), __FILE__, __LINE__);
    
    spi->SPI_CR |= SPI_CR_SPIEN_Msk;
    
    for (i = 0; i < len; i++)
    {
        recv[i] = SPI_TxByte(spi, msg[i]);
    }
    
    spi->SPI_CR |= SPI_CR_SPIDIS_Msk;
    
    return i;
}


bool SPI_SelfTest(Spi *spi)
{
    uint8_t msg[SPI_QUEUE_SIZE];
    uint8_t recv[SPI_QUEUE_SIZE];
    const uint32_t len = SPI_QUEUE_SIZE;
    bool ret = true;
    
    /* Generate test data */
    for (uint32_t i = 0; i < len; i++)
    {
        msg[i] = i;
    }
    
    /* Enable Local Loopback */
    spi->SPI_MR |= SPI_MR_LLB_Msk;
    
    SPI_TxMessageIrq(spi, msg, recv, len);
    
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


__STATIC_INLINE void SPI_Reset(Spi *spi)
{
    spi->SPI_CR |= SPI_CR_SWRST_Msk;
}


void SPI0_Handler(void)
{
    BaseType_t xRet;
    uint32_t status;
    uint8_t txByte;
    uint8_t rxByte;
    Spi *spi = SPI0;
    BaseType_t xTaskWoken = pdFALSE;
    
    //SEGGER_SYSVIEW_RecordEnterISR();
    
    spi->SPI_IDR |= SPI_IDR_TDRE_Msk | SPI_IDR_RDRF_Msk;
    
    status = spi->SPI_SR;
    assert(status != SPI_SR_OVRES_Msk, __FILE__, __LINE__);
    assert(status != SPI_SR_MODF_Msk, __FILE__, __LINE__);
    
    if ((status & SPI_SR_RDRF_Msk) != 0)
    {
        rxByte = (uint8_t)(spi->SPI_RDR & 0xFF);
        if (xQueueSendFromISR(xRxQ, (void *)&rxByte, &xTaskWoken) != pdTRUE)
        {
            xTaskNotifyFromISR(xJournalTask, SPI_ERROR, eSetBits, &xTaskWoken);
        }
        
        /* Enable TX IRQ as byte received */
        spi->SPI_IER |= SPI_IER_TDRE_Msk ;
    }
    
    if ((status & SPI_SR_TDRE_Msk) != 0)
    {
        xRet = xQueueReceiveFromISR(xTxQ, (void *)&txByte, &xTaskWoken);
        if (xRet == pdTRUE)
        {
            spi->SPI_TDR = (uint8_t)(txByte & 0xFF);
        }
        else
        {
            /* Queue empty, disable TX interrupt */
            spi->SPI_IDR |= SPI_IDR_TDRE_Msk;
        }
    }
    
    spi->SPI_IER |= SPI_IER_RDRF_Msk;

    /* Do context switch */
    portEND_SWITCHING_ISR(xTaskWoken);    
    
    if (xTaskWoken != pdFALSE)
    {
        //SEGGER_SYSVIEW_RecordExitISRToScheduler();
        portYIELD();
    }
    else
    {
        //SEGGER_SYSVIEW_RecordExitISR();
    }
}
