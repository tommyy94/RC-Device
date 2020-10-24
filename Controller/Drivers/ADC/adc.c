/**
 * adc.c
 * Driver module for MKL25 ADC peripheral.
 */

#include "adc.h"
#include "dma.h"
#include "FreeRTOS.h"

#include "fsl_bitaccess.h"


/* Local defines */
#define JOYSTICK_X_PIN        (0UL)  /* PTB0 = ADC0_SE8 */
#define JOYSTICK_Y_PIN        (1UL)  /* PTB1 = ADC0_SE9 */

#define ADC_SAMPLE_COUNT      (8UL)


/* Global variables */
static uint16_t usMeas[ADC_CH_COUNT][ADC_SAMPLE_COUNT]; /* Lots of wasted RAM here */

/* Local function prototypes */
__STATIC_INLINE bool ADC0_bCalibrate(void);

/* Function descriptions */


/**
 * @brief   Initialize ADC0 peripheral. Channels 8 and 9 used.
 *          ADC0 input clock = bus_clk / 2 / 4
 *                           = 24 MHz / 2 / 4
 *                           = 3 MHz
 * 
 * @param   None
 * 
 * @return  None
 */
void ADC0_vInit(void)
{
    bool bSuccess;

    /* Select analog for pins */
    PORTB->PCR[JOYSTICK_X_PIN] &= ~PORT_PCR_MUX_MASK;
    PORTB->PCR[JOYSTICK_Y_PIN] &= ~PORT_PCR_MUX_MASK;
    PORTB->PCR[JOYSTICK_X_PIN] |=  PORT_PCR_MUX(ALT0);
    PORTB->PCR[JOYSTICK_Y_PIN] |=  PORT_PCR_MUX(ALT0);
    
    /**
     * Long sample time - 24 ADCK cycles total
     * 16 bit single-ended conversion
     * Bus clock input/2
     * Clk prescaler 4
     */
    ADC0->CFG1 = ADC_CFG1_ADIV(2) | ADC_CFG1_ADICLK(1) | ADC_CFG1_ADLSMP(1) | ADC_CFG1_MODE(3);
    
    /**
    * Software trigger
    * Compare function disabled
    * Default voltage reference (VREFH & VREFL)
    */
    ADC0->SC2 = ADC_SC2_REFSEL(0);
    
    /**
     * Enable hardware average
     * 32 samples averaged
     */
    ADC0->SC3 = ADC_SC3_AVGE(1) | ADC_SC3_AVGS(ADC_SC3_AVGS_32SAMPLES);

    /* ADC0 needs to be calidrated between every reset */
    bSuccess = ADC0_bCalibrate();
    configASSERT(bSuccess == true);

    /* Use continuous conversion */
    ADC0->SC3 |= ADC_SC3_ADCO(1);

    /* Enable DMA on conversion complete */
    ADC0->SC2 |= ADC_SC2_DMAEN(1);

    /* Configure DMA channel for ADC */
    DMAMUX0_vInit(DMA_CHANNEL0, DMAMUX_CHCFG_SOURCE_ADC0);
    
    /* Disable both banks */
    ADC0->SC1[ADC_BANK_A] = ADC_SC1_ADCH(ADC_CH_DISABLED);
    ADC0->SC1[ADC_BANK_B] = ADC_SC1_ADCH(ADC_CH_DISABLED);
}

  
/**
 * @brief   Calibrate ADC0.
 * 
 * @param   None
 * 
 * @return  None
 */
