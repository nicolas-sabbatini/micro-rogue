require './shared/globals'

local push = require './libs/push'

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

function love.load()
end

function love.update(dt)
end

function love.draw()
  push:start()
  love.graphics.print('Hola', 10, 10)
  push:finish()
end
