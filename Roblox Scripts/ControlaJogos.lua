local RunService = game:GetService("RunService")
local tempo = 60
local iniciar = false
local inicioMiniGame = false

function verificaVencedor()
	if game.Workspace.Button:GetAttribute("Jogo") == "Futebol" then
		local maiorGols = 0
		local vencedor 
		for i,player in ipairs(game.Players:GetPlayers()) do			
			local playerGols = player:GetAttribute("Gols")
			player:SetAttribute("Gols",0)
			if playerGols > maiorGols then			
				maiorGols = playerGols
				vencedor = player
			end							
		end		
		if maiorGols > 0 then
			local leaderstats = vencedor.leaderstats
			local pontos = leaderstats and leaderstats:FindFirstChild("Pontos")
			if pontos then
				pontos.Value = pontos.Value + 1
			end
			game.Workspace.Button:SetAttribute("Vencedor",vencedor.Name)
		else
			game.Workspace.Button:SetAttribute("Vencedor","Ningúem")	
		end
		print(maiorGols)
		game.Workspace.Eventos.MostraVencedor:FireAllClients()
		game.Workspace.Eventos.FimMiniGame:Fire()
	end
end

RunService.Stepped:Connect(function(time_,deltaTime)
	if iniciar then
		tempo-=deltaTime
		game.Workspace.Button:SetAttribute("Tempo",tempo)
		if tempo<=0 then			
			iniciar = false	
			verificaVencedor()
		end
	end	
end)	

game.Workspace.Eventos.StartMiniGame.Event:Connect(function()
	wait(5) 
	if game.Workspace.Button:GetAttribute("Jogo") == "Futebol" then
		print("Pegue o máximo de moedas")		
		iniciar = true
		tempo = 60
		game.Workspace.Eventos.TimerMiniGame:FireAllClients()
	elseif game.Workspace.Button:GetAttribute("Jogo") == "Labirinto" then
		print("Ache a saída")
	elseif game.Workspace.Button:GetAttribute("Jogo") == "Corrida" then
		print("Chegue no final da pista antes de todos")
	else
		print("Deu ruim")
	end
end)