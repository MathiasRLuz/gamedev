local prompt = script.Parent.ProximityPrompt

function PromptAtivado(Player)
	local humanoid = Player.Character and Player.Character:FindFirstChild("Humanoid")
	-- humanoid é o Player.Character.Humanoid
	if humanoid then
		Player:SetAttribute("Ampulheta",true)  
	end
end

prompt.Triggered:Connect(PromptAtivado)
