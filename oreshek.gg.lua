-- ============================================
-- ORESHEK.GG
-- LinoriaLib based
-- ============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local Drawing = (syn and syn.Drawing) or (Drawing) or nil

-- ============================================
-- ANTI-CHEAT BYPASS — PASTE YOUR CODE HERE
-- ============================================
-- Доступные сервисы: Players, RunService, Lighting, UserInputService, Camera, Drawing, game, workspace
-- Доступные функции: getrawmetatable, hookmetamethod, hookfunction, newcclosure (если поддерживается эксплойтом)
-- Вставляй свой обход анти-чита прямо сюда:
loadstring([[
    function LPH_NO_VIRTUALIZE(f) return f end;
]])();

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- // LocalPlayer Check Loaded

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

-- // Checking for getcustomasset

if not getcustomasset then
    getgenv().getcustomasset = function(z) return z end
end

-- // Anticheat Bypass

local t = {}

game:GetService("RunService").Heartbeat:Connect(function()
    for _, c in ipairs(getconnections(game:GetService("LogService").MessageOut)) do
        if not table.find(t, c) then
            t[#t+1] = c
            local u = pcall(getupvalues, c.Function) and getupvalues(c.Function) or {}
            if #u >= 9 and type(u[9]) == "table" and type(u[9][1]) == "function" then
                pcall(setupvalue, u[9][1], 14, function() return function(x)
                    if type(x) == "table" then for i = 1, 4 do
                        if type(x[i]) == "userdata" and x[i].Disconnect then pcall(x[i].Disconnect, x[i]) end
                    end end
                end end)
                pcall(setupvalue, u[9][1], 1, function() task.wait(200) end)
                local o = u[9][1]
                pcall(hookfunction, u[9][1], function() return {} end)
            end
        end
    end
end)

warn("[+] headshots.cc : anticheat bypassed.")


-- ============================================
-- LIBRARY LOADING
-- ============================================

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'ORESHEK.GG',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Main = Window:AddTab('Main'),
    Visuals = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),
    Rage = Window:AddTab('Rage'),
    People = Window:AddTab('People'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

-- ============================================
-- AIMBOT GROUPBOX
-- ============================================

local AimbotGroup = Tabs.Main:AddLeftGroupbox('Aimbot')

local AimbotToggle = AimbotGroup:AddToggle('AimbotEnabled', {
    Text = 'Enable Aimbot',
    Default = false,
})

AimbotToggle:AddKeyPicker('AimbotKeybind', {
    Default = 'MB2',
    SyncToggleState = false,
    Mode = 'Hold',
    Text = 'Aimbot Key',
    NoUI = false,
})

AimbotGroup:AddToggle('AimbotFOV', {
    Text = 'Enable FOV Circle',
    Default = false,
})

AimbotGroup:AddSlider('AimbotFOVSize', {
    Text = 'FOV Size',
    Default = 100,
    Min = 10,
    Max = 500,
    Suffix = 'px',
    Rounding = 0,
})

AimbotGroup:AddSlider('AimbotSmoothness', {
    Text = 'Smoothness',
    Default = 5,
    Min = 1,
    Max = 20,
    Rounding = 1,
})

AimbotGroup:AddDropdown('AimbotTargetPart', {
    Values = { 'Head', 'Torso', 'HumanoidRootPart' },
    Default = 1,
    Multi = false,
    Text = 'Target Part',
})

-- ============================================
-- SILENT AIM GROUPBOX
-- ============================================

local SilentGroup = Tabs.Main:AddRightGroupbox('Silent Aim')

local SilentToggle = SilentGroup:AddToggle('SilentEnabled', {
    Text = 'Enable Silent Aim',
    Default = false,
})

SilentToggle:AddKeyPicker('SilentKeybind', {
    Default = 'E',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'Silent Aim Key',
    NoUI = false,
})

SilentGroup:AddToggle('SilentFOV', {
    Text = 'Enable FOV Circle',
    Default = false,
})

SilentGroup:AddSlider('SilentFOVSize', {
    Text = 'FOV Size',
    Default = 80,
    Min = 10,
    Max = 500,
    Suffix = 'px',
    Rounding = 0,
})

SilentGroup:AddDropdown('SilentTargetPart', {
    Values = { 'Head', 'Torso', 'HumanoidRootPart' },
    Default = 1,
    Multi = false,
    Text = 'Target Part',
})

SilentGroup:AddToggle('SilentVisibleCheck', {
    Text = 'Visible Check',
    Default = false,
})

SilentGroup:AddToggle('SilentWallbang', {
    Text = 'Wallbang',
    Default = false,
})

-- ============================================
-- TRIGGERBOT GROUPBOX
-- ============================================

local TriggerGroup = Tabs.Main:AddLeftGroupbox('Trigger Bot')

local TriggerToggle = TriggerGroup:AddToggle('TriggerbotEnabled', {
    Text = 'Enable Trigger Bot',
    Default = false,
})

TriggerToggle:AddKeyPicker('TriggerbotKeybind', {
    Default = 'T',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'Trigger Bot Key',
    NoUI = false,
})

TriggerGroup:AddSlider('TriggerbotDelay', {
    Text = 'Shot Delay',
    Default = 0.1,
    Min = 0.01,
    Max = 1.0,
    Suffix = 's',
    Rounding = 2,
})

-- ============================================
-- VISUALS GROUPBOX
-- ============================================

local ESPGroup = Tabs.Visuals:AddLeftGroupbox('Player ESP')

ESPGroup:AddToggle('ESPEnabled', {
    Text = 'Enable ESP',
    Default = false,
})

ESPGroup:AddToggle('ESPBox', {
    Text = 'Boxes',
    Default = false,
}):AddColorPicker('ESPBoxColor', { Default = Color3.fromRGB(255, 255, 255) })

ESPGroup:AddToggle('ESPName', {
    Text = 'Names',
    Default = false,
}):AddColorPicker('ESPNameColor', { Default = Color3.fromRGB(255, 255, 255) })

ESPGroup:AddToggle('ESPDistance', {
    Text = 'Distance',
    Default = false,
}):AddColorPicker('ESPDistanceColor', { Default = Color3.fromRGB(255, 255, 255) })

ESPGroup:AddToggle('ESPHealthBar', {
    Text = 'Health Bars',
    Default = false,
})

ESPGroup:AddToggle('ESPTracers', {
    Text = 'Tracers',
    Default = false,
}):AddColorPicker('ESPTracerColor', { Default = Color3.fromRGB(255, 0, 0) })

ESPGroup:AddSlider('ESPMaxDistance', {
    Text = 'Max Distance',
    Default = 1000,
    Min = 100,
    Max = 5000,
    Suffix = ' studs',
    Rounding = 0,
})

local WorldGroup = Tabs.Visuals:AddRightGroupbox('World Visuals')

WorldGroup:AddToggle('Fullbright', {
    Text = 'Fullbright',
    Default = false,
})

WorldGroup:AddToggle('NoFog', {
    Text = 'Remove Fog',
    Default = false,
})

WorldGroup:AddToggle('CustomFog', {
    Text = 'Custom Fog',
    Default = false,
}):AddColorPicker('FogColor', { 
    Default = Color3.fromRGB(100, 100, 100),
    Title = 'Fog Color'
})

WorldGroup:AddSlider('FogDensity', {
    Text = 'Fog Distance',
    Default = 200,
    Min = 10,
    Max = 2000,
    Suffix = ' studs',
    Rounding = 0,
})

-- ============================================
-- MISC GROUPBOX
-- ============================================

local MiscGroup = Tabs.Misc:AddLeftGroupbox('Player Modifications')

MiscGroup:AddToggle('MiscSpeedHack', {
    Text = 'Speed Hack',
    Default = false,
})

MiscGroup:AddSlider('MiscSpeedValue', {
    Text = 'Speed Value',
    Default = 50,
    Min = 16,
    Max = 500,
    Suffix = ' spd',
    Rounding = 0,
})

-- ============================================
-- RAGE GROUPBOX (LEFT)
-- ============================================

local RageGroup = Tabs.Rage:AddLeftGroupbox('Rage Silent Aim')

local RageToggle = RageGroup:AddToggle('RageEnabled', {
    Text = 'Enable Rage Silent Aim',
    Default = false,
})

RageToggle:AddKeyPicker('RageKeybind', {
    Default = 'Q',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'Rage Aim Key',
    NoUI = false,
})

RageGroup:AddToggle('RageFOV', {
    Text = 'Enable FOV Circle',
    Default = false,
})

RageGroup:AddSlider('RageFOVSize', {
    Text = 'FOV Size',
    Default = 200,
    Min = 10,
    Max = 1000,
    Suffix = 'px',
    Rounding = 0,
})

RageGroup:AddDropdown('RageTargetPart', {
    Values = { 'Head', 'Torso', 'HumanoidRootPart' },
    Default = 1,
    Multi = false,
    Text = 'Target Part',
})

RageGroup:AddToggle('RageIgnoreVisibility', {
    Text = 'Ignore Visibility',
    Default = false,
})

-- ============================================
-- RAGE GROUPBOX (RIGHT) — TELEPORT & SPIN
-- ============================================

local RageUtilityGroup = Tabs.Rage:AddRightGroupbox('Rage Utility')

local RageTeleportToggle = RageUtilityGroup:AddToggle('RageTeleportEnabled', {
    Text = 'Teleport To Player',
    Default = false,
})

RageTeleportToggle:AddKeyPicker('RageTeleportKeybind', {
    Default = 'V',
    SyncToggleState = false,
    Mode = 'Hold',
    Text = 'Teleport Key',
    NoUI = false,
})

RageUtilityGroup:AddDivider()

local RageSpinToggle = RageUtilityGroup:AddToggle('RageSpinEnabled', {
    Text = 'Spin Around Player',
    Default = false,
})

RageSpinToggle:AddKeyPicker('RageSpinKeybind', {
    Default = 'X',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'Spin Key',
    NoUI = false,
})

RageUtilityGroup:AddSlider('RageSpinRadius', {
    Text = 'Spin Distance',
    Default = 5,
    Min = 1,
    Max = 50,
    Suffix = ' studs',
    Rounding = 1,
})

RageUtilityGroup:AddSlider('RageSpinSpeed', {
    Text = 'Spin Speed',
    Default = 10,
    Min = 1,
    Max = 100,
    Suffix = ' spd',
    Rounding = 1,
})

-- ============================================
-- PEOPLE GROUPBOX
-- ============================================

local PeopleGroup = Tabs.People:AddLeftGroupbox('Player Interactions')

local function getPlayerNames()
    local names = {}
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= Players.LocalPlayer then
            table.insert(names, plr.Name)
        end
    end
    if #names == 0 then
        table.insert(names, "None")
    end
    return names
end

PeopleGroup:AddDropdown('PeopleTarget', {
    Values = getPlayerNames(),
    Default = 1,
    Multi = false,
    Text = 'Select Player',
})

PeopleGroup:AddButton('Refresh Players', function()
    if Options.PeopleTarget then
        Options.PeopleTarget:SetValues(getPlayerNames())
        Options.PeopleTarget:SetValue(getPlayerNames()[1])
    end
end)

PeopleGroup:AddButton('Teleport To Player', function()
    local targetName = Options.PeopleTarget.Value
    if not targetName or targetName == "None" then return end
    local targetPlayer = Players:FindFirstChild(targetName)
    if not targetPlayer or not targetPlayer.Character then return end
    local targetHrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    local localChar = Players.LocalPlayer.Character
    if not targetHrp or not localChar then return end
    local localHrp = localChar:FindFirstChild("HumanoidRootPart")
    if localHrp then
        localHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 0, 3)
    end
end)

