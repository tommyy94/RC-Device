/**
 * spi.c
 * Driver module for MKL25 SPI peripheral.
 */


/* Device vendor headers */
#include "MKL25Z4.h"
#include "fsl_bitaccess.h"

/* RTOS headers */
#include "FreeRTOS.h"
#include "task.h"
#include "message_buffer.h"

/* User headers */
#include "spi.h"
#include "defines.h"
#include "system.h"


/* Local defines */
#define MISO                    (1UL)
#define SCK                     (2UL)
#define MOSI                    (3UL)
#define SS                      (4UL)

#define SPI1_TIMEOUT_MS         (10UL)


typedef enum
{
    MODE_0,
    MODE_1,
    MODE_2,
    MODE_3,
    MODE_COUNT
} SPI_Mode;


extern MessageBufferHandle_t   xSpiTxBuf;
extern MessageBufferHandle_t   xSpiRxBuf;


__STATIC_INLINE void SPI1_IO_vInit(void);
__STATIC_INLINE void SPI_vSetMode(SPI_Type *const pxSpi, const SPI_Mode eMode);
__STATIC_INLINE void SPI1_vSetSlave(const uint32_t ulState);


/* Function descriptions */

/**
 * @brief   Configure GPIO for SPI1.
 * 
 * @param   None
 * 
 * @return  None
 */
__STATIC_INLINE void SPI1_IO_vInit(void)
{
    /* Set PTE2 as SPI1_SCK */
    PORTE->PCR[SCK] &= ~PORT_PCR_MUX_MASK;
    PORTE->PCR[SCK] |=  PORT_PCR_MUX(ALT2);
    
    /* Set PTE3 as SPI1_MOSI */
    PORTE->PCR[MOSI] &= ~PORT_PCR_MUX_MASK;
    PORTE->PCR[MOSI] |=  PORT_PCR_MUX(ALT5);
    
    /* Set PTE1 as SPI1_MISO */
    PORTE->PCR[MISO] &= ~PORT_PCR_MUX_MASK;
    PORTE->PCR[MISO] |=  PORT_PCR_MUX(ALT5);
    
    /* Set PTE4 as GPIO for manual SS */
    PORTE->PCR[SS]   &= ~PORT_PCR_MUX_MASK;
    PORTE->PCR[SS]   |= PORT_PCR_MUX(ALT1);
    FGPIOE->PDDR     |= MASK(SS);
    FGPIOE->PDOR     |= MASK(SS);
}


/**
 * @brief   Set SS line high/low.
 * 
 * @param   ulState     HIGH/LOW
 *             
 * @return  None
 */
__STATIC_INLINE void SPI1_vSetSlave(const uint32_t ulState)
{
    configASSERT(ulState == LOW || (ulState == HIGH));
    
    /* Figure out whether to set or clear bit */
    const uint32_t *pulReg = (uint32_t *)&FGPIOE->PCOR - ulState; /* Subtract 0 - 1 words from PCOR address => pulReg = FGPIOE->PSOR/PCOR */
    
    /* Perform bitwise operation */
    BME_OR8(&(*pulReg), MASK(SS));
}


/**
 * @brief   Set SPI mode.
 * 
 * @param   eMode       Selected SPI mode.
 * 
 * @return  None
 */
__STATIC_INLINE void SPI_vSetMode(SPI_Type *pxSpi, SPI_Mode eMode)
{
    const uint32_t modeTable[MODE_COUNT] =
    {
        SPI_C1_CPOL(0) | SPI_C1_CPHA(1),  /* Mode 0 */
        SPI_C1_CPOL(0) | SPI_C1_CPHA(0),  /* Mode 1 */
        SPI_C1_CPOL(1) | SPI_C1_CPHA(1),  /* Mode 2 */
        SPI_C1_CPOL(1) | SPI_C1_CPHA(0)   /* Mode 3 */
    };

    pxSpi->C1 &= ~(SPI_C1_CPHA_MASK | SPI_C1_CPOL_MASK);
    pxSpi->C1 |= modeTable[eMode];
}


/**
 * @brief   Initialize SPI1 peripheral.
 * 
 * @details Baud rate = 48 MHz/(3*2�) = 4 MHz = 250 ns/bit
 *           Mode 3, MSB first, automatic SS.
 * 
 * @param   None
 * 
 * @return  None
 */
void SPI1_vInit(void)
{    
    /* Disable SPI during configuration */
    SPI1->C1 &= ~SPI_C1_SPE_MASK;
    
    SPI1_IO_vInit();

    /* Select master mode with manual SS output */
    SPI1->C1  =  SPI_C1_MSTR_MASK;
    SPI1->C2 &= ~SPI_C2_MODFEN_MASK;
    
    /* Baudrate = Bus clock / ((SPPR + 1) * 2^^(SPR+1)) */
    SPI1->BR = SPI_BR_SPPR(0) | SPI_BR_SPR(1);
    
    SPI_vSetMode(SPI1, MODE_3);
    
    /* Enable module & interrupts */
    SPI1->C1 |= SPI_C1_SPIE_MASK | SPI_C1_SPE_MASK;

    NVIC_ClearPendingIRQ(SPI1_IRQn);
    NVIC_SetPriority(SPI1_IRQn, SPI1_IRQ_PRIO);
    NVIC_EnableIRQ(SPI1_IRQn);
}


