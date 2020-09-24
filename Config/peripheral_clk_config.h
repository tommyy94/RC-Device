/* Auto-generated config file peripheral_clk_config.h */
#ifndef PERIPHERAL_CLK_CONFIG_H
#define PERIPHERAL_CLK_CONFIG_H

// <<< Use Configuration Wizard in Context Menu >>>

// <h> HSMCI Clock Settings
// <y> HSMCI Clock source
// <CONF_SRC_MCK"> Master Clock (MCK)
// <i> This defines the clock source for the HSMCI
// <id> hsmci_clock_source
#ifndef CONF_HSMCI_SRC
#define CONF_HSMCI_SRC CONF_SRC_MCK
#endif
// </h>

/**
 * \def HSMCI FREQUENCY
 * \brief HSMCI's Clock frequency
 */
#ifndef CONF_HSMCI_FREQUENCY
#define CONF_HSMCI_FREQUENCY 150000000
#endif

/**
 * \def CONF_HCLK_FREQUENCY
 * \brief HCLK's Clock frequency
 */
#ifndef CONF_HCLK_FREQUENCY
#define CONF_HCLK_FREQUENCY 300000000
#endif

/**
 * \def CONF_FCLK_FREQUENCY
 * \brief FCLK's Clock frequency
 */
#ifndef CONF_FCLK_FREQUENCY
#define CONF_FCLK_FREQUENCY 300000000
#endif

/**
 * \def CONF_CPU_FREQUENCY
 * \brief CPU's Clock frequency
 */
#ifndef CONF_CPU_FREQUENCY
#define CONF_CPU_FREQUENCY 300000000
#endif

/**
 * \def CONF_SLCK_FREQUENCY
 * \brief Slow Clock frequency
 */
#define CONF_SLCK_FREQUENCY 32000

/**
 * \def CONF_MCK_FREQUENCY
 * \brief Master Clock frequency
 */
#define CONF_MCK_FREQUENCY 150000000

/**
 * \def CONF_PCK6_FREQUENCY
 * \brief Programmable Clock Controller 6 frequency
 */
#define CONF_PCK6_FREQUENCY 12000000

// <o> RTC Clock source
// <0=> SLCK for Peripheral
// <i> This defines the clock source for the RTC
// <id> rtc_clock_source
#ifndef CONF_RTC_SRC
#define CONF_RTC_SRC 0
#endif

/**
 * \def CONF_CLK_RTC_FREQUENCY
 * \brief RTC's Clock frequency
 */
#ifndef CONF_CLK_RTC_FREQUENCY
#define CONF_CLK_RTC_FREQUENCY 32000
#endif

// <<< end of configuration section >>>

#endif // PERIPHERAL_CLK_CONFIG_H
