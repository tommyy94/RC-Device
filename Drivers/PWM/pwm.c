#include <same70q21b.h>


enum
{
    FREQ_2KHZ,
    FREQ_3KHZ,
    FREQ_4KHZ,
    FREQ_5KHZ,
    FREQ_6KHZ,
    FREQ_7KHZ,
    FREQ_8KHZ,
    FREQ_9KHZ,
    FREQ_10KHZ,
    FREQ_11KHZ,
    FREQ_12KHZ,
    FREQ_13KHZ,
    FREQ_14KHZ,
    FREQ_15KHZ,
    FREQ_16KHZ,
    FREQ_17KHZ,
    FREQ_18KHZ,
    FREQ_19KHZ,
    FREQ_20KHZ,
    FREQ_COUNT = 19
};


/* Need CPRD and PREx values to calculate frequency */
uint32_t freq_khz[FREQ_COUNT] =
{
    0 /* 2 kHz */
};


static void PWM_IO_Init(void);


/* Could use 2-20 kHz signal for driving DC motors.
 * Center-aligned mode seems to be the best for H-bridge.
 */
void PWM_Init(void)
{
    Pmc *pmc = PMC;
    Pwm *pwm = PWM0;

    PWM_IO_Init();

    /**
     * Enable PWM clock gating
     * - PWM clock = 75 kHz
     */
    pmc->PMC_PCR = PMC_PCR_CMD_Msk | PMC_PCR_PID(PWM0_CLOCK_ID) | PMC_PCR_EN_Msk;
                                  
    /* clkA & clkB = 75 kHz / 16 = 4 kHz => center-aligned so 4 kHz */
    pwm->PWM_CLK = PWM_CLK_PREA_CLK_DIV16 | PWM_CLK_DIVA_PREA;
    
    /* Center-aligned, clk A as source */
    pwm->PwmChNum[0].PWM_CMR = PWM_CMR_CPRE_CLKA | PWM_CMR_CALG_Msk;

    /* period = (2 *  2^PREx * CPRD * DIVx) / SCLK
     *
     *
     */
    pwm->PwmChNum[0].PWM_CPRD = PWM_CPRD_CPRD(1000);
    
    /* Set duty cycle
     * 
     * Duty cycle = ((period / 2) - 1 / channel_clk x CDTY) / (period / 2)
     */
    pwm->PwmChNum[0].PWM_CDTY = 0x00A0;

    /* Enable PWM on channel 0 */
    pwm->PWM_ENA = PWM_ENA_CHID0_Msk;
}


/* Select PA0 for PWM0 CH0 */
static void PWM_IO_Init(void)
{
    Pio *pioa = PIOA;
    
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

    /* Select peripheral A */
    pioa->PIO_ABCDSR[0] &= ~PIO_ABCDSR_P0_Msk;
    pioa->PIO_ABCDSR[1] &= ~PIO_ABCDSR_P0_Msk;

    /* Set peripheral function */
    pioa->PIO_PDR |= PIO_PDR_P0_Msk;
}
