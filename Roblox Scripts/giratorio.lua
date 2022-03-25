local fixed = script.Parent.Parent.Fixed
while true do
	for i = 1, 360 do
		script.Parent.CFrame = CFrame.new(fixed.Position) * CFrame.Angles(0,math.rad(i),0) * CFrame.new(script.Parent.Size.X/2,0,0)
		wait(0.3)
	end
end