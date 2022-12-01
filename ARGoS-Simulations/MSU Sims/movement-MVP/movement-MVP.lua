require 'movement-functions'


function init() 
    reset()
end

function step()
    driveForward(2)
end

function reset()
    driveForward(0)
end

function destroy() 

end
