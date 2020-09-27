#ifndef PWM_H_
#define PWM_H_


typedef enum
{
    FREQ_2KHZ = 0,
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
    FREQ_COUNT
} Frequency;


void PWM_Init(void);
void PWM_UpdateDutyCycle(Pwm *pwm, uint32_t ch, float dutyPer);
void PWM_UpdateFrequency(Pwm *pwm, uint32_t ch, Frequency freq);
void PWM_IncrementDutyCycle(Pwm *pwm, uint32_t ch, uint32_t steps);
void PWM_DecrementDutyCycle(Pwm *pwm, uint32_t ch, uint32_t steps);
void PWM_Enable(Pwm *pwm, uint32_t ch);
void PWM_Disable(Pwm *pwm, uint32_t ch);


#endif /* PWM_H_ */
