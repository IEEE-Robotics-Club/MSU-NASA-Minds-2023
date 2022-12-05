---@fi

---@class Motor A basic motor object that encodes a motor's state.
---@field max_pwm integer
---@field pin_number integer
---@field pwm integer
---@field direction integer


---Used to initialize a motor object with its associated information.
---Should be used on an empty table.
---@param motor Motor The empty motor object to initialize.
---@param max_pwm integer The maximum specified pwm number. (Used for clamping)
---@param pin_number integer The associated virtual "pin_number" for parity with hardware.
---@param joints_list table List of joints from which to assign indicies.
---@param pwm_factor number A pwm strength factor to use when driving.
function motor_init(motor, max_pwm, pin_number, list, joints_list, pwm_factor)
    motor.max_pwm = max_pwm
    motor.pin_number = pin_number
    motor.pwm = 0
    motor.direction = 1
    motor.pwm_factor = pwm_factor
end

---Set the corresponding motor values and drive the motor.
---@param motor table The motor to drive.
---@param pwm integer The signed pwm value for this motor. Sign indicates direction. Clamped to motor.max_pwm.
function motor_drive(motor, pwm)
    adjusted_pwm = pwm

    if(adjusted_pwm > motor.max_pwm)
    then
        adjusted_pwm = motor.max_pwm
    end
    if(adjusted_pwm < -1 * motor.max_pwm)
    then
        adjusted_pwm = -1 * motor.max_pwm
    end

    motor.pwm = adjusted_pwm
    motor.joints_list[motor.pin_number].set_target(motor.pwm)
end