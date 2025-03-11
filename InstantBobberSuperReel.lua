--[[#Naaellx Code]] -- Dont Skid Please I just learn lua :(
if getgenv().ancestral then 
    warn("Ancestral Hub: Already executed!") 
    return 
end
getgenv().ancestral = true

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- GUI Awal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Fungsi untuk ukuran responsif
local function GetResponsiveSize(baseSize)
local screenSize = workspace.CurrentCamera.ViewportSize
return UDim2.new(baseSize * (screenSize.X / 1920), 0, baseSize * (screenSize.Y / 1080), 0)
end
--[[#Naaellx Code]]
-- Teks "Ancestral"
local TitleText = Instance.new("TextLabel")
TitleText.Parent = ScreenGui
TitleText.Size = GetResponsiveSize(0.15) -- Ukuran lebih kecil
TitleText.Position = UDim2.new(0.5, 0, 0.45, 0) -- Sedikit lebih turun dari tengah
TitleText.AnchorPoint = Vector2.new(0.5, 0.5)
TitleText.BackgroundTransparency = 1
TitleText.Font = Enum.Font.GothamBold
TitleText.TextScaled = true
TitleText.TextStrokeTransparency = 0.2
TitleText.TextTransparency = 1
TitleText.TextColor3 = Color3.fromRGB(186, 115, 211) -- Soft Purple Premium
TitleText.Text = "「Ancestral」" -- Font khusus

-- Subtitle lebih dekat dengan "Ancestral"
local SubtitleText = Instance.new("TextLabel")
SubtitleText.Parent = ScreenGui
SubtitleText.Size = GetResponsiveSize(0.08) -- Ukuran lebih kecil
SubtitleText.Position = UDim2.new(0.5, 0, 0.50, 0) -- Lebih dekat dengan TitleText
SubtitleText.AnchorPoint = Vector2.new(0.5, 0.5)
SubtitleText.BackgroundTransparency = 1
SubtitleText.Font = Enum.Font.Gotham
SubtitleText.TextScaled = true
SubtitleText.TextStrokeTransparency = 0.2
SubtitleText.TextTransparency = 1
SubtitleText.TextColor3 = Color3.fromRGB(220, 220, 220) -- Warna abu-abu premium
SubtitleText.Text = "Script loading.. please wait" -- Ganti teks sesuai keinginan

-- Animasi fade-in
local fadeInTitle = TweenService:Create(TitleText, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
TextTransparency = 0
})
local fadeInSubtitle = TweenService:Create(SubtitleText, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
TextTransparency = 0
})

fadeInTitle:Play()
fadeInSubtitle:Play()

fadeInTitle.Completed:Connect(function()
-- Animasi turun lebih pendek (agar tetap dekat)
local moveTitle = TweenService:Create(TitleText, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, 0, 0.65, 0) -- Pindah ke bawah, tapi tidak terlalu jauh
})
local moveSubtitle = TweenService:Create(SubtitleText, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, 0, 0.70, 0) -- Jarak lebih dekat dengan TitleText
})
moveTitle:Play()
moveSubtitle:Play()

task.delay(2.5, function()
    -- Animasi fade-out
    local fadeOutTitle = TweenService:Create(TitleText, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 1
    })
    local fadeOutSubtitle = TweenService:Create(SubtitleText, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 1
    })
    fadeOutTitle:Play()
    fadeOutSubtitle:Play()

    fadeOutTitle.Completed:Wait()
    ScreenGui:Destroy()
end)
end)


-- Tunggu beberapa detik sebelum teks muncul
task.delay(3, function() -- Ganti angka 3 dengan durasi yang diinginkan sebelum teks muncul
local args = {
    [1] = "<font color='#BA73D3'><i>Ancestral</i></font> has been loaded!";
    [3] = 0;
    [4] = game:GetService("ReplicatedStorage"):WaitForChild("resources", 9e9):WaitForChild("sounds", 9e9):WaitForChild("sfx", 9e9):WaitForChild("event", 9e9):WaitForChild("aurora", 9e9);
}

game:GetService("ReplicatedStorage"):WaitForChild("events", 9e9):WaitForChild("anno_localthoughtbig", 9e9):Fire(unpack(args)) -- Event
end)


-- Update ukuran teks secara dinamis
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
TitleText.Size = GetResponsiveSize(0.15)
SubText.Size = GetResponsiveSize(0.12)
end)  

-- Load UI utama Fluent
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Knuxy92/Ui-linoria/main/Fluent/Fluent.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local ClickButton = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local IconLabel = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local ExpandButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local Divider = Instance.new("Frame")

ClickButton.Name = "ClickButton"
ClickButton.Parent = game.CoreGui
ClickButton.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ClickButton.ResetOnSpawn = false

-- Frame utama tombol (diperlebar agar tombol tidak bertabrakan)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ClickButton
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundTransparency = 0.3 -- Background transparan
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 140, 0, 50) 
MainFrame.Active = true
MainFrame.Draggable = true

-- Sudut melengkung
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- UIGradient untuk efek transisi warna
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(136, 77, 167)), 
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 80))
}
Gradient.Rotation = 90
Gradient.Parent = MainFrame

-- Ikon di sebelah kiri (tetap solid)
IconLabel.Parent = MainFrame
IconLabel.BackgroundTransparency = 1
IconLabel.Size = UDim2.new(0, 24, 0, 24)
IconLabel.Position = UDim2.new(0.08, 0, 0.5, -12)
IconLabel.Image = "rbxassetid://73407780444753"
IconLabel.ScaleType = Enum.ScaleType.Fit

-- Garis pemisah (tetap solid)
Divider.Parent = MainFrame
Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Warna putih
Divider.BackgroundTransparency = 0 -- Tidak transparan
Divider.Position = UDim2.new(0.35, 0, 0.15, 0)
Divider.Size = UDim2.new(0, 1, 0.7, 0)

-- Teks subtitle "Ancestral" (diperkecil agar tidak terlalu besar)
TextLabel.Parent = MainFrame
TextLabel.BackgroundTransparency = 1
TextLabel.Size = UDim2.new(0.5, 0, 0.4, 0) -- Ukuran teks diperkecil
TextLabel.Position = UDim2.new(0.38, 0, 0.3, 0) -- Sedikit digeser ke bawah
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.Text = "Ancestral"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Tetap solid
TextLabel.TextScaled = false
TextLabel.TextSize = 14 -- Ukuran teks lebih kecil seperti sebelumnya
TextLabel.TextTransparency = 0.1

-- Tombol untuk perbesar/minimize (digeser lebih ke kanan agar tidak bertabrakan)
ExpandButton.Parent = MainFrame
ExpandButton.BackgroundTransparency = 1
ExpandButton.Size = UDim2.new(0, 20, 0, 20)
ExpandButton.Position = UDim2.new(0.9, -5, 0.5, -10) -- Digeser lebih ke kanan
ExpandButton.Image = "rbxassetid://10734886735"
ExpandButton.ScaleType = Enum.ScaleType.Fit

-- Variabel untuk cek status minimize
local isMinimized = false

ExpandButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized

    game:GetService("VirtualInputManager"):SendKeyEvent(true, "LeftControl", false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "LeftControl", false, game)

    if isMinimized then
        ExpandButton.Image = "rbxassetid://10734886735"
    else
        ExpandButton.Image = "rbxassetid://10734895698"
    end
end)