PeopleGroup:AddToggle('SpectateEnabled', {
    Text = 'Spectate Player',
    Default = false,
    Callback = function(Value)
        if not Value then
            local localChar = Players.LocalPlayer.Character
            if localChar then
                local hum = localChar:FindFirstChildOfClass("Humanoid")
                if hum then
                    Camera.CameraSubject = hum
                end
            end
            return
        end
        local targetName = Options.PeopleTarget.Value
        local targetPlayer = Players:FindFirstChild(targetName)
        if targetPlayer and targetPlayer.Character then
            local targetHum = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
            if targetHum then
                Camera.CameraSubject = targetHum
            end
        end
    end
})

-- ============================================
-- VARIABLES & STORAGE
-- ============================================

local originalLighting = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    FogStart = Lighting.FogStart,
    FogColor = Lighting.FogColor
}

local isUnloaded = false

local fovCircle = nil
local silentFovCircle = nil
local rageFovCircle = nil

if Drawing then
    fovCircle = Drawing.new("Circle")
    fovCircle.Visible = false
    fovCircle.Radius = 100
    fovCircle.Color = Color3.fromRGB(255, 255, 255)
    fovCircle.Thickness = 1
    fovCircle.Filled = false
    fovCircle.NumSides = 60

    silentFovCircle = Drawing.new("Circle")
    silentFovCircle.Visible = false
    silentFovCircle.Radius = 80
    silentFovCircle.Color = Color3.fromRGB(255, 0, 100)
    silentFovCircle.Thickness = 1
    silentFovCircle.Filled = false
    silentFovCircle.NumSides = 60
    
    rageFovCircle = Drawing.new("Circle")
    rageFovCircle.Visible = false
    rageFovCircle.Radius = 200
    rageFovCircle.Color = Color3.fromRGB(255, 0, 0)
    rageFovCircle.Thickness = 2
    rageFovCircle.Filled = false
    rageFovCircle.NumSides = 60
