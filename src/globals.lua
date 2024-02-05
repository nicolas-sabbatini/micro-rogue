WINDOW_WIDTH = 800
WINDOW_HEIGHT = 600
GAME_WIDTH = 400
GAME_HEIGHT = 300

FONT_SMALL = love.graphics.newFont("assets/fonts/8-BIT_WONDER.TTF", 8)
FONT_MEDIUM = love.graphics.newFont("assets/fonts/8-BIT_WONDER.TTF", 16)
FONT_BIG = love.graphics.newFont("assets/fonts/8-BIT_WONDER.TTF", 34)

IN_FOCUS = false

PUSH = require("vendors/push")

local function getMousePosition()
	local x, y = love.mouse.getPosition()
	local p_x, p_y = PUSH:toGame(x, y)
	if not p_x and x < WINDOW_WIDTH / 2 then
		p_x = 0
	end
	if not p_x and x > WINDOW_WIDTH / 2 then
		p_x = GAME_WIDTH
	end
	if not p_y and y < WINDOW_HEIGHT / 2 then
		p_y = 0
	end
	if not p_y and y > WINDOW_HEIGHT / 2 then
		p_y = GAME_HEIGHT
	end
	if IN_FOCUS then
		return p_x, p_y
	end
	return nil, nil
end

local function screenToHumpCamera(hump_camera, width, height)
	local x, y = getMousePosition()
	x = x or 0
	y = y or 0
	return hump_camera:worldCoords(x, y, 0, 0, width, height)
end
UTILS_FUNCTONS = {
	screenToHumpCamera = screenToHumpCamera,
	getMousePosition = getMousePosition,
}
