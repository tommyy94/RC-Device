#include <atmel_start.h>
#include "sdcard.h"
#include "SEGGER_RTT.h"
#include "sd_mmc.h"
#include "sd_mmc_protocol.h"
#include <string.h>


/* Offset before the end of memory card to start the test */
#define TEST_MEM_START_OFFSET (1024lu * 1024lu * 4lu)

/* Memory area size dedicated for the read/write test */
#define TEST_MEM_AREA_SIZE (1024lu * 1024lu * 1lu)

/**
 * Size of each read or write access.
 * Increasing this number can get higher R/W performance.
 */
#define TEST_MEM_ACCESS_SIZE (8lu * SD_MMC_BLOCK_SIZE)

#if TEST_MEM_START_OFFSET < TEST_MEM_AREA_SIZE
#error TEST_MEM_START_OFFSET must be higher than TEST_MEM_AREA_SIZE
#endif
#if TEST_MEM_ACCESS_SIZE > TEST_MEM_AREA_SIZE
#error TEST_MEM_AREA_SIZE must be higher than TEST_MEM_ACCESS_SIZE
#endif

/* The value used to generate test data */
#define TEST_FILL_VALUE_U32 (0x5500AAFFU)

/* Read and write test length of CIA in bytes */
#define TEST_CIA_SIZE (0x16)

/* Buffer used by read/write tests */
COMPILER_ALIGNED(4)
static uint8_t buf_test[TEST_MEM_ACCESS_SIZE];

COMPILER_ALIGNED(4)
/* Buffer for test SDIO data */
static uint8_t buf_cia[TEST_CIA_SIZE];




static void sdcard_dump_buffer(uint8_t *data_buffer, uint32_t length);
static void sdcard_test_memory(uint8_t slot);
static void sdcard_test_sdio(uint8_t slot);
static void sdcard_display_info_card(uint8_t slot);



void SDCard_Test(void)
{
    sd_mmc_err_t err;
    
    SEGGER_RTT_WriteString(0, "Please plug an SD, MMC or SDIO card in slot.\r\n");
    
    /* Wait for a card and ready */
    do {
        err = sd_mmc_check(0);
    } while (SD_MMC_OK != err);
    
    sdcard_display_info_card(0);
    
    /* Test the card */
    if (sd_mmc_get_type(0) & CARD_TYPE_SDIO) {
        /* Test CIA of SDIO card */
        sdcard_test_sdio(0);
    }
    
    if (sd_mmc_get_type(0) & (CARD_TYPE_SD | CARD_TYPE_MMC)) {
        /* SD/MMC Card R/W */
        sdcard_test_memory(0);
    }
}


/**
 * \brief Display basic information of the card.
 * \note This function should be called only after the card has been
 *       initialized successfully.
 *
 * \param slot   SD/MMC slot to test
 */
static void sdcard_display_info_card(uint8_t slot)
{
    SEGGER_RTT_printf(0, "Card information:\r\n");

    SEGGER_RTT_printf(0, "    ");
    switch (sd_mmc_get_type(slot)) {
    case CARD_TYPE_SD | CARD_TYPE_HC:
        SEGGER_RTT_printf(0, "SDHC");
        break;
    case CARD_TYPE_SD:
        SEGGER_RTT_printf(0, "SD");
        break;
    case CARD_TYPE_MMC | CARD_TYPE_HC:
        SEGGER_RTT_printf(0, "MMC High Density");
        break;
    case CARD_TYPE_MMC:
        SEGGER_RTT_printf(0, "MMC");
        break;
    case CARD_TYPE_SDIO:
        SEGGER_RTT_printf(0, "SDIO\r\n");
        return;
    case CARD_TYPE_SD_COMBO:
        SEGGER_RTT_printf(0, "SD COMBO");
        break;
    case CARD_TYPE_UNKNOWN:
    default:
        SEGGER_RTT_printf(0, "Unknow\r\n");
        return;
    }
    SEGGER_RTT_printf(0, "\r\n    %d MB\r\n", (uint16_t)(sd_mmc_get_capacity(slot) / 1024));
}


/**
 * \brief Dump and print buffer.
 *
 * \param data_buffer Pointer to data buffer.
 * \param length      Buffer length.
 */
static void sdcard_dump_buffer(uint8_t *data_buffer, uint32_t length)
{
    uint32_t i;

    SEGGER_RTT_printf(0, "Dump buffer (length=%d):", (int)length);
    for (i = 0; i < length; i++) {
        if ((i % 16) == 0) { /* Display 16 data per line */
            SEGGER_RTT_printf(0, "\r\n%3x:", (int)i);
        }

        SEGGER_RTT_printf(0, " %02x", data_buffer[i]);
    }
    SEGGER_RTT_printf(0, "\r\n");
}
/**
 * \brief Card R/W tests
 *
 * \param slot   SD/MMC slot to test
 */
