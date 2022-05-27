script.Parent:SetAttribute("Bola",true)
script.Parent:SetAttribute("Jogador",'')
script.Parent.Touched:Connect(function(hit) 
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
		script.Parent:SetAttribute("Jogador",hit.Parent.Name)	
	end 
end)