/*****************************************************************************
 * Copyright (c) 2019 Rowley Associates Limited.                             *
 *                                                                           *
 * This file may be distributed under the terms of the License Agreement     *
 * provided with this software.                                              *
 *                                                                           *
 * THIS FILE IS PROVIDED AS IS WITH NO WARRANTY OF ANY KIND, INCLUDING THE   *
 * WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. *
 *                                                                           *
 *****************************************************************************/

/*****************************************************************************
 *                         Preprocessor Definitions                          *
 *                         ------------------------                          *
 * STARTUP_FROM_RESET                                                        *
 *                                                                           *
 *   If defined, the program will startup from power-on/reset. If not        *
 *   defined the program will just loop endlessly from power-on/reset.       *
 *                                                                           *
 * VECTORS_IN_RAM                                                            *
 *                                                                           *
 *   If defined, an area of RAM will large enough to store the vector table  *
 *   will be reserved.                                                       *
 *                                                                           *
 *****************************************************************************/

  .syntax unified
  .code 16

  .section .init, "ax"
  .align 2

/*****************************************************************************
 * Default Exception Handlers                                                *
 *****************************************************************************/

#ifndef STARTUP_FROM_RESET

  .thumb_func
  .weak Reset_Wait
Reset_Wait:
  b .

#endif

  .thumb_func
  .weak NMI_Handler
NMI_Handler:
  b .

  .thumb_func
  .weak HardFault_Handler
HardFault_Handler:
  b .

  .thumb_func
  .weak SVC_Handler
SVC_Handler:
  b .

  .thumb_func
  .weak PendSV_Handler
PendSV_Handler:
  b .

  .thumb_func
  .weak SysTick_Handler
SysTick_Handler:
  b .

  .thumb_func
Dummy_Handler:
  b .

