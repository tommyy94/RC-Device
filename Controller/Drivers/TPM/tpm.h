/**
 * tpm.h
 * Driver module for MKL25 TPM peripheral.
 */

#pragma once

/* System headers */
#include <stdint.h>

/* Device vendor headers */

/* User headers */

/* Timings calculated from 24 MHz clock speed */
#define MICROSECOND                         (24UL)                                      /* 1.0 s */
#define TEN_MICROSECONDS                    (MICROSECOND * 10)                          /* 10.0 s */
#define TIME_BETWEEN_BYTES                  (6UL)                                       /* 0.25 s */
#define TIME_PER_BYTE                       (MICROSECOND * 2 + TIME_BETWEEN_BYTES)      /* 2.25 s */

#define TPM2_MICROSECONDS(x)                ((x) * MICROSECOND)

/* Global function prototypes */
void TPM2_vInit(void);
void TPM2_vStart(void);
void TPM2_vStop(void);
