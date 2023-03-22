#include <Wire.h>
#include <WireIMXRT.h>
#include <WireKinetis.h>


//Values and expected responses from the datasheet
#define MAG_ADDRESS 0x0C
#define ACC_ADDRESS 0b1001100
#define INFO_MORE 0x0E
#define WHOAMI 0x0F
#define INFO_VERSION 0x0D

#define INFO_VERSION_VALUE 0b00010001
#define INFO_MORE_VALUE 0b00010101
#define WHOAMI_VALUE 0b01001001


//Device Class Definition
class MCP6470{
    private:
        int i2cWire;
        int a5Level;
        int address; 
        int mag_add = MAG_ADDRESS;
        int acc_address; 

        
    public:
        MCP6470(int wire, int a5);
        bool readInfo();
};

MCP6470::MCP6470(int wire, int a5)
{
    //Register the device in the Wire Session
    this->acc_address = 0b1001100 | (a5 << 5);
    this->i2cWire = wire; 

}


bool MCP6470::readInfo()
{
    char info[3];
    int address = this->address;

    //Read Device Information
    Wire.beginTransmission(this->address);    //Begin Transmission

    Wire.write(INFO_VERSION);           //Tell the device we want to read from the INFO_VERSION register
    Wire.requestFrom(address,1);        //Request a byte from the address
    info[0] = Wire.read();              //Read the incoming byte

    Wire.write(INFO_MORE);              //Tell the device we want to read from the INFO_MORE register
    Wire.requestFrom(address,1);        //Request a byte from the address
    info[1] = Wire.read();              //Read the incoming byte

    Wire.write(WHOAMI);                 //Tell the device we want to read from the WHOAMI register
    Wire.requestFrom(address,1);        //Request a byte from the address
    info[2] = Wire.read();              //Read the incoming byte

    Wire.endTransmission(); 

    //Check the results against valid values
    for(int i = 0; i<3; i++){
        if((info[i] != INFO_VERSION_VALUE) && (info[i] != INFO_MORE_VALUE) && (info[i] != WHOAMI_VALUE))
            return false;
    }
    return true;
}

//Test Script
void setup() {
    
  Serial.begin(9600);
  MCP6470 * myDevice = new MCP6470(0,0);
  if (myDevice->readInfo()){
    Serial.print("Device Identified");
  } 
  else{
    Serial.print("Something went wrong");
  }

}

void loop() {
  // put your main code here, to run repeatedly:
  //Nothing to run repeatedly, as chip is contacted in setup

}
