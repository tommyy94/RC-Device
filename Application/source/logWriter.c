#include "logWriter.h"
#include "sdcard.h"
#include "osConfig.h"
#include "rtc.h"

#include "string.h"
#include "ff.h"
#include "stdlib.h"
#include "atmel_start.h"

#include "FreeRTOS.h"
#include "task.h"

#include <string.h>


#define MAX_LOG_LINE_LEN        (80u)

#define FATFS_DELAY_MOUNT        (0)
#define FATFS_FORCE_MOUNT        (1)


static TCHAR path[] = "SD1";
static FATFS fs;


static uint32_t createFileSystem(void);
static void logError(uint32_t id);


/*
 * Experimental function. Creating the file system takes up to 5-10 minutes.
 * Might have to look in to the ASF code.
 */
static uint32_t createFileSystem(void)
{
    FRESULT res;
    BYTE work[_MAX_SS]; /* Work area (larger is better for processing time) */
    
    res = f_mkfs("SD1", 0, sizeof(work));
    assert(res == FR_OK, __FILE__, __LINE__);
    
    return res == FR_OK;
}


static void logError(uint32_t id)
{
    UINT len;
    FRESULT res;
    FIL file;
    UINT bytesWritten;
    char msg[MAX_LOG_LINE_LEN];
    struct Calendar *calendar = NULL;

    __BKPT();

    /* Get timestamp - format 2012-09-26 00:16:47 */
    xTaskNotify(xCalendarTask, RTC_RETURN_TIME, eSetBits);
    if (xQueueReceive(xTsQ, calendar, pdMS_TO_TICKS(TS_QUEUE_TIMEOUT)) == pdPASS)
    {
        snprintf(msg,
                 strlen((const char *)msg),
                 "%d-%d-%d %d:%d:%d | Error: %lu\r\n",
                 calendar->date.year,
                 calendar->date.month,
                 calendar->date.day,
                 calendar->time.hour,
                 calendar->time.minutes,
                 calendar->time.seconds,
                 (unsigned long)id);
    }
    else
    {    
        snprintf(msg,
                 strlen((const char *)msg),
                 "No timestamp | Error: %lu\r\n",
                 (unsigned long)id);
    }
    
    /* Append to log file */
    res = f_open(&file, "error.log", FA_OPEN_ALWAYS | FA_WRITE);
    if (res == FR_DENIED)
    {
        /* Could be full, delete and try again */
        res = f_open(&file, "error.log", FA_CREATE_ALWAYS | FA_WRITE);        
    }
    assert(res == FR_OK, __FILE__, __LINE__);
    if (res == FR_OK)
    {
        len = strlen((const char *)msg);
        res = f_write(&file, msg, len, &bytesWritten);
        assert(bytesWritten == len , __FILE__, __LINE__);
        assert(res == FR_OK, __FILE__, __LINE__);
        f_close(&file);
    }
}


/* Wait for notification
 * - Record error
 * - Include timestamp
 */
void journalTask(void *arg)
{
    (void)arg;
    FRESULT res;
    uint32_t event;
    
    res = f_mount(&fs, path, FATFS_DELAY_MOUNT);
    assert(res == FR_OK, __FILE__, __LINE__);
    
    while (1)
    {
        event = ulTaskNotifyTake(pdFALSE, portMAX_DELAY);
        logError(event);
        __BKPT();
    }
}
