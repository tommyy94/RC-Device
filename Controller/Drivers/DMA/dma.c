/**
 * dma.c
 * This compilation unit handles Direct Memory Access.
 */

#include "FreeRTOS.h"
#include "task.h"


#include "dma.h"
#include "fsl_bitaccess.h"

/* Local defines */
#define BCR_MAX_LEN                 (0x00F0FFFFUL)

/* Validate DMA address register as specified in the datasheet */
#define VALIDATE_ADDR_REG(x)        (((x) < 0x00100000)                         |   \
                                    (((x) >= 0x1FF00000) && ((x) < 0x20000000)) |   \
                                    (((x) >= 0x20000000) && ((x) < 0x20100000)) |   \
                                    (((x) >= 0x40000000) && ((x) < 0x40100000)))    


/* Function descriptions */

/**
 * @brief   Initialize DMAMUX0 channel N.
 * 
 * @param   ulChannel       DMA channel.
 *
 * @param   ucSource        DMA0 trigger source.
 * 
 * @return  None
 */
void DMAMUX0_vInit(uint32_t const ulChannel, uint32_t const ulSource)
{
    configASSERT(ulChannel < DMAMUX_CHCFG_COUNT);
    configASSERT(ulSource <= DMAMUX0_CHCFG_SOURCE_DMAMUX3);

    /* Disable DMA channel to configure it */
    DMAMUX0->CHCFG[ulChannel] = 0;
    
    /* Enable DMA0 MUX channel triggers */
    DMAMUX0->CHCFG[ulChannel] = DMAMUX_CHCFG_SOURCE(ulSource);
}


/**
 * @brief   Link DMA0 channels.
 * 
 * @param   ucSrcCh     Source channel
 *
 * @param   ucDstCh     Destination channel
 * 
 * @return  None
 */
void DMA0_vLinkChannel(const uint32_t ulSrcCh, const uint32_t ulDstCh)
{
    configASSERT(ulSrcCh < DMAMUX_CHCFG_COUNT);
    configASSERT(ulDstCh < DMAMUX_CHCFG_COUNT);

    /* Perform a link to channel LCH1 after each cycle-steal transfer */
    DMA0->DMA[ulSrcCh].DCR |= DMA_DCR_LINKCC(2) | DMA_DCR_LCH1(ulDstCh);
}


/**
 * @brief   Initialize DMA for byte transfers on peripheral request.
 * 
 * @param   None
 * 
 * @return  None
 */
void DMA0_vInit(void)
{
    /**
     * Configure channel 0:
     * - Increment destination address
     * - Transfer halfwords
     * - Enable peripheral request
     * - Cycle stealing mode
     */
    DMA0->DMA[DMA_CHANNEL0].DCR = DMA_DCR_ERQ(1) | DMA_DCR_CS(1) | DMA_DCR_SSIZE(2) | DMA_DCR_DSIZE(2) | DMA_DCR_DINC(1);
    
    /**
     * Configure channel 1:
     * - Increment source address
     * - Transfer words
     * - Enable peripheral request
     * - Cycle stealing mode
     */
    DMA0->DMA[DMA_CHANNEL1].DCR = DMA_DCR_ERQ(1) | DMA_DCR_CS(1) | DMA_DCR_SSIZE(0) | DMA_DCR_DSIZE(0) | DMA_DCR_SINC(1);
    
    DMA0_vClearStatus(DMA_CHANNEL0);
    DMA0_vClearStatus(DMA_CHANNEL1);
    
    /* Link DMA channels 0 & 1:
     * - Channel 0 reads ADC results  triggering
     *   channel 1 selecting new ADC channel
     */
    DMA0_vLinkChannel(DMA_CHANNEL0, DMA_CHANNEL1);
}


/**
 * @brief   Clear DMA0 channel N status bits.
 * 
 * @param   ulChannel       DMA channel.
 * 
 * @return  None
 */
void DMA0_vClearStatus(const uint32_t ulChannel)
{
    configASSERT(ulChannel < DMAMUX_CHCFG_COUNT);
    DMA0->DMA[ulChannel].DSR_BCR |= DMA_DSR_BCR_DONE(1);
}


/**
 * @brief   Initialize DMA addresses and transfer size.
 * 
 * @param   ulChannel       DMA channel.
 * 
 * @param   pulSrcAddr      Source address
 * 
 * @param   pulDstAddr      Destination address
 * 
 * @param   ulLength        Transaction length
 * 
 * @return  None
 */
void DMA0_vInitTransaction(const uint32_t ulChannel, void *const pvSrcAddr, void *const pvDstAddr, const uint32_t ulLength)
{
    configASSERT(ulChannel < DMAMUX_CHCFG_COUNT);
    configASSERT(VALIDATE_ADDR_REG((uint32_t)pvSrcAddr));
    configASSERT(VALIDATE_ADDR_REG((uint32_t)pvDstAddr));
    configASSERT(ulLength < BCR_MAX_LEN);
    
    /* Initialize source & destination pointers */
    DMA0->DMA[ulChannel].SAR = DMA_SAR_SAR((uint32_t)pvSrcAddr);
    DMA0->DMA[ulChannel].DAR = DMA_DAR_DAR((uint32_t)pvDstAddr);
    
    /* Number of bytes to transmit */
    DMA0->DMA[ulChannel].DSR_BCR |= DMA_DSR_BCR_BCR(ulLength);
}


/**
 * @brief   Enable DMA0 on specified channel.
 * 
 * @param   ulChannel       DMA channel.
 * 
 * @return  None
 */
void DMA0_vChannelNEnable(const uint32_t ulChannel)
{
    configASSERT(ulChannel < DMAMUX_CHCFG_COUNT);

    /* Should use DMA0_vStartChannel0 to write DMA channel 0 */
    configASSERT(ulChannel > DMA_CHANNEL0);
    
    DMAMUX0->CHCFG[ulChannel] |= DMAMUX_CHCFG_ENBL(1);
}


/**
 * @brief   Disable specified DMA0 channel.
 * 
 * @param   ulChannel       DMA channel.
 * 
 * @return  None
 */
void DMA0_vChannelNDisable(const uint32_t ulChannel)
{
    configASSERT(ulChannel < DMAMUX_CHCFG_COUNT);

    /* Should use DMA0_vStartChannel0 to write DMA channel 0 */
    configASSERT(ulChannel > DMA_CHANNEL0);

    DMAMUX0->CHCFG[ulChannel] &= ~DMAMUX_CHCFG_ENBL(1);
}


/**
 * @brief   Enable DMA0 channel 0.
 *          BME (Bit Manipulatio Engine) is able to access ONLY channel 0.
 *          Accessing other DMAMUX0 channels with BME results in HardFault.
 *          This strongly suggests the DMA channels are meant to be linked
 *          to each other.
 * 
 * @param   None
 * 
 * @return  None
 */
void DMA0_vChannel0Enable(void)
{
    BME_OR32(&DMAMUX0->CHCFG[DMA_CHANNEL0], DMAMUX_CHCFG_ENBL(1));
}


/**
 * @brief   Disable DMA0 Channel 0.
 *          BME (Bit Manipulatio Engine) is able to access ONLY channel 0.
 *          Accessing other DMAMUX0 channels with BME results in HardFault.
 *          This strongly suggests the DMA channels are meant to be linked
 *          to each other.
 * 
 * @param   None
 * 
 * @return  None
 */
void DMA0_vChannel0Disable(void)
{
    BME_AND32(&DMAMUX0->CHCFG[DMA_CHANNEL0], ~DMAMUX_CHCFG_ENBL(1));
}
