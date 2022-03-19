local deslizante = script.Parent
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local tweenInfo = TweenInfo.new(
	3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,-1,true,0
)

local tween = TweenService:Create(deslizante,tweenInfo, {Position = deslizante.Position + Vector3.new(10,0,0)})
tween:Play()

local lastPosition = deslizante.Position
RunService.Stepped:Connect(function(time,deltaTime)
	local currentPosition = deslizante.Position
	local deltaPosition = currentPosition - lastPosition
	local velocity = deltaPosition/deltaTime
	deslizante.AssemblyLinearVelocity = velocity
	lastPosition = currentPosition
end)