-- global motor speed factor for pwm. For example,
-- a value of 1000 indicates that a pwm value of 1000 will result in a speed of 1.
_motor_pwm_speed_factor = 500 

--- Initialize a table to store motor data
--- @param motor table The object to initialize as a motor
--- @param joint table The assigned argos joint
--- @param max_pwm integer A unique index for this motor
function motor_init(motor, joint, max_pwm)
    motor.joint = joint
    motor.max_pwm = max_pwm
    motor.pwm = 0
    motor.direction = false
end

--- Drive a motor based on a pulse width modulation value and a direction
--- @param motor table the motor (must be already initialized, see motor_init)
--- @param pwm integer
function motor_drive(motor, pwm)

    local adjusted_pwm = pwm

    if(adjusted_pwm > motor.max_pwm)
    then
        adjusted_pwm = motor.max_pwm
    elseif(pwm < -1 * motor.max_pwm)
    then
        adjusted_pwm = -1*motor.max_pwm
    end
    
    motor.joint.set_target(adjusted_pwm / _motor_pwm_speed_factor)
end