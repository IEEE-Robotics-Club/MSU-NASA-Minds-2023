scanRate = 1/100;
velocity = 5; 

distance_per_step = scanRate*velocity;
path = GeneratePath([0,0], 1, 0.25, 0);
cell = mat2cell(path, 1, [38]); 


pathIndex = 1;
current_coord = [0,0];

data= [];
while pathIndex < length(path)
    if norm(current_coord - path(pathIndex)) < 0.05
        pathIndex = pathIndex + 1;
    else
        traj = (path(pathIndex) - current_coord);
        utraj = traj/(norm(traj));

        distance_step = distance_per_step*utraj;
        current_coord = current_coord + distance_step;
        data = [data, {current_coord}]
        
    end
end

for i = 1 : length(data)
    hold on
        scatter(data{1,i}(1), data{1,i}(2))
    hold off
end