end

local espObjects = {}

local function clearESP(plr)
    if espObjects[plr] then
        for _, obj in pairs(espObjects[plr]) do
            if obj and obj.Remove then 
                obj.Visible = false
                obj:Remove() 
            end
        end
        espObjects[plr] = nil
    end
end

Players.PlayerRemoving:Connect(clearESP)

Players.PlayerAdded:Connect(function()
    task.wait(1)
    if Options.PeopleTarget then
        Options.PeopleTarget:SetValues(getPlayerNames())
    end
end)

Players.PlayerRemoving:Connect(function()
    task.wait(1)
    if Options.PeopleTarget then
        Options.PeopleTarget:SetValues(getPlayerNames())
    end
end)

-- ============================================
-- HELPER FUNCTIONS
-- ============================================

local function getClosestPlayer(fovSize, targetPartName)
    local closestPlayer = nil
    local shortestDistance = fovSize
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, plr in pairs(Players:GetPlayers()) do
        if plr == Players.LocalPlayer then continue end
        if not plr.Character then continue end

        local targetPart = plr.Character:FindFirstChild(targetPartName)
        if not targetPart then continue end

        local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
        if not onScreen then continue end

        local distance = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
        if distance < shortestDistance then
            shortestDistance = distance
            closestPlayer = plr
        end
    end

    return closestPlayer
