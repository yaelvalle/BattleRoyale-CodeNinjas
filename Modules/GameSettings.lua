
--[[
	-<Variable Descriptions>-
	<intermissionDuration>: Time during intermission between when it will check if the required number of players is available
	<matchDuration>: How long a match will last
	<minimumPlayers>: Minimum number of required players needed to start a match
	<transitionTime>: Time between when the match is set to start, and players are teleported to the Map
]]
local GameSettings = {}

GameSettings.intermissionDuration = 5
GameSettings.matchDuration = 10
GameSettings.minimumPlayers = 2
GameSettings.transitionTime = 5

return GameSettings