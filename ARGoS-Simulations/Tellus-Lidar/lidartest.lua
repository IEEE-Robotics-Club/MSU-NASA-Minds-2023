require "lidar-mapping"
-- Use Shift + Click to select a robot
-- When a robot is selected, its variables appear in this editor

-- Use Ctrl + Click (Cmd + Click on Mac) to move a selected robot to a different location



-- Put your global variables here


--[[ This function is executed every time you press the 'execute' button ]]
function init()
   -- put your code here
	local outfile=io.open("lidar-out.txt", "w")
	io.output(outfile)
	io.write("[")
	io.close(outfile)
	--Lidar Spinning at 10Hz, with sample rate 4000Hz
	--Lidar has rotational velocity of 62.6cm/s 
	--Attained through guess and check (400 Frames for 1 full rotation @ 4000 ticks/sec) 
	lidar_init(62.6)
	
end



--[[ This function is executed at each time step
     It must contain the logic of your controller ]]
function step()
	if (math.deg(robot.joints.base_lidar.encoder) >= 360) then
		lidar_init(0)

		local outfile=io.open("lidar-out.txt", "a")
		io.output(outfile)
		io.write("]")
		io.close(outfile)
	else
		local outfile=io.open("lidar-out.txt", "a")
		local step_result = lidar_step()

		--Matlab formatting for 2d vector
			io.output(outfile)
			io.write("[")
			io.write(step_result[1])
			io.write(",")
			io.write(step_result[2])
			io.write("]")
			io.write(";")
			io.close(outfile)

	end
	
   -- put your code here
end




--[[ This function is executed every time you press the 'reset'
     button in the GUI. It is supposed to restore the state
     of the controller to whatever it was right after init() was
     called. The state of sensors and actuators is reset
     automatically by ARGoS. ]]
function reset()
	init()
   -- put your code here
end



--[[ This function is executed only once, when the robot is removed
     from the simulation ]]
function destroy()
   -- put your code here
end