end

-- ============================================
-- RENDER LOGIC
-- ============================================

local triggerTimer = 0
local spinAngle = 0

RunService.RenderStepped:Connect(function()
    if isUnloaded then return end

    -- FOV Circles
    if Drawing then
        if Toggles.AimbotFOV and Toggles.AimbotFOV.Value then
            fovCircle.Visible = true
            fovCircle.Radius = Options.AimbotFOVSize.Value
            fovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        else
            fovCircle.Visible = false
        end

        if Toggles.SilentFOV and Toggles.SilentFOV.Value then
            silentFovCircle.Visible = true
            silentFovCircle.Radius = Options.SilentFOVSize.Value
            silentFovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        else
            silentFovCircle.Visible = false
        end
        
        if Toggles.RageFOV and Toggles.RageFOV.Value then
            rageFovCircle.Visible = true
            rageFovCircle.Radius = Options.RageFOVSize.Value
            rageFovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        else
            rageFovCircle.Visible = false
        end
    end

    -- === AIMBOT ===
    if Toggles.AimbotEnabled and Toggles.AimbotEnabled.Value then
        local keybindState = Options.AimbotKeybind:GetState()
        if keybindState then
            local target = getClosestPlayer(Options.AimbotFOVSize.Value, Options.AimbotTargetPart.Value)
            if target and target.Character then
                local targetPart = target.Character:FindFirstChild(Options.AimbotTargetPart.Value)
                if targetPart then
                    local smoothness = Options.AimbotSmoothness.Value
                    local currentCF = Camera.CFrame
                    local targetCF = CFrame.new(currentCF.Position, targetPart.Position)
                    Camera.CFrame = currentCF:Lerp(targetCF, 1 / smoothness)
                end
            end
        end
    end

    -- === TRIGGERBOT ===
    if Toggles.TriggerbotEnabled and Toggles.TriggerbotEnabled.Value then
        local keybindState = Options.TriggerbotKeybind:GetState()
        if keybindState then
            local target = getClosestPlayer(Options.SilentFOVSize.Value, Options.SilentTargetPart.Value)
            if target then
                if tick() - triggerTimer >= Options.TriggerbotDelay.Value then
                    if mouse1click then
                        mouse1click()
                    elseif mouse1press and mouse1release then
                        mouse1press()
                        task.wait()
                        mouse1release()
                    end
                    triggerTimer = tick()
                end
            end
        end
    end

    -- === RAGE: TELEPORT ===
    if Toggles.RageTeleportEnabled and Toggles.RageTeleportEnabled.Value then
        local keybindState = Options.RageTeleportKeybind:GetState()
        if keybindState then
            local target = getClosestPlayer(Options.RageFOVSize.Value, Options.RageTargetPart.Value)
            if target and target.Character then
                local targetHrp = target.Character:FindFirstChild("HumanoidRootPart")
                local localChar = Players.LocalPlayer.Character
                if targetHrp and localChar then
                    local localHrp = localChar:FindFirstChild("HumanoidRootPart")
                    if localHrp then
                        localHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 0, 3)
                    end
                end
            end
        end
    end

    -- === RAGE: SPIN ===
    if Toggles.RageSpinEnabled and Toggles.RageSpinEnabled.Value then
        local keybindState = Options.RageSpinKeybind:GetState()
        if keybindState then
            local target = getClosestPlayer(Options.RageFOVSize.Value, Options.RageTargetPart.Value)
            if target and target.Character then
                local targetHrp = target.Character:FindFirstChild("HumanoidRootPart")
                local localChar = Players.LocalPlayer.Character
                if targetHrp and localChar then
                    local localHrp = localChar:FindFirstChild("HumanoidRootPart")
                    if localHrp then
                        spinAngle = spinAngle + (Options.RageSpinSpeed.Value * 0.1)
                        local radius = Options.RageSpinRadius.Value
                        local offset = CFrame.new(math.cos(spinAngle) * radius, 0, math.sin(spinAngle) * radius)
                        localHrp.CFrame = targetHrp.CFrame * offset
                    end
                end
            else
                spinAngle = 0
            end
        else
            spinAngle = 0
        end
    else
        spinAngle = 0
    end

    -- === MISC: SPEED HACK ===
    if Toggles.MiscSpeedHack and Toggles.MiscSpeedHack.Value then
        local char = Players.LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.WalkSpeed = Options.MiscSpeedValue.Value
            end
        end
    end

    -- World Visuals (Lighting)
    if Toggles.Fullbright.Value then
        Lighting.Brightness = 3
        Lighting.ClockTime = 14
    else
        Lighting.Brightness = originalLighting.Brightness
        Lighting.ClockTime = originalLighting.ClockTime
    end

    -- Fog Logic
    if Toggles.CustomFog.Value then
        Lighting.FogColor = Options.FogColor.Value
        Lighting.FogEnd = Options.FogDensity.Value
        Lighting.FogStart = 0
    elseif Toggles.NoFog.Value then
        Lighting.FogEnd = 100000
    else
        Lighting.FogEnd = originalLighting.FogEnd
        Lighting.FogStart = originalLighting.FogStart
        Lighting.FogColor = originalLighting.FogColor
    end

    -- Spectate Logic
    if Toggles.SpectateEnabled and Toggles.SpectateEnabled.Value then
        local targetName = Options.PeopleTarget.Value
        local targetPlayer = Players:FindFirstChild(targetName)
        if targetPlayer and targetPlayer.Character then
            local targetHum = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
            if targetHum and targetHum.Health > 0 then
                if Camera.CameraSubject ~= targetHum then
                    Camera.CameraSubject = targetHum
                end
            end
        end
    end

    -- Player ESP
    if not Drawing then return end

    for _, plr in pairs(Players:GetPlayers()) do
        if plr == Players.LocalPlayer then continue end

        if Toggles.ESPEnabled.Value and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") then
            local hrp = plr.Character.HumanoidRootPart
            local hum = plr.Character.Humanoid
            local dist = (Camera.CFrame.Position - hrp.Position).Magnitude

            if dist > Options.ESPMaxDistance.Value then
                clearESP(plr)
                continue
            end

            local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            if not onScreen then
                if espObjects[plr] then
                    for _, obj in pairs(espObjects[plr]) do obj.Visible = false end
                end
                continue
            end

            if not espObjects[plr] then
                espObjects[plr] = {
                    Box = Drawing.new("Square"),
                    Name = Drawing.new("Text"),
                    Distance = Drawing.new("Text"),
                    Tracer = Drawing.new("Line"),
                    HealthBar = Drawing.new("Square")
                }
                espObjects[plr].Box.Thickness = 1
                espObjects[plr].Box.Filled = false
                espObjects[plr].Name.Size = 13
                espObjects[plr].Name.Center = true
                espObjects[plr].Name.Outline = true
                espObjects[plr].Distance.Size = 13
                espObjects[plr].Distance.Center = true
                espObjects[plr].Distance.Outline = true
                espObjects[plr].HealthBar.Thickness = 1
                espObjects[plr].HealthBar.Filled = true
                espObjects[plr].Tracer.Thickness = 1
            end

            local esp = espObjects[plr]
            local scale = 1 / (screenPos.Z * math.tan(math.rad(Camera.FieldOfView / 2)))
            local width = math.floor(30 * scale)
            local height = math.floor(50 * scale)
            local boxPos = Vector2.new(math.floor(screenPos.X - width / 2), math.floor(screenPos.Y - height / 2))

            if Toggles.ESPBox.Value then
                esp.Box.Visible = true
                esp.Box.Size = Vector2.new(width, height)
                esp.Box.Position = boxPos
                esp.Box.Color = Options.ESPBoxColor.Value
            else
                esp.Box.Visible = false
            end

            if Toggles.ESPName.Value then
                esp.Name.Visible = true
                esp.Name.Text = plr.Name
                esp.Name.Position = Vector2.new(boxPos.X + width / 2, boxPos.Y - 15)
                esp.Name.Color = Options.ESPNameColor.Value
            else
                esp.Name.Visible = false
            end

            if Toggles.ESPDistance.Value then
                esp.Distance.Visible = true
                esp.Distance.Text = math.floor(dist) .. " studs"
                esp.Distance.Position = Vector2.new(boxPos.X + width / 2, boxPos.Y + height)
                esp.Distance.Color = Options.ESPDistanceColor.Value
            else
                esp.Distance.Visible = false
            end

            if Toggles.ESPHealthBar.Value then
                esp.HealthBar.Visible = true
                local healthPct = hum.Health / hum.MaxHealth
                esp.HealthBar.Size = Vector2.new(2, height)
                esp.HealthBar.Position = Vector2.new(boxPos.X - 5, boxPos.Y)
                esp.HealthBar.Color = Color3.fromRGB(255 - math.floor(255 * healthPct), math.floor(255 * healthPct), 0)
            else
                esp.HealthBar.Visible = false
            end

            if Toggles.ESPTracers.Value then
                esp.Tracer.Visible = true
                esp.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                esp.Tracer.To = Vector2.new(screenPos.X, screenPos.Y)
                esp.Tracer.Color = Options.ESPTracerColor.Value
            else
                esp.Tracer.Visible = false
            end
        else
            clearESP(plr)
        end
    end
