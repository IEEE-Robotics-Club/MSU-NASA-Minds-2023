/**
 * @file motors.hpp
 * @author Adam Cate (acate@msudenver.edu) aka pepsiman
 * @brief The basic function abstractions for driving motors
 * @version 0.1
 * @date 2022-09-22
 * 
 * @copyright GNU GPL v3.0
 * 
 */
#ifndef MOTORS_H
#define MOTORS_H

#include <stdint.h>
#include <stdbool.h>


typedef uint8_t pin; // pin number between 0-255

typedef enum{
    SERVO,          // servo motor
    DC,             // dc motor
    WHEEL_ENCODER   // encoder for wheel motion
}peripheral_t;

/**********************************************************************/
  /*! @brief Holds the pin and state data pertaining to a given motor.

   *  @param type       Specifier for motor type (see # peripheral_t)
   *  @param pin_number The PWM pin number (0-255), only some will work. Don't modify after initializing
   *  @param pwm        The PWM value      (0-255)
   *  @param direction  Direction to turn the motor
   
   */
  /**********************************************************************/
typedef struct{
    peripheral_t type;
    pin pin_number;
    uint8_t pwm;
    bool direction;
}motor;


 /**********************************************************************/
  /*! @brief Takes a reference to a motor variable and updates the corresponding motor's state.
   *  @param motor A reference to the motor variable to drive with the new values
   *
   *  @details Motors should ideally be set as needed, and #motor_update called sequentially
   *  once per loop, so that pins for all motors are being updated at the same time (and not more than needed)
   */
  /**********************************************************************/
void motor_update(motor* motor);

/**********************************************************************/
  /** @brief Must be called to configure initial pin outputs for a motor to be usuable.
   *  @param motor Reference to the motor to configure. Members should be initialized prior to calling  
   */
/**********************************************************************/
void motor_init(motor* motor);

#endif