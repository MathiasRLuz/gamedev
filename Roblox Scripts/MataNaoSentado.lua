local humanoid = script.Parent.Humanoid
local RunService = game:GetService("RunService")

local tempo = 0
local function onStep(currentTime, deltaTime)
	tempo += deltaTime
	if humanoid:GetState() == Enum.HumanoidStateType.Seated then	
		tempo = 0
	end
	if tempo>5 then
		tempo = 0
		print(humanoid:GetState())		
		if humanoid:GetState() ~= Enum.HumanoidStateType.Seated then		
			humanoid.Health = 0
		end
	end
end

RunService.Stepped:Connect(onStep)