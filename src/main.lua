require './shared/globals'

local push = require './libs/push'
local Loader = require './components/img-loader'
local static = require './components/static-map'

-- Push set up
function love.resize(w, h)
    push:resize(w, h)
end

love.graphics.setDefaultFilter('nearest', 'nearest')

push:setupScreen(FAKE_WIDTH, FAKE_HEIGHT, REAL_WIDTH, REAL_HEIGHT, {
    vsync = true,
    fullscreen = false,
    resizable = true,
  })
--

local help

function love.load()
  help = Loader.map_quads()
  static.create_map(help)
end

function love.update(dt)
end

function love.draw()
  push:start()
  static.draw(10, 10, Loader.img)
  
  push:finish()
end
