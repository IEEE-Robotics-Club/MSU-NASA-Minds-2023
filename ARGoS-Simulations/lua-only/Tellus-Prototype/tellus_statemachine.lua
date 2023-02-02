local machine = require('statemachine')
local waypoints = require('waypoints')

Driving_Fsm = machine.create({
    initial = 's_pathfinding',
    events = {
        {name = 'e_calc_finished', from = 's_pathfinding', to = 's_driving'},
        {name = 'e_obstacle_detected', from = 's_driving', to = 's_backtrack'},
        {name = 'e_backtrack_finished', from = 's_backtrack', to = 's_pathfinding'}
    },
    callbacks = {
        one_calc_finished = function(self, event, from, to) print('calc finished') end,
        one_obstacle_detected = function(self, event, from, to) print('obstacle detected') end,
        on_backtrack_finished = function(self, event, from, to) print('backtrack finished') end
    }
})