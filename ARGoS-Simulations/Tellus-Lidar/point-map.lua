--This map structure is a 32 x 32 bitfield that is meant for a 1 m^2 area.
--Each map structurre takes 128 Bytes, giving a cost of 128 Bytes/m^2

Map = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

function Map:addPoint(n_x, n_y)
	--x and y are discrete, normalized integers between 1 and 32
	Map[y] = Map[y] + bit32.lshift(1,x)
end

function Map:convertToLocal(x, y, sec_bl_x, sec_bl_y)
	--take absolute coordinates and convert them to local coordinates
	local loc_x = x - sec_bl_x
	local loc_y = y - sec_bl_y
	
	return {loc_x, loc_y)
end
	
function Map:normalize(loc_x, loc_y)
	--take local coordinates and convert them to bit indices
	local n_x = math.round(1+loc_x*31)
	local n_y = math.round(1+loc_y*31)
	
	return {n_x, n_y}
end
	