static void sdcard_test_memory(uint8_t slot)
{
    uint32_t last_blocks_addr, i, nb_trans;

    /* Compute the last address */
    last_blocks_addr = sd_mmc_get_capacity(slot) * (1024 / SD_MMC_BLOCK_SIZE);
    if (last_blocks_addr < (TEST_MEM_START_OFFSET / 512lu)) {
        SEGGER_RTT_printf(0, "[Memory is too small.]\r\n");
        return;
    }
    last_blocks_addr -= (TEST_MEM_START_OFFSET / SD_MMC_BLOCK_SIZE);

    SEGGER_RTT_printf(0, "Card R/W test:\r\n");

    /* Read the last block */
    SEGGER_RTT_printf(0, "    Read... ");
    if (SD_MMC_OK != sd_mmc_init_read_blocks(slot, last_blocks_addr, TEST_MEM_AREA_SIZE / SD_MMC_BLOCK_SIZE)) {
        SEGGER_RTT_printf(0, "[FAIL]\r\n");
        return;
    }
    for (nb_trans = 0; nb_trans < (TEST_MEM_AREA_SIZE / TEST_MEM_ACCESS_SIZE); nb_trans++) {
        if (SD_MMC_OK != sd_mmc_start_read_blocks(buf_test, TEST_MEM_ACCESS_SIZE / SD_MMC_BLOCK_SIZE)) {
            SEGGER_RTT_printf(0, "[FAIL]\r\n");
            return;
        }
        if (SD_MMC_OK != sd_mmc_wait_end_of_read_blocks(false)) {
            SEGGER_RTT_printf(0, "[FAIL]\r\n");
            return;
        }
    }
    SEGGER_RTT_printf(0, "[OK]\r\n");

    /* Fill buffer with a pattern */
    for (i = 0; i < (TEST_MEM_ACCESS_SIZE / sizeof(uint32_t)); i++) {
        ((uint32_t *)buf_test)[i] = TEST_FILL_VALUE_U32;
    }

    SEGGER_RTT_printf(0, "    Write pattern... ");
    if (SD_MMC_OK != sd_mmc_init_write_blocks(slot, last_blocks_addr, TEST_MEM_AREA_SIZE / SD_MMC_BLOCK_SIZE)) {
        SEGGER_RTT_printf(0, "[FAIL]\r\n");
        return;
    }

    for (nb_trans = 0; nb_trans < (TEST_MEM_AREA_SIZE / TEST_MEM_ACCESS_SIZE); nb_trans++) {
        ((uint32_t *)buf_test)[0] = nb_trans;
        if (SD_MMC_OK != sd_mmc_start_write_blocks(buf_test, TEST_MEM_ACCESS_SIZE / SD_MMC_BLOCK_SIZE)) {
            SEGGER_RTT_printf(0, "[FAIL]\r\n");
            return;
        }
        if (SD_MMC_OK != sd_mmc_wait_end_of_write_blocks(false)) {
            SEGGER_RTT_printf(0, "[FAIL]\r\n");
            return;
        }
    }
    SEGGER_RTT_printf(0, "[OK]\r\n");

    SEGGER_RTT_printf(0, "    Read and check pattern... ");
    if (SD_MMC_OK != sd_mmc_init_read_blocks(slot, last_blocks_addr, TEST_MEM_AREA_SIZE / SD_MMC_BLOCK_SIZE)) {
        SEGGER_RTT_printf(0, "Read [FAIL]\r\n");
        return;
    }
    for (nb_trans = 0; nb_trans < (TEST_MEM_AREA_SIZE / TEST_MEM_ACCESS_SIZE); nb_trans++) {
        for (i = 0; i < (TEST_MEM_ACCESS_SIZE / sizeof(uint32_t)); i++) {
            ((uint32_t *)buf_test)[i] = 0xFFFFFFFF;
        }
        if (SD_MMC_OK != sd_mmc_start_read_blocks(buf_test, TEST_MEM_ACCESS_SIZE / SD_MMC_BLOCK_SIZE)) {
            SEGGER_RTT_printf(0, "Read [FAIL]\r\n");
            return;
        }
        if (SD_MMC_OK != sd_mmc_wait_end_of_read_blocks(false)) {
            SEGGER_RTT_printf(0, "Read [FAIL]\r\n");
            return;
        }
        if (((uint32_t *)buf_test)[0] != nb_trans) {
            SEGGER_RTT_printf(0, "Check [FAIL]\r\n");
            return;
        }
        for (i = 1; i < (TEST_MEM_ACCESS_SIZE / sizeof(uint32_t)); i++) {
            if (((uint32_t *)buf_test)[i] != TEST_FILL_VALUE_U32) {
                SEGGER_RTT_printf(0, "Check [FAIL]\r\n");
                return;
            }
        }
    }
    SEGGER_RTT_printf(0, "[OK]\r\n");
}

