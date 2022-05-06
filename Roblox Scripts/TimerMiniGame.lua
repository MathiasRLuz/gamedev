local RunService = game:GetService("RunService")
local tempo = 60
local iniciou = false
script.Parent.TimerMiniGame.Visible = false
RunService.Stepped:Connect(function(time_,deltaTime)
	script.Parent.TimerMiniGame.Text = "O jogo acaba em: " .. math.ceil(tempo)
	if iniciou then
		tempo = game.Workspace.Button:GetAttribute("Tempo")	
	end		
	if tempo <=0 then
		iniciou = false
		script.Parent.TimerMiniGame.Visible = false
	end
end)

game.Workspace.Eventos.TimerMiniGame.OnClientEvent:Connect(function()
	script.Parent.TimerMiniGame.Visible = true
	iniciou = true	
end)