/**
 * @brief   Interrupt driven SPI transmit.
 * 
 * @param   pucTx       Pointer to data to send.
 * 
 * @param   pucRx       Pointer to data to receive.
 * 
 * @param   ulLength    Data length
 * 
 * @return  None
 */
void SPI1_vTransmitISR(uint8_t *const pucTx, uint8_t *const pucRx, uint32_t ulLength)
{
    BaseType_t xRet;

    /* Fill TX message buffer */
    xRet = xMessageBufferSend(xSpiTxBuf, pucTx, ulLength, NULL);
    configASSERT(xRet == (BaseType_t)ulLength);

    /* Start transmitting */
    BME_OR8(&SPI1->C1, SPI_C1_SPTIE_MASK);

    /* Fill RX message buffer */
    xRet = xMessageBufferReceive(xSpiRxBuf, pucRx, ulLength, pdMS_TO_TICKS(SPI1_TIMEOUT_MS));
    configASSERT(xRet == (BaseType_t)ulLength);
}


/**
 * @brief   Read byte from SPI1 receive buffer.
 * 
 * @param   None
 * 
 * @return  SPI1->D     Received byte
 */
uint8_t SPI1_ucReadPolling(void)
{
    while (BME_UBFX8(&SPI1->S, SPI_S_SPRF_SHIFT, SPI_S_SPRF_WIDTH) == 0)
    {
        ; /* Wait until buffer full */
    }
    
    return SPI1->D;
}


/**
 * @brief   Transmit character over SPI by polling.
 * 
 * @param   ucByte      Byte to send.
 * 
 * @return  None
 */
uint8_t SPI1_ucTransmitByte(const char ucByte)
{
    uint8_t ucRet;

    BME_AND8(&SPI1->C1, (uint8_t)~SPI_C1_SPIE_MASK);

    while (BME_UBFX8(&SPI1->S, SPI_S_SPTEF_SHIFT, SPI_S_SPTEF_WIDTH) == 0)
    {
        ; /* Wait until buffer empty */
    }
    
    /* Transfer byte */
    SPI1_vSetSlave(LOW);
    
    SPI1->D = ucByte;
    ucRet = SPI1_ucReadPolling();
    
    SPI1_vSetSlave(HIGH);
    
    BME_OR8(&SPI1->C1, SPI_C1_SPIE_MASK);

    return ucRet;
}


/**
 * @brief   SPI1 ISR.
 * 
 * @param   None
 *             
 * @return  None
 *
 * @note    SPI Receive buffer full IRQ cannot be disabled.
 */
void SPI1_IRQHandler(void)
{
    static uint8_t      pucTxBuf[SPI_QUEUE_SIZE];
    static uint8_t      pucRxBuf[SPI_QUEUE_SIZE];
    static BaseType_t   xRxLen;
    static BaseType_t   xTxLen;
    static uint32_t     ulBytesSent = 0;
    static uint32_t     ulBytesRecv = 0;
    BaseType_t          xHigherPriorityTaskWoken = pdFALSE;

    /* Read message buffer if this is a new transfer */
    if (ulBytesSent == 0)
    {
        xTxLen = (uint32_t)xMessageBufferReceiveFromISR(xSpiTxBuf, pucTxBuf, SPI_QUEUE_SIZE, &xHigherPriorityTaskWoken);
        SPI1_vSetSlave(LOW);
    }

    /* Must read receive buffer first to avoid overrun */
    if (BME_UBFX8(&SPI1->S, SPI_S_SPRF_SHIFT, SPI_S_SPRF_WIDTH) != 0)
    {
        pucRxBuf[ulBytesRecv++] = SPI1->D;

        /* Check if this was the last byte */
        if (ulBytesSent >= (uint32_t)xTxLen)
        {
            SPI1_vSetSlave(HIGH);
            xRxLen = xMessageBufferSendFromISR(xSpiRxBuf, pucRxBuf, ulBytesRecv, &xHigherPriorityTaskWoken);
            configASSERT(xRxLen == (BaseType_t)ulBytesRecv);
            ulBytesSent = 0;
            ulBytesRecv = 0;
        }
    }

    if ((BME_UBFX8(&SPI1->C1, SPI_C1_SPTIE_SHIFT, SPI_C1_SPTIE_WIDTH) != 0)
     && (BME_UBFX8(&SPI1->S, SPI_S_SPTEF_SHIFT, SPI_S_SPTEF_WIDTH)  != 0))
    {
        /* Disable transmitter IRQ before sending the last byte
         * to guarantee no IRQ after the last byte
         */
        if ((ulBytesSent + 1) >= (uint32_t)xTxLen)
        {
            BME_AND8(&SPI1->C1, (uint8_t)~SPI_C1_SPTIE_MASK);
        }

        SPI1->D = pucTxBuf[ulBytesSent++];
    }

    /* This condition should never occur as SSOE is set 1!
     * Leave check for debugging.
     */
    if (BME_UBFX8(&SPI1->S, SPI_S_MODF_SHIFT, SPI_S_MODF_WIDTH) != 0)
    {
        __BKPT();
    }

    /* Switch to higher priority task if needed */
    portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}
