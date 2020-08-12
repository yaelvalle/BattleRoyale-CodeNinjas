local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")

--Map Variables
local Map = workspace:WaitForChild("Map")	--!IMPORTANT!: Make sure your Map is a model with all your map assets inside
local MapSpawns = workspace:WaitForChild("MapSpawns")	--!IMPORTANT!: Make sure all of your |Spawn Locations| are in a |Model|, inside of your Map

--Lobby Variables
local Lobby = workspace:WaitForChild("Lobby")	--!IMPORTANT!: Make sure your Lobby is a model with all your lobby assets inside
local LobbySpawn = Lobby:WaitForChild("SpawnLocation")	--!IMPORTANT!: If you have more than 1 |Spawn Location| store them inside a |Model| inside of your Lobby Model

--Weapons
local Weapon = ServerStorage.Weapons.Sword

--Players who are currently in the Map fighting
local activePlayers = {}

local PlayerManager = {}

--Spawns the player at the assigned spawnLocation and gives them a weapon
local function preparePlayer(player, spawnLocation)
	player.RespawnLocation = spawnLocation
	player:LoadCharacter()

	local character = player.CharacterAdded:Wait()
	local sword = Weapon:Clone()
	sword.Parent = character
end

--Sends the current player 
function PlayerManager:SendPlayerToMatch()
	print("Sending Player To Match!")

	--Creates a list of all our map spawns
	local mapSpawns = MapSpawns:GetChildren()

	--Loops through each player and assign them a spawnLocation
	for i, player in pairs(Players:GetChildren()) do
		local spawnLocation = mapSpawns[1]

		preparePlayer(player, spawnLocation)

		--Add the player to the activePlayers list
		table.insert(activePlayers, player)

		--Remove the current spawnLocation from the list
		table.remove(mapSpawns, 1)
	end
end

Players.PlayerAdded:Connect(function(player)
	player.RespawnLocation = LobbySpawn
end)

return PlayerManager
