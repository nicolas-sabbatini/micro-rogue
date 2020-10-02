local Static = {}
Static.__index = Static

Static.map_string = [[
#######################
#.....................#
#..##.................#
#..##.................#
#..T..................#
#.....##A#............#
#.....#..#............#
#..#..A..A............#
#.....##A#............#
#.....................#
#.....................#
#.....................#
#.....................#
#######################
]]
Static.map = {}

function Static.create_map(quads)
    -- Transform data from string to map
    -- TODO replace level generator
    -- Width 
    local width = #Static.map_string:match("[^\n]+")
    local x = 0
    local y = 0
    for row in Static.map_string:gmatch("[^\n]+") do
        Static.map[y] = {}
        for char in row:gmatch(".") do
            Static.map[y][x] = { quad = quads.floor[1] }
            if char == '#' then
                Static.map[y][x].type = 'wall'
            elseif char == 'A' then
                Static.map[y][x].type = 'arch'
            elseif char == 'T' then
                Static.map[y][x].quad = quads.trap[1]
            end
            x = x + 1
        end
        print(row)
        x = 0
        y = y + 1
    end
    --
    local y_limit = y - 1
    local x_limit = width - 1
    for y=0, y_limit do
        for x=0, x_limit do
            if Static.map[y][x].type == 'wall' or Static.map[y][x].type == 'arch' then
                -- Is side wall
                if y - 1 >=0 and y + 1 <= y_limit and 
                  (Static.map[y-1][x].type == 'wall' or Static.map[y-1][x].type == 'arch') and
                  (Static.map[y+1][x].type == 'wall' or Static.map[y+1][x].type == 'arch')
                then
                    if Static.map[y][x].type == 'wall' then
                        Static.map[y][x].quad = quads.walls[1][1]
                    else
                        Static.map[y][x].quad = quads.arch[1][1]
                    end
                -- Is horizontal
                elseif x - 1 >=0 and x + 1 <= x_limit and 
                  (Static.map[y][x-1].type == 'wall' or Static.map[y][x-1].type == 'arch') and
                  (Static.map[y][x+1].type == 'wall' or Static.map[y][x+1].type == 'arch')
                then
                    if Static.map[y][x].type == 'wall' then
                        Static.map[y][x].quad = quads.walls[2][1]
                    else
                        Static.map[y][x].quad = quads.arch[2][1]
                    end
                -- Is top rigth or top left
                elseif y + 1 <= y_limit and 
                  (Static.map[y+1][x].type == 'wall' or Static.map[y+1][x].type == 'arch')
                then
                    if x - 1 >=0 and 
                      (Static.map[y][x-1].type == 'wall' or Static.map[y][x-1].type == 'arch')
                    then
                        Static.map[y][x].quad = quads.walls[4][1]
                    elseif x + 1 <= x_limit and 
                      (Static.map[y][x+1].type == 'wall' or Static.map[y][x+1].type == 'arch')
                    then
                        Static.map[y][x].quad = quads.walls[3][1]
                    end
                -- Is bot rigth or top left
                elseif y - 1 >= 0 and 
                  (Static.map[y-1][x].type == 'wall' or Static.map[y-1][x].type == 'arch')
                then
                    if x - 1 >=0 and 
                      (Static.map[y][x-1].type == 'wall' or Static.map[y][x-1].type == 'arch')
                    then
                        Static.map[y][x].quad = quads.walls[6][1]
                    elseif x + 1 <= x_limit and 
                      (Static.map[y][x+1].type == 'wall' or Static.map[y][x+1].type == 'arch')
                    then
                        Static.map[y][x].quad = quads.walls[5][1]
                    end
                end 
            end
        end
    end
end

function Static.draw(off_x, off_y, img)
    for y in pairs(Static.map) do
        for x in pairs(Static.map[y]) do
            love.graphics.draw(img, Static.map[y][x].quad, off_x + (x * 8), off_y + (y * 8))
        end
    end
end

return Static