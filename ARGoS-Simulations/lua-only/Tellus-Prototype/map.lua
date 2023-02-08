require('utils')

function InitMap(width, height, cell_count_x, cell_count_y)
    Map = {map_cells = {}, width = width, height = height, cell_count_x = cell_count_x, cell_count_y = cell_count_y}
    for i = 1, cell_count_x do
        Map.map_cells[i] = {}
        
        for j = 1, cell_count_y do
            Map.map_cells[i][j].num_obj = 0
        end
    end

    return Map
end


function PointInsideRect(rect, x, y)
    return x > rect.pos.x and x < rect.pos.x + rect.width and y > rect.pos.y and y < rect.pos.y + rect.height
end

function IsRayIntersectingRect(rect, vx_0, vy_0, vx_1, vy_1)
    local dir_x = vx_1 - vx_0
    local dir_y = vy_1 - vy_0

    local t_min = (rect.x - vx_0) / dir_x
    local t_max = (rect.x + rect.width - vx_0) / dir_x

    local ty_min = (rect.y - vy_0) / dir_y
    local ty_max = (rect.y + rect.height - vy_0) / dir_y

    if t_min > t_max then SWAP(t_min,t_max) end
    if ty_min > ty_max then SWAP(ty_min, ty_max) end

    if t_min > ty_max or ty_min > t_max then 
        return false
    end

    if ty_min > t_min then t_min = ty_min end
    if ty_max < t_max then t_max = ty_max end

    

    return true
end