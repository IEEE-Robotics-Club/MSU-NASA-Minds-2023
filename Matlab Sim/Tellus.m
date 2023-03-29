classdef Tellus
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here

    properties
        fieldStatus = []
        fieldIndex = 1

        current_coord = []
        path = []
        
        scanRate = 1/100;
        velocity = 5;
        pathIndex = 1
        data = [];

    end

    methods
        function obj = init(inputArg1,inputArg2)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here

            obj.Property1 = inputArg1 + inputArg2;
        end

        function outputArg = step(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            if obj.pathIndex < length(obj.path)
                distance_to_target = sqrt((obj.path(obj.pathIndex)-obj.current_coord(1))^2  + (obj.path(obj.pathIndex+1)-obj.current_coord(2))^2); 
                if distance_to_target < 0.02
                    obj.pathIndex = obj.pathIndex + 2;
                else
                    traj = [obj.path(obj.pathIndex) - obj.current_coord(1),  obj.path(obj.pathIndex+1) - obj.current_coord(2)];
                    utraj = traj/(norm(traj));
            
                    distance_step = distance_per_step*utraj;
                    obj.current_coord = obj.current_coord + distance_step;
            
                    obj.data = [obj.data, {obj.current_coord}];
                end
            end            
            outputArg = obj.Property1 + inputArg;
        end
    end
end