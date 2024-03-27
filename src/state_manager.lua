--- @class State
--- @field enter function
--- @field update fun(self: State, dt: number): Commands, nil | State | number, nil | number
--- @field update_pause fun(self: State, dt: number)
--- @field draw function
--- @field draw_pause function
--- @field clean function

--- Create a new state to manipulate
--- @return State
function CREATE_NEW_STATE()
	return {
		enter = function() end,
		update = function()
			return "NOP", nil
		end,
		update_pause = function() end,
		draw = function() end,
		draw_pause = function() end,
		clean = function() end,
	}
end

--- @class StateManager
--- @field package stack State[]
--- @field package stack_size number
--- @field name string Name of the state manager
--- @field push fun(self: StateManager, state: State) Push a state to the stack
--- @field package pop fun(self: StateManager, amount: integer) Pops an amount of states and calls the clean function on each
--- @field update fun(self: StateManager, dt: number) Update the stack
--- @field draw fun(self: StateManager) Draws the stack
--- @field clean_all fun(self: StateManager) Pops the stack and calls the clean function on each

--- @enum (key) Commands
local commands = {
	NOP = function() end,
	POP = function(state_manager, amount)
		state_manager:pop(amount)
	end,
	POP_REPLEASE = function(state_manager, state, amount)
		state_manager:pop(amount or 1)
		state_manager:push(state)
	end,
	QUIT = function(state_manager)
		state_manager:pop(state_manager.stack_size)
		love.event.quit()
	end,
}

local StateManager = {}
StateManager.__index = StateManager

function StateManager:push(state)
	table.insert(self.stack, state)
	self.stack_size = #self.stack
	state.enter()
end

function StateManager:pop(amount)
	for _ = 1, amount do
		local poped_state = table.remove(self.stack)
		assert(poped_state, "Attempt to pop a nil state on " .. self.name)
		poped_state:clean()
	end
	self.stack_size = #self.stack_size
end

function StateManager:update(dt)
	assert(self.stack_size > 0, "Attempt to update and empty stack on " .. self.name)
	for i = 1, self.stack_size - 1 do
		self.stack[i]:update_pause(dt)
	end
	local command, v1, v2 = self.stack[self.stack_size]:update(dt)
	commands[command](self, v1, v2)
end

function StateManager:draw()
	assert(self.stack_size > 0, "Attempt to draw and empty stack on " .. self.name)
	for i = 1, self.stack_size - 1 do
		self.stack[i]:draw_pause()
	end
	self.stack[self.stack_size]:draw()
end

function StateManager:clean_all()
	self:pop(self.stack_size)
end

--- Creates a new State manager
--- @param name string
--- @return StateManager
function CREATE_NEW_STATE_MANAGER(name)
	local state_manager = {
		name = name,
		stack = {},
		stack_size = 0,
	}
	setmetatable(state_manager, StateManager)
	return state_manager
end