-- UI utama menggunakan Fluent
local Window = Fluent:CreateWindow({
    Title = game:GetService("MarketplaceService"):GetProductInfo(16732694052).Name .. " | Ancestral v1.0",
    SubTitle = "discord.gg/ancestral",
    TabWidth = 160,
    Size = UDim2.fromOffset(520, 400), -- Ukuran lebih kecil agar lebih responsif
    Acrylic = false,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- // // // Services // // // --
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local CoreGui = game:GetService('StarterGui')
local ContextActionService = game:GetService('ContextActionService')
local UserInputService = game:GetService('UserInputService')

-- // // // Locals // // // --
local LocalPlayer = Players.LocalPlayer
local LocalCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = LocalCharacter:FindFirstChild("HumanoidRootPart")
local UserPlayer = HumanoidRootPart:WaitForChild("user")
local ActiveFolder = Workspace:FindFirstChild("active")
local FishingZonesFolder = Workspace:FindFirstChild("zones"):WaitForChild("fishing")
local TpSpotsFolder = Workspace:FindFirstChild("world"):WaitForChild("spawns"):WaitForChild("TpSpots")
local NpcFolder = Workspace:FindFirstChild("world"):WaitForChild("npcs")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui", PlayerGui)
-- local shadowCountLabel = Instance.new("TextLabel", screenGui)
local RenderStepped = RunService.RenderStepped
local WaitForSomeone = RenderStepped.Wait

-- // // // Features List // // // --

-- // // // Variables // // // --
local CastMode = "Legit"
local ShakeMode = "Navigation"
local ReelMode = "Blatant"
local CollectMode = "Teleports"
local teleportSpots = {}
local FreezeChar = false
local DayOnlyLoop = nil
local BypassGpsLoop = nil
local Noclip = false
local RunCount = false

-- // // // Functions // // // --
function ShowNotification(String)
    Fluent:Notify({
        Title = "Ancestral",
        Content = String,
        Duration = 5
    })
end

-- // // // Tabs Gui // // // --
local Tabs = { -- https://lucide.dev/icons/
    CharacterTab = Window:AddTab({ Title = "Character", Icon = "rbxassetid://10747373176" }),
    Config = Window:AddTab({ Title = "Config", Icon = "rbxassetid://121667411319639" }),
    Main = Window:AddTab({ Title = "Fishing", Icon = "rbxassetid://10734941354" }),
    Items = Window:AddTab({ Title = "Market", Icon = "rbxassetid://10734952273" }),
    Forge = Window:AddTab({ Title = "Forge", Icon = "rbxassetid://104768258304566" }), 
    Event = Window:AddTab({ Title = "Event", Icon = "rbxassetid://103886955707876" }),
    Teleports = Window:AddTab({ Title = "Worlds", Icon = "rbxassetid://10709811445" }),
    Visual = Window:AddTab({ Title = "Visual", Icon = "rbxassetid://97855077268525" }), 
    Exclusives = Window:AddTab({ Title = "Exclusives", Icon = "rbxassetid://10734966248" }), 
    Misc = Window:AddTab({ Title = "Misc", Icon = "rbxassetid://10734976739" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "rbxassetid://10734950020" }),
}
local Options = Fluent.Options
    -- // // // Auto Cast // // // --
local autoCastEnabled = false
    -- // // // Auto Shake // // // --
local autoShakeEnabled = false
local autoShakeConnection

local function autoShake()
    if ShakeMode == "Navigation" then
        task.wait()
        xpcall(function()
            local shakeui = PlayerGui:FindFirstChild("shakeui")
            if not shakeui then return end
            local safezone = shakeui:FindFirstChild("safezone")
            local button = safezone and safezone:FindFirstChild("button")
            task.wait(0.2)
            GuiService.SelectedObject = button
            if GuiService.SelectedObject == button then
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            end
            task.wait(0.1)
            GuiService.SelectedObject = nil
        end,function (err)
        end)
    elseif ShakeMode == "Mouse" then
        task.wait()
        xpcall(function()
            local shakeui = PlayerGui:FindFirstChild("shakeui")
            if not shakeui then return end
            local safezone = shakeui:FindFirstChild("safezone")
            local button = safezone and safezone:FindFirstChild("button")
            local pos = button.AbsolutePosition
            local size = button.AbsoluteSize
            VirtualInputManager:SendMouseButtonEvent(pos.X + size.X / 2, pos.Y + size.Y / 2, 0, true, LocalPlayer, 0)
            VirtualInputManager:SendMouseButtonEvent(pos.X + size.X / 2, pos.Y + size.Y / 2, 0, false, LocalPlayer, 0)
        end,function (err)
        end)
    end
end

local function startAutoShake()
    if autoShakeConnection or not autoShakeEnabled then return end
    autoShakeConnection = RunService.RenderStepped:Connect(autoShake)
end

local function stopAutoShake()
    if autoShakeConnection then
        autoShakeConnection:Disconnect()
        autoShakeConnection = nil
    end
end

PlayerGui.DescendantAdded:Connect(function(descendant)
    if autoShakeEnabled and descendant.Name == "button" and descendant.Parent and descendant.Parent.Name == "safezone" then
        startAutoShake()
    end
end)

PlayerGui.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "playerbar" and descendant.Parent and descendant.Parent.Name == "bar" then
        stopAutoShake()
    end
end)

if autoShakeEnabled and PlayerGui:FindFirstChild("shakeui") and PlayerGui.shakeui:FindFirstChild("safezone") and PlayerGui.shakeui.safezone:FindFirstChild("button") then
    startAutoShake()
end

-- // // // Auto Reel // // // --
local autoReelEnabled = false
local PerfectCatchEnabled = false
local autoReelConnection
local ReelMode = "Legit" -- Atau "Blatant", sesuaikan sesuai kebutuhan
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerGui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")

-- // // // Zone Cast // // // --
    local section = Tabs.Main:AddSection("Auto Fishing")
    -- AutoCastToggle
    local autoCast = Tabs.Main:AddToggle("autoCast", { Title = "Auto Cast", Default = false })
    -- AutoShakeToggle
    local autoShake = Tabs.Main:AddToggle("autoShake", { Title = "Auto Shake", Default = false })

local autoReelEnabled = false
local instaReelEnabled = false
-- AUTO RELL LEGIT
local function StartAutoReel()
    spawn(function()
        while autoReelEnabled do
            local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
            if reelGui then
                local bar = reelGui:FindFirstChild("bar")
                if bar then
                    local playerBar = bar:FindFirstChild("playerbar")
                    local fish = bar:FindFirstChild("fish")
                    while bar and reelGui:IsDescendantOf(LocalPlayer.PlayerGui) do
                        RunService.RenderStepped:Wait()
                        local newPosition = playerBar.Position:Lerp(fish.Position, 0.7)
                        playerBar.Position = UDim2.fromScale(math.clamp(newPosition.X.Scale, 0.15, 0.85), newPosition.Y.Scale)
                    end
                end
            end
            wait(math.random(0.1, 0.3))
        end
    end)
end

-- AUTO REEL LEGIT END
    -- AutoreelToggleLegit
    local autoReelToggle = Tabs.Main:AddToggle("autoReel", { Title = "Auto Reel Legit", Default = false })
autoReelToggle:OnChanged(function()
    autoReelEnabled = Options.autoReel.Value
    if autoReelEnabled then
        task.spawn(StartAutoReel)
    end
end)
-- FASTREELCODE
local function StartFastReel()
    spawn(function()
        while Options.fastReel.Value do
            local delay = tonumber(Options.fastreeldelay.Value) or 0
            local perfectCatchChance = tonumber(Options.perfectCatchChance.Value) or 0.1
            
            task.wait(delay) 
            repeat
                task.wait()
                local ui = LocalPlayer.PlayerGui:FindFirstChild("reel")
                if ui and ui:FindFirstChild("bar") then
                    local b = ui:FindFirstChild("bar")
                    if b:FindFirstChild("fish") and b:FindFirstChild("playerbar") then
                        b:FindFirstChild("playerbar").Position = b:FindFirstChild("fish").Position
                    end
                    ReplicatedStorage:WaitForChild("events"):WaitForChild("reelfinished ")
                        :FireServer(100, math.random() <= perfectCatchChance)
                end
                if not ui then ui = false end
            until not ui
            task.wait(perfectCatchChance / 100)
        end
    end)
end 
-- FASTREELCODE END

-- Fast Reel Toggle
local fastReelToggle = Tabs.Main:AddToggle("fastReel", { Title = "Fast Reel", Default = false })
fastReelToggle:OnChanged(function()
    if Options.fastReel.Value then
        task.spawn(StartFastReel)
    end
end)

local autoFishSettings = Tabs.Config:AddSection("Auto Fish Settings")

-- Auto Reel Delay Input
local fastReelDelayInputUI = Tabs.Config:AddInput("fastreeldelay", {
    Title = "Fast Reel Delay",
    Default = "0",  -- Set default value as string
    Placeholder = "Enter delay in seconds",
})


local perfectCatchChanceInputUI = Tabs.Config:AddInput("perfectCatchChance", {
    Title = "Perfect Catch Chance",
    Default = "0.2",  -- Default [[Nnaellx Ganteng boi]]
    Placeholder = "Enter chance (0.1-1)",
})
-- Auto Cast Delay Input
local autoCastDelayInputUI = autoFishSettings:AddInput("autocastdelay", {
    Title = "Auto Cast Delay",
    Default = "0",  -- Set default value as string
    Placeholder = "Enter delay in seconds",
})

local function StartAutoFishing()
    spawn(function()
        while autoCastEnabled do
            pcall(function()
                local character = LocalPlayer.Character
                if character then
                    local rodName = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value
                    local rod = character:FindFirstChildOfClass("Tool") or LocalPlayer.Backpack:FindFirstChild(rodName)

                    if rod and rod.Parent == LocalPlayer.Backpack then
                        character.Humanoid:EquipTool(rod)
                    end

                    if rod then
                        local values = rod:FindFirstChild("values")
                        local events = rod:FindFirstChild("events")

                        if values and events and not values.casted.Value then
                            -- Memainkan animasi lemparan sebelum casting
                            local Animations = ReplicatedStorage:WaitForChild("resources"):WaitForChild("animations")
                            local ThrowAnim = character.Humanoid:LoadAnimation(Animations.fishing.throw)
                            ThrowAnim:Play()
                            
                            events.cast:FireServer(100, 1)
                        end
                    end
                end
            end)
            local autoCastDelay = tonumber(autoCastDelayInputUI.Text) or 0
            task.wait(autoCastDelay) -- Menggunakan nilai dari input sebagai delay
        end
    end)
end

autoCast:OnChanged(function()
    autoCastEnabled = Options.autoCast.Value
    if autoCastEnabled then
        StartAutoFishing()
    end
end)

-- Auto Shake Delay Input
local autoShakeDelayInputUI = Tabs.Config:AddInput("autoshakedelay", {
    Title = "Auto Shake Delay",
    Default = "1",  -- Set default value as string
    Placeholder = "Enter delay in seconds",
})

autoShake:OnChanged(function()
    pcall(function()
        if Options.autoShake.Value then
            autoShakeEnabled = true
            task.defer(function()
                while autoShakeEnabled do
                    local rod = LocalCharacter and LocalCharacter:FindFirstChildOfClass("Tool")
                    if rod and rod:FindFirstChild("bobber") then
                        rod.events.shake:FireServer()
                    end
                    -- Gunakan nilai dari input sebagai delay dengan randomisasi untuk menghindari deteksi
                    local autoShakeDelay = tonumber(autoShakeDelayInputUI.Text) or 1
                    task.wait(math.random(autoShakeDelay, autoShakeDelay + 1))
                end
            end)
        else
            autoShakeEnabled = false
        end
    end)
end)

-- Auto Shake Mode Dropdown
local section = Tabs.Config:AddSection("Mode Fishing")
local autoShakeMode = Tabs.Config:AddDropdown("autoShakeMode", {
    Title = "Auto Shake Mode",
    Values = {"Navigation"},
    Multi = false,
    Default = ShakeMode,
})

autoShakeMode:OnChanged(function(Value)
    ShakeMode = Value
end)
-- Freeze Code
local FreezeCharacter = Tabs.Main:AddToggle("FreezeCharacter", {Title = "Freeze Character", Default = false })
FreezeCharacter:OnChanged(function()
    local oldpos = HumanoidRootPart.CFrame
    FreezeChar = Options.FreezeCharacter.Value
    task.wait()
    while WaitForSomeone(RenderStepped) do
        if FreezeChar and HumanoidRootPart ~= nil then
            task.wait()
            HumanoidRootPart.CFrame = oldpos
        else
            break
        end
    end
end)
-- Save Zone Code
    local Config = Tabs.Config:AddSection("Save Zone")

    -- Table untuk menyimpan zona memancing
    local fishZones = {}
    
    -- UI Dropdown untuk memilih zona memancing
    local fishZoneDropdown = Tabs.Config:AddDropdown("FishZoneDropdown", {
        Title = "Select Fishing Zone",
        Values = {},
        Multi = false,
        Default = nil,
    })
    
    -- Input Box untuk Nama Zona
    local zoneNameInput = Tabs.Config:AddInput("ZoneNameInput", {
        Title = "Zone Name",
        Default = "Fishing Spot",
        Placeholder = "Enter zone name...",
    })
    
    -- Button untuk membuat zona baru
    Tabs.Config:AddButton({
        Title = "Create Fish Zone",
        Description = "Save current location as a Fishing Zone (Will Be Deleted If Rejoin Game)",
        Callback = function()
            local playerPos = LocalPlayer.Character.HumanoidRootPart.CFrame
            local zoneName = zoneNameInput.Value ~= "" and zoneNameInput.Value or "Zone " .. tostring(#fishZones + 1)
    
            -- Simpan zona baru ke table
            fishZones[zoneName] = playerPos
    
            -- Update Dropdown UI
            table.insert(fishZoneDropdown.Values, zoneName)
            fishZoneDropdown:SetValues(fishZoneDropdown.Values)
    
            -- Notify user
            Fluent:Notify({
                Title = "Fishing Zone",
                Content = "Created new zone: " .. zoneName,
                Duration = 5
            })
        end
    })
    
    -- Saat memilih zona, teleport ke lokasi tersebut
    fishZoneDropdown:OnChanged(function(selectedZone)
        if fishZones[selectedZone] and LocalPlayer.Character then
            local targetPos = fishZones[selectedZone] * CFrame.new(0, 3, 0) -- Sedikit di atas agar tetap stabil
            LocalPlayer.Character.HumanoidRootPart.CFrame = targetPos
        end
    end)

    -- AutoBalanceNuke
local autoBalanceNukeEnabled = true
local Connections2 = {}
local StartMinigame

Tabs.Main:AddToggle("AutoBalanceNuke", {
    Title = "Auto Balance Nuke",
    Default = true,
    Callback = function(value)
        autoBalanceNukeEnabled = value

        if autoBalanceNukeEnabled then
            if getgc then
                task.spawn(function()
                    for _, v in pairs(getgc(true)) do
                        if type(v) == "function" then
                            local name = debug.info(v, "n")

                            if name == "StartMinigame" then
                                task.spawn(function()
                                    -- v()
                                end)

                                StartMinigame = v
                            elseif name == "LoopMinigame" then
                                if debug.setupvalue then
                                    task.spawn(function()
                                        while autoBalanceNukeEnabled do
                                            local success = pcall(function()
                                                debug.setupvalue(v, 13, os.clock() - 10)
                                            end)

                                            if not success then
                                                break
                                            end

                                            task.wait()
                                        end
                                    end)
                                end
                            end
                        end
                    end
                end)
            else
                local LocalPlayer = game.Players.LocalPlayer
                task.wait(1)
                local nukeGui = LocalPlayer.PlayerGui:FindFirstChild("NukeMinigame")
                if nukeGui then
                    Connections2.AutoBalanceNuke = nukeGui.Center.Marker.Pointer.Frame:GetPropertyChangedSignal("AbsoluteRotation"):Connect(function()
                        local rot = nukeGui.Center.Marker.Pointer.Frame.AbsoluteRotation
                        if rot < -35 then
                            VIM:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                            VIM:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                        elseif rot > 35 then
                            VIM:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
                            VIM:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
                        end
                    end)
                end
            end
        else
            if Connections2.AutoBalanceNuke then
                Connections2.AutoBalanceNuke:Disconnect()
                Connections2.AutoBalanceNuke = nil
            end
        end
    end
})
local section = Tabs.CharacterTab:AddSection("Character")

-- Fungsi untuk membuat efek gradient ungu-putih yang lebih tebal & terang
local function createPurpleWhiteGradient(obj)
    if obj and obj:IsA("TextLabel") then
        obj.RichText = true 

        local uiGradient = Instance.new("UIGradient")
        uiGradient.Parent = obj
        uiGradient.Rotation = 90 -- Gradient dari atas ke bawah
        uiGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 0, 255)), -- Ungu lebih terang
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)) -- Putih
        }
    end