#if defined(__OPTIMIZATION_SMALL)

  .weak SUPC_Handler
  .thumb_set SUPC_Handler,Dummy_Handler

  .weak RSTC_Handler
  .thumb_set RSTC_Handler,Dummy_Handler

  .weak RTC_Handler
  .thumb_set RTC_Handler,Dummy_Handler

  .weak RTT_Handler
  .thumb_set RTT_Handler,Dummy_Handler

  .weak WDT_Handler
  .thumb_set WDT_Handler,Dummy_Handler

  .weak PMC_Handler
  .thumb_set PMC_Handler,Dummy_Handler

  .weak EFC_Handler
  .thumb_set EFC_Handler,Dummy_Handler

  .weak UART0_Handler
  .thumb_set UART0_Handler,Dummy_Handler

  .weak UART1_Handler
  .thumb_set UART1_Handler,Dummy_Handler

  .weak PIOA_Handler
  .thumb_set PIOA_Handler,Dummy_Handler

  .weak PIOB_Handler
  .thumb_set PIOB_Handler,Dummy_Handler

  .weak PIOC_Handler
  .thumb_set PIOC_Handler,Dummy_Handler

  .weak USART0_Handler
  .thumb_set USART0_Handler,Dummy_Handler

  .weak USART1_Handler
  .thumb_set USART1_Handler,Dummy_Handler

  .weak USART2_Handler
  .thumb_set USART2_Handler,Dummy_Handler

  .weak PIOD_Handler
  .thumb_set PIOD_Handler,Dummy_Handler

  .weak PIOE_Handler
  .thumb_set PIOE_Handler,Dummy_Handler

  .weak HSMCI_Handler
  .thumb_set HSMCI_Handler,Dummy_Handler

  .weak TWIHS0_Handler
  .thumb_set TWIHS0_Handler,Dummy_Handler

  .weak TWIHS1_Handler
  .thumb_set TWIHS1_Handler,Dummy_Handler

  .weak SPI0_Handler
  .thumb_set SPI0_Handler,Dummy_Handler

  .weak SSC_Handler
  .thumb_set SSC_Handler,Dummy_Handler

  .weak TC0_Handler
  .thumb_set TC0_Handler,Dummy_Handler

  .weak TC1_Handler
  .thumb_set TC1_Handler,Dummy_Handler

  .weak TC2_Handler
  .thumb_set TC2_Handler,Dummy_Handler

  .weak TC3_Handler
  .thumb_set TC3_Handler,Dummy_Handler

  .weak TC4_Handler
  .thumb_set TC4_Handler,Dummy_Handler

  .weak TC5_Handler
  .thumb_set TC5_Handler,Dummy_Handler

  .weak AFEC0_Handler
  .thumb_set AFEC0_Handler,Dummy_Handler

  .weak DACC_Handler
  .thumb_set DACC_Handler,Dummy_Handler

  .weak PWM0_Handler
  .thumb_set PWM0_Handler,Dummy_Handler

  .weak ICM_Handler
  .thumb_set ICM_Handler,Dummy_Handler

  .weak ACC_Handler
  .thumb_set ACC_Handler,Dummy_Handler

  .weak USBHS_Handler
  .thumb_set USBHS_Handler,Dummy_Handler

  .weak MCAN0_INT0_Handler
  .thumb_set MCAN0_INT0_Handler,Dummy_Handler

  .weak MCAN0_INT1_Handler
  .thumb_set MCAN0_INT1_Handler,Dummy_Handler

  .weak MCAN1_INT0_Handler
  .thumb_set MCAN1_INT0_Handler,Dummy_Handler

  .weak MCAN1_INT1_Handler
  .thumb_set MCAN1_INT1_Handler,Dummy_Handler

  .weak GMAC_Handler
  .thumb_set GMAC_Handler,Dummy_Handler

  .weak AFEC1_Handler
  .thumb_set AFEC1_Handler,Dummy_Handler

  .weak TWIHS2_Handler
  .thumb_set TWIHS2_Handler,Dummy_Handler

  .weak SPI1_Handler
  .thumb_set SPI1_Handler,Dummy_Handler

  .weak QSPI_Handler
  .thumb_set QSPI_Handler,Dummy_Handler

  .weak UART2_Handler
  .thumb_set UART2_Handler,Dummy_Handler

  .weak UART3_Handler
  .thumb_set UART3_Handler,Dummy_Handler

  .weak UART4_Handler
  .thumb_set UART4_Handler,Dummy_Handler

  .weak TC6_Handler
  .thumb_set TC6_Handler,Dummy_Handler

  .weak TC7_Handler
  .thumb_set TC7_Handler,Dummy_Handler

  .weak TC8_Handler
  .thumb_set TC8_Handler,Dummy_Handler

  .weak TC9_Handler
  .thumb_set TC9_Handler,Dummy_Handler

  .weak TC10_Handler
  .thumb_set TC10_Handler,Dummy_Handler

  .weak TC11_Handler
  .thumb_set TC11_Handler,Dummy_Handler

  .weak AES_Handler
  .thumb_set AES_Handler,Dummy_Handler

  .weak TRNG_Handler
  .thumb_set TRNG_Handler,Dummy_Handler

  .weak XDMAC_Handler
  .thumb_set XDMAC_Handler,Dummy_Handler

  .weak ISI_Handler
  .thumb_set ISI_Handler,Dummy_Handler

  .weak PWM1_Handler
  .thumb_set PWM1_Handler,Dummy_Handler

  .weak FPU_Handler
  .thumb_set FPU_Handler,Dummy_Handler

  .weak SDRAMC_Handler
  .thumb_set SDRAMC_Handler,Dummy_Handler

  .weak RSWDT_Handler
  .thumb_set RSWDT_Handler,Dummy_Handler

  .weak CCW_Handler
  .thumb_set CCW_Handler,Dummy_Handler

  .weak CCF_Handler
  .thumb_set CCF_Handler,Dummy_Handler

  .weak GMAC_Q1_Handler
  .thumb_set GMAC_Q1_Handler,Dummy_Handler

  .weak GMAC_Q2_Handler
  .thumb_set GMAC_Q2_Handler,Dummy_Handler

  .weak IXC_Handler
  .thumb_set IXC_Handler,Dummy_Handler

  .weak I2SC0_Handler
  .thumb_set I2SC0_Handler,Dummy_Handler

  .weak I2SC1_Handler
  .thumb_set I2SC1_Handler,Dummy_Handler

  .weak GMAC_Q3_Handler
  .thumb_set GMAC_Q3_Handler,Dummy_Handler

  .weak GMAC_Q4_Handler
  .thumb_set GMAC_Q4_Handler,Dummy_Handler

  .weak GMAC_Q5_Handler
  .thumb_set GMAC_Q5_Handler,Dummy_Handler

#else

  .thumb_func
  .weak SUPC_Handler
SUPC_Handler:
  b .

  .thumb_func
  .weak RSTC_Handler
RSTC_Handler:
  b .

  .thumb_func
  .weak RTC_Handler
RTC_Handler:
  b .

  .thumb_func
  .weak RTT_Handler
RTT_Handler:
  b .

  .thumb_func
  .weak WDT_Handler
