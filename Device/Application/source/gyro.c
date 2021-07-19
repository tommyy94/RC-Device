#include "gyro.h"
#include "mpu-6050.h"
#include "system.h"
#include "com.h"


extern QueueHandle_t    xJobQueue;
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
    xJobStruct     xJob;
    xJobStruct    *pxJob = &xJob;

    while (1)
    {
        MPU6050_vSensorsRead(&xAccel, &xGyro);
        pxJob->pucData[0] = xAccel.ucX;
        pxJob->pucData[1] = xAccel.ucY;
        pxJob->pucData[2] = xAccel.ucZ;
        pxJob->pucData[3] = xAccel.ucX;
        pxJob->pucData[4] = xAccel.ucY;
        pxJob->pucData[5] = xAccel.ucZ;

        /* Order a write job */
        pxJob->ulLen        = 6;
        pxJob->ulType       = RF_SEND;
        pxJob->xSubscriber  = xGyroTask;
        xRet = xQueueSend(xJobQueue, &pxJob, NULL);
        if (xRet != pdTRUE)
        {
            Journal_vWriteError(JOB_QUEUE_FULL);
        }

        (void)ulTaskNotifyTakeIndexed(4, pdTRUE, portMAX_DELAY);
    }
}
