require("globals")
require("state_manager")
local play_state = require("play_state.play")

local app_state = CREATE_NEW_STATE_MANAGER("App state manager")

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	PUSH:setupScreen(GAME_WIDTH, GAME_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = false,
		resizable = true,
	})
	app_state:push(play_state)
end

function love.resize(w, h)
	PUSH:resize(w, h)
end

function love.focus(f)
	IN_FOCUS = f
end

function love.update(dt)
	app_state:update(dt)
end

function love.draw()
	love.graphics.clear(0.0, 0.0, 0.0)
	PUSH:start()
	app_state:draw()
	love.graphics.clear(0.1, 0.1, 0.1)
	PUSH:finish()
end
