script.Parent.Vencedor.Visible = false

game.Workspace.Eventos.MostraVencedor.OnClientEvent:Connect(function()	
	script.Parent.Vencedor.Visible = true	
	script.Parent.Vencedor.Text = game.Workspace.Button:GetAttribute("Vencedor") .. " foi o vencedor"
	wait(3)
	script.Parent.Vencedor.Visible = false
end)