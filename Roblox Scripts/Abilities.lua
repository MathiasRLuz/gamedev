local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")

local db_tp = false

local function doTeleport()
	local player = Players.LocalPlayer
	local character = player.Character
	if character and character.Parent then
		-- check if player has the ability
		if player:GetAttribute("Cuckoo") then
			-- Move the character 20 studs forwards in the direction they're facing
			if not db_tp then
				db_tp = true
				local currentPivot = character:GetPivot()
				character:PivotTo(currentPivot * CFrame.new(0, 0, -20))	
				wait(10)
				db_tp = false
			end
		end
	end
end

ContextActionService:BindAction("Dash", doTeleport, true, Enum.KeyCode.F)


local db = false

local function ampulheta()
	local player = Players.LocalPlayer
	local character = player.Character
	if character and character.Parent then
		-- Move the character 10 studs forwards in the direction they're facing
		if player:GetAttribute("TimeAmpulheta") > 0  then
			if not db then
				db = true
				character:PivotTo(CFrame.new(player:GetAttribute("CheckpointAmpulheta")) + Vector3.new(0, 4, 0))
				--player:SetAttribute("TimeAmpulheta",0)		
				wait(1)			
				db = false	
			end			
		else			
			if not db then
				db = true
				player:SetAttribute("CheckpointAmpulheta",character.PrimaryPart.Position)
				player:SetAttribute("TimeAmpulheta",15)			
				wait(1)			
				db = false	
			end			
		end
	end
end

ContextActionService:BindAction("Set position", ampulheta, true, Enum.KeyCode.H)
local RunService = game:GetService("RunService")
RunService.Stepped:Connect(function(time_,deltaTime)
	local player = game.Players.LocalPlayer
	if player:GetAttribute("TimeAmpulheta") > 0 then
		player:SetAttribute("TimeAmpulheta",player:GetAttribute("TimeAmpulheta")-deltaTime)	
	else
		player:SetAttribute("TimeAmpulheta",0)
	end
	
end)