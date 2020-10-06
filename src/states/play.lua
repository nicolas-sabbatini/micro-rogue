local Play = {}
Play.__index = Play

local Map = require './components/map'
local Player = require './components/player'
local Camera = require 'libs.camera'
local Loader = require './components/img-loader'

-- Temp deps
local static = require './components/static-map'

-- tamp variables
local map_quads, player_quads, camera
local offset_x, offset_y, zoom = 200, 150, 1
local time = 0
-- Camera movement
function Play.wheelmoved(x, y)
    if y > 0 then
        zoom = zoom + 0.1
    elseif y < 0 then
        zoom = zoom - 0.1
    end
    zoom = math.max(0.55, math.min(zoom, 3))
    camera:zoomTo(zoom)
    if love.keyboard.isDown('lctrl') then offset_x, offset_y = UTILS.screen_to_hump(camera, FAKE_WIDTH, FAKE_HEIGHT) end
end
--

function Play.load()
    map_quads = Loader.walls(0, 0, 8, 8)
    map_quads = Loader.extras(0, 0, 8, 8, map_quads)
    player_quads = Loader.player(0, 0, 8, 8)
    Map.set_tiles(static, map_quads)
    camera = Camera.new(offset_x, offset_y, zoom, 0, Camera.smooth.damped(10))
end

function Play.update(dt)
    local mouse_x, mouse_y = UTILS.get_mouse_position()
    if mouse_y and mouse_y + 5 > FAKE_HEIGHT then offset_y = offset_y + ( 50 * dt / zoom) end
    if mouse_y and mouse_y - 5 < 0           then offset_y = offset_y + (-50 * dt / zoom) end
    if mouse_x and mouse_x + 5 > FAKE_WIDTH  then offset_x = offset_x + ( 50 * dt / zoom) end
    if mouse_x and mouse_x - 5 < 0           then offset_x = offset_x + (-50 * dt / zoom) end
end

function Play.draw()
    camera:attach(0, 0, FAKE_WIDTH, FAKE_HEIGHT, true)
    camera:lockPosition(math.floor(offset_x), math.floor(offset_y))
    Map.draw(static, Loader.img, 0, 0)
    camera:detach()
end

return Play