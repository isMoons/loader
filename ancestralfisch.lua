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
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- GUI untuk tombol minimize (akan muncul di PC & Mobile)
local ClickButton = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local IconLabel = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local ExpandButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local Divider = Instance.new("Frame") -- Garis pemisah

ClickButton.Name = "ClickButton"
ClickButton.Parent = game.CoreGui
ClickButton.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ClickButton.ResetOnSpawn = false -- Agar tidak hilang saat reset karakter

-- Frame utama tombol
MainFrame.Name = "MainFrame"
MainFrame.Parent = ClickButton
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundTransparency = 0 -- Jangan buat transparan agar gradient terlihat
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.1, 0, 0.2, 0) -- Posisi awal
MainFrame.Size = UDim2.new(0, 120, 0, 50) -- Ukuran lebih lebar agar tidak berdempetan
MainFrame.Active = true
MainFrame.Draggable = true -- Bisa dipindahkan

-- Sudut melengkung
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8) 
UICorner.Parent = MainFrame

-- Tambahkan UIGradient untuk efek transisi warna
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(136, 77, 167)), -- Purple (atas)
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 80))    -- Navy Blue (bawah)
}
Gradient.Rotation = 90 -- Gradient dari atas ke bawah
Gradient.Parent = MainFrame -- Pastikan gradient masuk ke MainFrame

-- Ikon di sebelah kiri
IconLabel.Parent = MainFrame
IconLabel.BackgroundTransparency = 1
IconLabel.Size = UDim2.new(0, 24, 0, 24) -- Ukuran sedikit diperbesar
IconLabel.Position = UDim2.new(0.08, 0, 0.5, -12) -- Letak ikon ditengah vertikal
IconLabel.Image = "rbxassetid://73407780444753" -- Ganti dengan ID ikon yang sesuai
IconLabel.ScaleType = Enum.ScaleType.Fit

-- Garis pemisah
Divider.Parent = MainFrame
Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Warna putih untuk pemisah
Divider.BackgroundTransparency = 0.5 -- Transparan sedikit agar halus
Divider.Position = UDim2.new(0.35, 0, 0.15, 0) -- Sedikit geser ke kiri
Divider.Size = UDim2.new(0, 1, 0.7, 0) -- Garis vertikal memanjang

-- Teks subtitle "Ancestral"
TextLabel.Parent = MainFrame
TextLabel.BackgroundTransparency = 1
TextLabel.Size = UDim2.new(0.45, 0, 0.5, 0) -- Ukuran lebih kecil agar terlihat seperti subtitle
TextLabel.Position = UDim2.new(0.4, 0, 0.25, 0) -- Digeser lebih ke atas agar lebih proporsional
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.Text = "Ancestral"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextTransparency = 0.1

-- Tombol untuk perbesar
ExpandButton.Parent = MainFrame
ExpandButton.BackgroundTransparency = 1
ExpandButton.Size = UDim2.new(0, 20, 0, 20) -- Ukuran dikurangi agar tidak keluar frame
ExpandButton.Position = UDim2.new(0.87, -5, 0.5, -10) -- Digeser lebih ke dalam
ExpandButton.Image = "rbxassetid://107981980779327" -- Ganti dengan asset ID ikon maximize
ExpandButton.ScaleType = Enum.ScaleType.Fit -- Mencegah gambar melar

-- Variabel untuk cek status minimize
local isMinimized = false

ExpandButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized -- Toggle antara minimize dan open

    game:GetService("VirtualInputManager"):SendKeyEvent(true, "LeftControl", false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "LeftControl", false, game)

    if isMinimized then
        ExpandButton.Image = "rbxassetid://107981980779327" -- Ganti dengan asset ID ikon minimize
    else
        ExpandButton.Image = "rbxassetid://73064588643892" -- Kembali ke ikon maximize
    end
end)

-- UI utama menggunakan Fluent
local Window = Fluent:CreateWindow({
    Title = game:GetService("MarketplaceService"):GetProductInfo(16732694052).Name .."  | Ancestral v1.0",
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
    Profile = Window:AddTab({ Title = "Profile", Icon = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)}), 
    Information = Window:AddTab({ Title = "Information", Icon = "book" }), 
    Main = Window:AddTab({ Title = "Fishing", Icon = "anchor" }),
    CharacterTab = Window:AddTab({ Title = "Character", Icon = "user" }),
    Teleports = Window:AddTab({ Title = "Teleports", Icon = "compass" }), 
    Exclusives = Window:AddTab({ Title = "Exclusives", Icon = "star" }), 
    Misc = Window:AddTab({ Title = "Misc", Icon = "package" }),
}
local Options = Fluent.Options
    -- Profile Tab
    local Profile = Tabs.Profile:AddSection("Profile (SOON)")
    -- // Exclusives Tab // --
    local sectionExclus = Tabs.Exclusives:AddSection("Exclusives Features (SOON)")
    -- // Main Tab // --
    local Information = Tabs.Information:AddSection("Information (SOON)")
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
    local autoFishSettings = Tabs.Main:AddSection("Auto Fish Settings")
    -- AutoCast
    local autoCastDelaySlider = autoFishSettings:AddSlider("autocastdelay", {
        Title = "Auto Cast Delay",
        Suffix = "s",
        Min = 0,
        Max = 5,
        Default = 0,
        Rounding = 0.5
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
                            events.cast:FireServer(100, 1)
                        end
                    end
                end
            end)
            task.wait(autoCastDelaySlider.Value) -- Menggunakan nilai dari slider sebagai delay
        end
    end)
