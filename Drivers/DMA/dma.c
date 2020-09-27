#include <same70q21b.h>
#include "dma.h"


static void DMA_Init_memcpy(void);


void DMA_Init(void)
{
  Pmc *pmc = PMC;

  pmc->PMC_PCR |= PMC_PCR_CMD_Msk | PMC_PCR_PID(XDMAC_CLOCK_ID)
               |  PMC_PCR_EN_Msk;

  DMA_Init_memcpy();
}


static void DMA_Init_memcpy(void)
{
  Xdmac *dma = XDMAC;
  
  /* Memory-to-memory */
  dma->XdmacChid[0].XDMAC_CC  = XDMAC_CC_TYPE_MEM_TRAN;
  
  /* Single byte transfer
   * single burst byte bursts
   * 32-bit data
   * Read and write data through the system bus interface 0
   * Software request
   */
  dma->XdmacChid[0].XDMAC_CC |= XDMAC_CC_CSIZE(1) | XDMAC_CC_MBSIZE_SINGLE
                             | XDMAC_CC_DWIDTH_WORD
                             | XDMAC_CC_SIF_AHB_IF0 | XDMAC_CC_DIF_AHB_IF0
                             | XDMAC_CC_SWREQ_SWR_CONNECTED;

  /* The following registers need to be cleared */
  dma->XdmacChid[0].XDMAC_CNDC    = 0;
  dma->XdmacChid[0].XDMAC_CBC     = 0;
  dma->XdmacChid[0].XDMAC_CDS_MSP = 0;
  dma->XdmacChid[0].XDMAC_CSUS    = 0;
  dma->XdmacChid[0].XDMAC_CDUS    = 0;
}


void DMA_memcpy(uint32_t *dest, uint32_t *src, uint32_t n)
{
  Xdmac *dma = XDMAC;

  dma->XdmacChid[0].XDMAC_CSA  = src;
  dma->XdmacChid[0].XDMAC_CDA  = dest;
  dma->XdmacChid[0].XDMAC_CUBC = n;

  /* Enable interrupts if needed... */

  /* Enable channel 0 */
  __DMB();
  dma->XDMAC_GE = XDMAC_GE_EN0_Msk;

  /* Poll for transfer completion */
  while ((dma->XDMAC_GS & XDMAC_GS_ST0_Msk) != 0);
}