end

getgenv().name = "⭐.gg/ancestral"
local Plr = game.Players.LocalPlayer

local function ProtectIdentity()
    for _, Value in ipairs(game:GetDescendants()) do
        if Value:IsA("TextLabel") and Value.Text:find(Plr.Name) then
            Value.Text = Value.Text:gsub(Plr.Name, getgenv().name)
            Value:GetPropertyChangedSignal("Text"):Connect(function()
                Value.Text = Value.Text:gsub(Plr.Name, getgenv().name)
            end)
            
            createPurpleWhiteGradient(Value) -- Terapkan gradient ke semua teks
        end
    end

    game.DescendantAdded:Connect(function(Value)
        if Value:IsA("TextLabel") and Value.Text:find(Plr.Name) then
            Value:GetPropertyChangedSignal("Text"):Connect(function()
                Value.Text = Value.Text:gsub(Plr.Name, getgenv().name)
            end)
            Value.Text = Value.Text:gsub(Plr.Name, getgenv().name)

            createPurpleWhiteGradient(Value) -- Terapkan gradient ke semua teks
        end
    end)
end

-- Toggle untuk mengaktifkan Protect Identity
local IdentityHiderUI = Tabs.CharacterTab:AddToggle("IdentityHiderUI", {
    Title = "Protect Identity",
    Description = "Hides only your own name",
    Default = false
})

IdentityHiderUI:OnChanged(function()
    if Options.IdentityHiderUI.Value then
        ProtectIdentity()
        
        if UserPlayer:FindFirstChild("streak") then
            UserPlayer.streak.Text = "Ancestral"
            createPurpleWhiteGradient(UserPlayer.streak)
        end
        if UserPlayer:FindFirstChild("level") then
            UserPlayer.level.Text = "Ancestral"
            createPurpleWhiteGradient(UserPlayer.level)
        end
        if UserPlayer:FindFirstChild("user") then
            UserPlayer.user.Text = "Ancestral Protect"
            createPurpleWhiteGradient(UserPlayer.user)
        end

        local hud = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("hud"):WaitForChild("safezone")
        if hud:FindFirstChild("coins") then
            hud.coins.Text = "HIDDEN"
            createPurpleWhiteGradient(hud.coins) -- Terapkan gradient ungu-putih ke coins
        end

        if hud:FindFirstChild("lvl") then
            hud.lvl.Text = "Ancestral MAX"
            createPurpleWhiteGradient(hud.lvl)
        end
    end
end)

    local WalkOnWater = Tabs.CharacterTab:AddToggle("WalkOnWater", {Title = "Walk On Water", Default = false })
    WalkOnWater:OnChanged(function()
        for i,v in pairs(workspace.zones.fishing:GetChildren()) do
			if v.Name == WalkZone then
				v.CanCollide = Options.WalkOnWater.Value
                if v.Name == "Ocean" then
                    for i,v in pairs(workspace.zones.fishing:GetChildren()) do
                        if v.Name == "Deep Ocean" then
                            v.CanCollide = Options.WalkOnWater.Value
                        end
                    end
                end
			end
		end
    end)
    local WalkOnWaterZone = Tabs.CharacterTab:AddDropdown("WalkOnWaterZone", {
        Title = "Walk On Water Zone",
        Values = {"Ocean", "Desolate Deep", "The Depths"},
        Multi = false,
        Default = "Ocean",
    })
    WalkOnWaterZone:OnChanged(function(Value)
        WalkZone = Value
    end)
    local WalkSpeedToggle = Tabs.CharacterTab:AddToggle("WalkSpeedToggle", {
        Title = "Enable Walk Speed",
        Default = false,
    })
    
    local WalkSpeedInputUI = Tabs.CharacterTab:AddInput("WalkSpeedInputUI", {
        Title = "Walk Speed",
        Default = "16",
        Placeholder = "Enter walk speed",
    })
    
    WalkSpeedToggle:OnChanged(function(enabled)
        if enabled then
            local walkSpeed = tonumber(WalkSpeedInputUI.Value)
            if walkSpeed then
                LocalPlayer.Character.Humanoid.WalkSpeed = walkSpeed
            end
        else
            LocalPlayer.Character.Humanoid.WalkSpeed = 16 -- Reset ke default
        end
    end)
    
    WalkSpeedInputUI:OnChanged(function(value)
        if WalkSpeedToggle.Value then
            local walkSpeed = tonumber(value)
            if walkSpeed then
                LocalPlayer.Character.Humanoid.WalkSpeed = walkSpeed
            end
        end
    end)
    
    local JumpHeightToggle = Tabs.CharacterTab:AddToggle("JumpHeightToggle", {
        Title = "Enable Jump Height",
        Default = false,
    })
    
    local JumpHeightInputUI = Tabs.CharacterTab:AddInput("JumpHeightInputUI", {
        Title = "Jump Height",
        Default = "50",
        Placeholder = "Enter jump height",
    })
    
    JumpHeightToggle:OnChanged(function(enabled)
        if enabled then
            local jumpPower = tonumber(JumpHeightInputUI.Value)
            if jumpPower then
                LocalPlayer.Character.Humanoid.JumpPower = jumpPower
            end
        else
            LocalPlayer.Character.Humanoid.JumpPower = 50 -- Reset ke default
        end
    end)
    
    JumpHeightInputUI:OnChanged(function(value)
        if JumpHeightToggle.Value then
            local jumpPower = tonumber(value)
            if jumpPower then
                LocalPlayer.Character.Humanoid.JumpPower = jumpPower
            end
        end
    end)
-- Noclip
    local ToggleNoclip = Tabs.CharacterTab:AddToggle("ToggleNoclip", {Title = "Noclip", Default = false })
    ToggleNoclip:OnChanged(function()
        Noclip = Options.ToggleNoclip.Value
    end)
