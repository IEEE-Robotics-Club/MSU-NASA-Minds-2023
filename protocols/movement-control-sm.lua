local machine = require('statemachine')

local movement_sm = machine.create({
    initial = 'state_pathfinding',
    events = {
        {name = 'event_path_calc', from = '{state_pathfinding, state_backtracking}', to = 'state_driving'},
        {name = 'event_path_discrepancy', from = 'state_driving', to = 'state_pathfinding'},
        {name = 'event_obstacle_detected', from = 'state_driving', to = 'state_backtracking'}
    },
    callbacks = {
        onevent_path_calc = print("path calculated"),
        onevent_path_discrepancy = print("")
    }
})