#include <same70q21b.h>
#include <utils_assert.h>
#include "pwm.h"


#define PWM_CH_COUNT  (4u)


static void PWM_IO_Init(void);
static uint16_t PWM_GetChannelDutyCycle(float dutyPer);


/* Could use 2-20 kHz signal for driving DC motors.
 * Center-aligned mode seems to be the best for H-bridge.
 */
void PWM_Init(void)
{
    uint16_t chDuty;
    Pmc *pmc = PMC;
    Pwm *pwm = PWM0;

    PWM_IO_Init();

    /**
     * Enable PWM0 clock gating
     * - PWM0 clock = 75 MHz
     */
    pmc->PMC_PCR = PMC_PCR_CMD_Msk | PMC_PCR_PID(PWM0_CLOCK_ID) | PMC_PCR_EN_Msk;
                                  
    /* clkA & clkB = 75 MHz / 16 = 4,68 MHz => center-aligned so 2,34 MHz */
    pwm->PWM_CLK = PWM_CLK_PREA_CLK_DIV16 | PWM_CLK_DIVA_PREA;
    
    /* Center-aligned, clk A as source */
    pwm->PwmChNum[0].PWM_CMR = PWM_CMR_CPRE_CLKA | PWM_CMR_CALG_Msk;
    pwm->PwmChNum[2].PWM_CMR = PWM_CMR_CPRE_CLKA | PWM_CMR_CALG_Msk;

    /* period = (2 * 2^PREx * CPRD * DIVx) / Pclk
     *        = (2 * 16 * 1175 * 1) / 75 MHz
     *        = 0,0005s
     *
     * Channel period for desired frequency:
     * f(T) = (T * (75 * 10^6)) / 32
     */
    pwm->PwmChNum[0].PWM_CPRD = PWM_CPRD_CPRD(freq_tbl[FREQ_2KHZ]);
    pwm->PwmChNum[2].PWM_CPRD = PWM_CPRD_CPRD(freq_tbl[FREQ_2KHZ]);
    
    /* Duty cycle = ((period / 2) - 1 / channel_clk x CDTY) / (period / 2)
     *            = ((0,0005s / 2) - 1 / 4,68 MHz x CDTY) / (0,0005s / 2)
     * 
     * Converting desired duty cycle to CDTY:
     *    D = ((0,0005s / 2) - 1 / 4,68 MHz x CDTY) / (0,0005s / 2)
     * => D = ((0,00025) - 1 / (4,68 MHz x CDTY) / (0,00025)      | x 0.00025
     * => 0.00025 x D = 0.00025 - 1 / (4,68 MHz x CDTY)           | - 0.00025
     * => 0.00025 x D - 0.00025 = -1 / (4,68 MHz x CDTY)          | x 4,68 MHz
     * => 1170 x CDTY x D - 1170 x CDTY = -1                      | / 1170(D - 1)
     * => CDTY = -(1 / 1170(D - 1))
     *
     * The result is in the divisor, so:
     *    f(D)    = (-((1170 * D) - 1170))
     */
    chDuty = PWM_GetChannelDutyCycle(50.0);
    pwm->PwmChNum[0].PWM_CDTY = PWM_CDTY_CDTY(chDuty);
    pwm->PwmChNum[2].PWM_CDTY = PWM_CDTY_CDTY(chDuty);

    /* Enable PWM0 on channel 0 & channel 2 */
    pwm->PWM_ENA = PWM_ENA_CHID2_Msk | PWM_ENA_CHID0_Msk;
}


/* Select PA0 for PWM0 CH0+
 * and PC19 for PWM0 CH2+ 
 * NOTE: PC19 used by ISI!
 */
