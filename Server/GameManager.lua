local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")

local Modules = ServerStorage:WaitForChild("Modules")
local GameSettings = require(Modules:WaitForChild("GameSettings"))
local MatchManager = require(Modules:WaitForChild("MatchManager"))

--Game Loop
while true do
	repeat
		
		wait(GameSettings.intermissionDuration)

		print("Starting Intermission!")
		
	until #Players:GetPlayers() >= GameSettings.minimumPlayers
	
	print("Intermission Over!")

	wait(GameSettings.transitionTime)
	
	MatchManager:PrepareGame()
end