/**
 * \brief Perform test on CIA (Common I/O Area) of SDIO card.
 *
 * \note The Common I/O Area (CIA) shall be implemented on all SDIO cards.
 *
 * \param slot   SD/MMC slot to test
 */
static void sdcard_test_sdio(uint8_t slot)
{
    uint32_t i;
    uint32_t err;

    /*
     * Test with direct read and write command.
     */
    SEGGER_RTT_printf(0, "\r\n--- Test with direct read and write command of CIA:\r\n");
    /* Read */
    for (i = 0; i < TEST_CIA_SIZE; i++) {
        err = sdio_read_direct(slot, SDIO_CIA, i, &buf_cia[i]);
        if (err) {
            SEGGER_RTT_printf(0, "Error: SDIO direct read failed.\r\n");
            return;
        }
    }
    sdcard_dump_buffer(buf_cia, TEST_CIA_SIZE);

    /* Write */
    SEGGER_RTT_printf(0, "Write 0x02 to IEN(CIA.4).\r\n");
    err = sdio_write_direct(slot, SDIO_CIA, SDIO_CCCR_IEN, 0x02);
    if (err) {
        SEGGER_RTT_printf(0, "Error: SDIO direct write failed.\r\n");
        return;
    }

    /* Check */
    SEGGER_RTT_printf(0, "Check IEN after write:");
    err = sdio_read_direct(slot, SDIO_CIA, SDIO_CCCR_IEN, &buf_cia[SDIO_CCCR_IEN]);
    if (err) {
        SEGGER_RTT_printf(0, "Error: SDIO direct read failed.\r\n");
        return;
    }

    SEGGER_RTT_printf(0, "0x%02x\r\n", buf_cia[SDIO_CCCR_IEN]);
    if (0x02 == buf_cia[SDIO_CCCR_IEN]) {
        SEGGER_RTT_printf(0, "Test OK.\r\n");
    } else {
        SEGGER_RTT_printf(0, "Test failed.\r\n");
    }

    /* Restore data to 0 */
    sdio_write_direct(slot, SDIO_CIA, SDIO_CCCR_IEN, 0);

    /* Clear the buffer. */
    memset(buf_cia, 0x0, sizeof(buf_cia));

    SEGGER_RTT_printf(0, "\r\n--- Test with extended read and write command of CIA:\r\n");
    /* Read */
    err = sdio_read_extended(slot, SDIO_CIA, 0, 1, &buf_cia[0], TEST_CIA_SIZE);
    if (err) {
        SEGGER_RTT_printf(0, "Error: SDIO extended read failed.\r\n");
        return;
    }

    sdcard_dump_buffer(buf_cia, TEST_CIA_SIZE);

    /* Write */
    SEGGER_RTT_printf(0, "Modify Some R/W bytes for FN0 and write:\r\n");
    buf_cia[SDIO_CCCR_IEN] = 0x3;
    err                    = sdio_write_extended(slot, SDIO_CIA, SDIO_CCCR_IEN, 1, &buf_cia[SDIO_CCCR_IEN], 1);
    if (err) {
        SEGGER_RTT_printf(0, "Error: SDIO extended write failed.\r\n");
        return;
    }

    /* Read and check */
    SEGGER_RTT_printf(0, "Check CIA after write:\r\n");
    err = sdio_read_extended(slot, SDIO_CIA, 0, 1, &buf_cia[0], TEST_CIA_SIZE);
    if (err) {
        SEGGER_RTT_printf(0, "Error: SDIO extended read failed.\r\n");
        return;
    }

    sdcard_dump_buffer(buf_cia, TEST_CIA_SIZE);

    if (buf_cia[SDIO_CCCR_IEN] != 0x3) {
        SEGGER_RTT_printf(0, "CIA.4 Fail\r\n");
    } else {
        SEGGER_RTT_printf(0, "Test OK\r\n");
    }

    /* Restore data to 0 */
    sdio_write_direct(slot, SDIO_CIA, SDIO_CCCR_IEN, 0);

    return;
}