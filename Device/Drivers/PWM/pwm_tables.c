#include "pwm.h"


/* Precalculated positive duty cycle values for
 * accelerating/decelerating the device.
 * Duty cycle percentage is the lookup table index.
 */
const uint16_t dutyCycle[DUTY_CYCLE_COUNT] = 
{
    1170, 1158, 1146, 1134, 1123, 1111, 1099, 1088, 1076, 1064,
    1053, 1041, 1029, 1017, 1006,  994,  982,  971,  959,  947,
    936,   924,  912,  900,  889,  877,  865,  854,  842,  830,
    819,   807,  795,  783,  772,  760,  748,  737,  725,  713,
    702,   690,  678,  666,  655,  643,  631,  620,  608,  596,
    585,   573,  561,  549,  538,  526,  514,  503,  491,  479,
    468,   456,  444,  432,  421,  409,  397,  386,  374,  362,
    351,   339,  327,  315,  304,  292,  280,  269,  257,  245,
    234,   222,  210,  198,  187,  175,  163,  152,  140,  128,
    117,   105,   93,   81,   70,   58,   46,   35,   23,   11
};


const uint16_t freq_tbl[FREQ_COUNT] =
{
    1172, /*  2 kHz */
    781,  /*  3 kHz */
    586,  /*  4 kHz */
    469,  /*  5 kHz */
    391,  /*  6 kHz */
    335,  /*  7 kHz */
    293,  /*  8 kHz */
    260,  /*  9 kHz */
    234,  /* 10 kHz */
    213,  /* 11 kHz */
    195,  /* 12 kHz */
    180,  /* 13 kHz */
    167,  /* 14 kHz */
    156,  /* 15 kHz */
    146,  /* 16 kHz */
    138,  /* 17 kHz */
    130,  /* 18 kHz */
    123,  /* 19 kHz */
    117   /* 20 kHz */
};