WDT_Handler:
  b .

  .thumb_func
  .weak PMC_Handler
PMC_Handler:
  b .

  .thumb_func
  .weak EFC_Handler
EFC_Handler:
  b .

  .thumb_func
  .weak UART0_Handler
UART0_Handler:
  b .

  .thumb_func
  .weak UART1_Handler
UART1_Handler:
  b .

  .thumb_func
  .weak PIOA_Handler
PIOA_Handler:
  b .

  .thumb_func
  .weak PIOB_Handler
PIOB_Handler:
  b .

  .thumb_func
  .weak PIOC_Handler
PIOC_Handler:
  b .

  .thumb_func
  .weak USART0_Handler
USART0_Handler:
  b .

  .thumb_func
  .weak USART1_Handler
USART1_Handler:
  b .

  .thumb_func
  .weak USART2_Handler
USART2_Handler:
  b .

  .thumb_func
  .weak PIOD_Handler
PIOD_Handler:
  b .

  .thumb_func
  .weak PIOE_Handler
PIOE_Handler:
  b .

  .thumb_func
  .weak HSMCI_Handler
HSMCI_Handler:
  b .

  .thumb_func
  .weak TWIHS0_Handler
TWIHS0_Handler:
  b .

  .thumb_func
  .weak TWIHS1_Handler
TWIHS1_Handler:
  b .

  .thumb_func
  .weak SPI0_Handler
SPI0_Handler:
  b .

  .thumb_func
  .weak SSC_Handler
SSC_Handler:
  b .

  .thumb_func
  .weak TC0_Handler
TC0_Handler:
  b .

  .thumb_func
  .weak TC1_Handler
TC1_Handler:
  b .

  .thumb_func
  .weak TC2_Handler
TC2_Handler:
  b .

  .thumb_func
  .weak TC3_Handler
TC3_Handler:
  b .

  .thumb_func
  .weak TC4_Handler
TC4_Handler:
  b .

  .thumb_func
  .weak TC5_Handler
TC5_Handler:
  b .

  .thumb_func
  .weak AFEC0_Handler
AFEC0_Handler:
  b .

  .thumb_func
  .weak DACC_Handler
DACC_Handler:
  b .

  .thumb_func
  .weak PWM0_Handler
PWM0_Handler:
  b .

  .thumb_func
  .weak ICM_Handler
ICM_Handler:
  b .

  .thumb_func
  .weak ACC_Handler
ACC_Handler:
  b .

  .thumb_func
  .weak USBHS_Handler
USBHS_Handler:
  b .

  .thumb_func
  .weak MCAN0_INT0_Handler
MCAN0_INT0_Handler:
  b .

  .thumb_func
  .weak MCAN0_INT1_Handler
MCAN0_INT1_Handler:
  b .

  .thumb_func
  .weak MCAN1_INT0_Handler
MCAN1_INT0_Handler:
  b .

  .thumb_func
  .weak MCAN1_INT1_Handler
MCAN1_INT1_Handler:
  b .

  .thumb_func
  .weak GMAC_Handler
GMAC_Handler:
  b .

  .thumb_func
  .weak AFEC1_Handler
AFEC1_Handler:
  b .

  .thumb_func
  .weak TWIHS2_Handler
TWIHS2_Handler:
  b .

  .thumb_func
  .weak SPI1_Handler
SPI1_Handler:
  b .

  .thumb_func
  .weak QSPI_Handler
QSPI_Handler:
  b .

  .thumb_func
  .weak UART2_Handler
UART2_Handler:
  b .

  .thumb_func
  .weak UART3_Handler
UART3_Handler:
  b .

  .thumb_func
  .weak UART4_Handler
UART4_Handler:
  b .

  .thumb_func
  .weak TC6_Handler
TC6_Handler:
  b .

  .thumb_func
  .weak TC7_Handler
TC7_Handler:
  b .

  .thumb_func
  .weak TC8_Handler
TC8_Handler:
  b .

  .thumb_func
  .weak TC9_Handler
TC9_Handler:
  b .

  .thumb_func
  .weak TC10_Handler
TC10_Handler:
  b .

  .thumb_func
  .weak TC11_Handler
TC11_Handler:
  b .

  .thumb_func
  .weak AES_Handler
AES_Handler:
  b .

  .thumb_func
  .weak TRNG_Handler
TRNG_Handler:
  b .

  .thumb_func
  .weak XDMAC_Handler
XDMAC_Handler:
  b .

  .thumb_func
  .weak ISI_Handler
