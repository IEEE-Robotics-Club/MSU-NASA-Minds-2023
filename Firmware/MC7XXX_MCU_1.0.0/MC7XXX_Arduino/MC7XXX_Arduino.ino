#include <m_drv_console.h>
#include <m_drv_i2c.h>
#include <m_drv_mc3xxx.h>
#include <m_drv_mc70xx.h>
#include <m_drv_mc_utility.h>


//Test Sketch for communicating with the MC6470

void setup(){
    Serial.begin(9600);

    //The 70XX is the Magnetometer, While the 3XXX is the Accelerometer
    M_DRV_MC70XX_Init();
    M_DRV_MC3XXX_Init();

    //Set the Accelerometer to continuous sampling of the data
    M_DRV_MC3XXX_SetMode(1);
}

void loop(){
    //Output Arrays for the readings
    float accelOutput[3];
    float magnetOutput[3];

    //Read the sensors
    M_DRV_MC3XXX_ReadSensorData(accelOutput);
    M_DRV_MC70XX_ReadSensorData(magnetOutput);

    //Print the data to the console for testing
    Serial.println("Output Acceleration X");
    Serial.println(accelOutput[0]);
    Serial.println("Output Acceleration Y");
    Serial.println(accelOutput[1]);
    Serial.println("Output Acceleration Z");
    Serial.println(accelOutput[2]);

    Serial.println("Output Magnetic Field X");
    Serial.println(magnetOutput[0]);
    Serial.println("Output Magnetic Field Y");
    Serial.println(magnetOutput[1]);
    Serial.println("Output Magnetic Field Z");
    Serial.println(magnetOutput[2]);

}
