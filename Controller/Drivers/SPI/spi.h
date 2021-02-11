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

/* Device vendor headers */

/* User headers */

/* Global defines */
#define SPI_QUEUE_SIZE          (1UL)

typedef enum
{
    SPI_TFT = 0,
    SPI_RF,
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
bool SPI_bXfer(SPI_Adapter *pxAdap);