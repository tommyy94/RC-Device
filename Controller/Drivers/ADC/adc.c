/**
 * adc.c
 * Driver module for MKL25 ADC peripheral.
 */

#include "adc.h"
#include "dma.h"
#include "FreeRTOS.h"

#include "fsl_bitaccess.h"


/* Local defines */
#define JOYSTICK_X_PIN                (0UL)  /* PTB0 = ADC0_SE8 */
#define JOYSTICK_Y_PIN                (1UL)  /* PTB1 = ADC0_SE9 */

#define ADC_CHANNEL_SAMPLE_COUNT      (8UL)
#define ADC_CHANNEL_COUNT             (2UL)
#define ADC_SAMPLE_COUNT              (ADC_CHANNEL_COUNT * ADC_CHANNEL_SAMPLE_COUNT)


/* Global variables */
static uint16_t usMeas[ADC_SAMPLE_COUNT];

static uint32_t pulAdcChTbl[ADC_SAMPLE_COUNT] =
{
    ADC_SC1_ADCH(ADC_CH_AD9), ADC_SC1_ADCH(ADC_CH_AD8),
    ADC_SC1_ADCH(ADC_CH_AD9), ADC_SC1_ADCH(ADC_CH_AD8),
    ADC_SC1_ADCH(ADC_CH_AD9), ADC_SC1_ADCH(ADC_CH_AD8),
    ADC_SC1_ADCH(ADC_CH_AD9), ADC_SC1_ADCH(ADC_CH_AD8),
    ADC_SC1_ADCH(ADC_CH_AD9), ADC_SC1_ADCH(ADC_CH_AD8),
    ADC_SC1_ADCH(ADC_CH_AD9), ADC_SC1_ADCH(ADC_CH_AD8),
    ADC_SC1_ADCH(ADC_CH_AD9), ADC_SC1_ADCH(ADC_CH_AD8),
    ADC_SC1_ADCH(ADC_CH_AD9), ADC_SC1_ADCH(ADC_CH_AD8)
};

/* Local function prototypes */
__STATIC_INLINE bool ADC0_bCalibrate(void);
__STATIC_INLINE void ADC0_vSelectBank(const uint32_t ulBank);

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
    /**
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

    /* Configure DMA0 trigger source */
    DMAMUX0_vInit(DMA_CHANNEL0, DMAMUX0_CHCFG_SOURCE_ADC0);
    
    /* Disable both banks */
    ADC0->SC1[ADC_BANK_A] = ADC_SC1_ADCH(ADC_CH_DISABLED);
    ADC0->SC1[ADC_BANK_B] = ADC_SC1_ADCH(ADC_CH_DISABLED);
    
    ADC0_vSelectBank(ADC_BANK_A);
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
 * @param   pusAnalogValues     Pointer to ADC results
 * 
 * @return  Stored into pointer.
 */
__attribute__((optimize("unroll-loops")))
void ADC0_vReadChannels(uint16_t pusAnalogValues[])
{
    uint32_t ulCh8Avg = 0;
    uint32_t ulCh9Avg = 0;

    for (uint32_t i = 0; i < ADC_SAMPLE_COUNT; i += 2)
    {
        ulCh8Avg += usMeas[i];
        ulCh9Avg += usMeas[i + 1];
    }

    /* We should have 16-bit results */
    configASSERT((ulCh8Avg >> 3) <= UINT16_MAX);
    configASSERT((ulCh9Avg >> 3) <= UINT16_MAX);

    pusAnalogValues[0] = (uint16_t)(ulCh8Avg >> 3) & 0xFFFF;
    pusAnalogValues[1] = (uint16_t)(ulCh9Avg >> 3) & 0xFFFF;
}


/**
 * @brief   Select ADC0 bank.
 * 
 * @param   ulBank          Bank select.
 * 
 * @return  None
 */
__STATIC_INLINE void ADC0_vSelectBank(const uint32_t ulBank)
{
    /* Sanity check */
    configASSERT((ulBank == ADC_BANK_A) || (ulBank == ADC_BANK_B));

    /* Select new bank */
    BME_AND32(&ADC0->CFG2, ~ADC_CFG2_MUXSEL_MASK);
    BME_OR32(&ADC0->CFG2, ADC_CFG2_MUXSEL(ulBank));
}


/**
 * @brief   Start ADC0 measurement.
 *          ADC results are written to RAM.
 * 
 * @param   None
 * 
 * @return  None
 */
void ADC0_DMA_vMeasureChannels(void)
{
    uint32_t *const pulChSel = (uint32_t *)&(ADC0->SC1[ADC_BANK_A]);
    uint32_t *const pulData  = (uint32_t *)&(ADC0->R[ADC_BANK_A]);

    /* Convert the transfer length to bytes as the DMA
     * controller counts the transfer length in bytes
     */
    uint32_t const ulCh0Len = ADC_SAMPLE_COUNT * sizeof(usMeas[0]);
    uint32_t const ulCh1Len = ADC_SAMPLE_COUNT * sizeof(pulAdcChTbl[0]);

    /* Disable DMA requests before configuring it */
    ADC0->SC2 &= ~ADC_SC2_DMAEN(1);
    DMA0_vChannel0Disable();

    /* Need to clear DONE flags before each transaction */
    DMA0_vClearStatus(DMA_CHANNEL0);
    DMA0_vClearStatus(DMA_CHANNEL1);

    /* Configure DMA to switch to next channel after reading ADC result.
     * Need to rewrite all source and destination addresses every time
     * as the controller increments them.
     */
    DMA0_vInitTransaction(DMA_CHANNEL0, pulData, usMeas, ulCh0Len);
    DMA0_vInitTransaction(DMA_CHANNEL1, pulAdcChTbl, pulChSel, ulCh1Len);
    
    /* Start conversion */
    DMA0_vChannel0Enable();
    ADC0->SC2 |= ADC_SC2_DMAEN(1);
    ADC0->SC1[ADC_BANK_A] = ADC_SC1_ADCH(ADC_CH_AD8);
}
