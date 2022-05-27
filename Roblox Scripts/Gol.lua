script.Parent.Touched:Connect(function(hit)
	if hit:GetAttribute("Bola") then
		local player = game.Players:GetPlayerByUserId( game.Players:GetUserIdFromNameAsync(hit:GetAttribute("Jogador")))		
		print("GOOOOOOOOOOOOOL do " .. player.Name)		
		player:SetAttribute("Gols",player:GetAttribute("Gols")+1)
		hit:PivotTo(CFrame.new(game.Workspace.Spawns.SpawnFutebol.Position))
		hit:SetAttribute("Jogador","")		
	end
end)