-- // // // Noclip Stepped // // // --
NoclipConnection = RunService.Stepped:Connect(function()
    if Noclip == true then
        if LocalCharacter ~= nil then
            for i, v in pairs(LocalCharacter:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide == true then
                    v.CanCollide = false
                end
            end
        end
    end
end)
Tabs.CharacterTab:AddToggle("InfiniteOxygen", {Title = "Infinite Oxygen", Default = false}):OnChanged(function(m)
    local character = LocalPlayer.Character
    if m then
        local divingTank = Instance.new("Glue")
        divingTank.Name = "DivingTank"
        divingTank:SetAttribute("Tier", 9e9)
        divingTank.Parent = character
    else
        local existingTank = character:FindFirstChild("DivingTank")
        if existingTank then
            existingTank:Destroy()
        end
    end
end)
local BypassRadar = Tabs.CharacterTab:AddToggle("BypassRadar", {Title = "Bypass Fish Radar", Default = false })
BypassRadar:OnChanged(function()
    for _, v in pairs(game:GetService("CollectionService"):GetTagged("radarTag")) do
        if v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
            v.Enabled = Options.BypassRadar.Value
        end
    end
end)
Tabs.CharacterTab:AddToggle("AntiDrown", {
    Title = "Disable Temperature",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        local temperature = LocalPlayer.Character:FindFirstChild("client") and LocalPlayer.Character.client:FindFirstChild("temperature")
        -- print("Temperature Object:", temperature)
        if isEnabled then
            if temperature then
                -- print("Connecting to Temperature")
                temperature.Disabled = true
                temperatureConnection = temperature.Changed:Connect(function()
                    -- print("Temperature Changed - Disabled:", temperature.Disabled)
                    temperature.Disabled = true
                end)
            end
        else
            if temperatureConnection then
                -- print("Disconnecting Temperature connection")
                temperatureConnection:Disconnect()
                temperature.Enabled = true
            end
        end
    end,
})
--[[#Naaellx Code]]
-- Menemukan folder teleportasi di dalam world
for i, v in pairs(TpSpotsFolder:GetChildren()) do
    if table.find(teleportSpots, v.Name) == nil then
        table.insert(teleportSpots, v.Name)
    end
end

-- Pastikan teleportSpots terurut alfabetis
table.sort(teleportSpots, function(a, b)
    return a:lower() < b:lower()
end)

local IslandTPDropdownUI = Tabs.Teleports:AddDropdown("IslandTPDropdownUI", {
    Title = "Area Teleport",
    Values = teleportSpots,
    Multi = false,
    Default = nil,
})

if game:GetService("UserInputService").TouchEnabled then
    Tabs.Teleports:AddButton({
        Title = "Teleport To Selection",
        Callback = function()
            local Value = IslandTPDropdownUI.Value
            if Value and HumanoidRootPart then
                xpcall(function()
                    local target = TpSpotsFolder:FindFirstChild(Value)
                    if target then
                        HumanoidRootPart.CFrame = target.CFrame + Vector3.new(0, 5, 0)
                        IslandTPDropdownUI:SetValue(nil)
                    end
                end, function(err)
                    warn("Teleport Error: ", err)
                end)
            end
        end
    })
else
    IslandTPDropdownUI:OnChanged(function(Value)
        if Value and HumanoidRootPart then
            xpcall(function()
                local target = TpSpotsFolder:FindFirstChild(Value)
                if target then
                    HumanoidRootPart.CFrame = target.CFrame + Vector3.new(0, 5, 0)
                    IslandTPDropdownUI:SetValue(nil)
                end
            end, function(err)
                warn("Teleport Error: ", err)
            end)
        end
    end)
end

-- Menemukan folder NPC di dalam world
local NpcFolder = Workspace:FindFirstChild("world"):WaitForChild("npcs")
local npcList = {}
local npcPositions = {}

-- Menambahkan NPC yang ditemukan di dalam game
for _, npc in pairs(NpcFolder:GetChildren()) do
    if npc:IsA("Model") and npc:FindFirstChild("HumanoidRootPart") then
        table.insert(npcList, npc.Name)
        npcPositions[npc.Name] = npc.HumanoidRootPart.Position
    end
end

-- Menambahkan NPC manual
local npcData = {
    {name = "Marc Merchant", position = Vector3.new(466, 151, 224)},
    {name = "Appraiser", position = Vector3.new(453.182, 150.5, 206.909)},
    {name = "Merlin", position = Vector3.new(-928.033, 223.7, -998.745)},
    {name = "Jack Marrow", position = Vector3.new(-2829.856, 212.093, 1517.44)},
    {name = "Mods Lantern Keeper", position = Vector3.new(-39, -247, 196)},
    {name = "Terrapin Shipwright", position = Vector3.new(5869.422, 143.498, 7.101)}
}

for _, npc in pairs(npcData) do
    table.insert(npcList, npc.name)
    npcPositions[npc.name] = npc.position
end

-- Pastikan npcList terurut alfabetis
table.sort(npcList, function(a, b)
    return a:lower() < b:lower()
end)

-- Dropdown untuk memilih NPC tujuan teleportasi
local NpcTPDropdownUI = Tabs.Teleports:AddDropdown("NpcTPDropdownUI", {
    Title = "NPC Teleport",
    Description = "Select an NPC to teleport to.",
    Values = npcList,
    Multi = false,
    Default = nil,
})

if game:GetService("UserInputService").TouchEnabled then
    Tabs.Teleports:AddButton({
        Title = "Teleport To NPC",
        Callback = function()
            local Value = NpcTPDropdownUI.Value
            if Value and HumanoidRootPart then
                xpcall(function()
                    local targetPosition = npcPositions[Value]
                    if targetPosition then
                        HumanoidRootPart.CFrame = CFrame.new(targetPosition + Vector3.new(0, 3, 0))
                        NpcTPDropdownUI:SetValue(nil) -- Reset dropdown setelah teleportasi
                    else
                        warn("NPC position not found!")
                    end
                end, function(err)
                    warn("Teleport Error: ", err)
                end)
            end
        end
    })
else
    NpcTPDropdownUI:OnChanged(function(Value)
        if Value and HumanoidRootPart then
            xpcall(function()
                local targetPosition = npcPositions[Value]
                if targetPosition then
                    HumanoidRootPart.CFrame = CFrame.new(targetPosition + Vector3.new(0, 3, 0))
                    NpcTPDropdownUI:SetValue(nil)
                else
                    warn("NPC position not found!")
                end
            end, function(err)
                warn("Teleport Error: ", err)
            end)
        end
    end)
end
local section = Tabs.Teleports:AddSection("Useful Feature")
Tabs.Teleports:AddButton({
    Title = "Discover All Locations [XP]",
    Variant = "Primary",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local success, event = pcall(function()
            return ReplicatedStorage:WaitForChild("events"):WaitForChild("discoverlocation")
        end)

        if not success or not event then
            -- Jika event tidak ditemukan, tampilkan notifikasi gagal
            Fluent:Notify({
                Title = "Error",
                Content = "Failed to find discoverlocation event!",
                Duration = 3
            })
            return
        end

        local Locations = {
            ["The Depths"] = {}, ["Roslit"] = {}, ["Ancient Isle"] = {}, ["Sunstone"] = {}, ["Volcanic Vents"] = {},
            ["Winter's Edge"] = {}, ["Frigid Cavern"] = {}, ["Atlantean Storm"] = {}, ["Abyssal Zenith"] = {}, ["Terrapin"] = {},
            ["Ancient Archives"] = {}, ["Snowcap"] = {}, ["Glacial Grotto"] = {}, ["All"] = {}, ["Ashfall"] = {},
            ["Overgrowth Caves"] = {}, ["Roslit Volcano"] = {}, ["Veil of the Forsaken"] = {}, ["Calm Zone"] = {}, ["Moosewood"] = {},
            ["Vertigo"] = {}, ["FischFright"] = {}, ["Challenger's Deep"] = {}, ["Keepers Altar"] = {}, ["Ocean"] = {},
            ["Archeological Site"] = {}, ["Cryogenic Canal"] = {}, ["Forsaken Shores"] = {}, ["Fischgiving"] = {}, ["Grand Reef"] = {},
            ["Brine Pool"] = {}, ["Fischmas"] = {}, ["Desolate Deep"] = {}, ["Mushgrove"] = {}, ["Golden Tide"] = {}, ["Atlantis"] = {}
        }

        for key in pairs(Locations) do
            event:FireServer(key)
        end

        -- Tampilkan notifikasi sukses
        Fluent:Notify({
            Title = "Ancestral",
            Content = "All Location Has Been Discover!",
            Duration = 8
        })
    end,
})

    local rodsFolder = game:GetService("ReplicatedStorage").resources.items.rods
    local event = game:GetService("ReplicatedStorage").events.purchase
-- Mengumpulkan nama semua pancingan dalam folder
local rodNames = {}
for _, rod in pairs(rodsFolder:GetChildren()) do
    if rod:IsA("Folder") then
        table.insert(rodNames, rod.Name)
    end
end

-- Dropdown untuk memilih pancingan
local RodDropdown = Tabs.Items:AddDropdown("RodSelection", {
    Title = "Select a Rod",
    Description = "Choose a fishing rod from the shop to purchase.", 
    Values = rodNames,
    Multi = false,
    Default = nil,
})

Tabs.Items:AddButton({
    Title = "Buy Selected Rod",
    Description = "Click this button to purchase the selected fishing rod.", 
    Callback = function()
        local selectedRod = RodDropdown.Value
        if selectedRod then
            event:FireServer(selectedRod, "Rod", nil, 1)
        else
            warn("No Rod selected!")
        end
    end
})

-- Mengumpulkan daftar item dari folder
local itemsFolder = game:GetService("ReplicatedStorage"):FindFirstChild("resources") 
    and game:GetService("ReplicatedStorage").resources:FindFirstChild("items") 
    and game:GetService("ReplicatedStorage").resources.items:FindFirstChild("items")

local itemNames = {}

if itemsFolder then
    for _, item in pairs(itemsFolder:GetChildren()) do
        if item:IsA("Folder") then
            table.insert(itemNames, item.Name)
        end
    end
else
    warn("Items folder not found")
end

-- Input jumlah item yang ingin dibeli
local BuyAmountInput = Tabs.Items:AddInput("BuyAmountInput", {
    Title = "Amount to Buy",
    Default = "1",
    Placeholder = "Enter amount...",
    Numeric = true
})

-- Dropdown untuk memilih item
local ItemDropdown = Tabs.Items:AddDropdown("ItemSelection", {
    Title = "Select an Item",
    Description = "Choose an item from the shop to purchase.", -- Deskripsi ditambahkan
    Values = itemNames,
    Multi = false,
    Default = nil,
})

-- Tombol untuk membeli item yang dipilih
Tabs.Items:AddButton({
    Title = "Buy Selected Item",
    Description = "Click this button to purchase the selected item from the shop.", -- Deskripsi ditambahkan
    Callback = function()
        local selectedItem = ItemDropdown.Value
        local selectedAmount = tonumber(BuyAmountInput.Value) or 1
        
        if selectedItem then
            game:GetService("ReplicatedStorage").events.purchase:FireServer(selectedItem, "Item", nil, selectedAmount)
        else
            warn("No item selected!")
        end
    end
})
    local BuyAmountInput = Tabs.Items:AddInput("BuyAmountInput", {
        Title = "Amount to Buy",
        Default = "1",
        Placeholder = "Enter amount...",
        Numeric = true
    })
    
    Tabs.Items:AddButton({
        Title = "Buy Enchant Relic",
        Description = "View 11,000C$/1",
        Callback = function()
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local amount = tonumber(BuyAmountInput.Value) or 1
    
            local previousPosition = character.HumanoidRootPart.Position
            local targetPosition = Vector3.new(-931.5254516601562, 223.78355407714844, -986.8485717773438)
            character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
    
            local merlin = workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("power")
            
            for i = 1, amount do
                merlin:InvokeServer()
            end
    
            character:SetPrimaryPartCFrame(CFrame.new(previousPosition))
        end
    })
    
    Tabs.Items:AddButton({
        Title = "Buy Luck Upgrade",
        Description = "Need 5,000C$/1",
        Callback = function()
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local amount = tonumber(BuyAmountInput.Value) or 1
    
            local previousPosition = character.HumanoidRootPart.Position
            local targetPosition = Vector3.new(-931.525, 223.784, -986.849)
            character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
    
            local merlinLuck = workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("luck")
            
            for i = 1, amount do
                merlinLuck:InvokeServer()
            end
    
            character:SetPrimaryPartCFrame(CFrame.new(previousPosition))
        end
    })
    
local WorldEventTPDropdownUI = Tabs.Event:AddDropdown("WorldEventTPDropdownUI", {
    Title = "Select World Event",
    Values = {"Strange Whirlpool", "Great Hammerhead Shark", "Great White Shark", "Whale Shark", "The Depths - Serpent","The Kraken"},
    Multi = false,
    Default = nil,
})

local EventData = {
    ["Strange Whirlpool"] = {name = "Isonade", offset = Vector3.new(10, 110, 10)},
    ["Great Hammerhead Shark"] = {name = "Great Hammerhead Shark", offset = Vector3.new(10, 110, 10)},
    ["Great White Shark"] = {name = "Great White Shark", offset = Vector3.new(10, 110, 10)},
    ["Whale Shark"] = {name = "Whale Shark", offset = Vector3.new(10, 110, 10)},
    ["The Depths - Serpent"] = {name = "The Depths - Serpent", offset = Vector3.new(10, 110, 10)},
    ["The Kraken"] = {name = "The Kraken", offset = Vector3.new(10, 110, 10)},
}

local autoTeleportEnabled = false
local selectedEvent = nil
local originalCFrame = nil -- Simpan posisi awal sebelum teleportasi
local player = game.Players.LocalPlayer

-- Fungsi untuk teleport dan tetap bisa auto cast tanpa gerakan
local function FloatAboveZone()
    local character = player.Character or player.CharacterAdded:Wait()
    if not character then return end

    local HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    local Humanoid = character:FindFirstChildOfClass("Humanoid")
    if not HumanoidRootPart or not Humanoid then return end

    -- Simpan posisi awal sebelum teleport
    originalCFrame = HumanoidRootPart.CFrame 

    -- Gunakan BodyVelocity agar tidak jatuh, tapi tetap bisa auto cast
    local BodyVelocity = Instance.new("BodyVelocity")
    BodyVelocity.Velocity = Vector3.new(0, 0.1, 0) -- Efek anti-gravity
    BodyVelocity.MaxForce = Vector3.new(0, math.huge, 0) -- Mencegah jatuh
    BodyVelocity.Parent = HumanoidRootPart

    -- Nonaktifkan gerakan karakter tanpa freeze total
    local WalkSpeedBackup = Humanoid.WalkSpeed
    local JumpPowerBackup = Humanoid.JumpPower
    Humanoid.WalkSpeed = 0
    Humanoid.JumpPower = 0

    -- Jangan gerakkan karakter ke mana-mana
    local originalCFrameNoMove = HumanoidRootPart.CFrame

    while autoTeleportEnabled do
        local eventFound = false

        if selectedEvent then
            local eventInfo = EventData[selectedEvent]
            local eventObject = game.Workspace.zones.fishing:FindFirstChild(eventInfo.name)

            if eventObject then
                -- Teleport ke atas zona event
                eventFound = true
                HumanoidRootPart.CFrame = CFrame.new(eventObject.Position + eventInfo.offset)
                
                -- Tunggu sampai event selesai
                repeat
                    task.wait(1)
                until not eventObject.Parent

                break -- Setelah event selesai, keluar dari loop
            end
        end

        if not eventFound then
            ShowNotification("No selected event found!")
        end

        task.wait(1) -- Cek setiap 1 detik
    end

    -- Hapus efek anti-gravity setelah event selesai
    BodyVelocity:Destroy()

    -- Kembalikan kecepatan gerakan & loncatan karakter
    Humanoid.WalkSpeed = WalkSpeedBackup
    Humanoid.JumpPower = JumpPowerBackup

    -- Kembali ke posisi awal tanpa gerak
    if originalCFrame then
        HumanoidRootPart.CFrame = originalCFrameNoMove
    end
end

-- Event Selection Dropdown
WorldEventTPDropdownUI:OnChanged(function(Value)
    selectedEvent = Value -- Simpan event yang dipilih
end)

-- Auto Teleport Toggle
Tabs.Event:AddToggle("AutoTeleport", {
    Title = "Auto Teleport to Event",
    Default = false,
    Callback = function(value)
        autoTeleportEnabled = value
        if autoTeleportEnabled then
            FloatAboveZone()
        end
    end
})
-- Forge Tab
variables = variables or {} -- Pastikan variables sudah ada sebelum digunakan

local section = Tabs.Forge:AddSection("Feature")
genv = genv or {} -- Pastikan genv tidak nil

Tabs.Forge:AddToggle("AutoOpenItem", {
    Title = "Auto Open Bait",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.AutoOpenItem = isEnabled
        while genv.AutoOpenItem do
            local item = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if item then
                item:Activate()
            else
                genv.AutoOpenItem = false
                return
            end
            task.wait(0.1)
        end
    end,
})
Tabs.Forge:AddToggle("AutoOpenSkinCrate", {
    Title = "Auto Open Held Skin Crate",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.AutoOpenSkinCrate = isEnabled
        if genv.AutoOpenSkinCrate then
            local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            
            if tool then
                if tool.Name == "Skin Crate" then
                    local skinLink = tostring(tool.link.Value)
                    local stackValue = tonumber(ReplicatedStorage.playerstats[game.Players.LocalPlayer.Name].Inventory[skinLink].Stack.Value)

                    for i = 1, stackValue do
                        ReplicatedStorage.packages.Net["RF/SkinCrates/RequestSpin"]:InvokeServer()
                        task.wait(8)

                        if not genv.AutoOpenSkinCrate then
                            break
                        end
                    end

                    Fluent:Notify({Title = "Auto Open Skin Crate", Content = "Completed", Duration = 5})
                else
                    Fluent:Notify({Title = "Auto Open Skin Crate", Content = "You're not holding a Skin Crate...", Duration = 5})
                end
            else
                Fluent:Notify({Title = "Auto Open Skin Crate", Content = "You're not holding a Skin Crate...", Duration = 5})
            end
        end
    end,
})
Tabs.Forge:AddToggle("AutoSell", {
    Title = "Auto Sell",
    Default = false,
    Description = "RE-Enable After use delay sell.",
    Callback = function(isEnabled)
        variables.autoselling = isEnabled
        if isEnabled then
            coroutine.wrap(function()
                while variables.autoselling do
                    pcall(function()
                        ReplicatedStorage.events.SellAll:InvokeServer()
                    end)
                    task.wait(variables.autoSellDelay or 60) -- Pastikan ada nilai default
                    if not variables.autoselling then break end
                end
            end)()
        end
    end,
})
Tabs.Forge:AddToggle("AutoSellHand", {
    Title = "Auto Sell Held Item",
    Default = false,
    Description = "Be smart to use this.",
    Callback = function(isEnabled)
        variables.autosellingHand = isEnabled
        while isEnabled do
            ReplicatedStorage.events.Sell:InvokeServer()
            task.wait()
        end
    end,
})
Tabs.Forge:AddInput("Auto Sell Delay", {
    Title = "Auto Sell Delay [S]",
    Description = "",
    Default = "60",
    Numeric = true,
    Callback = function(value)
        variables.autoSellDelay = tonumber(value) or 60
    end,
})
Tabs.Forge:AddButton({
    Title = "Sell All",
    Variant = "Primary",
    Callback = function()
        ReplicatedStorage.events.SellAll:InvokeServer()
    end,
})

Tabs.Forge:AddButton({
    Title = "Sell Hand",
    Variant = "Primary",
    Callback = function()
        ReplicatedStorage.events.Sell:InvokeServer()
    end,
})
local section = Tabs.Forge:AddSection("Treasure")
Tabs.Forge:AddButton({
    Title = "Teleport to Jack Marrow",
    Callback = function()
        HumanoidRootPart.CFrame = CFrame.new(-2824.359, 214.311, 1518.130)
    end
})
Tabs.Forge:AddButton({
    Title = "Repair Map",
    Callback = function()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
            if v.Name == "Treasure Map" then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                workspace.world.npcs["Jack Marrow"].treasure.repairmap:InvokeServer()
            end
        end
    end
})
Tabs.Forge:AddButton({
    Title = "Collect Treasure",
    Callback = function()
        for i, v in ipairs(game:GetService("Workspace"):GetDescendants()) do
            if v.ClassName == "ProximityPrompt" then
                v.HoldDuration = 0
            end
        end
        for i, v in pairs(workspace.world.chests:GetDescendants()) do
            if v:IsA("Part") and v:FindFirstChild("ChestSetup") then 
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                for _, v in pairs(workspace.world.chests:GetDescendants()) do
                    if v.Name == "ProximityPrompt" then
                        fireproximityprompt(v)
                    end
                end
                task.wait(1)
            end 
        end
    end
})
    -- // Exclusives Tab // --
    local sectionExclus = Tabs.Exclusives:AddSection("Exclusives Feature")
    local autoCastEnabled = false
    -- // // // Auto Shake // // // --
local autoShakeEnabled = false
local autoShakeConnection

local function autoShake()
    if ShakeMode == "Navigation" then
        task.wait()
        xpcall(function()
            local shakeui = PlayerGui:FindFirstChild("shakeui")
            if not shakeui then return end
            local safezone = shakeui:FindFirstChild("safezone")
            local button = safezone and safezone:FindFirstChild("button")
            task.wait(0.2)
            GuiService.SelectedObject = button
            if GuiService.SelectedObject == button then
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            end
            task.wait(0.1)
            GuiService.SelectedObject = nil
        end,function (err)
        end)
    elseif ShakeMode == "Mouse" then
        task.wait()
        xpcall(function()
            local shakeui = PlayerGui:FindFirstChild("shakeui")
            if not shakeui then return end
            local safezone = shakeui:FindFirstChild("safezone")
            local button = safezone and safezone:FindFirstChild("button")
            local pos = button.AbsolutePosition
            local size = button.AbsoluteSize
            VirtualInputManager:SendMouseButtonEvent(pos.X + size.X / 2, pos.Y + size.Y / 2, 0, true, LocalPlayer, 0)
            VirtualInputManager:SendMouseButtonEvent(pos.X + size.X / 2, pos.Y + size.Y / 2, 0, false, LocalPlayer, 0)
        end,function (err)
        end)
    end
end

local function startAutoShake()
    if autoShakeConnection or not autoShakeEnabled then return end
    autoShakeConnection = RunService.RenderStepped:Connect(autoShake)
end

local function stopAutoShake()
    if autoShakeConnection then
        autoShakeConnection:Disconnect()
        autoShakeConnection = nil
    end
end

PlayerGui.DescendantAdded:Connect(function(descendant)
    if autoShakeEnabled and descendant.Name == "button" and descendant.Parent and descendant.Parent.Name == "safezone" then
        startAutoShake()
    end
end)

PlayerGui.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "playerbar" and descendant.Parent and descendant.Parent.Name == "bar" then
        stopAutoShake()
    end
end)

if autoShakeEnabled and PlayerGui:FindFirstChild("shakeui") and PlayerGui.shakeui:FindFirstChild("safezone") and PlayerGui.shakeui.safezone:FindFirstChild("button") then
    startAutoShake()
end

-- // // // Auto Reel // // // --
local autoReelEnabled = false
local PerfectCatchEnabled = false
local autoReelConnection
local ReelMode = "Legit" -- Atau "Blatant", sesuaikan sesuai kebutuhan
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerGui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")

-- // // // Zone Cast // // // --
    local section = Tabs.Exclusives:AddSection("Active All For Use")
    -- AutoCastToggle
    local autoCast = Tabs.Exclusives:AddToggle("autoCast", { Title = "Auto Cast", Default = false })
    -- AutoShakeToggle
    local autoShake = Tabs.Exclusives:AddToggle("autoShake", { Title = "Auto Shake", Default = false })

local autoReelEnabled = false
local instaReelEnabled = false
-- AUTO RELL LEGIT
local function StartAutoReel()
    spawn(function()
        while autoReelEnabled do
            local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
            if reelGui then
                local bar = reelGui:FindFirstChild("bar")
                if bar then
                    local playerBar = bar:FindFirstChild("playerbar")
                    local fish = bar:FindFirstChild("fish")
                    while bar and reelGui:IsDescendantOf(LocalPlayer.PlayerGui) do
                        RunService.RenderStepped:Wait()
                        local newPosition = playerBar.Position:Lerp(fish.Position, 0.7)
                        playerBar.Position = UDim2.fromScale(math.clamp(newPosition.X.Scale, 0.15, 0.85), newPosition.Y.Scale)
                    end
                end
            end
            wait(math.random(0.1, 0.3))
        end
    end)
end

-- AUTO REEL LEGIT END
    -- AutoreelToggleLegit
    local autoReelToggle = Tabs.Main:AddToggle("autoReel", { Title = "Auto Reel Legit", Default = false })
autoReelToggle:OnChanged(function()
    autoReelEnabled = Options.autoReel.Value
    if autoReelEnabled then
        task.spawn(StartAutoReel)
    end
end)
-- FASTREELCODE
local function StartFastReel()
    PlayerGui.ChildAdded:Connect(function(child)
        if child.Name == "reel" then
            task.spawn(function()
                while child.Parent == PlayerGui do
                    if Options.fastReel.Value then
                        local delay = tonumber(Options.fastreeldelay.Value) or 0
                        task.wait(delay)
                        local Bar = child:FindFirstChild("bar")
                        if Bar then
                            Bar:Destroy()
                        end
                        ReplicatedStorage.events["reelfinished "]:FireServer(100, true)
                    end
                    task.wait(0)
                end
            end)
        end
    end)
end 

-- FASTREELCODE END
-- Fast Reel Toggle
local fastReelToggle = Tabs.Exclusives:AddToggle("fastReel", { Title = "Fast Reel", Default = false })
fastReelToggle:OnChanged(function()
    if Options.fastReel.Value then
        task.spawn(StartFastReel)
    end
end)
    local autoFishSettings = Tabs.Exclusives:AddSection("Auto Fish Settings")
    -- Auto Reel Delay Input
    local fastReelDelayInputUI = Tabs.Exclusives:AddInput("fastreeldelay", {
        Title = "Fast Reel Delay",
        Default = "0",  -- Set default value as string
        Placeholder = "Enter delay in seconds",
    })
    
-- Auto Cast Delay Input
local autoCastDelayInputUI = autoFishSettings:AddInput("autocastdelay", {
    Title = "Auto Cast Delay",
    Default = "0",  -- Set default value as string
    Placeholder = "Enter delay in seconds",
})
instantBobber = false
local function StartAutoFishing()
    LocalPlayer.Character.ChildAdded:Connect(function(child)
        local rodName = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value
        if child.Name == rodName then
            if autoCastEnabled then
                task.spawn(function()
                    while autoCastEnabled and LocalPlayer.Character:FindFirstChild(rodName) do
                        local Rod = LocalPlayer.Character:FindFirstChild(rodName)
                        if Rod then
                            local randomValue = math.random(960, 989) / 10
                            Rod.events.cast:FireServer(randomValue, 1)
                            local Bobber = Rod:FindFirstChild("bobber")
                            if Bobber and instantBobber then
                                local Params = RaycastParams.new()
                                Params.FilterType = Enum.RaycastFilterType.Include
                                Params.FilterDescendantsInstances = { workspace.Terrain }
                                local RaycastResult = workspace:Raycast(Bobber.Position, -Vector3.yAxis * 100, Params)
                                if RaycastResult and RaycastResult.Instance and RaycastResult.Instance:IsA("Terrain") then
                                    if Bobber:IsA("Model") and Bobber.PrimaryPart then
                                        Bobber:SetPrimaryPartCFrame(CFrame.new(RaycastResult.Position))
                                    elseif Bobber:IsA("BasePart") then
                                        Bobber.CFrame = CFrame.new(RaycastResult.Position)
                                    end
                                end
                            end
                            game:GetService("RunService").Heartbeat:Wait() 
                        end
                    end
                end)
            end
        end
    end)    
end

autoCast:OnChanged(function()
    autoCastEnabled = Options.autoCast.Value
    if autoCastEnabled then
        StartAutoFishing()
    end
end)

local toggleInstantBobber = Tabs.Exclusives:AddToggle("InstantBobber", { 
    Title = "Instant Bobber", 
    Default = false 
})

toggleInstantBobber:OnChanged(function(value)
    instantBobber = value
end)
-- Auto Shake Delay Input
local autoShakeDelayInputUI = Tabs.Exclusives:AddInput("autoshakedelay", {
    Title = "Auto Shake Delay",
    Default = "1",  -- Set default value as string
    Placeholder = "Enter delay in seconds",
})

autoShake:OnChanged(function()
    pcall(function()
        if Options.autoShake.Value then
            autoShakeEnabled = true
            task.defer(function()
                while autoShakeEnabled do
                    local rod = LocalCharacter and LocalCharacter:FindFirstChildOfClass("Tool")
                    if rod and rod:FindFirstChild("bobber") then
                        rod.events.shake:FireServer()
                    end
                    -- Gunakan nilai dari input sebagai delay dengan randomisasi untuk menghindari deteksi
                    local autoShakeDelay = tonumber(autoShakeDelayInputUI.Text) or 1
                    task.wait(math.random(autoShakeDelay, autoShakeDelay + 1))
                end
            end)
        else
            autoShakeEnabled = false
        end
    end)
end)

-- Auto Shake Mode Dropdown
local section = Tabs.Exclusives:AddSection("Mode Fishing")
local autoShakeMode = Tabs.Exclusives:AddDropdown("autoShakeMode", {
    Title = "Auto Shake Mode",
    Values = {"Navigation"},
    Multi = false,
    Default = ShakeMode,
})

autoShakeMode:OnChanged(function(Value)
    ShakeMode = Value
end)
local FishingToggle = Tabs.Exclusives:AddToggle("FishingToggle", {
    Title = "Super Reel",
    Default = false
})
FishingToggle:OnChanged(function(value)         
    isFishing = value
    while isFishing do
        local rodName = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value
        local reel
        local startTime = tick()
        while not reel and tick() - startTime < 10 do
            reel = PlayerGui and PlayerGui:FindFirstChild("reel")
            task.wait(0.1)
        end
        if reel then
            reel:Destroy()
            LocalPlayer.Character.Humanoid:UnequipTools()
            task.wait(0)
            LocalPlayer.Character.Humanoid:EquipTool(Backpack:FindFirstChild(rodName))
        else
            LocalPlayer.Character.Humanoid:UnequipTools()
            task.wait(0)
            LocalPlayer.Character.Humanoid:EquipTool(Backpack:FindFirstChild(rodName))
        end
        task.wait(2)
    end         
end)
task.spawn(function()
    while true do
        local player = game:GetService("Players").LocalPlayer
        if player and player.Character then
            local rootPart = workspace:FindFirstChild(player.Character.Name)
            if rootPart then
                local humanoidRoot = rootPart:FindFirstChild("HumanoidRootPart")
                if humanoidRoot then
                    for _, obj in pairs(humanoidRoot:GetChildren()) do
                        if obj:IsA("Sound") then
                            obj:Destroy() 
                        end
                    end
                end
            end
        end
        task.wait(100)
    end
end)

RunService.Heartbeat:Connect(function()
    local fishUI = workspace:FindFirstChild("active")
    if fishUI then
        fishUI:Destroy()
    end
end)
local PromptButtonHoldBegan = nil

local InstantPPToggle = sectionExclus:AddToggle("InstantProximityPrompt", {
    Title = "Instant Interact NPC",
    Default = false,
    Description = "Instant Interact triggers Proximity Prompts instantly.",
    Callback = function(isEnabled)
        if isEnabled then
            if fireproximityprompt then
                PromptButtonHoldBegan = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
                    fireproximityprompt(prompt)
                end)
            else
                Fluent:Notify({
                    Title = "Incompatible Exploit",
                    Content = "Your exploit does not support this feature (missing fireproximityprompt)",
                    Duration = 8
                })
                InstantPPToggle:Set(false)
            end
        else
            if PromptButtonHoldBegan then
                PromptButtonHoldBegan:Disconnect()
                PromptButtonHoldBegan = nil
            end
        end
    end
})

Fluent:Notify({
    Title = "Ancestral",
    Content = "Executed!",
    Duration = 8
})

-- local function fakeDupeFish(times)
--     local Players = game:GetService("Players")
--     local LocalPlayer = Players.LocalPlayer
--     local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
--     local backpack = LocalPlayer:WaitForChild("Backpack")
--     local tool = character:FindFirstChildOfClass("Tool")

--     if tool then
--         for i = 1, times do
--             local toolClone = tool:Clone()
--             toolClone.Parent = backpack
--         end
--         Fluent:Notify({
--             Title = "Ancestral",
--             Content = "Dupe Fish Success! Cloned " .. times .. " fish.",
--             Duration = 2
--         })
--     else
--         Fluent:Notify({
--             Title = "Ancestral",
--             Content = "Please Hold a fish to Dupe",
--             Duration = 3
--         })
--     end
-- end

-- -- Pastikan Tabs.Exclusives sudah ada sebelum menambahkan tombol
-- if Tabs and Tabs.Exclusives then
--     sectionExclus:AddButton({
--         Text = "Dupe Fish [Visual]",
--         Callback = function()
--             local dupeCount = math.random(5, 10)
--             fakeDupeFish(dupeCount)
--         end
--     })
-- else
--     warn("Tabs.Exclusives tidak ditemukan, pastikan Fluent UI Darwis sudah dimuat dengan benar!")
-- end
-- Misc Tab
local section = Tabs.Visual:AddSection("Visual Feature")
local NameInput = Tabs.Visual:AddInput("Input",
    {
        Title = "Name Changer",
        Default = "",
        Placeholder = "Name",
        Numeric = false, -- Only allows numbers
        Finished = true, -- Only calls callback when you press enter
        Callback = function(Value)
            local new_name = Value
            local new_id = 104867
            local clear_avatar = false
            local flush_body_colors = false
            local rename_instances = false
            local change_id = false
            local deep_scan = true
            local filter_httpget = {
                enabled = false,
                result = true,
                request = true
            }

            local Players =
                assert(
                assert(game, "game missing?"):FindService("Players") or game:GetService("Players"),
                "Players missing?"
            )
            local LocalPlayer = assert(Players.LocalPlayer, "LocalPlayer missing?")
            local CoreGui = game:FindService("CoreGui") or game:GetService("CoreGui")
            local PlayerGui = assert(LocalPlayer:FindFirstChild("PlayerGui"), "PlayerGui mising?")
            local RunService =
                assert(game:FindService("RunService") or game:GetService("RunService"), "RunService missing?")
            local replaces_str = {
                Players.LocalPlayer.Name
            }
            local replaces_num = {
                tostring(Players.LocalPlayer.UserId)
            }
            new_name, new_id = tostring(new_name), tostring(new_id)
            local function casepatt(pattern)
                return string.gsub(
                    pattern,
                    "(%%?)(.)",
                    function(percent, letter)
                        if percent ~= "" or not string.match(letter, "%a") then
                            return percent .. letter
                        else
                            return string.format("[%s%s]", string.lower(letter), string.upper(letter))
                        end
                    end
                )
            end
            function replace(item, fast)
                for replacewith, data in pairs(
                    {
                        [new_name] = replaces_str,
                        [new_id] = replaces_num
                    }
                ) do
                    if not fast then
                        RunService.RenderStepped:Wait()
                    end
                    for _, v in pairs(data) do
                        if not fast then
                            RunService.RenderStepped:Wait()
                        end
                        for _, t in pairs(
                            {
                                "Text",
                                "Message",
                                "ToolTip",
                                "Value"
                            }
                        ) do
                            pcall(
                                function()
                                    if string.find(item[t], v, nil, true) then
                                        item[t] = string.gsub(item[t], v, replacewith)
                                    elseif string.find(item[t], string.lower(v), nil, true) then
                                        item[t] = string.gsub(item[v], string.lower(v), string.lower(replacewith))
                                    elseif string.find(item[t], string.upper(v), nil, true) then
                                        item[t] = string.gsub(item[v], string.upper(v), string.upper(replacewith))
                                    elseif string.find(string.lower(item[t]), string.lower(v), nil, true) then
                                        item[t] = string.gsub(item[v], casepatt(v), replacewith)
                                    end
                                end
                            )
                            if not fast then
                                RunService.RenderStepped:Wait()
                            end
                        end
                        if not fast then
                            RunService.RenderStepped:Wait()
                        end
                        if rename_instances then
                            pcall(
                                function()
                                    if string.find(item.Name, v, nil, true) then
                                        item.Name = string.gsub(item.Name, v, replacewith)
                                    elseif string.find(item.Name, string.lower(v), nil, true) then
                                        item.Name = string.gsub(item.Name, string.lower(v), string.lower(replacewith))
                                    elseif string.find(item.Name, string.upper(v), nil, true) then
                                        item.Name = string.gsub(item.Name, string.lower(v), string.upper(replacewith))
                                    elseif string.find(string.lower(item.Name), string.lower(v), nil, true) then
                                        item.Name = string.gsub(item.Name, casepatt(v), replacewith)
                                    end
                                end
                            )
                        end
                    end
                end
            end
            shared.rep = replace
            local function scan_and_replace(fast)
                local scan_que = {
                    CoreGui:GetDescendants(),
                    PlayerGui:GetDescendants(),
                    workspace:GetDescendants()
                }
                local last_break = 0
                for _, items in pairs(scan_que) do
                    if not fast then
                        RunService.RenderStepped:Wait()
                    end
                    for _, gui in pairs(assert(type(items) == "table" and items, "scan_que does not hold a table")) do
                        last_break = 1 + last_break
                        if last_break >= 6000 then
                            RunService.RenderStepped:Wait()
                            last_break = 0
                        end
                        if not fast then
                            RunService.RenderStepped:Wait()
                        end
                        replace(gui, fast)
                    end
                end
                for _, obj in pairs(workspace:GetDescendants()) do
                    if not fast then
                        RunService.RenderStepped:Wait()
                    end
                    replace(obj)
                end
            end
            function fixchar(Character)
                if not Character then
                    return
                end
                wait(0.2)
                RunService.RenderStepped:Wait()
                if rename_instances then
                    Character.Name = new_name
                end
                if clear_avatar then
                    Players.LocalPlayer:ClearCharacterAppearance()
                end
                wait(0.1)
                if flush_body_colors then
                    local bc = Character:FindFirstChildOfClass("BodyColors")
                    if bc then
                        for _, c in pairs(
                            {
                                "HeadColor",
                                "LeftArmColor",
                                "LeftLegColor",
                                "RightArmColor",
                                "RightLegColor",
                                "TorsoColor"
                            }
                        ) do
                            bc[c] = (typeof(bc[c]) == "BrickColor" and BrickColor.Random()) or bc[c]
                        end
                    else
                        local h = Character:FindFirstChildOfClass("Humanoid")
                        if h then
                            for _, limb in pairs(Character:GetChildren()) do
                                if limb:IsA("BasePart") and pcall(h.GetLimb, h, limb) then
                                    limb.BrickColor = BrickColor.Random()
                                end
                            end
                        end
                    end
                end
            end
            fixchar(Players.LocalPlayer.Character)
            Players.LocalPlayer.CharacterAppearanceLoaded:Connect(fixchar)
            Players.LocalPlayer.CharacterAdded:Connect(fixchar)
            if deep_scan then
                game.ItemChanged:Connect(
                    function(obj, property)
                        if not rename_instances and "Name" == property then
                            return
                        end
                        local s, v =
                            pcall(
                            function()
                                return obj[property]
                            end
                        )
                        if s then
                            if "string" == type(v) then
                                for _, c in pairs(replaces_str) do
                                    RunService.RenderStepped:Wait()
                                    if string.find(obj[property], c, nil, true) then
                                        obj[property] = string.gsub(tostring(obj[property] or v), c, new_name)
                                    elseif string.find(obj[property], string.lower(c)) then
                                        obj[property] =
                                            string.gsub(
                                            tostring(obj[property] or v),
                                            string.lower(c),
                                            string.lower(new_name)
                                        )
                                    elseif string.find(obj[property], string.upper(c), nil, true) then
                                        obj[property] =
                                            string.gsub(
                                            tostring(obj[property] or v),
                                            string.upper(c),
                                            string.upper(new_name)
                                        )
                                    elseif string.find(string.upper(obj[property]), string.upper(c), nil, true) then
                                        obj[property] = string.gsub(tostring(obj[property] or v), casepatt(c), new_name)
                                    end
                                end
                                RunService.RenderStepped:Wait()
                                for _, c in pairs(replaces_num) do
                                    RunService.RenderStepped:Wait()
                                    if string.find(obj[property], new_id) then
                                        obj[property] = string.gsub(tostring(obj[property] or v), c, new_id)
                                    end
                                end
                            elseif "number" == type(v) then
                                v = tostring(obj[property] or v)
                                for _, c in pairs(replaces_num) do
                                    RunService.RenderStepped:Wait()
                                    if string.find(v, c) then
                                        obj[property] =
                                            tonumber(
                                            tonumber(string.gsub(v, c, new_id) or obj[property]) or obj[property]
                                        )
                                    end
                                end
                            end
                        end
                    end
                )
                CoreGui.DescendantAdded:Connect(replace)
                PlayerGui.DescendantAdded:Connect(replace)
            end
            local function filterstr(s)
                for _, data in pairs(
                    {
                        [new_name] = replaces_str,
                        [new_id] = replaces_num
                    }
                ) do
                    for c, v in pairs(data) do
                        if string.find(s, v, nil, true) then
                            s = string.gsub(s, v, c)
                        elseif string.find(s, string.lower(v), nil, true) then
                            s = string.gsub(s, string.lower(v), string.lower(c))
                        elseif string.find(s, string.upper(v), nil, true) then
                            s = string.gsub(s, string.upper(v), string.upper(c))
                        elseif string.find(string.upper(s), string.upper(v), nil, true) then
                            s = string.gsub(s, casepatt(v), c)
                        end
                    end
                end
                return s
            end
            if filter_httpget.enabled and type(hookfunc or hookfunction or detour_function) == "function" then
                local hget
                hget =
                    assert(hookfunction or hookfunc or detour_function, "Hook function required for filter_httpget")(
                    assert(game.HttpGet, "HttpGet required for filter_httpget"),
                    function(shelf, u, ...)
                        if filter_httpget.request then
                            local x, e = pcall(filterstr, u)
                            if x and e then
                                u = e
                            end
                        end
                        if filter_httpget.result then
                            local result = hget(shelf, u, ...)
                            local x, e = pcall(filterstr, result)
                            if x and e then
                                return e
                            end
                        end
                        return hget(shelf, u, ...)
                    end
                )
            end
            scan_and_replace(true)
            while wait(1) do
                if rename_instances then
                    Players.LocalPlayer.Name = new_name
                    if Players.LocalPlayer.Character then
                        Players.LocalPlayer.Character.Name = new_name
                    end
                end
                if change_id then
                    Players.LocalPlayer.UserId = tonumber(tonumber(new_id or 1) or 1)
                end
                scan_and_replace()
            end
        end
    }
)
local rbxLink = "http://www.roblox.com/asset/?id="
local skyTable = {
    ["Realistic Sky"] = 4607457995,
    ["Realistic Sky(2)"] = 10256505900,
    ["Minecraft Sky"] = 2758029221,
    ["Minecraft Sky(2)"] = 10594760952,
    ["Night Sky"] = 7975080965,
    ["Moon Sky"] = 14828385099,
    ["Halloween Sky"] = 15220097936,
    ["Pink Sky"] = 8202961731,
    ["Black Sky"] = 4696746436,
    ["Galaxy Sky"] = 15983996673,
    ["Space Sky"] = 12612655684,
    ["Anime Sky"] = 13107361022,
    ["Hell Sky"] = 17893731831,
    ["Rainbow Sky"] = 127719608807122,
    ["Scary Sky"] = 8808550143,
    ["The Rock Sky"] = 9774228162
}

local lighting = game:GetService("Lighting") -- Pastikan lighting terdefinisi
local currentSky
local skyNames = {}

for name, id in pairs(skyTable) do
    table.insert(skyNames, name)
end

local SkyDropdown = Tabs.Visual:AddDropdown(
    "Dropdown",
    {
        Title = "Sky",
        Values = skyNames,
        Multi = false,
        Default = 1
    }
)

SkyDropdown:OnChanged(function(SkyName)
    currentSky = SkyName
end)

Tabs.Visual:AddButton(
    {
        Title = "Change Sky",
        Description = "You have to wait a while for the sky to fully load.",
        Callback = function()
            if not currentSky or not skyTable[currentSky] then
                Fluent:Notify(
                    {
                        Title = "Error",
                        Content = "No sky selected or invalid selection.",
                        Duration = 5
                    }
                )
                return
            end

            local oldSky = lighting:FindFirstChildWhichIsA("Sky")
            if oldSky then
                oldSky:Destroy()
            end

            local newSky = game:GetObjects("rbxassetid://" .. tostring(skyTable[currentSky]))[1]
            if newSky then
                lighting.ClockTime = 14.5
                newSky.Parent = lighting
            else
                Fluent:Notify(
                    {
                        Title = "Error",
                        Content = "Problem Error: 00x1b",
                        SubContent = "If the problem continues, please write about it in our discord channel 'bug-reports'.",
                        Duration = 5
                    }
                )
            end
        end
    }
)
Tabs.Visual:AddButton({
    Title = "Custom Color [PC]",
    Description = "You can change the color of the sky to any color you want.",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/isMoons/loader/main/CustomObfuscated.lua'))()
        
        -- Notifikasi setelah script dieksekusi
        Fluent:Notify({
            Title = "Ancestral-Universal",
            Content = "Has been loaded!",
            Duration = 8
        })
    end
})

local section = Tabs.Misc:AddSection("Misc Feature")
Tabs.Misc:AddButton({
    Title = "Redeem All Codes",
    Description = "Redeem all active Fisch codes.",
    Variant = "Primary",
    Callback = function()
        local activeCodes = {
            "THEKRAKEN", "RFG", "CARBON", "SORRYGUYS", "ATLANTEANSTORM",
            "GOLDENTIDE", "GOODBYEFISCHMAS", "NewYear", "1BVisits", "RRG", "NorthernExpedition"
        }
        for _, code in ipairs(activeCodes) do
            ReplicatedStorage:WaitForChild("events"):WaitForChild("runcode"):FireServer(code)
        end
    end,
})
Tabs.Misc:AddButton({
    Title = "Instant Die",
    Description = "Click if you want die",
    Variant = "Primary",
    Callback = function()
        ReplicatedStorage:WaitForChild("events"):WaitForChild("drown"):FireServer(0)     
    end,
})
Tabs.Misc:AddButton({
    Title = "Copy Coordinat",
    Description = "Copy to see your Coordinat",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local XYZ = player.Character.HumanoidRootPart.Position
            local coordString = string.format("game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(%f, %f, %f)", XYZ.X, XYZ.Y, XYZ.Z)
            
            -- Menyalin koordinat ke clipboard
            setclipboard(coordString)
            
            -- Menampilkan notifikasi
            Fluent:Notify({
                Title = "Ancestral",
                Content = "Coordinates copied to clipboard!",
                Duration = 8
            })
        else
            Fluent:Notify({
                Title = "Error",
                Content = "Failed to get coordinates!",
                Duration = 5
            })
        end
    end
})
-- // // // Optimized FPS Boost // // // --
local function optimizeFPS()
    local workspace = game.Workspace
    local lighting = game.Lighting
    local terrain = workspace.Terrain
    
    -- Optimize terrain water properties
    terrain.WaterWaveSize = 0
    terrain.WaterWaveSpeed = 0
    terrain.WaterReflectance = 0
    terrain.WaterTransparency = 1
    
    -- Optimize lighting settings
    lighting.GlobalShadows = false
    lighting.FogEnd = 8999999488
    lighting.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    
    -- Optimize game elements
    for _, obj in pairs(game:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("MeshPart") then
            obj.Material = "SmoothPlastic"
            obj.Reflectance = 0
            obj.CastShadow = false
        elseif obj:IsA("Decal") then
            obj.Transparency = 1
        elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
            obj.Lifetime = NumberRange.new(0)
        elseif obj:IsA("Explosion") then
            obj.BlastPressure = 1
            obj.BlastRadius = 1
        elseif obj:IsA("Fire") or obj:IsA("SpotLight") or obj:IsA("Smoke") then
            obj.Enabled = false
        end
    end
    
    -- Disable post-processing effects
    for _, effect in pairs(lighting:GetChildren()) do
        if effect:IsA("PostEffect") or effect:IsA("DepthOfFieldEffect") then
            effect.Enabled = false
        end
    end

    -- Show notification using Fluent UI Darwis
    Fluent:Notify({
        Title = "Success",
        Content = "FPS boost has been loaded!",
        Duration = 3
    })
end

-- Add performance button
Tabs.Misc:AddButton({
    Title = "1-Click FPS Boost",
    Description = "Improves FPS by applying optimizations.",
    Callback = function()
        optimizeFPS()
    end
})

spawn(function()
    while true do
        game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("afk"):FireServer(false)
        task.wait(0.01)
    end
end)
local AntiAFK = Tabs.Misc:AddToggle("AntiAFK", {Title = "Anti-AFK", Default = true})
AntiAFK:OnChanged(function(m)
    if m then
        local virtualUser = game:GetService("VirtualUser")
        LocalPlayer.Idled:Connect(function()
            virtualUser:CaptureController()
            virtualUser:ClickButton2(Vector2.new())
        end)
    end
end)
local JustUI = Tabs.Misc:AddToggle("JustUI", {Title = "SHOW/HIDE UI", Default = true })
JustUI:OnChanged(function()
    local BlackShow = JustUI.Value
    if BlackShow then
        PlayerGui.hud.safezone.Visible = true
    else
        PlayerGui.hud.safezone.Visible = false
    end
end)
local DisableAurora = Tabs.Misc:AddToggle("DisableAurora", {
    Title = "Disable Aurora Borealis Sky [Improve FPS]",
    Default = false
})

DisableAurora:OnChanged(function()
    if Options.DisableAurora.Value then
        local aurora = workspace:FindFirstChild("active") 
                       and workspace.active:FindFirstChild("constant") 
                       and workspace.active.constant:FindFirstChild("Aurora Borealis") 
                       and workspace.active.constant["Aurora Borealis"]:FindFirstChild("Aurora Borealis")
        if aurora and aurora:IsA("Folder") then
            for _, beam in ipairs(aurora:GetDescendants()) do
                if beam:IsA("Beam") then
                    beam.Enabled = false
                end
            end
        end
    else
        local aurora = workspace:FindFirstChild("active") 
                       and workspace.active:FindFirstChild("constant") 
                       and workspace.active.constant:FindFirstChild("Aurora Borealis") 
                       and workspace.active.constant["Aurora Borealis"]:FindFirstChild("Aurora Borealis")
        if aurora and aurora:IsA("Folder") then
            for _, beam in ipairs(aurora:GetDescendants()) do
                if beam:IsA("Beam") then
                    beam.Enabled = true
                end
            end
        end
    end
end)

local RemoveFog = Tabs.Misc:AddToggle("RemoveFog", {Title = "Remove Fog", Default = false })
RemoveFog:OnChanged(function()
    if Options.RemoveFog.Value == true then
        if game:GetService("Lighting"):FindFirstChild("Sky") then
            game:GetService("Lighting"):FindFirstChild("Sky").Parent = game:GetService("Lighting").bloom
        end
    else
        if game:GetService("Lighting").bloom:FindFirstChild("Sky") then
            game:GetService("Lighting").bloom:FindFirstChild("Sky").Parent = game:GetService("Lighting")
        end
    end
end)

local DayOnly = Tabs.Misc:AddToggle("DayOnly", {Title = "Day Only", Default = false })
DayOnly:OnChanged(function()
    if Options.DayOnly.Value == true then
        DayOnlyLoop = RunService.Heartbeat:Connect(function()
            game:GetService("Lighting").TimeOfDay = "12:00:00"
        end)
    else
        if DayOnlyLoop then
            DayOnlyLoop:Disconnect()
            DayOnlyLoop = nil
        end
    end
end)
local NightOnly = Tabs.Misc:AddToggle("NightOnly", {Title = "Night Only", Default = false })
NightOnly:OnChanged(function()
    if Options.NightOnly.Value == true then
        NightOnlyLoop = RunService.Heartbeat:Connect(function()
            game:GetService("Lighting").TimeOfDay = "00:00:00"
        end)
    else
        if NightOnlyLoop then
            NightOnlyLoop:Disconnect()
            NightOnlyLoop = nil
        end
    end
end)

-- // Load Tab // --
local section = Tabs.Misc:AddSection("Load Scripts")
Tabs.Misc:AddButton({
    Title = "Load Infinite-Yield FE",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})
Tabs.Misc:AddButton({
    Title = "Load RemoteSpy",
    Callback = function()
        loadstring(game:HttpGetAsync("https://github.com/richie0866/remote-spy/releases/latest/download/RemoteSpy.lua"))()
    end
})
Tabs.Misc:AddButton({
    Title = "Load OldServer-Finder",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Spectrum-Trash/Addons/refs/heads/main/FindServer.lua"))()
    end
})

-- Tambahkan Section Misc di Tab Settings
local Settings_M = Tabs.Settings:AddSection("Config Setup")

-- Paragraph untuk menampilkan waktu bermain di server
local Timeing = Settings_M:AddParagraph({        
    Title = "Timeing Server"
})

-- -- Toggle untuk Auto Loading Configs
-- local AutoLoadingConfigs = Settings_M:AddToggle("AutoLoadingConfigs", {
--     Title = "Auto Loading Configs",
--     Default = false
-- })

-- AutoLoadingConfigs:OnChanged(function(v)
--     writefile(tostring(LocalPlayer.UserId).."ALC.txt", tostring(v))
-- end)

-- Tombol untuk Join Discord
Settings_M:AddButton({
    Title = "Copy Discord link",
    Description = "Join our discord to see next update!",
    Callback = function()
        -- Tambahkan fungsi untuk membuka URL Discord
        setclipboard("https://discord.gg/dJmUxnAfbq")
        Fluent:Notify({
            Title = "Discord",
            Content = "Invite link copied to clipboard!",
            Duration = 3
        })
    end
})

-- Update waktu server dengan RunService
local Old = os.time()
RunService.Heartbeat:Connect(function()
    local TimeSinceLastPlay = os.time() - Old
    local hours = tostring(math.floor(TimeSinceLastPlay / 3600))
    local minutes = tostring(math.floor((TimeSinceLastPlay % 3600) / 60))
    local seconds = tostring(TimeSinceLastPlay % 60)
    
    -- Update UI Paragraph
    Timeing:SetTitle("Server Joined " .. hours .. " H " .. minutes .. " M " .. seconds .. " S ")
end)

-- Load UI Fluent
InterfaceManager:SetLibrary(Fluent)
InterfaceManager:SetFolder("Ancestral")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()
Fluent:SetTheme("Amethyst")

-- FPS Limit & Optimalisasi
setfflag("TaskSchedulerTargetFps", "1000")
setfpscap(120)

while true do
    if (game:GetService("Workspace").DistributedGameTime % 1 * 60) > 30 then
        setfpscap(120)
    end
    wait(0)
end
-- Execute Information
Window:SelectTab(1)
Fluent:Notify({
    Title = "Ancestral",
    Content = "Executed!",
    Duration = 8
})
--[[#Naaellx Code]]
