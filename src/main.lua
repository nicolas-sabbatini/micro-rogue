-- Load globals
require("./shared/globals")

-- Load libs
local push = require("./libs/push")

-- Load states
local Play = require("./states/play")
-- TODO

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

-- Focus handeling
function love.focus(f)
	if not f then
		IN_FOCUS = false
	else
		IN_FOCUS = true
	end
end
--

-- Util functions
function UTILS.screen_to_hump(hump_camera, width, height)
	local x, y = push:toGame(love.mouse.getPosition())
	x = x or 0
	y = y or 0
	return hump_camera:worldCoords(x, y, 0, 0, width, height)
end

function UTILS.get_mouse_position()
	local x, y = love.mouse.getPosition()
	local p_x, p_y = push:toGame(x, y)
	if not p_x and x < REAL_WIDTH / 2 then
		p_x = 0
	end
	if not p_x and x > REAL_WIDTH / 2 then
		p_x = FAKE_WIDTH
	end
	if not p_y and y < REAL_HEIGHT / 2 then
		p_y = 0
	end
	if not p_y and y > REAL_HEIGHT / 2 then
		p_y = FAKE_HEIGHT
	end
	if IN_FOCUS then
		return p_x, p_y
	end
	return nil, nil
end

function love.wheelmoved(x, y)
	Play.wheelmoved(x, y)
end
--

-- Set up imputs
function love.keypressed(key)
	KEY_TABLE[key] = true
end
--

function love.load()
	Play.load()
end

function love.update(dt)
	if KEY_TABLE["escape"] then
		love.event.quit()
	end
	Play.update(dt)
	KEY_TABLE = {}
end

function love.draw()
	push:start()
	love.graphics.setColor(0.1, 0.1, 0.1)
	love.graphics.rectangle("fill", 0, 0, FAKE_WIDTH, FAKE_HEIGHT)
	love.graphics.setColor(1, 1, 1)
	Play.draw()
	push:finish()
	love.graphics.print("Current FPS: " .. tostring(love.timer.getFPS()), 0, 0)
end
