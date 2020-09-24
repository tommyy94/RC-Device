/*
 * Code generated from Atmel Start.
 *
 * This file will be overwritten when reconfiguring your Atmel Start project.
 * Please copy examples or other code you want to keep to a separate file
 * to avoid losing it when reconfiguring.
 */

#include "driver_init.h"
#include <hal_init.h>
#include <hpl_pmc.h>
#include <peripheral_clk_config.h>
#include <utils.h>

struct mci_sync_desc MCI_0;

void MCI_0_PORT_init(void)
{

    gpio_set_pin_direction(PA28,
                           // <y> Pin direction
                           // <id> pad_direction
                           // <GPIO_DIRECTION_OFF"> Off
                           // <GPIO_DIRECTION_IN"> In
                           // <GPIO_DIRECTION_OUT"> Out
                           GPIO_DIRECTION_OUT);

    gpio_set_pin_level(PA28,
                       // <y> Initial level
                       // <id> pad_initial_level
                       // <false"> Low
                       // <true"> High
                       false);

    gpio_set_pin_pull_mode(PA28,
                           // <y> Pull configuration
                           // <id> pad_pull_config
                           // <GPIO_PULL_OFF"> Off
                           // <GPIO_PULL_UP"> Pull-up
                           // <GPIO_PULL_DOWN"> Pull-down
                           GPIO_PULL_OFF);

    gpio_set_pin_function(PA28,
                          // <y> Pin function
                          // <id> pad_function
                          // <i> Auto : use driver pinmux if signal is imported by driver, else turn off function
                          // <MUX_PA28C_HSMCI_MCCDA"> Auto
                          // <GPIO_PIN_FUNCTION_OFF"> Off
                          // <GPIO_PIN_FUNCTION_A"> A
                          // <GPIO_PIN_FUNCTION_B"> B
                          // <GPIO_PIN_FUNCTION_C"> C
                          // <GPIO_PIN_FUNCTION_D"> D
                          MUX_PA28C_HSMCI_MCCDA);

    gpio_set_pin_direction(PA25,
                           // <y> Pin direction
                           // <id> pad_direction
                           // <GPIO_DIRECTION_OFF"> Off
                           // <GPIO_DIRECTION_IN"> In
                           // <GPIO_DIRECTION_OUT"> Out
                           GPIO_DIRECTION_OUT);

    gpio_set_pin_level(PA25,
                       // <y> Initial level
                       // <id> pad_initial_level
                       // <false"> Low
                       // <true"> High
                       false);

    gpio_set_pin_pull_mode(PA25,
                           // <y> Pull configuration
                           // <id> pad_pull_config
                           // <GPIO_PULL_OFF"> Off
                           // <GPIO_PULL_UP"> Pull-up
                           // <GPIO_PULL_DOWN"> Pull-down
                           GPIO_PULL_OFF);

    gpio_set_pin_function(PA25,
                          // <y> Pin function
                          // <id> pad_function
                          // <i> Auto : use driver pinmux if signal is imported by driver, else turn off function
                          // <MUX_PA25D_HSMCI_MCCK"> Auto
                          // <GPIO_PIN_FUNCTION_OFF"> Off
                          // <GPIO_PIN_FUNCTION_A"> A
                          // <GPIO_PIN_FUNCTION_B"> B
                          // <GPIO_PIN_FUNCTION_C"> C
                          // <GPIO_PIN_FUNCTION_D"> D
                          MUX_PA25D_HSMCI_MCCK);

    gpio_set_pin_direction(PA30,
                           // <y> Pin direction
                           // <id> pad_direction
                           // <GPIO_DIRECTION_OFF"> Off
                           // <GPIO_DIRECTION_IN"> In
                           // <GPIO_DIRECTION_OUT"> Out
                           GPIO_DIRECTION_OUT);

    gpio_set_pin_level(PA30,
                       // <y> Initial level
                       // <id> pad_initial_level
                       // <false"> Low
                       // <true"> High
                       false);

    gpio_set_pin_pull_mode(PA30,
                           // <y> Pull configuration
                           // <id> pad_pull_config
                           // <GPIO_PULL_OFF"> Off
                           // <GPIO_PULL_UP"> Pull-up
                           // <GPIO_PULL_DOWN"> Pull-down
                           GPIO_PULL_OFF);

    gpio_set_pin_function(PA30,
                          // <y> Pin function
                          // <id> pad_function
                          // <i> Auto : use driver pinmux if signal is imported by driver, else turn off function
                          // <MUX_PA30C_HSMCI_MCDA0"> Auto
                          // <GPIO_PIN_FUNCTION_OFF"> Off
                          // <GPIO_PIN_FUNCTION_A"> A
                          // <GPIO_PIN_FUNCTION_B"> B
                          // <GPIO_PIN_FUNCTION_C"> C
                          // <GPIO_PIN_FUNCTION_D"> D
                          MUX_PA30C_HSMCI_MCDA0);

    gpio_set_pin_direction(PA31,
                           // <y> Pin direction
                           // <id> pad_direction
                           // <GPIO_DIRECTION_OFF"> Off
                           // <GPIO_DIRECTION_IN"> In
                           // <GPIO_DIRECTION_OUT"> Out
                           GPIO_DIRECTION_OUT);

    gpio_set_pin_level(PA31,
                       // <y> Initial level
                       // <id> pad_initial_level
                       // <false"> Low
                       // <true"> High
                       false);

    gpio_set_pin_pull_mode(PA31,
                           // <y> Pull configuration
                           // <id> pad_pull_config
                           // <GPIO_PULL_OFF"> Off
                           // <GPIO_PULL_UP"> Pull-up
                           // <GPIO_PULL_DOWN"> Pull-down
                           GPIO_PULL_OFF);

    gpio_set_pin_function(PA31,
                          // <y> Pin function
                          // <id> pad_function
                          // <i> Auto : use driver pinmux if signal is imported by driver, else turn off function
                          // <MUX_PA31C_HSMCI_MCDA1"> Auto
                          // <GPIO_PIN_FUNCTION_OFF"> Off
                          // <GPIO_PIN_FUNCTION_A"> A
                          // <GPIO_PIN_FUNCTION_B"> B
                          // <GPIO_PIN_FUNCTION_C"> C
                          // <GPIO_PIN_FUNCTION_D"> D
                          MUX_PA31C_HSMCI_MCDA1);

    gpio_set_pin_direction(PA26,
                           // <y> Pin direction
                           // <id> pad_direction
                           // <GPIO_DIRECTION_OFF"> Off
                           // <GPIO_DIRECTION_IN"> In
                           // <GPIO_DIRECTION_OUT"> Out
                           GPIO_DIRECTION_OUT);

    gpio_set_pin_level(PA26,
                       // <y> Initial level
                       // <id> pad_initial_level
                       // <false"> Low
                       // <true"> High
                       false);

    gpio_set_pin_pull_mode(PA26,
                           // <y> Pull configuration
                           // <id> pad_pull_config
                           // <GPIO_PULL_OFF"> Off
                           // <GPIO_PULL_UP"> Pull-up
                           // <GPIO_PULL_DOWN"> Pull-down
                           GPIO_PULL_OFF);

    gpio_set_pin_function(PA26,
                          // <y> Pin function
                          // <id> pad_function
                          // <i> Auto : use driver pinmux if signal is imported by driver, else turn off function
                          // <MUX_PA26C_HSMCI_MCDA2"> Auto
                          // <GPIO_PIN_FUNCTION_OFF"> Off
                          // <GPIO_PIN_FUNCTION_A"> A
                          // <GPIO_PIN_FUNCTION_B"> B
                          // <GPIO_PIN_FUNCTION_C"> C
                          // <GPIO_PIN_FUNCTION_D"> D
                          MUX_PA26C_HSMCI_MCDA2);

    gpio_set_pin_direction(PA27,
                           // <y> Pin direction
                           // <id> pad_direction
                           // <GPIO_DIRECTION_OFF"> Off
                           // <GPIO_DIRECTION_IN"> In
                           // <GPIO_DIRECTION_OUT"> Out
                           GPIO_DIRECTION_OUT);

    gpio_set_pin_level(PA27,
                       // <y> Initial level
                       // <id> pad_initial_level
                       // <false"> Low
                       // <true"> High
                       false);

    gpio_set_pin_pull_mode(PA27,
                           // <y> Pull configuration
                           // <id> pad_pull_config
                           // <GPIO_PULL_OFF"> Off
                           // <GPIO_PULL_UP"> Pull-up
                           // <GPIO_PULL_DOWN"> Pull-down
                           GPIO_PULL_OFF);

    gpio_set_pin_function(PA27,
                          // <y> Pin function
                          // <id> pad_function
                          // <i> Auto : use driver pinmux if signal is imported by driver, else turn off function
                          // <MUX_PA27C_HSMCI_MCDA3"> Auto
                          // <GPIO_PIN_FUNCTION_OFF"> Off
                          // <GPIO_PIN_FUNCTION_A"> A
                          // <GPIO_PIN_FUNCTION_B"> B
                          // <GPIO_PIN_FUNCTION_C"> C
                          // <GPIO_PIN_FUNCTION_D"> D
                          MUX_PA27C_HSMCI_MCDA3);
}

void MCI_0_CLOCK_init(void)
{
    _pmc_enable_periph_clock(ID_HSMCI);
}

void MCI_0_init(void)
{
    MCI_0_CLOCK_init();
    mci_sync_init(&MCI_0, HSMCI);
    MCI_0_PORT_init();
}

void system_init(void)
{
    init_mcu();

    /* Disable Watchdog */
    hri_wdt_set_MR_WDDIS_bit(WDT);

    MCI_0_init();
}
