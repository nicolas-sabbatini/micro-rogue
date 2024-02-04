-- Setup filter
love.graphics.setDefaultFilter("nearest", "nearest")

-- Globals variables
REAL_WIDTH = 800
REAL_HEIGHT = 600
FAKE_WIDTH = 400
FAKE_HEIGHT = 300

-- Setup fonts
FONT_SMALL = love.graphics.newFont("assets/fonts/8-BIT_WONDER.TTF", 8)
FONT_MEDIUM = love.graphics.newFont("assets/fonts/8-BIT_WONDER.TTF", 16)
FONT_BIG = love.graphics.newFont("assets/fonts/8-BIT_WONDER.TTF", 34)

-- Input table
KEY_TABLE = {}

-- Utils
UTILS = {}

-- Focus
IN_FOCUS = false
