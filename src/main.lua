require("globals")

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	PUSH:setupScreen(GAME_WIDTH, GAME_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = false,
		resizable = true,
	})
end

function love.resize(w, h)
	PUSH:resize(w, h)
end

function love.focus(f)
	if not f then
		IN_FOCUS = false
	else
		IN_FOCUS = true
	end
end

function love.draw()
	love.graphics.clear(0.0, 0.0, 0.0)
	PUSH:start()
	love.graphics.clear(0.1, 0.1, 0.1)
	PUSH:finish()
	love.graphics.print("Current FPS: " .. tostring(love.timer.getFPS()), 0, 0)
end
