local Players = game:GetService("Players")

local function onCharacterAdded(character)
	print(character.Name .. " has spawned")	
	local Mod = game.ServerStorage.Car -- name of the car
	local clone = Mod:Clone()
	wait(1)
	print(character.HumanoidRootPart.CFrame.Position)
	clone:PivotTo(CFrame.new(character.HumanoidRootPart.CFrame.Position)+Vector3.new(10,0,10))		
	clone.Parent = workspace.Carros
	clone:MakeJoints()
end

local function onCharacterRemoving(character)
	print(character.Name .. " is despawning")
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(onCharacterAdded)
	player.CharacterRemoving:Connect(onCharacterRemoving)
end

Players.PlayerAdded:Connect(onPlayerAdded)