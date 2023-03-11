#include "Motor.h"

void Motor::sleep() {
    digitalWrite(p1, LOW);
    digitalWrite(p2, LOW);
}

void Motor::forward() {
    digitalWrite(p1, HIGH);
    digitalWrite(p2, LOW);
}

void Motor::reverse() {
    digitalWrite(p1, LOW);
    digitalWrite(p2, HIGH);
}

void Motor::brake() {
    digitalWrite(p1, HIGH);
    digitalWrite(p2, HIGH);
}

Motor::Motor(int p1, int p2, string motorID) {
    this->p1 = p1;
    this->p2 = p2;
    this->motorID = motorID;
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

int getMotorID() {
    return motorID;
}