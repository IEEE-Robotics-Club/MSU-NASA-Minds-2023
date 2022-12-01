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

    if(pwm > motor.max_pwm)
    then
        pwm = motor.max_pwm
    elseif(pwm < -1 * motor.max_pwm)
    then
        pwm = -1*motor.max_pwm
    end
    
    motor.joint.set_target(pwm)
end