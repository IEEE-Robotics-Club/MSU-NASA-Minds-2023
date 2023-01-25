---@fi

---@class Motor A basic motor object that encodes a motor's state.
---@field max_speed integer
---@field speed number
---@field direction integer


---@class Servo A basic servo object that encodes a servo's state
---@field angle number
---@field max_angle number



---Used to initialize a motor object with its associated information.
---Should be used on an empty table.
---@param motor Motor The empty motor object to initialize.
---@param max_speed number The maximum specified pwm number. (Used for clamping)
---@param joint table The Argos joint to set
function motor_init(motor, max_speed, joint)
    motor.max_speed = max_speed
    motor.joint = joint
    motor.speed = 0
    motor.direction = 1
end

---Set the corresponding motor values and drive the motor.
---@param motor Motor The motor to drive.
---@param speed number The signed pwm value for this motor. Sign indicates direction. Clamped to motor.max_pwm.
function motor_drive(motor, speed)
    local adjusted_speed = speed

    if(adjusted_speed > motor.max_speed)
    then
        adjusted_speed = motor.max_speed
    end
    if(adjusted_speed < -1 * motor.max_speed)
    then
        adjusted_speed = -1 * motor.max_speed
    end

    motor.speed = math.abs(adjusted_speed)
    motor.direction = speed/math.abs(speed)
    motor.joint.set_target(motor.speed)
end