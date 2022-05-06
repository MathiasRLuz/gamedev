local RunService = game:GetService("RunService")
local tempo = 10
local iniciou = false
script.Parent.Timer.Visible = false
RunService.Stepped:Connect(function(time_,deltaTime)
	script.Parent.Timer.Text = "O próximo jogo começa em: " .. math.ceil(tempo)
	if iniciou then
		tempo -= deltaTime		
	end		
	if tempo <=0 then
		iniciou = false
		script.Parent.Timer.Visible = false
	end
end)

game.Workspace.Eventos.IniciarTimer.OnClientEvent:Connect(function()
	script.Parent.Timer.Visible = true
	iniciou = true	
end)