__STATIC_INLINE bool ADC0_bCalibrate(void)
{
    uint16_t gain;
    bool bSuccess = false;

    /* Ensure software trigger set */
    ADC0->SC2 &= ~ADC_SC2_ADTRG_MASK;

    /* Start calibration */
    ADC0->SC3 |= ADC_SC3_CAL(1);
    while (!(ADC0->SC1[ADC_BANK_A] & ADC_SC1_COCO(1)))
    {
        ; /* Wait until calibration finished */
    }

    /* If calibration OK, generate gain values */
    if ((ADC0->SC3 & ADC_SC3_CALF(1)) == 0)
    {
        /* Sum plus side calib values */
        gain  = ADC0->CLP0;
        gain += ADC0->CLP1;
        gain += ADC0->CLP2;
        gain += ADC0->CLP3;
        gain += ADC0->CLP4;
        gain += ADC0->CLPS;

        /* Div by 2 and set MSB */
        gain = (gain >> 1) | 0x8000;

        ADC0->PG = gain;

        /* Repeat the same procedure for the minus
         * side even though not needed for single
         * ended conversion.
         */
        gain  = ADC0->CLM0;
        gain += ADC0->CLM1;
        gain += ADC0->CLM2;
        gain += ADC0->CLM3;
        gain += ADC0->CLM4;
        gain += ADC0->CLMS;

        /* Div by 2 and set MSB */
        gain = (gain >> 1) | 0x8000;

        ADC0->MG = gain;

        bSuccess = true;
    }

    return bSuccess;
}

        
/**
 * @brief   Read ADC0 by polling.
 * 
 * @param   ulBank          Bank to read.
 *
 * @param   ulChannel       Channel to read.
 * 
 * @return  ADC0->R[0]      16-bit ADC0 bank A result.
 */
uint16_t ADC0_usReadPolling(const uint32_t ulBank, const uint32_t ulChannel)
{
    configASSERT((ulBank == ADC_BANK_A) || (ulBank == ADC_BANK_B));
    configASSERT(ulChannel < ADC_CH_DISABLED);

    /* Bank select - no bank-channel validation */
    BME_AND32(&ADC0->CFG2, ~ADC_CFG2_MUXSEL_MASK);
    BME_OR32(&ADC0->CFG2, ADC_CFG2_MUXSEL(ulBank));

    /* Start conversion on selected channel */
    ADC0->SC1[ulBank] = ADC_SC1_ADCH(ulChannel);
    
    /* Timeout should be used */
    while (!(ADC0->SC1[ulBank] & ADC_SC1_COCO(1)))
    {
        ; /* Wait until conversion is finished */
    }
    
    /* Read the result */
    return ((uint16_t)ADC0->R[ulBank]);
}

   
/**
 * @brief   Non-blocking ADC0 channel read.
 *          Read analog values from RAM and calculate software average.
 * 
 * @param   ulChannel       Channel to read.
 * 
 * @return  ADC0->R[0]      16-bit ADC0 result.
 */
__attribute__((optimize("unroll-loops")))
uint16_t ADC0_usReadChannel(const uint32_t ulChannel)
{
    uint32_t usAvg = 0;

    /* Only these channels enabled */
    configASSERT((ulChannel == ADC_CH_AD8) || (ulChannel == ADC_CH_AD9));

    for (uint32_t i = 0; i < ADC_SAMPLE_COUNT; i++)
    {
        usAvg += usMeas[ulChannel][i];
    }
    usAvg >>= 3;

    /* We should have 16-bit result */
    configASSERT(usAvg <= UINT16_MAX);

    return (uint16_t)(usAvg & 0xFFFF);
}


/**
 * @brief   Start ADC0 measurement.
 * 
 * @param   ulBank          Bank to read.
 *
 * @param   ulChannel       Channel to read.
 * 
 * @return  None
 */
void ADC0_DMA_vMeasure(const uint32_t ulBank, const uint32_t ulChannel)
{
    configASSERT((ulBank == ADC_BANK_A) || (ulBank == ADC_BANK_B));
    configASSERT((ulChannel == ADC_CH_AD8) || (ulChannel == ADC_CH_AD9));

    /* Bank select - no bank-channel validation */
    BME_AND32(&ADC0->CFG2, ~ADC_CFG2_MUXSEL_MASK);
    BME_OR32(&ADC0->CFG2, ADC_CFG2_MUXSEL(ulBank));

    /* Set source and destination addresses */
    DMA0_vInitTransaction(DMA_CHANNEL0, (uint32_t *)&(ADC0->R[ulBank]), &usMeas[ulChannel][0], ADC_SAMPLE_COUNT * 2);

    /* Start conversion */
    ADC0->SC1[ulBank] = ADC_SC1_ADCH(ulChannel);
    DMA0_vStart(DMA_CHANNEL0);
}
