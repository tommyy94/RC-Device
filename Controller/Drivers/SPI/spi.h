/**
 * spi.h
 * Driver module for MKL25 SPI peripheral.
 * 
 * SPI1 Populated IO:
 *  PTE1 - MISO
 *  PTE2 - SCK
 *  PTE3 - MOSI
 *  PTE4 - CS
 */

#pragma once

/* System headers */
#include <stdint.h>

/* Device vendor headers */

/* User headers */

/* Global defines */
#define SPI_QUEUE_SIZE          (32UL)

typedef enum
{
    SPI_RF = 0,
    SPI_TFT,
    SPI_COUNT
} SPI_Target;

typedef struct
{
    const SPI_Target  eInstance;
    uint8_t          *pucTx;
    uint8_t          *pucRx;
    uint32_t          ulLen;
} SPI_Adapter;


/* Global function prototypes */
void SPI0_vInit(void);
void SPI1_vInit(void);
void SPI_vXfer(SPI_Adapter *pxAdap);