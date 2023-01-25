package.path = package.path .. ';../lua-state-machine/?.lua'
require('statemachine')
local machine = require('statemachine')

local movement_state = machine.create({
    initial = 'GATHER_OBJECTIVE',
    events = {
        {name='EVENT_RECEIVED_INFO', from = 'GATHER_OBJECTIVE', to = 'PATHFIND'},
        {name='EVENT_COURSE_CALCULATED', from = 'PATHFIND', to = 'DRIVE_LOOP'}
    }
})