ISI_Handler:
  b .

  .thumb_func
  .weak PWM1_Handler
PWM1_Handler:
  b .

  .thumb_func
  .weak FPU_Handler
FPU_Handler:
  b .

  .thumb_func
  .weak SDRAMC_Handler
SDRAMC_Handler:
  b .

  .thumb_func
  .weak RSWDT_Handler
RSWDT_Handler:
  b .

  .thumb_func
  .weak CCW_Handler
CCW_Handler:
  b .

  .thumb_func
  .weak CCF_Handler
CCF_Handler:
  b .

  .thumb_func
  .weak GMAC_Q1_Handler
GMAC_Q1_Handler:
  b .

  .thumb_func
  .weak GMAC_Q2_Handler
GMAC_Q2_Handler:
  b .

  .thumb_func
  .weak IXC_Handler
IXC_Handler:
  b .

  .thumb_func
  .weak I2SC0_Handler
I2SC0_Handler:
  b .

  .thumb_func
  .weak I2SC1_Handler
I2SC1_Handler:
  b .

  .thumb_func
  .weak GMAC_Q3_Handler
GMAC_Q3_Handler:
  b .

  .thumb_func
  .weak GMAC_Q4_Handler
GMAC_Q4_Handler:
  b .

  .thumb_func
  .weak GMAC_Q5_Handler
GMAC_Q5_Handler:
  b .

#endif

/*****************************************************************************
 * Vector Table                                                              *
 *****************************************************************************/

  .section .vectors, "ax"
  .align 2
  .global _vectors
  .extern __stack_end__
#ifdef STARTUP_FROM_RESET
  .extern Reset_Handler
#endif

_vectors:
  .word __stack_end__
#ifdef STARTUP_FROM_RESET
  .word Reset_Handler
#else
  .word Reset_Wait
#endif
  .word NMI_Handler
  .word HardFault_Handler
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word SVC_Handler
  .word 0 /* Reserved */
  .word 0 /* Reserved */
  .word PendSV_Handler
  .word SysTick_Handler
  .word SUPC_Handler
  .word RSTC_Handler
  .word RTC_Handler
  .word RTT_Handler
  .word WDT_Handler
  .word PMC_Handler
  .word EFC_Handler
  .word UART0_Handler
  .word UART1_Handler
  .word Dummy_Handler /* Reserved */
  .word PIOA_Handler
  .word PIOB_Handler
  .word PIOC_Handler
  .word USART0_Handler
  .word USART1_Handler
  .word USART2_Handler
  .word PIOD_Handler
  .word PIOE_Handler
  .word HSMCI_Handler
  .word TWIHS0_Handler
  .word TWIHS1_Handler
  .word SPI0_Handler
  .word SSC_Handler
  .word TC0_Handler
  .word TC1_Handler
  .word TC2_Handler
  .word TC3_Handler
  .word TC4_Handler
  .word TC5_Handler
  .word AFEC0_Handler
  .word DACC_Handler
  .word PWM0_Handler
  .word ICM_Handler
  .word ACC_Handler
  .word USBHS_Handler
  .word MCAN0_INT0_Handler
  .word MCAN0_INT1_Handler
  .word MCAN1_INT0_Handler
  .word MCAN1_INT1_Handler
  .word GMAC_Handler
  .word AFEC1_Handler
  .word TWIHS2_Handler
  .word SPI1_Handler
  .word QSPI_Handler
  .word UART2_Handler
  .word UART3_Handler
  .word UART4_Handler
  .word TC6_Handler
  .word TC7_Handler
  .word TC8_Handler
  .word TC9_Handler
  .word TC10_Handler
  .word TC11_Handler
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word Dummy_Handler /* Reserved */
  .word AES_Handler
  .word TRNG_Handler
  .word XDMAC_Handler
  .word ISI_Handler
  .word PWM1_Handler
  .word FPU_Handler
  .word SDRAMC_Handler
  .word RSWDT_Handler
  .word CCW_Handler
  .word CCF_Handler
  .word GMAC_Q1_Handler
  .word GMAC_Q2_Handler
  .word IXC_Handler
  .word I2SC0_Handler
  .word I2SC1_Handler
  .word GMAC_Q3_Handler
  .word GMAC_Q4_Handler
  .word GMAC_Q5_Handler
_vectors_end:

#ifdef VECTORS_IN_RAM
  .section .vectors_ram, "ax"
  .align 2
  .global _vectors_ram

_vectors_ram:
  .space _vectors_end - _vectors, 0
#endif
