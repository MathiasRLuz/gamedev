script.Parent.Touched:connect(function(hit)
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
		hit.Parent.Humanoid.Health -= 100
	end
end)