#include "gyro.h"
#include "mpu-6050.h"
#include "system.h"
#include "com.h"


extern QueueHandle_t    xJobQueue;
extern QueueHandle_t    xGyroQueue;
extern TaskHandle_t     xGyroTask;


/**
 * @brief   Read accelerometer and gyroscope measurements
 *          and relay the sensor values to the controller.
 *
 * @param   pvArg     Pointer to argument, unused.
 *
 * @return  None.
 */
void gyro_vTask(void *pvArg)
{
    (void)pvArg;
    BaseType_t     xRet;

    AxisStruct_t   xAccel;
    AxisStruct_t   xGyro;

    RF_Struct_t    xRf;
    RF_Struct_t   *pxRf= NULL;

    while (1)
    {
        xRet = xQueueReceive(xGyroQueue, &pxRf, portMAX_DELAY);
        if (xRet != pdTRUE)
        {
            Journal_vWriteError(JOB_QUEUE_FULL);
        }

        /* Read sensor and reorganize measurements */
        MPU6050_vSensorsRead(&xAccel, &xGyro);
        xRf.pucParam[0] = xAccel.ucX;
        xRf.pucParam[1] = xAccel.ucY;
        xRf.pucParam[2] = xAccel.ucZ;
        xRf.pucParam[3] = xAccel.ucX;
        xRf.pucParam[4] = xAccel.ucY;
        xRf.pucParam[5] = xAccel.ucZ;

        /* Pass message forward as a response */
        xRf.ucCmd = RF_RESP;
        pxRf = &xRf;
        xRet = xQueueSend(xJobQueue, &pxRf, NULL);
        if (xRet != pdTRUE)
        {
            Journal_vWriteError(JOB_QUEUE_FULL);
        }
    }
}
