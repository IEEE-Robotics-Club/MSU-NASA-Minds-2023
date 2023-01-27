local machine = require('statemachine')

local fsm = machine.create({
  initial = 'green',
  events = {
    { name = 'warn',  from = 'green',  to = 'yellow' },
    { name = 'panic', from = 'yellow', to = 'red'    },
    { name = 'calm',  from = 'red',    to = 'yellow' },
    { name = 'clear', from = 'yellow', to = 'green'  }
  },
  callbacks = {
    onpanic =  function(self, event, from, to, msg) print('panic! ' .. msg)    end,
    onclear =  function(self, event, from, to, msg) print('thanks to ' .. msg) end,
    ongreen =  function(self, event, from, to)      print('green light')       end,
    onyellow = function(self, event, from, to)      print('yellow light')      end,
    onred =    function(self, event, from, to)      print('red light')         end,
  }
})

fsm:warn()
fsm:panic('killer bees')
fsm:calm()
fsm:clear('sedatives in the honey pots')