end

autoCast:OnChanged(function()
    autoCastEnabled = Options.autoCast.Value
    if autoCastEnabled then
        StartAutoFishing()
    end
end)
-- AutoCast End
    -- Auto Shake
    local autoShakeDelaySlider = Tabs.Main:AddSlider("autoshakedelay", {
        Title = "Auto Shake Delay",
        Suffix = "ms",
        Min = 0.3,
        Max = 3,
        Default = 0.5,
        Rounding = 0.1
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
                        -- Gunakan nilai dari slider sebagai delay dengan randomisasi untuk menghindari deteksi
                        task.wait(math.random(autoShakeDelaySlider.Value, autoShakeDelaySlider.Value + 0.5))
                    end
                end)
            else
                autoShakeEnabled = false
            end
        end)
    end)    
    -- Auto Shake End
    -- // Mode Tab // --
    local section = Tabs.Main:AddSection("Mode Fishing")
    local autoShakeMode = Tabs.Main:AddDropdown("autoShakeMode", {
        Title = "Auto Shake Mode",
        Values = {"Navigation"},
        Multi = false,
        Default = ShakeMode,
    })
    autoShakeMode:OnChanged(function(Value)
        ShakeMode = Value
    end)
    local section = Tabs.CharacterTab:AddSection("Character")
    local IdentityHiderUI = Tabs.CharacterTab:AddToggle("IdentityHiderUI", {Title = "Protect Identity", Default = false})
    IdentityHiderUI:OnChanged(function()
        while Options.IdentityHiderUI.Value == true do
            -- Update elemen UI dengan warna yang lebih elegan dan tidak mencolok
            if UserPlayer:FindFirstChild("streak") then
                UserPlayer.streak.Text = "Ancestral"
                UserPlayer.streak.TextColor3 = Color3.fromRGB(180, 180, 180) -- Abu-abu medium, lebih soft
            end
            if UserPlayer:FindFirstChild("level") then
                UserPlayer.level.Text = "Ancestral"
                UserPlayer.level.TextColor3 = Color3.fromRGB(140, 140, 220) -- Biru pastel yang lebih kalem
            end
            if UserPlayer:FindFirstChild("user") then
                UserPlayer.user.Text = "Ancestral Protect"
                UserPlayer.user.TextColor3 = Color3.fromRGB(160, 160, 160) -- Abu-abu yang lebih seimbang
            end
            local hud = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("hud"):WaitForChild("safezone")
            if hud:FindFirstChild("coins") then
                hud.coins.Text = "HIDDEN"
                hud.coins.TextColor3 = Color3.fromRGB(235, 210, 150) -- Kuning emas lembut, lebih elegan
            end
            if hud:FindFirstChild("lvl") then
                hud.lvl.Text = "Ancestral MAX"
                hud.lvl.TextColor3 = Color3.fromRGB(190, 170, 230) -- Ungu pastel lembut
            end
            task.wait(0.01)
        end
    end)
    local section = Tabs.CharacterTab:AddSection("Feature Character")
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
    local WalkSpeedSliderUI = Tabs.CharacterTab:AddSlider("WalkSpeedSliderUI", {
        Title = "Walk Speed",
        Min = 16,
        Max = 200,
        Default = 16,
        Rounding = 1,
    })
    WalkSpeedSliderUI:OnChanged(function(value)
        LocalPlayer.Character.Humanoid.WalkSpeed = value
    end)
    local JumpHeightSliderUI = Tabs.CharacterTab:AddSlider("JumpHeightSliderUI", {
        Title = "Jump Height",
        Min = 50,
        Max = 200,
        Default = 50,
        Rounding = 1,
    })
    JumpHeightSliderUI:OnChanged(function(value)
        LocalPlayer.Character.Humanoid.JumpPower = value
    end)
    
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
local section = Tabs.Teleports:AddSection("Select Teleport")

-- Menemukan folder teleportasi di dalam world
local TpSpotsFolder = Workspace:FindFirstChild("world"):WaitForChild("spawns"):WaitForChild("TpSpots")
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

Tabs.Teleports:AddButton({
    Title = "Teleport",
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


local section = Tabs.Misc:AddSection("Misc Feature (SOON)")
-- Execute Information
Window:SelectTab(1)
Fluent:Notify({
    Title = "Ancestral",
    Content = "Executed!",
    Duration = 8
})
