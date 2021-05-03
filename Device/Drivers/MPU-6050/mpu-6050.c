#include "mpu-6050.h"
#include "twi.h"

#define ADDR_MPU6050    (0x68)


static TWI_Adapter xTwiAdap =
{
    .pxInst = TWIHS0,
    .ulAddr = ADDR_MPU6050
};

void MPU6050_vInit(void)
{
   uint8_t     buf1            = { 0x75 };
   uint8_t     buf2            = { 0x00 };

   xTwiAdap.pxMsg[0].pucBuf    = &buf1;
   xTwiAdap.pxMsg[0].ulLen     = 1;
   xTwiAdap.pxMsg[0].ulFlags   = TWI_WRITE;
   xTwiAdap.pxMsg[1].pucBuf    = &buf2;
   xTwiAdap.pxMsg[1].ulLen     = 1;
   xTwiAdap.pxMsg[1].ulFlags   = TWI_READ;
   TWI_vXfer(&xTwiAdap, 2);
}
