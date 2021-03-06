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
#include <stdbool.h>

/* Device vendor headers */

/* User headers */

/* Global defines */
#define SPI_QUEUE_SIZE          (1UL)

#define LOW     (0UL)
#define HIGH    (1UL)

typedef enum
{
    SPI_UNUSED = 0,
    SPI_RF,
    SPI_COUNT
} SPI_Target;

typedef struct
{
    const SPI_Target  eInstance;
    uint8_t          *pucTx;
    uint8_t          *pucRx;
    uint32_t          ulLen;
    uint32_t          ulIndx;
    uint32_t          ulTimeoutMs;
    void              (*pvTxCallback)(void *);
    void              (*pvRxCallback)(void *);
} SPI_Adapter;


/* Global function prototypes */
void SPI0_vInit(void);
void SPI1_vInit(void);
bool SPI_bXfer(SPI_Adapter *pxAdap);
void SPI_vSetSlave(SPI_Target eInst, const uint32_t ulState);
void SPI_vEnableInterrupts(const SPI_Target eInst);
void SPI_vDisableInterrupts(const SPI_Target eInst);
