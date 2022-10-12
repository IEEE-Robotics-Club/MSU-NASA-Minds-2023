#ifndef MOTOR_CONTROL_H
#define MOTOR_CONTROL_H

#include "motors.hpp"

void clockwise_movement(motor* servo, int degrees);
void counterclock_wise_movement(motor* servo, int degrees);
void forward_movement(int speed, int time);
void reverse_movement(int speed, int time);

#endif
