require ('movement-functions')
require ('mapping-functions')

-- Use Shift + Click to select a robot
-- When a robot is selected, its variables appear in this editor
local flag = false

-- Put your global variables here

local target = 1
local current_target
local current_x= robot.positioning.position.x
local current_y= robot.positioning.position.y
local last_x = current_x
local last_y = current_y
local disp = 0
local lastTurn = false
local isTurning = false
fieldStatus = {false,false,false,false,false,false,false,false,false}
field = chunk(36,36,3, {0,0})
local mySquare

--[[ This function is executed every time you press the 'execute' button ]]
function init()
	target = 1
	if robot.id == "gpr-bot2" then
		current_path = generatePath(field[1]["bl"], 8, 2 ,2)
   	current_target = current_path[target]
		robot.radios.radio_tx.tx_data({1})
		mySquare = 1
	elseif robot.id == "gpr-bot1" then
		current_path = generatePath(field[2]["bl"], 8, 2 ,2)
   	current_target = current_path[target]
		robot.radios.radio_tx.tx_data({2})
		mySquare = 2 
	elseif robot.id == "gpr-bot0" then
		current_path = generatePath(field[4]["bl"], 8, 2 ,2)
   	current_target = current_path[target]
		robot.radios.radio_tx.tx_data({4})
		mySquare = 4
	end
	fieldStatus[mySquare] = true
end


--[[ This function is executed at each time step
     It must contain the logic of your controller ]]
function step()
	--Communication Logic

	--Transmit square to everybody in range
	robot.radios.radio_tx.tx_data({mySquare})

	--Receive everybody elses data
	--If there is data to receive
	if # robot.radios.radio_rx.rx_data > 0 then
		--Update the map
		for i = 1, #robot.radios.radio_rx.rx_data, 1 do
			fieldStatus[robot.radios.radio_rx.rx_data[i][1]] = true
		end
	end

	if (obstacleDetect()) then 
		obstacleAvoid()
	else
		checkerboardStep()
	end
	
end

function reset()
	init()
end

function destroy()

end

function checkerboardStep()
--Navigation Logic
	--Get the current position
	current_x= robot.positioning.position.x
	current_y= robot.positioning.position.y

	--Create Trajectory vector pointing at the next target 
	local sum_of_squares=math.pow((current_target[1] - current_x),2)+math.pow((current_target[2] - current_y),2)
	local traj_magnitude=math.sqrt(sum_of_squares)

	--If we are far away, drive to the current target

	if (traj_magnitude > 0.1) then
		isTurning = driveTo(current_target[1],current_target[2], 5)
	--Else, We have arrived at the target 
	else
		--Have we run out of targets?
		if target + 1 > tablelength(current_path) then
			local isFinished = false
			local counter = 0 
			--Count up all the finished fields status
			for i = 1, #fieldStatus, 1 do
				if fieldStatus[i] == true then
					counter = counter + 1
				end
			end
			--If the finished fields counter matches the number of fields, the entire area has been covered
			if counter == #fieldStatus then
				log("All gound covered!")
			--Else, there is more work to do, so pick the closest chunk. 
			else
				log("Picking next chunk!")
				--Pick where to go next
				mySquare = shortestDistance(robot.positioning.position.x, robot.positioning.position.y)
				--Reset the target, and generate a new path based on the closest square
				target = 1
				current_path = generatePath(field[mySquare]["bl"], 8, 2 ,2)
   			current_target = current_path[target]
			end

		--Else, there are more targets, go to next target 
		else
			target = target+1
			current_target = current_path[target]
		end
	end
end