s.Disabled = false
player.CharacterAdded:connect(function (char)
    local s = script.SprintScript:clone()
    s.Parent = player.Character
    s.Disabled = false
    --[[
    local s = script.TimeLoop:clone()
    s.Parent = char
    s.Disabled = false			
    ]]
    local s = script.Abilities:clone()
    s.Parent = player.Character
    s.Disabled = false
end)
end

game.Players.PlayerAdded:connect(onPlayerEntered)