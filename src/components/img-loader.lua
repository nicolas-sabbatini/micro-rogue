local Loader = {}
Loader.__index = Loader

Loader.img = love.graphics.newImage('assets/img/micro-map.png')

--love.graphics.newQuad( 0, 8, 8, 8, Loader.img:getDimensions()),

function Loader.walls()
    local quads = {}
    -- 1
    quads['00001011'] = love.graphics.newQuad(  0, 0, 8, 8, Loader.img:getDimensions())
    quads['00011111'] = love.graphics.newQuad(  8, 0, 8, 8, Loader.img:getDimensions())
    quads['00010110'] = love.graphics.newQuad( 16, 0, 8, 8, Loader.img:getDimensions())
    quads['00000010'] = love.graphics.newQuad( 24, 0, 8, 8, Loader.img:getDimensions())
    quads['00001010'] = love.graphics.newQuad( 32, 0, 8, 8, Loader.img:getDimensions())
    quads['00011110'] = love.graphics.newQuad( 40, 0, 8, 8, Loader.img:getDimensions())
    quads['00011011'] = love.graphics.newQuad( 48, 0, 8, 8, Loader.img:getDimensions())
    quads['00010010'] = love.graphics.newQuad( 56, 0, 8, 8, Loader.img:getDimensions())
    quads['00011010'] = love.graphics.newQuad( 64, 8, 8, 8, Loader.img:getDimensions())
    quads['11011011'] = love.graphics.newQuad( 72, 0, 8, 8, Loader.img:getDimensions())
    -- 2
    quads['01101011'] = love.graphics.newQuad(  0, 8, 8, 8, Loader.img:getDimensions())
    quads['11111111'] = love.graphics.newQuad(  8, 8, 8, 8, Loader.img:getDimensions())
    quads['11010110'] = love.graphics.newQuad( 16, 8, 8, 8, Loader.img:getDimensions())
    quads['01000010'] = love.graphics.newQuad( 24, 8, 8, 8, Loader.img:getDimensions())
    quads['01101010'] = love.graphics.newQuad( 32, 8, 8, 8, Loader.img:getDimensions())
    quads['11111110'] = love.graphics.newQuad( 40, 8, 8, 8, Loader.img:getDimensions())
    quads['11111011'] = love.graphics.newQuad( 48, 8, 8, 8, Loader.img:getDimensions())
    quads['11010010'] = love.graphics.newQuad( 56, 8, 8, 8, Loader.img:getDimensions())
    quads['11111010'] = love.graphics.newQuad( 64, 8, 8, 8, Loader.img:getDimensions())
    quads['01111110'] = love.graphics.newQuad( 72, 8, 8, 8, Loader.img:getDimensions())
    -- 3
    quads['01101000'] = love.graphics.newQuad(  0, 16, 8, 8, Loader.img:getDimensions())
    quads['11111000'] = love.graphics.newQuad(  8, 16, 8, 8, Loader.img:getDimensions())
    quads['11010000'] = love.graphics.newQuad( 16, 16, 8, 8, Loader.img:getDimensions())
    quads['01000000'] = love.graphics.newQuad( 24, 16, 8, 8, Loader.img:getDimensions())
    quads['01001011'] = love.graphics.newQuad( 32, 16, 8, 8, Loader.img:getDimensions())
    quads['11011111'] = love.graphics.newQuad( 40, 16, 8, 8, Loader.img:getDimensions())
    quads['01111111'] = love.graphics.newQuad( 48, 16, 8, 8, Loader.img:getDimensions())
    quads['01010110'] = love.graphics.newQuad( 56, 16, 8, 8, Loader.img:getDimensions())
    quads['01011111'] = love.graphics.newQuad( 64, 16, 8, 8, Loader.img:getDimensions())
    quads['01011011'] = love.graphics.newQuad( 72, 16, 8, 8, Loader.img:getDimensions())
    quads['01011110'] = love.graphics.newQuad( 80, 16, 8, 8, Loader.img:getDimensions())
    -- 4
    quads['00001000'] = love.graphics.newQuad(  0, 24, 8, 8, Loader.img:getDimensions())
    quads['00011000'] = love.graphics.newQuad(  8, 24, 8, 8, Loader.img:getDimensions())
    quads['00010000'] = love.graphics.newQuad( 16, 24, 8, 8, Loader.img:getDimensions())
    quads['00000000'] = love.graphics.newQuad( 24, 24, 8, 8, Loader.img:getDimensions())
    quads['01001000'] = love.graphics.newQuad( 32, 24, 8, 8, Loader.img:getDimensions())
    quads['11011000'] = love.graphics.newQuad( 40, 24, 8, 8, Loader.img:getDimensions())
    quads['01111000'] = love.graphics.newQuad( 48, 24, 8, 8, Loader.img:getDimensions())
    quads['01010000'] = love.graphics.newQuad( 56, 24, 8, 8, Loader.img:getDimensions())
    quads['01011000'] = love.graphics.newQuad( 64, 24, 8, 8, Loader.img:getDimensions())
    quads['01111010'] = love.graphics.newQuad( 72, 24, 8, 8, Loader.img:getDimensions())
    quads['11011010'] = love.graphics.newQuad( 80, 24, 8, 8, Loader.img:getDimensions())
    -- 5
    quads['01001010'] = love.graphics.newQuad( 32, 32, 8, 8, Loader.img:getDimensions())
    quads['11011110'] = love.graphics.newQuad( 40, 32, 8, 8, Loader.img:getDimensions())
    quads['01111011'] = love.graphics.newQuad( 48, 32, 8, 8, Loader.img:getDimensions())
    quads['01010010'] = love.graphics.newQuad( 56, 32, 8, 8, Loader.img:getDimensions())
    quads['01011010'] = love.graphics.newQuad( 64, 32, 8, 8, Loader.img:getDimensions())
    return quads
end

return Loader