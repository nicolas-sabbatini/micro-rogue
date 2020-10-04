local Map = {}
Map.__index = Map

local function find_index(index, quads, p)
    local candidates = {}
    for target, _ in pairs(quads) do
        if #target == 8 and target ~= '00000000' then
            local candidate = ''
            for offset=1, 8 do
                if index:sub(offset, offset) == '1' and index:sub(offset, offset) == target:sub(offset, offset) then
                    candidate = candidate .. '1'
                else
                    candidate = candidate .. '0'
                end
            end
            if candidate == target then
                table.insert(candidates, candidate)
            end
        end 
    end
    local occurrence = 0
    local candidate = '00000000'
    for _, new_candidate in pairs(candidates) do
        local _, new_occurrence = new_candidate:gsub('1', '')
        if new_occurrence > occurrence then 
            candidate = new_candidate
            occurrence = new_occurrence
        end
    end
    return candidate
end

function Map.set_tiles(map, quads)
    local limit_y = map.size[2]
    local limit_x = map.size[1]
    for y=0, limit_y do
        for x=0, limit_x do
            if map.cels[y][x].type == 'wall' then
                local quad_index = ''
                for y_p=y-1, y+1 do
                    for x_p=x-1, x+1 do
                        if y_p ~= y or x_p ~= x then
                            if map.cels[y_p] and map.cels[y_p][x_p] and map.cels[y_p][x_p].type == 'wall' then
                                quad_index = quad_index .. '1'
                            else
                                quad_index = quad_index .. '0'
                            end
                        end
                    end
                end
                if not quads[quad_index] then quad_index = find_index(quad_index, quads, (y == 0 and x == 1)) end 
                map.cels[y][x].quad = quads[quad_index]
            elseif map.cels[y][x].type == 'floor' then
                map.cels[y][x].quad = quads['floor']
            end
        end
    end
end

function Map.draw(map, img, offset_x, offset_y, zoom)
    love.graphics.push()
    love.graphics.translate(offset_x, offset_y)
    love.graphics.scale(zoom)
    local limit_y = map.size[2]
    local limit_x = map.size[1]
    for y=0, limit_y do
        for x=0, limit_x do
            love.graphics.draw(img, map.cels[y][x].quad, 8 * x, 8 * y)
        end
    end
    love.graphics.pop()
end

return Map
