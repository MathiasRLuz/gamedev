function onPlayerEntered(player)
	repeat wait () until player.Character ~= nil
	--local s = script.SprintScript:clone()
	player:SetAttribute("Checkpoint",Vector3.new(-23.295, 26.918, -45.155))
	player:SetAttribute("CheckpointAmpulheta",Vector3.new(workspace.SpawnLocation.Position))
	player:SetAttribute("TimeAmpulheta",0)
	player:SetAttribute("MaxTime",15)
	player:SetAttribute("Ampulheta",true) -- habilita a skill de voltar no tempo, tipo ult do 
	player:SetAttribute("Cuckoo",true) -- habilita a skill de dash
	--player:SetAttribute("C",false) -- habilita a skill de pulo mais alto (ou pulo duplo)
end

game.Players.PlayerAdded:connect(onPlayerEntered)