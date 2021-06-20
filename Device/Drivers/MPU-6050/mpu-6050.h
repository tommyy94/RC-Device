#pragma once
#include <stdint.h>


typedef struct
{
    uint8_t ucX;
    uint8_t ucY;
    uint8_t ucZ;
} AxisStruct_t;

typedef struct
{
    AxisStruct_t xAccel;
    AxisStruct_t xGyro;
} MPU6050_t;


void MPU6050_vInit(void);
void MPU6050_vAccelRead(AxisStruct_t    *pxAccel);
void MPU6050_vGyroRead(AxisStruct_t     *pxGyro);
void MPU6050_vSensorsRead(AxisStruct_t  *pxAccel,
                          AxisStruct_t  *pxGyro);
