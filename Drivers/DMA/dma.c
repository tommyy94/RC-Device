#include <same70q21b.h>
#include <utils_assert.h>
#include <FreeRTOS.h>
#include <event_groups.h>

#include "dma.h"
#include "logWriter.h"
#include "osConfig.h"


EventGroupHandle_t dmaEvent;


static void DMA_Init_memcpy(void);


void DMA_Init(void)
{
  Xdmac *dma = XDMAC;
  Pmc *pmc = PMC;

  /* Enable XDMAC clock gating */
  pmc->PMC_PCR |= PMC_PCR_CMD_Msk | PMC_PCR_PID(XDMAC_CLOCK_ID)
               |  PMC_PCR_EN_Msk;
  
  /* Disable all channels */
  dma->XDMAC_GD = 0xFFFFFFFF;

  DMA_Init_memcpy();

  dmaEvent = xEventGroupCreate();
  assert(dmaEvent != NULL, __FILE__, __LINE__);
  
  NVIC_ClearPendingIRQ(XDMAC_IRQn);
  NVIC_SetPriority(XDMAC_IRQn, XDMAC_IRQ_PRIO);
  NVIC_EnableIRQ(XDMAC_IRQn);
}


static void DMA_Init_memcpy(void)
{
  Xdmac *dma = XDMAC;
  
  /* Memory-to-memory */
  dma->XdmacChid[DMA_MEMCPY_CH].XDMAC_CC  = XDMAC_CC_TYPE_MEM_TRAN;
  
  /* Single byte transfer
   * single burst byte bursts
   * 32-bit data
   * Read and write data through the system bus interface 0
   * Hardware request
   */
  dma->XdmacChid[DMA_MEMCPY_CH].XDMAC_CC |= XDMAC_CC_CSIZE_CHK_1 | XDMAC_CC_MBSIZE_SINGLE
                                         |  XDMAC_CC_DWIDTH_WORD
                                         |  XDMAC_CC_SIF_AHB_IF0 | XDMAC_CC_DIF_AHB_IF0
                                         |  XDMAC_CC_SWREQ_SWR_CONNECTED;

  /* The following registers need to be cleared */
  dma->XdmacChid[DMA_MEMCPY_CH].XDMAC_CNDC    = 0;
  dma->XdmacChid[DMA_MEMCPY_CH].XDMAC_CBC     = 0;
  dma->XdmacChid[DMA_MEMCPY_CH].XDMAC_CDS_MSP = 0;
  dma->XdmacChid[DMA_MEMCPY_CH].XDMAC_CSUS    = 0;
  dma->XdmacChid[DMA_MEMCPY_CH].XDMAC_CDUS    = 0;
}


void DMA_memcpy(uint32_t *dest, uint32_t *src, uint32_t n)
{
  Xdmac *dma = XDMAC;

  dma->XdmacChid[DMA_MEMCPY_CH].XDMAC_CSA  = (uint32_t)src;
  dma->XdmacChid[DMA_MEMCPY_CH].XDMAC_CDA  = (uint32_t)dest;
  dma->XdmacChid[DMA_MEMCPY_CH].XDMAC_CUBC = n;

  /* Enable interrupts if needed... */

  /* Enable channel 0 */
  __DMB();
  dma->XDMAC_GE = XDMAC_GE_EN0_Msk;

  /* Poll for transfer completion */
  while ((dma->XDMAC_GS & XDMAC_GS_ST0_Msk) != 0);
}

void XDMAC_Handler(void)
{
  Xdmac *dma = XDMAC;
  BaseType_t xTaskWoken = pdFALSE;
  uint32_t dmaErrMask = XDMAC_CIS_ROIS_Msk | XDMAC_CIS_WBEIS_Msk | XDMAC_CIS_RBEIS_Msk;
  uint32_t spiTxStatus;
  uint32_t spiRxStatus;

  /* Pending IRQ cleared by reading XDMAC_CISx */
  spiTxStatus = (dma->XdmacChid[DMA_SPI0_TX_CH].XDMAC_CIS & dmaErrMask);
  spiRxStatus = (dma->XdmacChid[DMA_SPI0_RX_CH].XDMAC_CIS & dmaErrMask);
  if ((spiTxStatus != 0) || (spiRxStatus != 0))
  {
    xTaskNotifyFromISR(xJournalTask, DMA_ERROR, eSetBits, &xTaskWoken);
    __BKPT();
  }

  /* Signal task */
  if (xEventGroupSetBitsFromISR(dmaEvent, dma->XDMAC_GIS, &xTaskWoken) != pdPASS)
  {
    /* Timer service queue full */
    xTaskNotifyFromISR(xJournalTask, RTOS_ERROR, eSetBits, &xTaskWoken);
  }

  /* Do context switch if higher prio task woke up */
  portEND_SWITCHING_ISR(xTaskWoken);    
  if (xTaskWoken != pdFALSE)
  {
      portYIELD();
  }
}
