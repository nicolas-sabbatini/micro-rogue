-- Load globals
require './shared/globals'

-- Load libs
local push = require './libs/push'
local Loader = require './components/img-loader'
local Map = require './components/map'
-- Load states
-- TODO

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

function UTILS.screen_to_hump(hump_camera)
  local x, y = push:toGame(love.mouse.getPosition())
  x = x or 0
  y = y or 0
  return hump_camera:worldCoords(x, y, 0, 0, FAKE_WIDTH, FAKE_HEIGHT)
end
--

-- Set up imputs
function love.keypressed(key)
  KEY_TABLE[key] = true
end
--

-- tamp variables
local map_quads, player_quads
local map_x_offset, map_y_offset, map_zoom = 0, 0, 1

function love.load()
  map_quads = Loader.walls(0, 0, 8, 8)
  map_quads = Loader.extras(0, 0, 8, 8, map_quads)
  player_quads = Loader.player(0, 0, 8, 8)
  Map.set_tiles(static.map, map_quads)
  Map.create_camera(static.map, map_x_offset, map_y_offset, map_zoom)
end

function love.update(dt)
  if KEY_TABLE['escape'] then love.event.quit() end

  if love.keyboard.isDown('w') then  map_y_offset = map_y_offset + ( 100 * dt) end
  if love.keyboard.isDown('s') then  map_y_offset = map_y_offset + (-100 * dt) end
  if love.keyboard.isDown('a') then  map_x_offset = map_x_offset + ( 100 * dt) end
  if love.keyboard.isDown('d') then  map_x_offset = map_x_offset + (-100 * dt) end
  if love.keyboard.isDown('.') then  map_zoom = map_zoom + (0.15 * dt); static.map.camera:zoomTo(map_zoom) end
  if love.keyboard.isDown(',') then  map_zoom = map_zoom - (0.15 * dt); static.map.camera:zoomTo(map_zoom) end

  KEY_TABLE = {}
end

function love.draw()
  push:start()
  Map.draw(static.map, Loader.img, math.floor(map_x_offset), math.floor(map_y_offset))
  push:finish()
  love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
end
