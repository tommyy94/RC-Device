/**
 * dma.h
 * This compilation unit handles Direct Memory Access.
 */

#pragma once

/* System headers */
#include <stdint.h>

/* Devices vendor headers */
#include "MKL25Z4.h"

/* User headers */
#include "defines.h"


/* Global defines */
/* DMA multiplexer request sources */
#define DMAMUX0_CHCFG_SOURCE_DISABLED       0       	/* 0x00 Disabled                                  */	
#define DMAMUX0_CHCFG_SOURCE_UART0_RX       2       	/* 0x02 UART0 RX - Available on DMAMUX0 & DMAMUX1 */
#define DMAMUX0_CHCFG_SOURCE_UART0_TX       3       	/* 0x03 UART0 TX                                  */
#define DMAMUX0_CHCFG_SOURCE_UART1_RX       4       	/* 0x04 UART1 RX                                  */
#define DMAMUX0_CHCFG_SOURCE_UART1_TX       5       	/* 0x05 UART1 TX                                  */
#define DMAMUX0_CHCFG_SOURCE_UART2_RX       6       	/* 0x06 UART2 RX                                  */
#define DMAMUX0_CHCFG_SOURCE_UART2_TX       7       	/* 0x07 UART2 TX                                  */
#define DMAMUX0_CHCFG_SOURCE_SPI0_RX        16      	/* 0x10 SPI0 RX                                   */
#define DMAMUX0_CHCFG_SOURCE_SPI0_TX        17      	/* 0x11 SPI0 TX                                   */
#define DMAMUX0_CHCFG_SOURCE_SPI1_RX        18      	/* 0x12 SPI1 RX                                   */
#define DMAMUX0_CHCFG_SOURCE_SPI1_TX        19      	/* 0x13 SPI1 TX                                   */
#define DMAMUX0_CHCFG_SOURCE_I2C0      	    22      	/* 0x16 I2C0 -  Available on DMAMUX0              */
#define DMAMUX0_CHCFG_SOURCE_I2C1_2    	    23      	/* 0x17 I2C1 (or I2C2)                            */
#define DMAMUX0_CHCFG_SOURCE_FTM0_C0        24      	/* 0x18 FTM0/TPM0 channel 0                       */
#define DMAMUX0_CHCFG_SOURCE_FTM0_C1        25      	/* 0x19 FTM0/TPM0 channel 1	                  */
#define DMAMUX0_CHCFG_SOURCE_FTM0_C2        26      	/* 0x1A FTM0/TPM0 channel 2	                  */
#define DMAMUX0_CHCFG_SOURCE_FTM0_C3        27      	/* 0x1B FTM0/TPM0 channel 3	                  */
#define DMAMUX0_CHCFG_SOURCE_FTM0_C4        28      	/* 0x1C FTM0/TPM0 channel 4	                  */
#define DMAMUX0_CHCFG_SOURCE_FTM0_C5 	    29      	/* 0x1D FTM0/TPM0 channel 5	                  */
#define DMAMUX0_CHCFG_SOURCE_FTM1_C0   	    32      	/* 0x20 FTM1/TPM1 channel 0	                  */
#define DMAMUX0_CHCFG_SOURCE_FTM1_C1   	    33      	/* 0x21 FTM1/TPM1 channel 1	                  */
#define DMAMUX0_CHCFG_SOURCE_FTM2_C0   	    34      	/* 0x22 FTM2/TPM2 channel 0	                  */
#define DMAMUX0_CHCFG_SOURCE_FTM2_C1   	    35      	/* 0x23 FTM2/TPM2 channel 1	                  */
#define DMAMUX0_CHCFG_SOURCE_ADC0           40      	/* 0x28 ADC0                                      */
#define DMAMUX0_CHCFG_SOURCE_CMP0      	    42      	/* 0x2A CMP0                                      */	
#define DMAMUX0_CHCFG_SOURCE_DAC0           45      	/* 0x2D DAC0                                      */
#define DMAMUX0_CHCFG_SOURCE_PORTA     	    49      	/* 0x31 port A                                    */
#define DMAMUX0_CHCFG_SOURCE_PORTD  	    52      	/* 0x34 port D                                    */
#define DMAMUX0_CHCFG_SOURCE_TPM0_OVERFLOW  54          /* 0x36 TPM0 overflow                             */
#define DMAMUX0_CHCFG_SOURCE_TPM1_OVERFLOW  55          /* 0x37 TPM1 overflow                             */
#define DMAMUX0_CHCFG_SOURCE_TPM2_OVERFLOW  56          /* 0x38 TPM2 overflow                             */
#define DMAMUX0_CHCFG_SOURCE_TSI            57      	/* 0x39 TSI                                       */
#define DMAMUX0_CHCFG_SOURCE_DMAMUX0        60      	/* 0x3C DMAMUX0                                   */
#define DMAMUX0_CHCFG_SOURCE_DMAMUX1        61      	/* 0x3D DMAMUX1                                   */
#define DMAMUX0_CHCFG_SOURCE_DMAMUX2        62      	/* 0x3E DMAMUX2                                   */
#define DMAMUX0_CHCFG_SOURCE_DMAMUX3        63      	/* 0x3F DMAMUX3                                   */

#define DMA_CHANNEL0                        0
#define DMA_CHANNEL1                        1
#define DMA_CHANNEL2                        2
#define DMA_CHANNEL3                        3

/* Global function prototypes */
void DMAMUX0_vInit(uint32_t const ulChannel, uint32_t const ulSource);
void DMA0_vLinkChannel(uint32_t const ulSrcCh, uint32_t const ulDstCh);
void DMA0_vClearStatus(const uint32_t ulChannel);
void DMA0_vInit(void);
void DMA0_vInitTransaction(const uint32_t ulChannel, void *const pvSrcAddr, void *const pvDstAddr, const uint32_t ulLength);
void DMA0_vChannelNEnable(const uint32_t ulChannel);
void DMA0_vChannelNDisable(const uint32_t ulChannel);
void DMA0_vChannel0Enable(void);
void DMA0_vChannel0Disable(void);
