---@module 'state_manager'

local PlayState = CREATE_NEW_STATE()

function PlayState:enter()
	print("Enter PlayState")
end

return PlayState
