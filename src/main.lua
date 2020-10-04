require './shared/globals'

local push = require './libs/push'
local Loader = require './components/img-loader'
local Map = require './components/map'
-- Temp deps
local static = require './components/static-map'

-- Push set up
function love.resize(w, h)
    push:resize(w, h)
end

push:setupScreen(FAKE_WIDTH, FAKE_HEIGHT, REAL_WIDTH, REAL_HEIGHT, {
    vsync = true,
    fullscreen = false,
    resizable = true,
  })
--

-- Set up imputs
function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
  KEY_TABLE[key] = true
end
--

local map_quads, player_quads

function love.load()
  map_quads = Loader.walls(0, 0, 8, 8)
  map_quads = Loader.extras(0, 0, 8, 8, map_quads)
  player_quads = Loader.player(0, 0, 8, 8)
  Map.set_tiles(static.map, map_quads)
end

function love.update(dt)
  if KEY_TABLE['escape'] then love.event.quit() end
  KEY_TABLE = {}
end

function love.draw()
  push:start()
  Map.draw(static.map, Loader.img, 0, 0, 2)
  push:finish()
end
