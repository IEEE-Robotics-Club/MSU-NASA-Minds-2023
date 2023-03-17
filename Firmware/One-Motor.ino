class Motor {
    private:
    int p1;
    int p2;
    int motorID;

    public:
    void sleep();
    void forward();
    void reverse();
    void brake();

    Motor(int p1, int p2, int motorID);

    void setP1(int p1);
    void setP2(int p2);
    void setMotorID(int motorID);
    int getP1();
    int getP2();
    int getMotorID();
};

void Motor::sleep() {
  digitalWrite(p1, 0);
  digitalWrite(p2, 0);
}

void Motor::forward() {
    digitalWrite(p1, 1);
    digitalWrite(p2, 0);
}

void Motor::reverse() {
    digitalWrite(p1, 0);
    digitalWrite(p2, 1);
}

void Motor::brake() {
    digitalWrite(p1, 1);
    digitalWrite(p2, 1);
}

// Mitchell's code
Motor::Motor(int p1, int p2, int motorID) {
    this->p1 = p1;
    this->p2 = p2;
    this->motorID = motorID;
    pinMode(p1, OUTPUT);
    pinMode(p2, OUTPUT);
}



Motor *myMotor = new Motor(17,16,1);
int flag= 1;



void setup() {
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:
  
  if(flag){
    myMotor->reverse(); 
    delay(2000); 

    myMotor->forward();
    delay(2000);
    
    myMotor->brake(); 
    delay(2000); 

    myMotor->forward();
    delay(2000);

    myMotor->sleep(); 
    delay(2000);
    flag = 0;   
  }

}
