game.StarterGui.TimerGUI.Vencedor.Visible = true
local iniciou = false
script.Parent.CanCollide = false

game.Workspace.Eventos.StartMiniGame.Event:Connect(function()
	iniciou = false
end)

script.Parent.Touched:Connect(function(parte)
	if not iniciou then
		iniciou = true
		local character = parte.Parent
		if character:FindFirstChild("Humanoid") ~= nil then
			local player = game.Players:GetPlayerFromCharacter(character)
			local leaderstats = player.leaderstats
			local pontos = leaderstats and leaderstats:FindFirstChild("Pontos")
			if pontos then
				pontos.Value = pontos.Value + 1
			end
			game.Workspace.Button:SetAttribute("Vencedor",player.Name)	
			game.Workspace.Eventos.MostraVencedor:FireAllClients()
			game.Workspace.Eventos.FimMiniGame:Fire()			
		end		
	end	
end)