#include "Motion.h"

void Motion::forward() {
    for(int i = 0; i < 6; i++) {
        this->motors[i].forward();
    }
}

void Motion::turnLeft() {
    for(int i = 0; i < 6; i++) {
        if (this->motors[i].getMotorID % 2 == 0) {
            this->motors[i].forward();
        }
        else this->motors[i].reverse();
    }
}

void Motion::turnRight() {
    for(int i = 0; i < 6; i++) {
        if (this->motors[i].getMotorID % 2 == 0) {
            this->motors[i].reverse();
        }
        else this->motors[i].forward();
    }
}

void Motion::reverse() {
    for (int i = 0; i < 6; i++) {
        this->motors[i].reverse();
    }
}

void Motion::brake() {
    for (int i = 0; i < 6; i++) {
        this->motors[i].brake();
    }
}

void Motion::sleep() {
    for (int i = 0; i < 6; i ++) {
        this->motors[i].sleep();
    }
}