static void PWM_IO_Init(void)
{
    Pio *pioa = PIOA;
    Pio *pioc = PIOC;
    
    /*
     * _______________________________________
     * |            |           |             |
     * |  ABCDSR1   |  ABCDSR2  | Peripheral  |
     * |------------+-----------+-------------|
     * |     0      |     0     |     A       |
     * |     1      |     0     |     B       |
     * |     0      |     1     |     C       |
     * |     1      |     1     |     D       |
     * |____________|___________|_____________|
     */

    /* Select peripheral A for PA0 */
    pioa->PIO_ABCDSR[0] &= ~PIO_ABCDSR_P0_Msk;
    pioa->PIO_ABCDSR[1] &= ~PIO_ABCDSR_P0_Msk;
    
    /* Select peripheral B for PC19 */
    pioc->PIO_ABCDSR[0] |=  PIO_ABCDSR_P19_Msk;
    pioc->PIO_ABCDSR[1] &= ~PIO_ABCDSR_P19_Msk;

    /* Set peripheral function */
    pioa->PIO_PDR |= PIO_ABCDSR_P0_Msk;
    pioc->PIO_PDR |= PIO_ABCDSR_P19_Msk;
}


void PWM_UpdateDutyCycle(Pwm *pwm, uint32_t ch, float dutyPer)
{
  uint16_t chDuty;
  assert(ch < PWM_CH_COUNT, __FILE__, __LINE__);

  chDuty = PWM_GetChannelDutyCycle(dutyPer);
  pwm->PwmChNum[ch].PWM_CDTYUPD = PWM_CDTYUPD_CDTYUPD(chDuty);
}


void PWM_UpdateFrequency(Pwm *pwm, uint32_t ch, Frequency freq)
{
  assert(ch < PWM_CH_COUNT, __FILE__, __LINE__);
  pwm->PwmChNum[ch].PWM_CPRDUPD = PWM_CPRDUPD_CPRDUPD(freq_tbl[freq]);
}


static uint16_t PWM_GetChannelDutyCycle(float dutyPer)
{
  /* Step can be calculated as follows:
   *    f(D)    = (-((1170 * D) - 1170))
   * => f(0.99) = 11.7
   */
  const float step = 11.7;

  /* Calculate positive duty cycle */
  dutyPer = 100.0 - dutyPer;
  return (uint16_t)(dutyPer * step);
}


/* These functions could be used when accelerating/decelerating
 * the device..
 *
 * NOTE: Might have to use a lookup table for the values,
 * to avoid DMA interrupt between each update.
 */
void PWM_IncrementDutyCycle(Pwm *pwm, uint32_t ch, uint32_t steps)
{
  assert(ch < PWM_CH_COUNT, __FILE__, __LINE__);
  uint16_t curDuty;
  const float step = 11.7;

  curDuty  = pwm->PwmChNum[ch].PWM_CDTY & PWM_CDTY_CDTY_Msk;
  curDuty += (uint16_t)(step * steps); /* CDTY rounded down */
  pwm->PwmChNum[ch].PWM_CDTYUPD = PWM_CDTYUPD_CDTYUPD(curDuty);
}


/* Decelerating could be done by inverting the PWM polarity and
 * updating the registers. The register value should be swapped to
 * the beginning/end of the lookup table.
 */
void PWM_DecrementDutyCycle(Pwm *pwm, uint32_t ch, uint32_t steps)
{
  assert(ch < PWM_CH_COUNT, __FILE__, __LINE__);
  uint16_t curDuty;
  const float step = 11.7;

  curDuty  = pwm->PwmChNum[ch].PWM_CDTY & PWM_CDTY_CDTY_Msk;
  curDuty -= (uint16_t)(step * steps); /* CDTY rounded down */
  pwm->PwmChNum[ch].PWM_CDTYUPD = PWM_CDTYUPD_CDTYUPD(curDuty);
}


void PWM_Enable(Pwm *pwm, uint32_t ch)
{
    assert(ch <= PWM_DIS_CHID3_Pos, __FILE__, __LINE__);
    pwm->PWM_ENA = (0x1U << ch) & PWM_ENA_Msk;
}


void PWM_Disable(Pwm *pwm, uint32_t ch)
{
    assert(ch <= PWM_DIS_CHID3_Pos, __FILE__, __LINE__);
    pwm->PWM_DIS = (0x1U << ch) & PWM_DIS_Msk;
}
