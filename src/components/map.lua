local Map = {}
Map.__index = Map

local Camera = require 'libs.camera'

--- Find index family
--- @param index any
--- @param quads any
--- @return string
local function find_index(index, quads)
    -- Creata a candidate list
    local candidates = {}
    for target, _ in pairs(quads) do
        -- If the target is not a auto tile index skip
        if #target == 8 and target ~= '00000000' then
            -- Do and AND operation
            local candidate = ''
            for offset=1, 8 do
                if index:sub(offset, offset) == '1' and index:sub(offset, offset) == target:sub(offset, offset) then
                    candidate = candidate .. '1'
                else
                    candidate = candidate .. '0'
                end
            end
            -- If the candidate is equal to the target they are family
            if candidate == target then
                table.insert(candidates, candidate)
            end
        end
    end
    local occurrence = 0
    local candidate = '00000000'
    -- Select the candidate family with more 1
    for _, new_candidate in pairs(candidates) do
        -- Get how many times 1 apears in the candidate
        local _, new_occurrence = new_candidate:gsub('1', '')
        -- If apears more this is the new family
        if new_occurrence > occurrence then
            candidate = new_candidate
            occurrence = new_occurrence
        end
    end
    -- Return the most likely family
    return candidate
end

--- Set the corresponding tiles to a map
--- @param map any
--- @param quads any
function Map.set_tiles(map, quads)
    -- Get map size
    local limit_y = map.size[2]
    local limit_x = map.size[1]
    for y=0, limit_y do
        for x=0, limit_x do
            -- Wals
            if map.cels[y][x].type == 'wall' then
                -- Create an index
                local quad_index = ''
                -- Check all neighbor
                for y_p=y-1, y+1 do
                    for x_p=x-1, x+1 do
                        -- If is not self
                        if y_p ~= y or x_p ~= x then
                            -- Check if is a wall or door
                            if map.cels[y_p] and map.cels[y_p][x_p] and map.cels[y_p][x_p].type == 'wall' then
                                quad_index = quad_index .. '1'
                            else
                                quad_index = quad_index .. '0'
                            end
                        end
                    end
                end
                -- If the index does not exist find this family
                if not quads[quad_index] then quad_index = find_index(quad_index, quads) end
                -- Set quad
                map.cels[y][x].quad = quads[quad_index]
            -- Floor
            elseif map.cels[y][x].type == 'floor' then
                map.cels[y][x].quad = quads['floor']
            end
        end
    end
end

function Map.create_camera(map, offset_x, offset_y, zoom)
    map.camera = Camera.new(offset_x, offset_y, zoom, 0, Camera.smooth.damped(10))
end

--- Draws a map
--- @param map any
--- @param img any
--- @param offset_x integer
--- @param offset_y integer
function Map.draw(map, img, offset_x, offset_y)
    map.camera:attach(0, 0, FAKE_WIDTH, FAKE_HEIGHT, true)
    map.camera:lockPosition(offset_x, offset_y)
    local limit_y = map.size[2]
    local limit_x = map.size[1]
    for y=0, limit_y do
        for x=0, limit_x do
            love.graphics.draw(img, map.cels[y][x].quad, 8 * x, 8 * y)
        end
    end
    map.camera:detach()
end

return Map
