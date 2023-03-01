function lidar_init(velocity)
	robot.joints.base_lidar.set_target(velocity)
end

function lidar_step()
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
