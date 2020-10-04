local Loader = {}
Loader.__index = Loader

Loader.img = love.graphics.newImage('assets/img/micro-map.png')

function Loader.walls(x, y, wide, height, table)
    local quads = table or {}
    -- 1
    quads['00001011'] = love.graphics.newQuad(x + (wide * 0), y, wide, height, Loader.img:getDimensions())
    quads['00011111'] = love.graphics.newQuad(x + (wide * 1), y, wide, height, Loader.img:getDimensions())
    quads['00010110'] = love.graphics.newQuad(x + (wide * 2), y, wide, height, Loader.img:getDimensions())
    quads['00000010'] = love.graphics.newQuad(x + (wide * 3), y, wide, height, Loader.img:getDimensions())
    quads['00001010'] = love.graphics.newQuad(x + (wide * 4), y, wide, height, Loader.img:getDimensions())
    quads['00011110'] = love.graphics.newQuad(x + (wide * 5), y, wide, height, Loader.img:getDimensions())
    quads['00011011'] = love.graphics.newQuad(x + (wide * 6), y, wide, height, Loader.img:getDimensions())
    quads['00010010'] = love.graphics.newQuad(x + (wide * 7), y, wide, height, Loader.img:getDimensions())
    quads['00011010'] = love.graphics.newQuad(x + (wide * 8), y, wide, height, Loader.img:getDimensions())
    quads['11011011'] = love.graphics.newQuad(x + (wide * 9), y, wide, height, Loader.img:getDimensions())
    -- 2
    quads['01101011'] = love.graphics.newQuad(x + (wide * 0), y + height, wide, height, Loader.img:getDimensions())
    quads['11111111'] = love.graphics.newQuad(x + (wide * 1), y + height, wide, height, Loader.img:getDimensions())
    quads['11010110'] = love.graphics.newQuad(x + (wide * 2), y + height, wide, height, Loader.img:getDimensions())
    quads['01000010'] = love.graphics.newQuad(x + (wide * 3), y + height, wide, height, Loader.img:getDimensions())
    quads['01101010'] = love.graphics.newQuad(x + (wide * 4), y + height, wide, height, Loader.img:getDimensions())
    quads['11111110'] = love.graphics.newQuad(x + (wide * 5), y + height, wide, height, Loader.img:getDimensions())
    quads['11111011'] = love.graphics.newQuad(x + (wide * 6), y + height, wide, height, Loader.img:getDimensions())
    quads['11010010'] = love.graphics.newQuad(x + (wide * 7), y + height, wide, height, Loader.img:getDimensions())
    quads['11111010'] = love.graphics.newQuad(x + (wide * 8), y + height, wide, height, Loader.img:getDimensions())
    quads['01111110'] = love.graphics.newQuad(x + (wide * 9), y + height, wide, height, Loader.img:getDimensions())
    -- 3
    quads['01101000'] = love.graphics.newQuad(x + (wide *  0), y + (height * 2), wide, height, Loader.img:getDimensions())
    quads['11111000'] = love.graphics.newQuad(x + (wide *  1), y + (height * 2), wide, height, Loader.img:getDimensions())
    quads['11010000'] = love.graphics.newQuad(x + (wide *  2), y + (height * 2), wide, height, Loader.img:getDimensions())
    quads['01000000'] = love.graphics.newQuad(x + (wide *  3), y + (height * 2), wide, height, Loader.img:getDimensions())
    quads['01001011'] = love.graphics.newQuad(x + (wide *  4), y + (height * 2), wide, height, Loader.img:getDimensions())
    quads['11011111'] = love.graphics.newQuad(x + (wide *  5), y + (height * 2), wide, height, Loader.img:getDimensions())
    quads['01111111'] = love.graphics.newQuad(x + (wide *  6), y + (height * 2), wide, height, Loader.img:getDimensions())
    quads['01010110'] = love.graphics.newQuad(x + (wide *  7), y + (height * 2), wide, height, Loader.img:getDimensions())
    quads['01011111'] = love.graphics.newQuad(x + (wide *  8), y + (height * 2), wide, height, Loader.img:getDimensions())
    quads['01011011'] = love.graphics.newQuad(x + (wide *  9), y + (height * 2), wide, height, Loader.img:getDimensions())
    quads['01011110'] = love.graphics.newQuad(x + (wide * 10), y + (height * 2), wide, height, Loader.img:getDimensions())
    -- 4
    quads['00001000'] = love.graphics.newQuad(x + (wide *  0), y + (height * 3), wide, height, Loader.img:getDimensions())
    quads['00011000'] = love.graphics.newQuad(x + (wide *  1), y + (height * 3), wide, height, Loader.img:getDimensions())
    quads['00010000'] = love.graphics.newQuad(x + (wide *  2), y + (height * 3), wide, height, Loader.img:getDimensions())
    quads['00000000'] = love.graphics.newQuad(x + (wide *  3), y + (height * 3), wide, height, Loader.img:getDimensions())
    quads['01001000'] = love.graphics.newQuad(x + (wide *  4), y + (height * 3), wide, height, Loader.img:getDimensions())
    quads['11011000'] = love.graphics.newQuad(x + (wide *  5), y + (height * 3), wide, height, Loader.img:getDimensions())
    quads['01111000'] = love.graphics.newQuad(x + (wide *  6), y + (height * 3), wide, height, Loader.img:getDimensions())
    quads['01010000'] = love.graphics.newQuad(x + (wide *  7), y + (height * 3), wide, height, Loader.img:getDimensions())
    quads['01011000'] = love.graphics.newQuad(x + (wide *  8), y + (height * 3), wide, height, Loader.img:getDimensions())
    quads['01111010'] = love.graphics.newQuad(x + (wide *  9), y + (height * 3), wide, height, Loader.img:getDimensions())
    quads['11011010'] = love.graphics.newQuad(x + (wide * 10), y + (height * 3), wide, height, Loader.img:getDimensions())
    -- 5
    quads['01001010'] = love.graphics.newQuad(x + (wide * 4), y + (height * 4), wide, height, Loader.img:getDimensions())
    quads['11011110'] = love.graphics.newQuad(x + (wide * 5), y + (height * 4), wide, height, Loader.img:getDimensions())
    quads['01111011'] = love.graphics.newQuad(x + (wide * 6), y + (height * 4), wide, height, Loader.img:getDimensions())
    quads['01010010'] = love.graphics.newQuad(x + (wide * 7), y + (height * 4), wide, height, Loader.img:getDimensions())
    quads['01011010'] = love.graphics.newQuad(x + (wide * 8), y + (height * 4), wide, height, Loader.img:getDimensions())
    return quads
end

function Loader.extras(x, y, wide, height, table)
    local quads = table or {}
    -- Extras
    quads['floor'] = love.graphics.newQuad(x, y + (height * 4), wide, height, Loader.img:getDimensions())
    quads['door'] = {
        open   = love.graphics.newQuad(x + (wide *  1), y + (height * 4), wide, height, Loader.img:getDimensions()),
        closed = love.graphics.newQuad(x + (wide *  2), y + (height * 4), wide, height, Loader.img:getDimensions()),
        locked = love.graphics.newQuad(x + (wide *  3), y + (height * 4), wide, height, Loader.img:getDimensions()),
    }
    return quads
end

function Loader.player(x, y, wide, height, table)
    local quads = table or {}
    quads['play'] = {
        love.graphics.newQuad( x + (wide * 10), y, wide, height, Loader.img:getDimensions()),
    }
end

return Loader