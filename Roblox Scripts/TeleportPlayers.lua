local RunService = game:GetService("RunService")
local tempo = 0
local minPlayers = 2
local tempoIniciar = 10
local iniciar = false
local iniciou = false

local jogos = {game.Workspace.Spawns.SpawnCorrida,game.Workspace.Spawns.SpawnLabirinto} -- lista de spawns de minigames

function teleportar(jogo)
	for i,player in ipairs(game.Players:GetPlayers()) do			
		if player:GetAttribute("Pronto") == true then			
			local character = player.Character			
			character:PivotTo(CFrame.new(jogo.Position)+Vector3.new(0,4,0))
		end							
	end
end

RunService.Stepped:Connect(function(time_,deltaTime)
	tempo += deltaTime
	if iniciar and not iniciou then
		tempoIniciar -= deltaTime		
		if tempoIniciar <= 0  then
			print("Começou")
			iniciou = true
			game.Workspace.Eventos.StartMiniGame:Fire()
			local indice = math.random(1,#jogos)
			--indice = 1 -- comentar essa linha depois
			if indice == 1 then
				game.Workspace.Button:SetAttribute("Jogo","Corrida")				
			elseif indice == 2 then
				game.Workspace.Button:SetAttribute("Jogo","Labirinto")			
			end
			teleportar(jogos[indice]) -- teleporta para um minigame aleatório
		end
	end
	if tempo > 10 and not iniciar then
		tempo = 0		
		local prontos = true
		for i,player in ipairs(game.Players:GetPlayers()) do			
			if player:GetAttribute("Pronto") == false then
				print(player.Name .. " não está pronto")
				prontos = false
			end							
		end
		if prontos and game.Players.NumPlayers >= minPlayers then
			print("O jogo vai começar em " .. tempoIniciar .." segundos")
			iniciar = true
			game.Workspace.Eventos.IniciarTimer:FireAllClients()
		end		
	end	
end)

game.Workspace.Eventos.FimMiniGame.Event:Connect(function()
	iniciar = false
	iniciou = false
	tempo = 0
	for i,player in ipairs(game.Players:GetPlayers()) do			
		if player:GetAttribute("Pronto") == true then			
			local character = player.Character			
			player:SetAttribute("Pronto", false)
			character:PivotTo(CFrame.new(game.Workspace.Spawns.SpawnLocation.Position))
		end							
	end
end)