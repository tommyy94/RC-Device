#include <same70q21b.h>
#include <FreeRTOS.h>
#include <task.h>
#include <utils_assert.h>

#include "osConfig.h"
#include "rtc.h"
#include "ff.h"


/* RTC must be read 2-3 times to ensure that two consecutive reads match */
#define STABLE_READ_COUNT   (3u)

#define BCD_SHIFT           (4u)
#define BCD_MASK            (0xFu)
#define BCD_FACTOR          (10)


enum
{
    MONDAY = 1,
    TUESDAY,
    WEDNESDAY,
    THURSDAY,
    FRIDAY,
    SATURDAY,
    SUNDAY
};


enum
{
    CAL_SECOND,
    CAL_MINUTE,
    CAL_HOUR,
    CAL_DAY,
    CAL_WDAY,
    CAL_MONTH,
    CAL_YEAR,
    CAL_CENTURY
};


extern QueueHandle_t xTsQ;


void RTC_Init(void);
static uint32_t dec2Bcd(uint32_t value, uint32_t mask);
static uint32_t bcd2Dec(uint32_t value, uint32_t mask);
static bool RTC_SetTime(Calendar *calendar);
static bool RTC_GetTime(Calendar *calendar);


/* PPM and clock correction should be done here.
 * Reset any correction values and select the Gregorian calendar
 * with 24-hour mode.
 */
void RTC_Init(void)
{
    Rtc *rtc = RTC;
    rtc->RTC_MR = 0;

    /* Enable second periodic interrupt */
    rtc->RTC_IDR = RTC_IDR_TDERRDIS_Msk | RTC_IDR_CALDIS_Msk
                 | RTC_IDR_TIMDIS_Msk | RTC_IDR_ALRDIS_Msk | RTC_IDR_ACKDIS_Msk;
    rtc->RTC_IER = RTC_IER_SECEN_Msk;

    NVIC_ClearPendingIRQ(RTC_IRQn);
    NVIC_SetPriority(RTC_IRQn, RTC_IRQ_PRIO);
    NVIC_EnableIRQ(RTC_IRQn);

    /* Start RTC */
    rtc->RTC_CR &= ~(RTC_CR_UPDCAL_Msk | RTC_CR_UPDTIM_Msk);
}


/* Send second period signal to CalendarTask. */
void RTC_Handler(void)
{
    Rtc *rtc = RTC;
    BaseType_t xTaskWoken = pdFALSE;
    uint32_t status;

    //SEGGER_SYSVIEW_RecordEnterISR();

    /* Read status register */
    status = rtc->RTC_SR;

    /* Process IRQ */
    if ((status & RTC_SR_SEC_SECEVENT) != 0)
    {
        xTaskNotifyFromISR(xCalendarTask, RTC_SEC_PERIOD, eSetBits, &xTaskWoken);
    }

    /* Clear all status flags */
    rtc->RTC_SCCR = status;

    /* Do context switch if needed */
    portEND_SWITCHING_ISR(xTaskWoken);

    if (xTaskWoken != pdFALSE)
    {
        //SEGGER_SYSVIEW_RecordExitISRToScheduler();
        portYIELD();
    }
    else
    {
        //SEGGER_SYSVIEW_RecordExitISR();
    }
}


/* Convert decimal calendar value to BCD. Resulting BCD is shifted to correct
 * RTC register bit field.
 */
static uint32_t dec2Bcd(uint32_t value, uint32_t mask)
{
    uint32_t bcd;

    switch(mask)
    {
        case CAL_CENTURY:
            bcd = ((value / BCD_FACTOR / BCD_FACTOR / BCD_FACTOR)  << (RTC_CALR_CENT_Pos + BCD_SHIFT)
                | ((value / BCD_FACTOR / BCD_FACTOR) % BCD_FACTOR) << RTC_CALR_CENT_Pos);
            break;
        case CAL_YEAR:
            bcd = (((value / BCD_FACTOR) % BCD_FACTOR) << (RTC_CALR_YEAR_Pos + BCD_SHIFT))
                |  ((value % BCD_FACTOR) << RTC_CALR_YEAR_Pos);
            break;
        case CAL_MONTH:
            bcd = ((value / BCD_FACTOR) << (RTC_CALR_MONTH_Pos + BCD_SHIFT))
                | ((value % BCD_FACTOR) <<  RTC_CALR_MONTH_Pos);
            break;
        case CAL_DAY:
            bcd = ((value / BCD_FACTOR) << (RTC_CALR_DATE_Pos + BCD_SHIFT))
                | ((value % BCD_FACTOR) <<  RTC_CALR_DATE_Pos);
            break;
        case CAL_WDAY:
            bcd = ((value / BCD_FACTOR) << (RTC_CALR_DAY_Pos + BCD_SHIFT))
                | ((value % BCD_FACTOR) <<  RTC_CALR_DAY_Pos);
            break;
        case CAL_HOUR:
            bcd = ((value / BCD_FACTOR) << (RTC_TIMR_HOUR_Pos + BCD_SHIFT))
                | ((value % BCD_FACTOR) <<  RTC_TIMR_HOUR_Pos);
            break;
        case CAL_MINUTE:
            bcd = ((value / BCD_FACTOR) << (RTC_TIMR_MIN_Pos + BCD_SHIFT))
                | ((value % BCD_FACTOR) <<  RTC_TIMR_MIN_Pos);
            break;
        case CAL_SECOND:
            bcd = ((value / BCD_FACTOR) << (RTC_TIMR_SEC_Pos + BCD_SHIFT))
                | ((value % BCD_FACTOR) <<  RTC_TIMR_SEC_Pos);
            break;
        default:
            bcd = 0;
            break;
    }

    return bcd;
}


