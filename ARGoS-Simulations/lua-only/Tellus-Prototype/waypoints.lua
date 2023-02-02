-- Used for the rate at which adjustments are made to heading, can affect stability
local rot_adjustment_speed_factor = 1

-- Initialize an empty waypoints_list
function InitWaypoints(waypoints_list)
    waypoints_list = {
        list = {},
        size = 0
    }
end

-- Add a waypoint to the list
function AddWaypoint(waypoints_list, position_x, position_y)
    waypoints_list.list.add({position_x, position_y})
    waypoints_list.size = waypoints_list.size + 1
end

-- Pop the waypoint at the top of the list and return it
function PopWaypoint(waypoints_list)
    local waypoint = waypoints_list.list.remove(1)
    waypoints_list.size = waypoints_list.size - 1
    
    return waypoint
end
-- Clear all waypoints from the list
function ClearWaypoints(waypoints_list)
    for i = #waypoints_list.list, 1, -1 do
        table.remove(waypoints_list.list, i)
    end
    waypoints_list.size = 0
end


-- Adjustment functions

function MatchHeading(angle, robot)
-- TODO: placeholder
end

-- Make the robot point at a given point. Happens in accordance with
-- global rot_adjustment_speed_factor defined in pathfind.lua
function PointAt(x, y, robot)
    local dir_x = x - robot.position.x
    local dir_y = y - robot.position.y
    local magnitude = math.sqrt(dir_x * dir_x + dir_y * dir_y)

    if (magnitude == 0) then
        dir_x = 0
        dir_y = 0
        -- if the desired robot is at desired point then don't adjust
        return
    else
        -- otherwise make the direction a unit vector
        dir_x = dir_x / magnitude
        dir_y = dir_y / magnitude
    end

    -- TODO: add motor code here
    -- TODO: Use cross product to determine angle adjustment
end