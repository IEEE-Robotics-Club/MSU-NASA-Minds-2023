Lidar = {
	speed = 0,
	samplerate = 2000,
	delta_theta = 0,
	readings = {}
}



function LidarInit(velocity)
	robot.joints.base_lidar.set_target(velocity)
end

function LidarStep()
	local n_rot = robot.joints.base_lidar.encoder
	
	--Since the joints measure total displacement, continually rotating the lidar module will continually increase the lidar encoder position measurement. 
	if n_rot > 2*math.pi then 
		while n_rot > 2*math.pi do 
			n_rot = n_rot-2*math.pi		
		end
	end 
-- Logging for now, but this function should probably return a table containing {distance, phase}
	return{n_rot, math.exp(0.-robot.proximity[1])}

end

function ObstacleAvoid()
	--Get Face Angle of the robot
    local face_angle = getYaw()

	--Round it to the nearest delta theta
    --Loop through each of the lidar readings

	--For each lidar collision within the threshold 
	--Check if its on the right or left side

	--Increment a counter for the right and left side

	--Turn Left or Right based on the
end

function ObstacleDetect(lidar)
	--Get Face Angle of the robot
    local face_angle = getYaw()

	--Round it to the nearest delta theta
    --Loop through each of the lidar readings

	--If there are one or more lidar collisions within the threshold 
	--Return True

	--Else Return False

    return false
end