/* Convert BCD calendar value to decimal. */
static uint32_t bcd2Dec(uint32_t value, uint32_t mask)
{
    uint32_t dec;
    uint32_t tmp;

    switch(mask)
    {
        case CAL_CENTURY:
            tmp = (value & RTC_CALR_CENT_Msk) >> RTC_CALR_CENT_Pos;
            dec = (tmp >> BCD_SHIFT) * BCD_FACTOR + (tmp & BCD_MASK);
            break;
        case CAL_YEAR:
            tmp = (value & RTC_CALR_CENT_Msk) >> RTC_CALR_CENT_Pos;
            dec = (tmp >> BCD_SHIFT) * BCD_FACTOR + (tmp & BCD_MASK);
            tmp = (value & RTC_CALR_YEAR_Msk) >> RTC_CALR_YEAR_Pos;
            dec = (dec * BCD_FACTOR * BCD_FACTOR) + (tmp >> BCD_SHIFT) * BCD_FACTOR + (tmp & BCD_MASK);
            break;
        case CAL_MONTH:
            tmp = (value & RTC_CALR_MONTH_Msk) >> RTC_CALR_MONTH_Pos;
            dec = (tmp >> BCD_SHIFT) * BCD_FACTOR + (tmp & BCD_MASK);
            break;
        case CAL_DAY:
            tmp = (value & RTC_CALR_DATE_Msk) >> RTC_CALR_DATE_Pos;
            dec = (tmp >> BCD_SHIFT) * BCD_FACTOR + (tmp & BCD_MASK);
            break;
        case CAL_WDAY:
            tmp = (value & RTC_CALR_DAY_Msk) >> RTC_CALR_DAY_Pos;
            dec = (tmp >> BCD_SHIFT) * BCD_FACTOR + (tmp & BCD_MASK);
            break;
        case CAL_HOUR:
            tmp = (value & RTC_TIMR_HOUR_Msk) >> RTC_TIMR_HOUR_Pos;
            dec = (tmp >> BCD_SHIFT) * BCD_FACTOR + (tmp & BCD_MASK);
            break;
        case CAL_MINUTE:
            tmp = (value & RTC_TIMR_MIN_Msk) >> RTC_TIMR_MIN_Pos;
            dec = (tmp >> BCD_SHIFT) * BCD_FACTOR + (tmp & BCD_MASK);
            break;
        case CAL_SECOND:
            tmp = (value & RTC_TIMR_SEC_Msk) >> RTC_TIMR_SEC_Pos;
            dec = (tmp >> BCD_SHIFT) * BCD_FACTOR + (tmp & BCD_MASK);
            break;
        default:
            dec = 0;
            break;
    }

    return dec;
}


/* This operation must be atomic if the scheduler is running */
static bool RTC_SetTime(Calendar *calendar)
{
    uint32_t bcdTime;
    uint32_t bcdDate;
    Rtc *rtc = RTC;
    bool status = true;
    
    /* Prepare time/calendar values */
    bcdDate = dec2Bcd(calendar->date.year,    CAL_YEAR)
            | dec2Bcd(calendar->date.month,   CAL_MONTH)
            | dec2Bcd(calendar->date.day,     CAL_DAY)
            | dec2Bcd(calendar->date.weekDay, CAL_WDAY);

    bcdTime = dec2Bcd(calendar->time.hour,    CAL_HOUR)
            | dec2Bcd(calendar->time.minutes, CAL_MINUTE)
            | dec2Bcd(calendar->time.seconds, CAL_SECOND);

    /* Wait for periodic event */
    while ((rtc->RTC_SR & RTC_SR_SEC_SECEVENT) == RTC_SR_SEC_NO_SECEVENT)
    {
        ;
    }

    taskENTER_CRITICAL();
    
    /* Stop RTC */
    rtc->RTC_CR = RTC_CR_UPDCAL_Msk | RTC_CR_UPDTIM_Msk;
    
    /* Wait until command acknowledged */
    while ((rtc->RTC_SR & RTC_SR_ACKUPD_Msk) == RTC_SR_ACKUPD_FREERUN)
    {
        ;
    }
    rtc->RTC_SCCR = RTC_SCCR_ACKCLR_Msk;
    
    /* Update time/calendar values */
    rtc->RTC_CALR = bcdDate;
    rtc->RTC_TIMR = bcdTime;
    
    /* Start RTC */
    rtc->RTC_CR &= ~(RTC_CR_UPDCAL_Msk | RTC_CR_UPDTIM_Msk);

    taskEXIT_CRITICAL();
    
    /* Check for errors */
    if (rtc->RTC_VER != 0 || ((rtc->RTC_SR & RTC_SR_TDERR_CORRECT) != 0))
    {
        status = false;
    }
    
    return status;
}


