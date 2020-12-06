/**
 * tpm.c
 * Driver module for MKL25 TPM peripheral.
 */

#include "tpm.h"
#include "fsl_bitaccess.h"
#include "MKL25Z4.h"

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

    /* Divide by 2 prescaler => 24 MHz clock speed  */
    TPM2->SC = TPM_SC_PS(1);

    /* Clear Timer Overflow Flag */
    TPM2->STATUS |= 0xFFFFFFFF;
    
    /* Reset counters */
    TPM2->CNT = 0;
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
