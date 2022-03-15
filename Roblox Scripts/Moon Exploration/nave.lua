local naNave = {}
local core = script.Parent.Parent.Core
local ponte = script.Parent.Parent.Bridge.Motor

-- verifica se alguém entrou na nave
core.Touched:Connect(function(obj_tocou)
	local Character = obj_tocou.Parent
	if  Character:FindFirstChild("Humanoid") ~= nil then
		local Player = game.Players:GetPlayerFromCharacter(Character)
		if table.find(naNave,Player.Name) == nil then
			table.insert(naNave,Player.Name)
		end
	end
end)

-- verifica se alguém saiu da nave
ponte.Touched:Connect(function(obj_tocou)
	local Character = obj_tocou.Parent
	if  Character:FindFirstChild("Humanoid") ~= nil then
		local Player = game.Players:GetPlayerFromCharacter(Character)
		if table.find(naNave,Player.Name) ~= nil then
			table.remove(naNave,table.find(naNave,Player.Name))
		end
	end
end)

local function decolar()
	-- Original Script

	script.Parent.ClickDetector.MaxActivationDistance=0	
	script.Parent.Parent.Alarm.Alarm:Play()	
	for i=255,0,-5 do
		script.Parent.Parent.Ladder_light.Color=Color3.fromRGB(255,i,i)
		script.Parent.Color=Color3.fromRGB(0,i,0)
		wait()
	end
	wait(8.5)
	for i=1,0,-0.1 do
		script.Parent.Parent.Alarm.Alarm.Volume=i
		wait()
	end
	script.Parent.Parent.Door.CanCollide=true
	for i=-6.9,0,0.2 do
		script.Parent.Parent.Door.Mesh.Offset=Vector3.new(0,i,0)
		wait()	
	end
	script.Parent.Parent.Bridge.Part.Sound:Play()
	for i=1,180 do
		script.Parent.Parent.Bridge:SetPrimaryPartCFrame(script.Parent.Parent.Bridge.PrimaryPart.CFrame * CFrame.fromEulerAnglesXYZ(0,math.rad(0.5),0))
		wait(0.0328)
	end
	script.Parent.Parent.Alarm.Countdown:Play()
	wait(10) 
	script.Parent.Parent.E1.Color=Color3.new(0,1,0)
	script.Parent.Parent.Emi1.Flame.Enabled=true
	script.Parent.Parent.Emi1.Smoke.Enabled=true
	script.Parent.Parent.Emi2.Flame.Enabled=true
	script.Parent.Parent.Emi2.Smoke.Enabled=true
	script.Parent.Parent.Emi3.Flame.Enabled=true
	script.Parent.Parent.Emi3.Smoke.Enabled=true
	script.Parent.Parent.Emi4.Flame.Enabled=true
	script.Parent.Parent.Emi4.Smoke.Enabled=true
	script.Parent.Parent.Emi5.Sound:Play()
	wait(3)
	script.Parent.Parent.Core.Anchored=false
	script.Parent.Parent.Separate2.Anchored=false
	script.Parent.Parent.Emi1.Smoke.Enabled=false
	script.Parent.Parent.Emi2.Smoke.Enabled=false
	script.Parent.Parent.Emi3.Smoke.Enabled=false
	script.Parent.Parent.Emi4.Smoke.Enabled=false
	script.Parent.Parent.Emi1.Smoke2.Enabled=true
	script.Parent.Parent.Emi2.Smoke2.Enabled=true
	script.Parent.Parent.Emi3.Smoke2.Enabled=true
	script.Parent.Parent.Emi4.Smoke2.Enabled=true
	script.Parent.Parent.Fuel.Decoupler:Play()
	for i=0,300,0.5 do
		script.Parent.Parent.Core.BodyVelocity.Velocity=Vector3.new(0,i,0)
		wait()
	end
	wait(10)
	script.Parent.Parent.E1.Color=Color3.new(1,0,0)
	script.Parent.Parent.Emi1.Flame.Enabled=false
	script.Parent.Parent.Emi1.Smoke2.Enabled=false
	script.Parent.Parent.Emi2.Flame.Enabled=false
	script.Parent.Parent.Emi2.Smoke2.Enabled=false
	script.Parent.Parent.Emi3.Flame.Enabled=false
	script.Parent.Parent.Emi3.Smoke2.Enabled=false
	script.Parent.Parent.Emi4.Flame.Enabled=false
	script.Parent.Parent.Emi4.Smoke2.Enabled=false
	script.Parent.Parent.Emi5.Sound:Stop()
	wait(1)
	script.Parent.Parent.E2.Color=Color3.new(0,1,0)
	script.Parent.Parent.Booster1.WeldConstraint:Destroy()
	script.Parent.Parent.Booster2.WeldConstraint:Destroy()
	script.Parent.Parent.Booster3.WeldConstraint:Destroy()
	script.Parent.Parent.Booster4.WeldConstraint:Destroy()
	script.Parent.Parent.Emi5.Sound:Play()
	script.Parent.Parent.Fuel.Decoupler:Play()
	script.Parent.Parent.Emi5.Flame.Enabled=true
	script.Parent.Parent.Emi5.Smoke.Enabled=true
	script.Parent.Parent.Nosecone.WeldConstraint:Destroy()
	script.Parent.Parent.Nosecone.Velocity=Vector3.new(math.random(-50,50),350,math.random(-50,50))
	wait(30)
	script.Parent.Parent.E2.Color=Color3.new(1,0,0)
	script.Parent.Parent.Emi5.Sound:Stop()
	script.Parent.Parent.Emi5.Flame.Enabled=false
	script.Parent.Parent.Emi5.Smoke.Enabled=false
	wait(2)
	script.Parent.Parent.Separate1.Weld:Destroy()
	script.Parent.Parent.Separate1.Decoupler:Play()
	script.Parent.Parent.Emi6.Sound:Play()
	script.Parent.Parent.Emi6.Flame.Enabled=true
	script.Parent.Parent.E3.Color=Color3.new(0,1,0)
	wait(30)
	script.Parent.Parent.Emi6.Sound:Stop()
	script.Parent.Parent.Emi6.Flame.Enabled=false
	script.Parent.Parent.E3.Color=Color3.new(1,0,0)
	wait(3)
	script.Parent.Parent.Separate2.Weld:Destroy()
	script.Parent.Parent.Separate2.Decoupler:Play()
end

local function voo()
	decolar()

	-- Teleporte dos players dentro da nave
	for elemento,valor in ipairs(naNave) do
		local Player = game.Players:GetPlayerByUserId(game.Players:GetUserIdFromNameAsync(valor))
		script.Parent.RemoteEvent:FireClient(Player)
		Player.Team = game.Teams.Lua
		Player:SetAttribute("Time",2)
		local Humanoid = Player.Character:WaitForChild("Humanoid")
		Player:LoadCharacterWithHumanoidDescription(Humanoid:GetAppliedDescription())				
	end	
end

local function tentaVoar()
	local podeVoar = true
	
	for elemento,valor in ipairs(naNave) do
		local Player = game.Players:GetPlayerByUserId(game.Players:GetUserIdFromNameAsync(valor))
		if Player:GetAttribute("Astronauta") == 0  then
			podeVoar = false
			print(valor .. " não é um astronauta")
			game.ReplicatedStorage.mostrarMsgEquipamento:FireClient(Player)
		end
	end
	
	if podeVoar then
		voo()
	end
end

script.Parent.ClickDetector.MouseClick:Connect(tentaVoar)