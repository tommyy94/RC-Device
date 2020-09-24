/*****************************************************************************
 * Copyright (c) 2015 Rowley Associates Limited.                             *
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
 * NO_TCM_CONFIG                                                             *
 *                                                                           *
 *   If defined, TCM will not be configured.                                 *
 *                                                                           *
 * NO_USER_RESET                                                             *
 *                                                                           *
 *   If defined, user resets are not enabled.                                *
 *                                                                           *
 * NO_WATCHDOG_DISABLE                                                       *
 *                                                                           *
 *   If defined, watchdog is not disabled.                                   *
 *                                                                           *
 *****************************************************************************/

#include <sam.h>

void DeviceInit(void)
{
#ifndef NO_WATCHDOG_DISABLE
  /* Disable Watchdog */
  REG_WDT_MR = WDT_MR_WDDIS;
#endif

#ifndef NO_USER_RESET
  /* Enable user reset */
  REG_RSTC_MR = RSTC_MR_KEY_PASSWD | RSTC_MR_URSTEN;
#endif

#ifndef NO_TCM_CONFIG
  #if !defined(__TCM_CONFIG__)
    #define __TCM_CONFIG__ 0
  #endif
  /* Configure TCM GPNVM bits */
  EFC->EEFC_FCR = (EEFC_FCR_FKEY_PASSWD | (__TCM_CONFIG__ & 1 ? EEFC_FCR_FCMD_SGPB : EEFC_FCR_FCMD_CGPB) | EEFC_FCR_FARG(7));
  EFC->EEFC_FCR = (EEFC_FCR_FKEY_PASSWD | (__TCM_CONFIG__ & 2 ? EEFC_FCR_FCMD_SGPB : EEFC_FCR_FCMD_CGPB) | EEFC_FCR_FARG(8));
#if __TCM_CONFIG__ == 0
  /* Disable TCM */
  __DSB();
  __ISB();
  SCB->ITCMCR &= ~(uint32_t)SCB_ITCMCR_EN_Msk;
  SCB->DTCMCR &= ~(uint32_t)SCB_ITCMCR_EN_Msk;
  __DSB();
  __ISB();
#else
  /* Enable TCM */
  __DSB();
  __ISB();
  SCB->ITCMCR = SCB_ITCMCR_EN_Msk | SCB_ITCMCR_RMW_Msk | SCB_ITCMCR_RETEN_Msk;
  SCB->DTCMCR = SCB_DTCMCR_EN_Msk | SCB_DTCMCR_RMW_Msk | SCB_DTCMCR_RETEN_Msk;
  __DSB();
  __ISB();
#endif
#endif
}


