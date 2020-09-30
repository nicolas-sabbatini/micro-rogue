local Loader = {}
Loader.__index = Loader

Loader.img = love.graphics.newImage('assets/img/micro-map.png')

function Loader.map_quads()
    local quads = {
        walls ={
            -- Top left
            tl = {
                love.graphics.newQuad( 0,  0, 8, 8, Loader.img:getDimensions()),
            },
            -- Top rigth
            tr = {
                love.graphics.newQuad(24,  0, 8, 8, Loader.img:getDimensions()),
            },
            -- Bot left
            bl = {
                love.graphics.newQuad( 0, 16, 8, 8, Loader.img:getDimensions()),
            },
            -- Bot rigth
            br = {
                love.graphics.newQuad(24, 16, 8, 8, Loader.img:getDimensions()),
            },
            -- Side wall
            s = {
                love.graphics.newQuad( 0, 8, 8, 8, Loader.img:getDimensions()),
            },
            -- Horizontal Wall
            h = {
                -- Normal
                love.graphics.newQuad( 8,  0, 8, 8, Loader.img:getDimensions()),
                -- Sewer
                love.graphics.newQuad( 8, 16, 8, 8, Loader.img:getDimensions()),
            }
        },
        arch = {
            -- Side arch
            s = { 
                love.graphics.newQuad(24, 8, 8, 8, Loader.img:getDimensions()),
            },
            -- Horizontal arch
            h = {
                love.graphics.newQuad( 0, 24, 8, 8, Loader.img:getDimensions()),
            }
        },
        trap = {
            love.graphics.newQuad( 8, 8, 8, 8, Loader.img:getDimensions()),
        },
        columns = {
            love.graphics.newQuad( 8, 24, 8, 8, Loader.img:getDimensions()),
        },
        floor = {
            love.graphics.newQuad( 16, 8, 8, 8, Loader.img:getDimensions()),
        }
    }
    return quads
end

return Loader