/* Supervision and control for RTC. */
void CalendarTask(void *arg)
{
    (void)arg;
    Rtc *rtc = RTC;
    BaseType_t ret;
    uint32_t event;
    Calendar calendar;

    RTC_Init();

    /* Set time for testing purposes */
    calendar.date.year    = 2020;
    calendar.date.month   = 9;
    calendar.date.day     = 13;
    calendar.time.hour    = 20;
    calendar.time.minutes = 25;
    calendar.time.seconds = 0;
    //RTC_SetTime(&calendar);
    
    while (1)
    {
        event = ulTaskNotifyTake(pdFALSE, portMAX_DELAY);
        if (event == RTC_SEC_PERIOD)
        {
            RTC_GetTime(&calendar);
        }
        if (event == RTC_SET_TIME)
        {
            ret = xQueueReceive(xTsQ, &calendar, pdMS_TO_TICKS(10));
            assert(ret != errQUEUE_EMPTY, __FILE__, __LINE__);

            /* Disable RTC second period IRQ to avoid race condition */
            rtc->RTC_IDR = RTC_IDR_SECDIS_Msk;
            RTC_SetTime(&calendar);
            rtc->RTC_IER = RTC_IER_SECEN_Msk;
        }
        if (event == RTC_RETURN_TIME)
        {
            ret = xQueueSend(xTsQ, &calendar, pdMS_TO_TICKS(10));
            assert(ret != errQUEUE_FULL, __FILE__, __LINE__);
        }
    }
}


static bool RTC_GetTime(Calendar *calendar)
{
    Rtc *rtc = RTC;
    bool status = false;
    uint32_t bcdDate[STABLE_READ_COUNT] = { 0 };
    uint32_t bcdTime[STABLE_READ_COUNT] = { 0 };

    /* First read */
    bcdDate[0] = rtc->RTC_CALR;
    bcdTime[0] = rtc->RTC_TIMR;

    /* Do up to 2 more reads */
    for (uint32_t i = 1; i < STABLE_READ_COUNT; i++)
    {
        bcdDate[i] = rtc->RTC_CALR;
        bcdTime[i] = rtc->RTC_TIMR;

        /* Compare to previous */
        if ((bcdDate[i] == bcdDate[i - 1]) && (bcdTime[i] == bcdTime[i - 1]))
        {
            /* Do sanity check */
            if ((bcdDate[i] != 0) || (bcdTime[i] != 0))
            {
                /* Convert BCD time to human readable format */
                calendar->date.year     = bcd2Dec(bcdDate[i], CAL_YEAR);
                calendar->date.month    = bcd2Dec(bcdDate[i], CAL_MONTH);
                calendar->date.day      = bcd2Dec(bcdDate[i], CAL_DAY);
                calendar->date.weekDay  = bcd2Dec(bcdDate[i], CAL_WDAY);
                calendar->time.hour     = bcd2Dec(bcdTime[i], CAL_HOUR);
                calendar->time.minutes  = bcd2Dec(bcdTime[i], CAL_MINUTE);
                calendar->time.seconds  = bcd2Dec(bcdTime[i], CAL_SECOND);
                status = true;
            }

            break;
        }
    }

    return status;
}

/**
 * \brief Current time returned is packed into a DWORD value.
 *
 * The bit field is as follows:
 *
 * bit31:25  Year from 1980 (0..127)
 *
 * bit24:21  Month (1..12)
 *
 * bit20:16  Day in month(1..31)
 *
 * bit15:11  Hour (0..23)
 *
 * bit10:5   Minute (0..59)
 *
 * bit4:0    Second (0..59)
 *
 * \return Current time.
 */
DWORD get_fattime(void)
{
    uint32_t status;
    uint32_t time;
    struct Calendar calendar;
    status = RTC_GetTime(&calendar);
    assert(status == true, __FILE__, __LINE__);

    time = ((calendar.date.year - 1980) << 25) | (calendar.date.month << 21) | (calendar.date.day << 16)
          | (calendar.time.hour << 11) | (calendar.time.minutes << 5) | (calendar.time.seconds << 0);

    return time;
}