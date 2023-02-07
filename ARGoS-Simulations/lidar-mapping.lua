function lidar_setup()
	robot.joints.base_lidar.set_target(10)
end

function lidar_step()
	local n_rot = math.deg(robot.joints.base_lidar.encoder) 
	
	--Since the joints measure total displacement, continually rotating the lidar module will continually increase the lidar encoder position measurement. 
	if n_rot > 360 then 
		while n_rot > 360 do 
			n_rot = n_rot-360.0		
		end
	end 
-- Logging for now, but this function should probably return a table containing {distance, phase}
	if robot.proximity[1] > 0 then
   		log(robot.proximity[1]) 
		log(n_rot)
	end
end
