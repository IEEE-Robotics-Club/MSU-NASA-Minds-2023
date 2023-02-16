function lidar_init(velocity)
	robot.joints.base_lidar.set_target(velocity)
end



function lidar_step()
	local n_rot = robot.joints.base_lidar.encoder
	
	--Since the joints measure total displacement, continually rotating the lidar module will continually increase the lidar encoder position measurement. 

	while n_rot > 2*Math.pi do 
		n_rot = n_rot-(2*Math.pi)		
	end
 
-- Return a table containing {phase, distance}
	return{n_rot, math.exp(0-robot.proximity[1])}

end


