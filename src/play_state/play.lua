--- @module "state_manager"
--- @module "globals"

--- @class PlayState : State
local PlayState = CREATE_NEW_STATE()

function PlayState:enter()
	self.camera = NEW_CAMERA()
end

return PlayState