end)

-- ============================================
-- ============================================
-- SILENT AIM SOURCE — PASTE YOUR CODE HERE
-- ============================================
-- ============================================

-- [YOUR SILENT AIM SOURCE CODE GOES HERE]







-- [END OF YOUR SILENT AIM SOURCE CODE]

-- ============================================
-- ============================================
-- RAGE SILENT AIM SOURCE — PASTE YOUR CODE HERE
-- ============================================
-- ============================================

-- [YOUR RAGE SILENT AIM SOURCE CODE GOES HERE]







-- [END OF YOUR RAGE SILENT AIM SOURCE CODE]

-- ============================================
-- ============================================
-- END OF SOURCE SECTIONS
-- ============================================
-- ============================================

-- ============================================
-- UI SETTINGS & LIBRARY SETUP
-- ============================================

Library:SetWatermarkVisibility(true)

local FrameTimer = tick()
local FrameCounter = 0
local FPS = 60

local WatermarkConnection = RunService.RenderStepped:Connect(function()
    if isUnloaded then return end
    FrameCounter += 1
    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter
        FrameTimer = tick()
        FrameCounter = 0
    end
    Library:SetWatermark(('ORESHEK.GG | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ))
end)

Library.KeybindFrame.Visible = true

Library:OnUnload(function()
    isUnloaded = true
    WatermarkConnection:Disconnect()

    Lighting.Brightness = originalLighting.Brightness
    Lighting.ClockTime = originalLighting.ClockTime
    Lighting.FogEnd = originalLighting.FogEnd
    Lighting.FogStart = originalLighting.FogStart
    Lighting.FogColor = originalLighting.FogColor

    if Toggles.SpectateEnabled then
        Toggles.SpectateEnabled:SetValue(false)
    end
    local localChar = Players.LocalPlayer.Character
    if localChar then
        local hum = localChar:FindFirstChildOfClass("Humanoid")
        if hum then
            Camera.CameraSubject = hum
        end
    end

    if fovCircle then fovCircle:Remove() end
    if silentFovCircle then silentFovCircle:Remove() end
    if rageFovCircle then rageFovCircle:Remove() end
    
    for plr, _ in pairs(espObjects) do 
        clearESP(plr) 
    end

    print('ORESHEK.GG Unloaded!')
    Library.Unloaded = true
end)

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
MenuGroup:AddButton('Unload', function() Library:Unload() end)

MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', {
    Default = 'Insert',
    NoUI = true,
    Text = 'Menu keybind'
})

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('ORESHEK.GG')
SaveManager:SetFolder('ORESHEK.GG/game')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
