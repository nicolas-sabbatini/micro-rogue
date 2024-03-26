-- Game settings
WINDOW_WIDTH = 800
WINDOW_HEIGHT = 600
GAME_WIDTH = 400
GAME_HEIGHT = 300

-- Fonts and global assets
FONT_SMALL = love.graphics.newFont("assets/fonts/Micro_Chat.ttf", 5)
FONT_MEDIUM = love.graphics.newFont("assets/fonts/Micro_Chat.ttf", 10)
FONT_BIG = love.graphics.newFont("assets/fonts/Micro_Chat.ttf", 15)

FONT_CUTOUT_SMALL = love.graphics.newFont("assets/fonts/Micro_Chat_Cutout.ttf", 5)
FONT_CUTOUT_MEDIUM = love.graphics.newFont("assets/fonts/Micro_Chat_Cutout.ttf", 10)
FONT_CUTOUT_BIG = love.graphics.newFont("assets/fonts/Micro_Chat_Cutout.ttf", 15)

-- On focus Variable
IN_FOCUS = false

-- Push library
PUSH = require("vendors/push")

function GET_MOUSE_POSITION()
	if not IN_FOCUS then
		return nil, nil
	end
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
	return p_x, p_y
end

-- Game camera settings
local camera = require("vendors.camera")
GAME_CAMERA = camera.new(GAME_WIDTH / 2, GAME_HEIGHT / 2)

function SCREEN_TO_GAME_CAMERA()
	if not IN_FOCUS then
		return nil, nil
	end
	local x, y = GET_MOUSE_POSITION()
	return GAME_CAMERA:worldCoords(x, y, 0, 0, GAME_WIDTH, GAME_HEIGHT)
end

function ATTACH_GAME_CAMERA()
	GAME_CAMERA:attach(0, 0, GAME_WIDTH, GAME_HEIGHT, true)
end

function DETACH_GAME_CAMERA()
	GAME_CAMERA:detach()
end
