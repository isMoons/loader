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
    Event = Window:AddTab({ Title = "Event", Icon = "rbxassetid://103886955707876" }),
    Teleports = Window:AddTab({ Title = "Worlds", Icon = "rbxassetid://10709811445" }), 
    Exclusives = Window:AddTab({ Title = "Exclusives", Icon = "rbxassetid://10734966248" }), 
    Misc = Window:AddTab({ Title = "Misc", Icon = "rbxassetid://10734976739" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "rbxassetid://10734950020" }),
}
local Options = Fluent.Options
    -- // Exclusives Tab // --
    local sectionExclus = Tabs.Exclusives:AddSection("Exclusives Features (SOON)")
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
-- INSTAREELCODE

local function StartInstaReel()
    spawn(function()
        while instaReelEnabled do
            task.wait(2)
            repeat
                task.wait()
                local ui = LocalPlayer.PlayerGui:FindFirstChild("reel")
                if ui and ui:FindFirstChild("bar") then
                    local b = ui:FindFirstChild("bar")
                    if b:FindFirstChild("fish") and b:FindFirstChild("playerbar") then
                        b:FindFirstChild("playerbar").Position = b:FindFirstChild("fish").Position
                    end
                    ReplicatedStorage:WaitForChild("events"):WaitForChild("reelfinished "):FireServer(100, math.random(0.1, 0.3) == 1)
                end
                if not ui then ui = false end
            until not ui
            task.wait(math.random(0.1, 0.3) / 100)
        end
    end)
end 

-- INSTAREELCODE END

-- instaReelToggle
local instaReelToggle = Tabs.Main:AddToggle("instaReel", { Title = "Fast Reel", Default = false })
instaReelToggle:OnChanged(function()
    instaReelEnabled = Options.instaReel.Value
    if instaReelEnabled then
        task.spawn(StartInstaReel)
    end
end) 
    -- Atur Delay
    local autoFishSettings = Tabs.Config:AddSection("Auto Fish Settings")
    -- AutoCast
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
    Default = "0.5",  -- Set default value as string
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
                    local autoShakeDelay = tonumber(autoShakeDelayInputUI.Text) or 0.5
                    task.wait(math.random(autoShakeDelay, autoShakeDelay + 0.5))
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
    local function createRainbowGradient(obj)
        if obj and obj:IsA("TextLabel") then
            local uiGradient = Instance.new("UIGradient")
            uiGradient.Parent = obj
            uiGradient.Rotation = 90
            uiGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), -- Merah
                ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 165, 0)), -- Oranye
                ColorSequenceKeypoint.new(0.34, Color3.fromRGB(255, 255, 0)), -- Kuning
                ColorSequenceKeypoint.new(0.51, Color3.fromRGB(0, 255, 0)), -- Hijau
                ColorSequenceKeypoint.new(0.68, Color3.fromRGB(0, 0, 255)), -- Biru
                ColorSequenceKeypoint.new(0.85, Color3.fromRGB(75, 0, 130)), -- Indigo
                ColorSequenceKeypoint.new(1, Color3.fromRGB(148, 0, 211)) -- Ungu
            }
            return uiGradient
        end
    end
    
    local function animateRainbow()
        _G.multi = 0.7
        _G.val = 0
        
        game:GetService("RunService").RenderStepped:Connect(function(r)
            _G.val += r * _G.multi
    
            if _G.val > 0.5 then
                _G.multi = _G.multi * -1
            elseif _G.val < -0.5 then
                _G.multi = _G.multi * -1
            end
    
            _G.Rainbow.Offset = Vector2.new(_G.val, 0)
            _G.Rainbow2.Offset = Vector2.new(_G.val, 0)
            _G.Rainbow3.Offset = Vector2.new(_G.val, 0)
            _G.Rainbow4.Offset = Vector2.new(_G.val, 0)
            _G.Rainbow5.Offset = Vector2.new(_G.val, 0)
            _G.Rainbow6.Offset = Vector2.new(_G.val, 0)
        end)
    end
    
    local IdentityHiderUI = Tabs.CharacterTab:AddToggle("IdentityHiderUI", {Title = "Protect Identity", Default = false})
    IdentityHiderUI:OnChanged(function()
        while Options.IdentityHiderUI.Value == true do
            if UserPlayer:FindFirstChild("streak") then
                UserPlayer.streak.Text = "Ancestral"
                _G.Rainbow3 = createRainbowGradient(UserPlayer.streak)
            end
            if UserPlayer:FindFirstChild("level") then
                UserPlayer.level.Text = "Ancestral"
                _G.Rainbow2 = createRainbowGradient(UserPlayer.level)
            end
            if UserPlayer:FindFirstChild("user") then
                UserPlayer.user.Text = "Ancestral Protect"
                _G.Rainbow = createRainbowGradient(UserPlayer.user)
            end
    
            local hud = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("hud"):WaitForChild("safezone")
            if hud:FindFirstChild("coins") then
                hud.coins.Text = "HIDDEN"
                _G.Rainbow5 = createRainbowGradient(hud.coins)
            end
            if hud:FindFirstChild("lvl") then
                hud.lvl.Text = "Ancestral MAX"
                _G.Rainbow6 = createRainbowGradient(hud.lvl)
            end
            
            task.wait(0.01)
        end
    end)
    task.spawn(animateRainbow)
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
local WalkSpeedInputUI = Tabs.CharacterTab:AddInput("WalkSpeedInputUI", {
    Title = "Walk Speed",
    Default = "16",  -- Set default value as string
    Placeholder = "Enter walk speed",
})

