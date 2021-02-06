#ifndef RTC_H_
#define RTC_H_

#include <stdbool.h>


enum
{
    RTC_SEC_PERIOD,
    RTC_SET_TIME,
    RTC_RETURN_TIME
};


#define TS_QUEUE_SIZE       (8u)
#define TS_QUEUE_TIMEOUT    (100)


typedef struct Calendar
{
	struct Date
	{
        uint8_t  weekDay;   /* Range from 1 to 7 (weekdays)         */
		uint8_t  day;	    /* Range from 1 to 28/29/30/31			*/
		uint8_t  month;	    /* Range from 1 to 12					*/
		uint16_t year;	    /* Absolute year >= 1970(such as 2000)	*/
	} date;

	struct Time
	{
		uint8_t  seconds;   /* Range from 0 to 59					*/
		uint8_t  minutes;	/* Range from 0 to 59					*/
		uint8_t  hour;	    /* Range from 0 to 23					*/
	} time;
} Calendar;


void CalendarTask(void *arg);
void RTC_Init(void);


#endif /* RTC_H_ */
