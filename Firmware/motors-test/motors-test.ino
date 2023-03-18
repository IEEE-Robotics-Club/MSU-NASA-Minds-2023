#include "Motion.h"

//Setup Global Motion object
Motion *tellus = new Motion();
int flag = 1; 

void setup() {
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:
  if(flag){
    tellus->reverse(); 
    delay(2000); 

    tellus->forward();
    delay(2000);
    
    tellus->brake(); 
    delay(2000); 

    tellus->forward();
    delay(2000);

    tellus->sleep(); 
    delay(2000);

    tellus->turnLeft(); 
    delay(2000); 

    tellus->turnRight();
    delay(2000);

    flag = 0;   
  }
}
