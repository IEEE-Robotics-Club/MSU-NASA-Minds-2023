-- swap the values of a and b
function SWAP(a, b)
    local temp_a = a
    a = b
    b = temp_a
end

-- return the minimum value
function MIN(a, b)
    if a < b then
        return a
    end

    return b
end

-- return the maximum value
function MAX(a, b)
    if a > b then
        return a
    end

    return b
end

-- clamp a to a value between min and max
function CLAMP(a, min, max)
    return MIN(MAX(a,min),max)
end