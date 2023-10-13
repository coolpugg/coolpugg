local player_gui = game:GetService('Players').LocalPlayer:FindFirstChild('PlayerGui')
if (not player_gui:FindFirstChildOfClass('Actor')) then
    warn('Bypassing Anticheat.....')
    local connection; connection = player_gui.ChildAdded:Connect(function(child)
        if (child.ClassName == 'Actor') then
            for _, client in next, child:GetChildren() do
                if (client:IsA('Script')) then
                    client.Disabled = true
                    client.Parent = player_gui
                    client.Disabled = false
                else
                    client.Parent = player_gui
                end
            end
            task.wait()
            child:Destroy()
            warn('[✔] Successfully')
            connection:Disconnect()
        end
    end)
else
    warn('[:x:] Failed')
end
