#include <same70q21b.h>
#include <utils_assert.h>

#include <FreeRTOS.h>
#include <task.h>
#include <semphr.h>
#include <event_groups.h>

#include "spi.h"
#include "dma.h"
#include "osConfig.h"
#include "logWriter.h"


#define SPI_DMA_TIMEOUT   (10u) /* ms */

extern SemaphoreHandle_t  spiMutex;
extern EventGroupHandle_t dmaEvent;


void SPI0_DMA_Init(void)
{
  /* Assume DMA clock gating enabled */

  Xdmac *dma = XDMAC;
  
  /* Configure SPI0 TX:
   * - Single byte transfer
   * - Single byte bursts
   * - 16-bit data
   * - Read and write data through the system bus interface 0
   * - Hardware request
   * - Memory-to-peripheral
   */
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CC
    |= XDMAC_CC_CSIZE_CHK_1
    |  XDMAC_CC_MBSIZE_SINGLE
    |  XDMAC_CC_DWIDTH_HALFWORD
    |  XDMAC_CC_DSYNC_MEM2PER
    |  XDMAC_CC_TYPE_PER_TRAN
    |  XDMAC_CC_SIF_AHB_IF0
    |  XDMAC_CC_DIF_AHB_IF0
    |  XDMAC_CC_SWREQ_HWR_CONNECTED
    |  XDMAC_CC_PERID_SPI0_TX
    |  XDMAC_CC_SAM_INCREMENTED_AM
    |  XDMAC_CC_DAM_FIXED_AM;

  /* Configure SPI0 RX:
   * - Single byte transfer
   * - Single byte bursts
   * - 16-bit data
   * - Read and write data through the system bus interface 0
   * - Hardware request
   * - Peripheral-to-memory
   */
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CC
    |= XDMAC_CC_CSIZE_CHK_1
    |  XDMAC_CC_MBSIZE_SINGLE
    |  XDMAC_CC_DWIDTH_HALFWORD
    |  XDMAC_CC_DSYNC_PER2MEM
    |  XDMAC_CC_TYPE_PER_TRAN
    |  XDMAC_CC_SIF_AHB_IF0
    |  XDMAC_CC_DIF_AHB_IF0
    |  XDMAC_CC_SWREQ_HWR_CONNECTED
    |  XDMAC_CC_PERID_SPI0_RX
    |  XDMAC_CC_SAM_FIXED_AM
    |  XDMAC_CC_DAM_INCREMENTED_AM;

  /* The following registers need to be cleared */
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CNDC    = 0;
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CBC     = 0;
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CDS_MSP = 0;
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CSUS    = 0;
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CDUS    = 0;
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CNDC    = 0;
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CBC     = 0;
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CDS_MSP = 0;
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CSUS    = 0;
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CDUS    = 0;

  while (((dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CC & XDMAC_CC_INITD_IN_PROGRESS) != 0)
      && ((dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CC & XDMAC_CC_INITD_IN_PROGRESS) != 0))
  {
    ; /* Poll until init done */
  }
  

  
  dma->XDMAC_GIE |= XDMAC_GIE_IE2_Msk | XDMAC_GIE_IE1_Msk;
}


void SPI_DMA_TransmitMessage(Spi *spi, uint16_t *msg, uint16_t *recv, uint32_t len)
{
  assert((spi == SPI0) || (spi == SPI1), __FILE__, __LINE__);

  Xdmac *dma = XDMAC;

  if (xSemaphoreTake(spiMutex, pdMS_TO_TICKS(SPI_DMA_TIMEOUT)) == pdTRUE)
  {
    /* Enable Local Loopback */
    spi->SPI_MR |= SPI_MR_LLB_Msk;

    /* Clear pending interrupt requests */
    (void)dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CIS;
    (void)dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CIS;

    /* Set addresses and transfer length */
    dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CSA  = (uint32_t)msg;
    dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CSA  = (uint32_t)&spi->SPI_RDR;
    dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CDA  = (uint32_t)&spi->SPI_TDR;
    dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CDA  = (uint32_t)recv;
    dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CUBC = len;
    dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CUBC = len;

    /* Enable SPI & DMA */
    spi->SPI_CR   |= SPI_CR_SPIEN_Msk;
    spi->SPI_IER  |= SPI_IER_TDRE_Msk | SPI_IER_RDRF_Msk;
    dma->XDMAC_GE  = XDMAC_GE_EN2_Msk | XDMAC_GE_EN1_Msk;

    /* Wait for signal from DMA handler */
    if (xEventGroupWaitBits(
      dmaEvent,
      DMA_EVENT_SPI0_TX & DMA_EVENT_SPI0_RX,
      pdTRUE,
      pdTRUE,
      pdMS_TO_TICKS(SPI_DMA_TIMEOUT))
    != (DMA_EVENT_SPI0_TX & DMA_EVENT_SPI0_RX))
    {
      xTaskNotify(xJournalTask, SPI_ERROR, eSetBits);
    }

    /* Disable SPI & DMA */
    spi->SPI_IDR |= (SPI_IDR_TDRE_Msk | SPI_IDR_RDRF_Msk);
    spi->SPI_CR  |= SPI_CR_SPIDIS_Msk;
    dma->XDMAC_GD = XDMAC_GD_DI2_Msk | XDMAC_GD_DI1_Msk;

    /* Disable Local Loopback */
    spi->SPI_MR &= ~SPI_MR_LLB_Msk;

    xSemaphoreGive(spiMutex);
  }
}
