# MSU-NASA-Minds-2023 - Lua Testing branch (do not merge)
This is where we will be testing lua functionality outside of ARGoS and defining basic state machine template outlines.

## What is a state machine and why are we using them?
Think of state machines almost like a flowchart. A

# Getting started

You will need to have Lua installed on your machine. I recommend installing one of the binaries listed here for your specific operating system: https://luabinaries.sourceforge.net/.

# Writing a state machine
For now you will have to copy the ``statemachine.lua`` file from the root directory of this repository into the folder along with your source file. 

For example, if my state machine implementation was defined under the source file ``my_machine.lua``, there must be a ``statemachine
.lua`` file in the same directory.

To create a state machine, outline the code as follows:

```lua
-- Load in the nessesary module
local machine = require('statemachine')

-- Create a statemachine object with the name "fsm"
local fsm = machine.create({
  initial = 'green', -- this is the initial state
  -- This is a list of events. Each event has an associated
  -- "source"(from) and "destination"(to) state.
  events = {
    -- The event 'warn' will take the state from green to yellow if triggered.
    { name = 'warn_event',  from = 'green_state',  to = 'yellow_state' },
    { name = 'panic_event', from = 'yellow_state', to = 'red_state'    },
    { name = 'calm_event',  from = 'red_state',    to = 'yellow_state' },
    { name = 'clear_event', from = 'yellow_state', to = 'green_state'  }
  },
  -- callbacks are functions which are called when an event is triggered or when a state 
  -- is reached. They can be any kind of function, but follow the naming convention of
  -- "on"+the name of the associated event or state.
  callbacks = {
    -- triggered when "panic" event occurs
    onpanic_event =  function(self, event, from, to, msg) print('panic! ' .. msg)    end,
    onclear_event =  function(self, event, from, to, msg) print('thanks to ' .. msg) end,
    -- triggered once when the "green_state" state is reached.
    ongreen_state =  function(self, event, from, to)      print('green light')       end,
    onyellow_state = function(self, event, from, to)      print('yellow light')      end,
    onred_state =    function(self, event, from, to)      print('red light')         end,
  }
})

```

# Triggering events

When triggering an event, the statemachine will call its associated function callback if it exists.
Events are triggered using the following convention:

```lua
fsm::my_event(message)
```
Where ``fsm`` is the name of the statemachine object, ``my_event`` is the name of the triggered event, and ``message`` is an optional parameter that can be passed to user defined function callbacks (see ``onpanic_event`` & ``onclear_event`` for good examples of this use case).

# Running a Lua source file

Make sure you have Lua installed on your computer, as well as the appropriate environment variables set so that the console recognizes the Lua command.
To run a source file, simply navigate to its directory on your operating system's command line and run ``Lua my_file.lua``. 
