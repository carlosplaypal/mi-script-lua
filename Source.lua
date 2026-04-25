-- Script Básico para Steal a Brainrot (Roba un Brainrot) - Móvil
-- Funciona mejor con ejecutores como Delta Executor

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Configuración
_G.AutoSteal = true
_G.Speed = 50          -- Velocidad (ajústala si es mucho)
_G.JumpPower = 100     -- Salto más alto (útil en móvil)

-- Función para auto steal (busca brainrots cercanos y los "roba")
spawn(function()
    while _G.AutoSteal do
        wait(0.3)  -- No spamees mucho para evitar kicks
        
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Model") or obj:IsA("Part") then
                -- Busca nombres típicos de brainrots o drops (cambia según el juego)
                if obj.Name:lower():find("brainrot") or 
                   obj.Name:lower():find("brain") or 
                   obj.Name:lower():find("drop") or 
                   obj.Name:lower():find("steal") then
                    
                    local root = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("PrimaryPart") or obj
                    if root and (root.Position - character.HumanoidRootPart.Position).Magnitude < 30 then
                        -- Teleport rápido cerca del brainrot
                        character.HumanoidRootPart.CFrame = root.CFrame + Vector3.new(0, 5, 0)
                        wait(0.2)
                        -- Intento de interacción (click o touch)
                        firetouchinterest(character.HumanoidRootPart, root, 0)
                        firetouchinterest(character.HumanoidRootPart, root, 1)
                        print("¡Intentando robar brainrot cercano!")
                    end
                end
            end
        end
    end
end)

-- Velocidad y salto (útil en móvil)
game:GetService("RunService").RenderStepped:Connect(function()
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.WalkSpeed = _G.Speed
        character.Humanoid.JumpPower = _G.JumpPower
    end
end)

print("✅ Script cargado - Auto Steal activado")
print("Para desactivar: _G.AutoSteal = false")
