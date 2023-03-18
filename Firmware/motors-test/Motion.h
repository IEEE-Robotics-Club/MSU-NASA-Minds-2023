class Motor {
    private:
      int p1;
      int p2;
      int motorID;

    public:
      Motor(int p1, int p2, int motorID);

      void sleep();
      void forward();
      void reverse();
      void brake();

      void setP1(int p1);
      void setP2(int p2);
      void setMotorID(int motorID);
      int getP1();
      int getP2();
      int getMotorID();
};

class Motion {
    private:
      Motor *motors[6];

    public:
      Motion();
      void forward();
      void turnLeft();
      void turnRight();
      void reverse();
      void brake();
      void sleep();
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

Motor::Motor(int p1, int p2, int motorID) {
    this->p1 = p1;
    this->p2 = p2;
    this->motorID = motorID;
}

void Motion::forward() {
    for(int i = 0; i < 6; i++) {
        this->motors[i]->forward();
    }
}

void Motion::turnLeft() {
    for(int i = 0; i < 6; i++) {
        if (this->motors[i]->getMotorID() % 2 == 0) {
            this->motors[i]->forward();
        }
        else this->motors[i]->reverse();
    }
}

void Motion::turnRight() {
    for(int i = 0; i < 6; i++) {
        if (this->motors[i]->getMotorID() % 2 == 0) {
            this->motors[i]->reverse();
        }
        else this->motors[i]->forward();
    }
}

void Motion::reverse() {
    for (int i = 0; i < 6; i++) {
        this->motors[i]->reverse();
    }
}

void Motion::brake() {
    for (int i = 0; i < 6; i++) {
        this->motors[i]->brake();
    }
}

void Motion::sleep() {
    for (int i = 0; i < 6; i ++) {
        this->motors[i]->sleep();
    }
}

Motion::Motion() {
  // instantiate motors
  this->motors[0] = new Motor(17, 16, 1);
  this->motors[1] = new Motor(15, 14, 2);
  this->motors[2] = new Motor(24, 25, 3);
  this->motors[3] = new Motor(26, 27, 4);
  this->motors[4] = new Motor(41, 40, 5);
  this->motors[5] = new Motor(39, 38, 6);
}


// getters and setters
void Motor::setP1(int p1) {
    this->p1 = p1;
}

void Motor::setP2(int p2) {
    this->p2 = p2;
}

void Motor::setMotorID(int motorID) {
    this->motorID = motorID;
}

int Motor::getP1() {
    return p1;
}

int Motor::getP2() {
    return p2;
}

int Motor::getMotorID() {
    return motorID;
}
