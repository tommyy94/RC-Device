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

extern EventGroupHandle_t dmaEvent;


void SPI0_DMA_Init(void)
{
  /* Assume DMA clock gating enabled */

  Xdmac *dma = XDMAC;
  
  /* Configure SPI0 TX:
   * - Single halfword transfer
   * - 16-bit data
   * - Read and write data through the system bus interface 0
   * - Hardware request
   * - Memory-to-peripheral
   */
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CC
    |= XDMAC_CC_CSIZE_CHK_1
    |  XDMAC_CC_DWIDTH_BYTE
    |  XDMAC_CC_DSYNC_MEM2PER
    |  XDMAC_CC_TYPE_PER_TRAN
    |  XDMAC_CC_SIF_AHB_IF0
    |  XDMAC_CC_DIF_AHB_IF1
    |  XDMAC_CC_SWREQ_HWR_CONNECTED
    |  XDMAC_CC_PERID_SPI0_TX
    |  XDMAC_CC_SAM_INCREMENTED_AM
    |  XDMAC_CC_DAM_FIXED_AM;

  /* Configure SPI0 RX:
   * - Single halfword transfer
   * - 16-bit data
   * - Read and write data through the system bus interface 0
   * - Hardware request
   * - Peripheral-to-memory
   */
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CC
    |= XDMAC_CC_CSIZE_CHK_1
    |  XDMAC_CC_DWIDTH_BYTE
    |  XDMAC_CC_DSYNC_PER2MEM
    |  XDMAC_CC_TYPE_PER_TRAN
    |  XDMAC_CC_SIF_AHB_IF1
    |  XDMAC_CC_DIF_AHB_IF0
    |  XDMAC_CC_SWREQ_HWR_CONNECTED
    |  XDMAC_CC_PERID_SPI0_RX
    |  XDMAC_CC_SAM_FIXED_AM
    |  XDMAC_CC_DAM_INCREMENTED_AM;

  /* The following registers need to be cleared */
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CNDC    = 0;
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CNDC    = 0;
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CBC     = 0;
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CBC     = 0;
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CDS_MSP = 0;
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CDS_MSP = 0;
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CSUS    = 0;
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CSUS    = 0;
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CDUS    = 0;
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CDUS    = 0;

  while (((dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CC & XDMAC_CC_INITD_IN_PROGRESS) != 0)
      && ((dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CC & XDMAC_CC_INITD_IN_PROGRESS) != 0))
  {
    ; /* Poll until init done */
  }
}


static void SPI0_DMA_InitTransaction(uint8_t *msg, uint8_t *recv, uint32_t len)
{
  uint32_t bsize = 0;
  Xdmac *dma = XDMAC;
  Spi *spi = SPI0;

  assert(len > 0, __FILE__, __LINE__);

  /* Clear pending interrupt requests */
  (void)dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CIS;
  (void)dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CIS;

  /* Flush channels */
  dma->XDMAC_GSWF = XDMAC_GSWF_SWF1_Msk | XDMAC_GSWF_SWF0_Msk;

  /* Set addresses and transfer length */
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CSA  = XDMAC_CSA_SA((uint32_t)msg);
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CSA  = XDMAC_CSA_SA((uint32_t)&spi->SPI_RDR);
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CDA  = XDMAC_CDA_DA((uint32_t)&spi->SPI_TDR);
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CDA  = XDMAC_CDA_DA((uint32_t)recv);
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CUBC = XDMAC_CUBC_UBLEN(len);
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CUBC = XDMAC_CUBC_UBLEN(len);

  if ((len % 16) == 0)
  {
    if ((len / 16) > 0)
    {
      bsize = XDMAC_CC_MBSIZE_SIXTEEN;
    }
  }
  else if ((len % 8) == 0)
  {
    if ((len / 8) > 0)
    {
      bsize = XDMAC_CC_MBSIZE_EIGHT;
    }
  }
  else if ((len % 4) == 0)
  {
    if ((len / 4) > 0)
    {
      bsize = XDMAC_CC_MBSIZE_FOUR;
    }
  }
  else
  {
    bsize = XDMAC_CC_MBSIZE_SINGLE;
  }

  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CC &= ~XDMAC_CC_MBSIZE_Msk;
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CC &= ~XDMAC_CC_MBSIZE_Msk;

  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CC |= bsize;
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CC |= bsize;
}


void SPI0_DMA_TransmitMessage(uint8_t *msg, uint8_t *recv, uint32_t len)
{
  EventBits_t evtBits;
  Xdmac *dma = XDMAC;
  Spi *spi = SPI0;

  /* Clean DCache before DMA tansfer (AT17417) */
  SCB_CleanDCache_by_Addr((uint32_t *)msg,  len);
  SCB_CleanDCache_by_Addr((uint32_t *)recv, len);

  SPI0_DMA_InitTransaction(msg, recv, len);

  /* Enable DMA IRQ */
  dma->XDMAC_GIE = XDMAC_GIE_IE2_Msk | XDMAC_GIE_IE1_Msk;
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CIE = XDMAC_CIE_BIE_Msk;
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CIE = XDMAC_CIE_BIE_Msk;

  /* Enable SPI & DMA */
  spi->SPI_CR   |= SPI_CR_SPIEN_Msk;
  __DMB();
  dma->XDMAC_GE  = XDMAC_GE_EN2_Msk | XDMAC_GE_EN1_Msk;

  /* Wait for signal from DMA handler */
  evtBits = xEventGroupWaitBits(
    dmaEvent,
    DMA_EVENT_SPI0_TX | DMA_EVENT_SPI0_RX,
    pdTRUE,
    pdTRUE,
    pdMS_TO_TICKS(SPI_DMA_TIMEOUT));

  /* Disable SPI & DMA */
  dma->XDMAC_GD  = XDMAC_GD_DI2_Msk | XDMAC_GD_DI1_Msk;
  __DMB();
  spi->SPI_CR   |= SPI_CR_SPIDIS_Msk;
    
  /* Disable DMA IRQ */
  dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CID = XDMAC_CID_BID_Msk;
  dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CID = XDMAC_CID_BID_Msk;
  dma->XDMAC_GID = XDMAC_GID_ID2_Msk | XDMAC_GID_ID1_Msk;
  
  /* Invalidate DCache after DMA tansfer (AT17417) */
  SCB_InvalidateDCache_by_Addr((uint32_t *)msg,  len);
  SCB_InvalidateDCache_by_Addr((uint32_t *)recv, len);

  /* Check for errors */
  if (((evtBits & DMA_EVENT_SPI0_TX) == 0)
   || ((evtBits & DMA_EVENT_SPI0_RX) == 0))
  {
    xTaskNotify(xJournalTask, DMA_ERROR, eSetBits);
  }

  xEventGroupClearBits(dmaEvent, DMA_EVENT_SPI0_TX | DMA_EVENT_SPI0_RX);
}
