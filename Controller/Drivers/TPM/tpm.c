/**
 * tpm.c
 * Driver module for MKL25 TPM peripheral.
 */

#include "tpm.h"
#include "fsl_bitaccess.h"

/* Local defines */

/* Function descriptions */


/**
 * @brief   Initialize TPM2.
 * 
 * @param   None
 * 
 * @return  None
 */
void TPM2_vInit(void)
{
    /* Set clock source for TPM2 */
    SIM->SOPT2 |= SIM_SOPT2_TPMSRC(1) | SIM_SOPT2_PLLFLLSEL_MASK;

    /**
     * Enable timer overflow interrupts
     * Divide by 2 prescaler => 24 MHz clock speed
     */
    TPM2->SC = TPM_SC_PS(1) | TPM_SC_TOIE(1);

    /* Clear Timer Overflow Flag */
    TPM2->STATUS |= 0xFFFFFFFF;
    
    /* Reset counters */
    TPM2->CNT = 0;

    /* Set NVIC for TPM2 ISR */
    NVIC_SetPriority(TPM2_IRQn, 3);
    NVIC_ClearPendingIRQ(TPM2_IRQn);
    NVIC_EnableIRQ(TPM2_IRQn);
}


/**
 * @brief   Wrapper function for loading TPM2 counter.
 * 
 * @detail  TPM2 is configured to 48 MHz/2 prescaler = 24 MHz clock speed.
 * 
 * @note    timePerBit = 250 ns
 *          => timePerByte = 2 s
 *          timeBetweenBytes = 0.25 s
 *          => timePerByte = 2.25 s
 *          
 *          deliveryTime = timePerByte * numberOfBytes - timeBetweenBytes
 * 
 *          Note: 2 s overhead at beginning
 * 
 * @param   ulBytes     Number of bytes to send.
 * 
 * @return  None
 */
void TPM2_vLoadCounter(uint32_t ulBytes)
{
    TPM2->MOD = TIME_PER_BYTE * ulBytes - TIME_BETWEEN_BYTES; /* Last delay between bytes not needed */
}


/**
 * @brief   Wrapper function for starting TPM2 counter.
 * 
 * @param   None
 * 
 * @return  None
 */
void TPM2_vStart(void)
{
    BME_OR32(&TPM2->SC, TPM_SC_CMOD(1));
}


/**
 * @brief   Wrapper function for stopping TPM2 counter.
 * 
 * @param   None
 * 
 * @return  None
 */
void TPM2_vStop(void)
{
    BME_AND32(&TPM2->SC, ~TPM_SC_CMOD(1));
}
