local ServerStorage = game:GetService("ServerStorage")

local Modules = ServerStorage:WaitForChild("Modules")
local PlayerManager = require(Modules.PlayerManager)

local MatchManager = {}

function MatchManager:PrepareGame()
	PlayerManager:SendPlayersToMatch()
end

return MatchManager