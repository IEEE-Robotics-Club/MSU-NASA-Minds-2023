function generatePath(bottom_left, length, width, offset)
	--Create table of points, and generate first point, which is the bottom left corner of the sector
	local travel_path = {}
	local start = {bottom_left["x"]+offset, bottom_left["y"]+offset}
	local x = start[1]
	local y = start[2]
	table.insert(travel_path, start)
	
	--For each of the sections of the path, generate the "snake like" pattern with the length running along the x direction 4 points at a time
	--(Travel East, North, West, North)
	for i = 1,(length/(2*width)), 1 
		do 
			x = x + length
			table.insert(travel_path,{x, y})
			y = y + width
			table.insert(travel_path,{x, y})
			x = x - length
			table.insert(travel_path,{x, y})
			y = y + width
			table.insert(travel_path,{x, y})
	end
	--Insert the last point into the table 
	x = x + length
	table.insert(travel_path,{x, y})
	
	
	--For each of the sections of the path, generate the "snake like" pattern with the length running along the y direction 4 points at a time
	--(Travel South, West, North, West)
	for i = 1,(length/(2*width)), 1 
		do 
			y = y - length
			table.insert(travel_path,{x, y})
			x = x - width
			table.insert(travel_path,{x, y})
			y = y + length
			table.insert(travel_path,{x, y})
			x = x - width
			table.insert(travel_path,{x, y})
	end
	
	--Insert the final point to the point table 
	y = y - length
	table.insert(travel_path,{x, y})
	
	--Return the table full of target vectors 
	return travel_path
end

function generateLargePath(bottom_left, length, width, offset)
	--Generate Large Path is the same algorithm and logic as generatePath, the only difference being that there is intermmediary points between the
	--extreme edges. This means that there are double the points. 
	local travel_path = {}
	local start = {bottom_left["x"]+offset, bottom_left["y"]+offset}
	local x = start[1]
	local y = start[2]
	table.insert(travel_path, start)
	for i = 1,(length/(2*width)), 1 
		do 
			x = x + length/2
			table.insert(travel_path,{x, y})
			x = x + length/2
			table.insert(travel_path,{x, y})
			y = y + width
			table.insert(travel_path,{x, y})
			x = x - length/2
			table.insert(travel_path,{x, y})
			x = x - length/2
			table.insert(travel_path,{x, y})
			y = y + width
			table.insert(travel_path,{x, y})
	end
	x = x + length
	table.insert(travel_path,{x, y})
	for i = 1,(length/(2*width)), 1 
		do 
			y = y - length/2
			table.insert(travel_path,{x, y})
			y = y - length/2
			table.insert(travel_path,{x, y})
			x = x - width
			table.insert(travel_path,{x, y})
			y = y + length/2
			table.insert(travel_path,{x, y})
			y = y + length/2
			table.insert(travel_path,{x, y})
			x = x - width
			table.insert(travel_path,{x, y})
	end
	y = y - length
	table.insert(travel_path,{x, y})
	return travel_path
end

function chunk(xLength, yLength, numSqr, center)
    local squareList = {}
    local square ={}
    offset =  {x=center[1]-(0.5*xLength) , y=center[2]-(0.5*yLength)}
     for j = 0,numSqr-1,1
       do
        columns = {}
       for i = 0,numSqr-1,1
           do
           tl={x=(xLength/numSqr)*i+offset["x"], y=(yLength/numSqr)*(j+1)+offset["y"]}
           bl={x=((xLength/numSqr)*i)+offset["x"], y=(yLength/numSqr)*j+offset["y"]}
           tr={x=(xLength/numSqr)*(i+1)+offset["x"], y=(yLength/numSqr)*(j+1)+offset["y"]}
           br={x=(xLength/numSqr)*(i+1)+offset["x"], y=(yLength/numSqr)*j+offset["y"]}
           table.insert(squareList, {tl=tl, bl=bl, tr=tr, br=br})
       end
   end
   return squareList
end

function shortestDistance(x, y)
    local distanceList = {}

    for k = 1, #fieldStatus, 1 do
        if fieldStatus[k] == false then
            xfieldval = field[k]["bl"]["x"]
            yfieldval = field[k]["bl"]["y"]
            distance = math.sqrt((xfieldval-x)^2 + (yfieldval-y)^2)
            table.insert(distanceList, {key=k, val=distance})
        end
    end
    
    local square
    local minimum = math.huge

    for i=1, #distanceList, 1 do
        if distanceList[i]["val"] < minimum then
            square = distanceList[i]["key"]
            minimum = distanceList[i]["val"]
        end
    end
    return square
end
