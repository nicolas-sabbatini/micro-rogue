local Static = {}
Static.__index = Static

Static.map_string = [[
#############
#...........#
#..##.......#
#..##.......#
#..T........#
#.....##A#..#
#.....#..#..#
#..#..A..A..#
#.....##A#..#
#...........#
#############
]]
Static.map = {}

function Static.create_map(quads)
    -- Width 
    local width = #Static.map_string:match("[^\n]+")
    local x = 0
    local y = 0
    for row in Static.map_string:gmatch("[^\n]+") do
        Static.map[y] = {}
        for char in row:gmatch(".") do
            Static.map[y][x] = quads.floor[1]
            if char == '#' then
                if y - 1 > 0 and Static.map[y][x] == quads.walls.s[1] or Static.map[y][x] == quads.walls.h[1] then
                    print('asd')
                    Static.map[y][x] = quads.walls.s[1]
                else
                    Static.map[y][x] = quads.walls.h[1]
                end 
            elseif char == 'A' then
                Static.map[y][x] = quads.arch.s[1]
            elseif char == 'T' then
                Static.map[y][x] = quads.trap[1]
            end
            x = x + 1
        end
        print(row)
        x = 0
        y = y + 1
    end
end

function Static.draw(off_x, off_y, img)
    for y in pairs(Static.map) do
        for x in pairs(Static.map[y]) do
            love.graphics.draw(img, Static.map[y][x], off_x + (x * 8), off_y + (y * 8))
        end
    end
end

return Static