WalkSpeedInputUI:OnChanged(function(value)
    local walkSpeed = tonumber(value)
    if walkSpeed then
        LocalPlayer.Character.Humanoid.WalkSpeed = walkSpeed
    end
end)

local JumpHeightInputUI = Tabs.CharacterTab:AddInput("JumpHeightInputUI", {
    Title = "Jump Height",
    Default = "50",  -- Set default value as string
    Placeholder = "Enter jump height",
})

JumpHeightInputUI:OnChanged(function(value)
    local jumpPower = tonumber(value)
    if jumpPower then
        LocalPlayer.Character.Humanoid.JumpPower = jumpPower
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
local section = Tabs.Teleports:AddSection("Select Teleport")

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
end
local section = Tabs.Teleports:AddSection("Select NPC")

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

-- Teleport otomatis saat nilai dropdown berubah
NpcTPDropdownUI:OnChanged(function(Value)
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
end)


    -- _G.connections = {}
    -- _G.running = false
    -- _G.AutoPriceCheck = false
    
    -- function GetBackPackItemValue(Name)
    --     local fishData = getFishInventorySetting(Name)
    --     if type(fishData) == "table" and data.Fish[fishData.Name] then
    --         local fishInfo = data.Fish[fishData.Name]
    --         local basePrice = math.ceil(fishInfo.Price / fishInfo.WeightPool[2] * (fishData.Weight or 1) * 10)
    
    --         if fishData.Shiny then
    --             basePrice = basePrice * 1.85
    --         end
    --         if fishData.Sparkling then
    --             basePrice = basePrice * 1.85
    --         end
    --         if fishData.Mutation and data.Mutations[tostring(fishData.Mutation)] then
    --             basePrice = basePrice * data.Mutations[tostring(fishData.Mutation)].PriceMultiply
    --         end
    --         if fishData.Stack then
    --             basePrice = basePrice * fishData.Stack
    --         end
    --         return math.ceil(basePrice)
    --     end
    --     return 0
    -- end
    
    -- function UpdatePrice(item)
    --     if not item or not item.Value then return end
    --     local price = GetBackPackItemValue(item.Value)
    --     if price and CreatePrice then
    --         CreatePrice(item.Parent, price)
    --     end
    -- end
    
    -- function monitorBackpack()
    --     _G.running = true
    --     local backpack = game.Players.LocalPlayer.PlayerGui.hud.safezone:FindFirstChild("backpack")
    --     if not backpack then return end
    
    --     local function processItem(descendant)
    --         if not _G.running or not descendant:IsA("ValueBase") or descendant.Name ~= "item" then return end
    --         UpdatePrice(descendant)
    --     end
    
    --     _G.descendantAddedConnection = backpack.DescendantAdded:Connect(function(descendant)
    --         if _G.running then task.defer(function() processItem(descendant) end) end
    --     end)
    --     table.insert(_G.connections, _G.descendantAddedConnection)
    
    --     for _, descendant in ipairs(backpack:GetDescendants()) do
    --         processItem(descendant)
    --         if descendant:IsA("ValueBase") and descendant.Name == "item" then
    --             _G.propertyChangedConnection = descendant:GetPropertyChangedSignal("Value"):Connect(function()
    --                 if _G.running then processItem(descendant) end
    --             end)
    --             table.insert(_G.connections, _G.propertyChangedConnection)
    --         end
    --     end
    -- end
    
    -- local section = Tabs.Items:AddToggle("Purchase & Sell & Display", {
    --     Title = "Purchase & Sell & Display",
    --     Default = false,
    --     Description = "Enable purchasing, selling, and displaying item values",
    --     Callback = function(isEnabled)
    --         _G.AutoPriceCheck = isEnabled
    
    --         if isEnabled then
    --             monitorBackpack()
    
    --             task.spawn(function()
    --                 while _G.AutoPriceCheck do
    --                     if not _G.running then
    --                         _G.running = true
    --                         monitorBackpack()
    --                     end
    --                     task.wait(1)
    --                 end
    
    --                 if not _G.AutoPriceCheck and _G.running then
    --                     _G.running = false
    --                     for _, connection in ipairs(_G.connections) do
    --                         if connection.Connected then
    --                             connection:Disconnect()
    --                         end
    --                     end
    --                     _G.connections = {}
    --                     if clearPriceLabels then clearPriceLabels() end
    --                 end
    --             end)
    --         else
    --             _G.AutoPriceCheck = false
    --         end
    --     end,
    -- })

    -- Items Tab
--     local rodsFolder = game:GetService("ReplicatedStorage").resources.items.rods
--     local event = game:GetService("ReplicatedStorage").events.purchase
--     local section = Tabs.Items:AddSection("Shop Rod")
-- -- Mengumpulkan nama semua pancingan dalam folder
-- local rodNames = {}
-- for _, rod in pairs(rodsFolder:GetChildren()) do
--     if rod:IsA("Folder") then
--         table.insert(rodNames, rod.Name)
--     end
-- end

-- -- Dropdown untuk memilih pancingan
-- local RodDropdown = Tabs.Items:AddDropdown("RodSelection", {
--     Title = "Select a Rod",
--     Description = "Choose a fishing rod from the shop to purchase.", -- Deskripsi ditambahkan
--     Values = rodNames,
--     Multi = false,
--     Default = nil,
-- })

-- -- Tombol untuk membeli pancingan yang dipilih
-- Tabs.Items:AddButton({
--     Title = "Buy Selected Rod",
--     Description = "Click this button to purchase the selected fishing rod.", -- Deskripsi ditambahkan
--     Callback = function()
--         local selectedRod = RodDropdown.Value
--         if selectedRod then
--             event:FireServer(selectedRod, "Rod", nil, 1)
--         else
--             warn("No Rod selected!")
--         end
--     end
-- })

local section = Tabs.Items:AddSection("Shop Items")

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
    local section = Tabs.Items:AddSection("Merlin Shop")
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
    
    
-- local section = Tabs.Items:AddSection("Automatically")
-- local autoSell = Tabs.Items:AddToggle("autoSell", { 
--     Title = "Auto Sell",
--     Description = "Enable this toggle to autosell all your inventory or when cast.",
--     Default = false 
-- })

-- task.spawn(function()
--     while task.wait(1) do 
--         if autoSell.Value then
--             game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("SellAll"):InvokeServer()
--         end
--     end
-- end)

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
-- Misc Tab
local section = Tabs.Misc:AddSection("Misc Feature")
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
