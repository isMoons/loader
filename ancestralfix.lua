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
-- local Noclip = false
local RunCount = false

-- // // // Functions // // // --
function ShowNotification(String)
    Fluent:Notify({
        Title = "Ancestral",
        Content = String,
        Duration = 5
    })
end

-- // Sending Execution To Discord // --
local function GetPlayerStats()
    local hud = LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("hud")
    if hud and hud.safezone then
        local coins = hud.safezone:FindFirstChild("coins") and hud.safezone.coins.Text or "N/A"
        local jobId = game.JobId
        local joinScript = string.format("game:GetService('TeleportService'):TeleportToPlaceInstance(%d, '%s', game:GetService('Players').LocalPlayer)", game.PlaceId, jobId)
        return {
            Username = LocalPlayer.Name,
            DisplayName = LocalPlayer.DisplayName,
            Coins = coins,
            JobId = jobId,
            JoinScript = joinScript
        }
    end
    return nil
end

game.Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

spawn(function()
    while true do
        game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("afk"):FireServer(false)
        task.wait(0.01)
    end
end)

-- // Find TpSpots // --
local TpSpotsFolder = Workspace:FindFirstChild("world"):WaitForChild("spawns"):WaitForChild("TpSpots")
for i, v in pairs(TpSpotsFolder:GetChildren()) do
    if table.find(teleportSpots, v.Name) == nil then
        table.insert(teleportSpots, v.Name)
    end
end

-- // // // Get Position // // // --
function GetPosition()
    if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return {
            Vector3.new(0,0,0),
            Vector3.new(0,0,0),
            Vector3.new(0,0,0)
        }
    end
    return {
        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X,
        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y,
        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z
    }
end

function ExportValue(arg1, arg2)
    return tonumber(string.format("%."..(arg2 or 1)..'f', arg1))
end

-- // // // Tabs Gui // // // --

local Tabs = { -- https://lucide.dev/icons/
    Profile = Window:AddTab({ Title = "Profile", Icon = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)}), 
    Information = Window:AddTab({ Title = "Information", Icon = "book" }), 
    Main = Window:AddTab({ Title = "Fishing", Icon = "anchor" }), 
    -- QuestRod = Window:AddTab({ Title = "Quest Rod", Icon = "target" }), 
    Shop = Window:AddTab({ Title = "Shop", Icon = "shopping-cart" }), 
    Items = Window:AddTab({ Title = "Selling & Repair", Icon = "hammer" }), 
    Automatically = Window:AddTab({ Title = "Automatically", Icon = "repeat" }), 
    Teleports = Window:AddTab({ Title = "Teleports", Icon = "compass" }), 
    CharacterTab = Window:AddTab({ Title = "Character", Icon = "user" }), 
    Exclusives = Window:AddTab({ Title = "Exclusives", Icon = "star" }), 
    Misc = Window:AddTab({ Title = "Misc", Icon = "package" }),
}
local Options = Fluent.Options

-- Ambil layanan Players dan LocalPlayer
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Ambil informasi profil pemain
local playerName = LocalPlayer.Name
local displayName = LocalPlayer.DisplayName
local userId = LocalPlayer.UserId
local accountAge = LocalPlayer.AccountAge
local joinDate = os.date("%Y-%m-%d", os.time() - (accountAge * 86400))
local friendCount = #Players:GetPlayers() -- Jumlah teman online dalam game

-- Cek status membership
local membershipType
if LocalPlayer.MembershipType == Enum.MembershipType.Premium then
membershipType = "⭐ Premium"
else
membershipType = "Free"
end

local section = Tabs.Profile:AddParagraph({
Title = "👤 Player Profile",
Content = [[
    🏷️ Display Name : ]] .. displayName .. [[  
    - Your in-game name.  

    👤 Username : ]] .. playerName .. [[  
    - Your unique account name.  

    🆔 User ID : ]] .. userId .. [[  
    - Your Roblox ID number.  

    📅 Account Age : ]] .. accountAge .. [[ days  
    - Days since account creation.  

    💎 Membership : ]] .. membershipType .. [[  
    - Your Roblox membership status.  

    📆 Join Date : ]] .. joinDate .. [[  
    - When your account was created.  

    🫂 Friends Online : ]] .. friendCount .. [[  
    - Number of online friends.  

    🎮 Enjoy your game and have fun! 🚀
]]
})

do
    Tabs.Information:AddButton({
        Title = "Copy Discord link",
        Description = "Join our main Discord for the latest updates!",
        Callback = function()
            setclipboard("https://discord.gg/NxWyyfVbwp")
        end
    })
    Tabs.Information:AddParagraph({
        Title = "🚀 CHANGELOGS - Ancestral 1.0",
        Content = [[
        🔥 Latest Updates & Enhancements 🔥  
    
        🛠 Bug Fixes:  
        - Patched critical stability issues for a smoother experience.  
        - Resolved UI glitches for better responsiveness.  
    
        ✨ New Features:  
        - Improved Identity Protection 
        - More customizable options to hide player data.  
    
        ⚡ Performance & Optimizations:  
        - Faster script execution and reduced lag.  
        - Optimized UI interactions for better flow.  
    
        💡 Community-Driven Changes:  
        - Added popular features based on user feedback.
    
        🔮 What's Next?  
        - More customization options for the shop system.  
        - Advanced security features for a safer experience.  
    
        🚀 Stay tuned for future updates & exclusive features!
        ]]
    })
    -- // Exclusives Tab // --
    local sectionExclus = Tabs.Exclusives:AddSection("Exclusives Features (SOON)")
    -- // Main Tab // --
    
    -- // // // Auto Cast // // // --
local autoCastEnabled = false
 -- // // // Auto Cast // // // --

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
ZoneConnection = LocalCharacter.ChildAdded:Connect(function(child)
if ZoneCast and child:IsA("Tool") and FishingZonesFolder:FindFirstChild(Zone) then
    child.ChildAdded:Connect(function(blehh)
        if blehh.Name == "bobber" then
            -- Hapus RopeConstraint agar bobber jatuh langsung
            local RopeConstraint = blehh:FindFirstChildOfClass("RopeConstraint")
            if RopeConstraint then
                RopeConstraint:Destroy()
            end

            -- Pindahkan bobber langsung ke zona pemancingan
            blehh.CFrame = FishingZonesFolder[Zone].CFrame
        end
    end)
end
end)

    local section = Tabs.Main:AddSection("Auto Fishing")

    -- Table untuk menyimpan zona memancing
    local fishZones = {}
    
    -- UI Dropdown untuk memilih zona memancing
    local fishZoneDropdown = Tabs.Main:AddDropdown("FishZoneDropdown", {
        Title = "Select Fishing Zone",
        Values = {},
        Multi = false,
        Default = nil,
    })
    
    -- Input Box untuk Nama Zona
    local zoneNameInput = Tabs.Main:AddInput("ZoneNameInput", {
        Title = "Zone Name",
        Default = "Fishing Spot",
        Placeholder = "Enter zone name...",
    })
    
    -- Button untuk membuat zona baru
    Tabs.Main:AddButton({
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
                    ReplicatedStorage:WaitForChild("events"):WaitForChild("reelfinished"):FireServer(100, math.random(1, 2) == 1)
                end
                if not ui then ui = false end
            until not ui
            task.wait(math.random(5, 10) / 100)
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
        Default = 2,
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

    -- Shop Tab
    local section = Tabs.Shop:AddSection("Shop Feature")
-- Dropdown untuk Rods
local RodDropdown = Tabs.Shop:AddDropdown("RodDropdown", {
    Title = "Rods",
    Values = {
        "Carbon Rod", "Fast Rod", "Flimsy Rod", "Long Rod", "Lucky Rod", "Plastic Rod", "Training Rod", "Tempest Rod", 
        "Kings Rod", "Scurvy Rod", "Nocturnal Rod", "Magnet Rod", "Trident Rod", "Lost Rod", "Reinforced Rod", "Steady Rod"
    },
    Multi = false,
    Default = nil,
})

-- Dropdown untuk Bait
local BaitDropdown = Tabs.Shop:AddDropdown("BaitDropdown", {
    Title = "Bait",
    Values = { "BaitCrate", "CoralGeode" },
    Multi = false,
    Default = nil,
})

-- Dropdown untuk Item Biasa
local ItemDropdown = Tabs.Shop:AddDropdown("ItemDropdown", {
    Title = "Miscellaneous Items",
    Values = { "Crab Cage", "GPS", "Enchant Relic", "Merlin", "Fish Radar", "Basic Diving Gear", "Conception Conch", 
                "Advance Diving Gear", "Super Flippers", "Flippers", "TideBreaker" },
    Multi = false,
    Default = nil,
})

RodDropdown:OnChanged(function(Value)
    local rodLocations = {
        ["Carbon Rod"] = CFrame.new(454.084, 150.590, 225.329),
        ["Fast Rod"] = CFrame.new(447.184, 148.226, 220.187),
        ["Flimsy Rod"] = CFrame.new(471.108, 148.362, 229.642),
        ["Long Rod"] = CFrame.new(485.695, 174.500, 145.746),
        ["Lucky Rod"] = CFrame.new(446.086, 148.253, 222.160),
        ["Plastic Rod"] = CFrame.new(454.425, 148.170, 229.172),
        ["Training Rod"] = CFrame.new(457.694, 148.358, 230.414),
        ["Tempest Rod"] = CFrame.new(-4931.645, -595.234, 1852.508),
        ["Kings Rod"] = CFrame.new(1375.900, -807.289, -303.509),
        ["Scurvy Rod"] = CFrame.new(-2827.079, 214.974, 1512.480),
        ["Nocturnal Rod"] = CFrame.new(-141.874, -512.374, 1139.045),
        ["Magnet Rod"] = CFrame.new(-195.603, 132.500, 1930.978),
        ["Trident Rod"] = CFrame.new(-1482.732, -226.024, -2200.441),
        ["Lost Rod"] = CFrame.new(2879.567, 137.820, 2722.313),
        ["Reinforced Rod"] = CFrame.new(-986.474, -242.510, -2689.792),
        ["Steady Rod"] = CFrame.new(-1510.391, 141.852, 762.347)
    }
    
    if rodLocations[Value] then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = rodLocations[Value]
    end
end)    
    -- Event untuk BaitDropdown
    BaitDropdown:OnChanged(function(Value)
        local baitLocations = {
            BaitCrate = CFrame.new(384.575, 135.352, 337.534),
            CoralGeode = CFrame.new(-1644.115, -213.679, -2848.292)
        }
        if baitLocations[Value] then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = baitLocations[Value]
        end
    end)
    
    -- Event untuk ItemDropdown
ItemDropdown:OnChanged(function(Value)
    local itemLocations = {
        ["Crab Cage"] = CFrame.new(474.804, 149.665, 229.495),
        ["GPS"] = CFrame.new(517.897, 149.218, 284.857),
        ["Enchant Relic"] = CFrame.new(-929.754, 225.730, -993.629),
        ["Merlin"] = CFrame.new(-929.754, 225.730, -993.629),
        ["Fish Radar"] = CFrame.new(365.751, 137.000, 274.105),
        ["Basic Diving Gear"] = CFrame.new(-1653.104, -212.269, -2823.574),
        ["Conception Conch"] = CFrame.new(-1630.507, -211.645, -2859.729),
        ["Advance Diving Gear"] = CFrame.new(-790.801, 132.749, -3102.360),
        ["Super Flippers"] = CFrame.new(-966.494, -242.510, -2694.468),
        ["Flippers"] = CFrame.new(-1641.443, -213.679, -2852.460),
        ["TideBreaker"] = CFrame.new(-1642.117, -213.679, -2850.791)
    }
    
    if itemLocations[Value] then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = itemLocations[Value]
    end
end)

    Tabs.Shop:AddParagraph({
        Title = "About Shop Features",
        Content = [[
        This section will receive future updates!  
    
        🔹 Soon, a Buy Button will be added, allowing you to purchase items directly without teleportation.  
        ]]
    })
    
-- // Sell Tab // --
local section = Tabs.Items:AddSection("Sell Items")

-- local isSellingHand = false -- Status awal (belum aktif)
-- Tabs.Items:AddButton({
--     name = "Sell Hand Fish",
--     callback = function()
--         isSellingHand = not isSellingHand -- Toggle status
--         if isSellingHand then
--             task.spawn(function()
--                 while isSellingHand and task.wait() do
--                     pcall(function()
--                         game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("Sell"):InvokeServer()
--                     end)
--                 end
--             end)
--         end
--     end
-- })

local isSelling = false -- Status awal (belum aktif)

Tabs.Items:AddButton({
    Title = "Sell All",
    Description = "Toggle Sell All",
    Callback = function()
        isSelling = not isSelling -- Toggle status
        if isSelling then
            task.spawn(function()
                while isSelling and task.wait() do
                    pcall(function()
                        game:GetService("ReplicatedStorage").events.SellAll:InvokeServer()
                    end)
                end
            end)
        end
    end
})    
    -- // Treasure Tab // --
    local section = Tabs.Items:AddSection("Treasure")
    Tabs.Items:AddButton({
        Title = "Teleport to Jack Marrow",
        Callback = function()
            HumanoidRootPart.CFrame = CFrame.new(-2824.359, 214.311, 1518.130)
        end
    })
    Tabs.Items:AddButton({
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
    Tabs.Items:AddButton({
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

    -- // Teleports Tab // --
    local section = Tabs.Teleports:AddSection("Select Teleport")

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
    
    IslandTPDropdownUI:OnChanged(function(Value)
        if teleportSpots ~= nil and HumanoidRootPart ~= nil then
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

    local TotemTPDropdownUI = Tabs.Teleports:AddDropdown("TotemTPDropdownUI", {
        Title = "Select Totem",
        Values = {"Aurora", "Sundial", "Windset", "Smokescreen", "Tempest"},
        Multi = false,
        Default = nil,
    })
    TotemTPDropdownUI:OnChanged(function(Value)
        SelectedTotem = Value
        if SelectedTotem == "Aurora" then
            HumanoidRootPart.CFrame = CFrame.new(-1811, -137, -3282)
            TotemTPDropdownUI:SetValue(nil)
        elseif SelectedTotem == "Sundial" then
            HumanoidRootPart.CFrame = CFrame.new(-1148, 135, -1075)
            TotemTPDropdownUI:SetValue(nil)
        elseif SelectedTotem == "Windset" then
            HumanoidRootPart.CFrame = CFrame.new(2849, 178, 2702)
            TotemTPDropdownUI:SetValue(nil)
        elseif SelectedTotem == "Smokescreen" then
            HumanoidRootPart.CFrame = CFrame.new(2789, 140, -625)
            TotemTPDropdownUI:SetValue(nil)
        elseif SelectedTotem == "Tempest" then
            HumanoidRootPart.CFrame = CFrame.new(35, 133, 1943)
            TotemTPDropdownUI:SetValue(nil)
        end
    end)
    
    local WorldEventTPDropdownUI = Tabs.Teleports:AddDropdown("WorldEventTPDropdownUI", {
        Title = "Select World Event",
        Values = {"Strange Whirlpool", "Great Hammerhead Shark", "Great White Shark", "Whale Shark", "The Depths - Serpent"},
        Multi = false,
        Default = nil,
    })
    WorldEventTPDropdownUI:OnChanged(function(Value)
        SelectedWorldEvent = Value
        if SelectedWorldEvent == "Strange Whirlpool" then
            local offset = Vector3.new(25, 135, 25)
            local WorldEvent = game.Workspace.zones.fishing:FindFirstChild("Isonade")
            if not WorldEvent then WorldEventTPDropdownUI:SetValue(nil) return ShowNotification("Not found Strange Whirlpool") end
            HumanoidRootPart.CFrame = CFrame.new(game.Workspace.zones.fishing.Isonade.Position + offset)                           -- Strange Whirlpool
            WorldEventTPDropdownUI:SetValue(nil)
        elseif SelectedWorldEvent == "Great Hammerhead Shark" then
            local offset = Vector3.new(0, 135, 0)
            local WorldEvent = game.Workspace.zones.fishing:FindFirstChild("Great Hammerhead Shark")
            if not WorldEvent then WorldEventTPDropdownUI:SetValue(nil) return ShowNotification("Not found Great Hammerhead Shark") end
            HumanoidRootPart.CFrame = CFrame.new(game.Workspace.zones.fishing["Great Hammerhead Shark"].Position + offset)         -- Great Hammerhead Shark
            WorldEventTPDropdownUI:SetValue(nil)
        elseif SelectedWorldEvent == "Great White Shark" then
            local offset = Vector3.new(0, 135, 0)
            local WorldEvent = game.Workspace.zones.fishing:FindFirstChild("Great White Shark")
            if not WorldEvent then WorldEventTPDropdownUI:SetValue(nil) return ShowNotification("Not found Great White Shark") end
            HumanoidRootPart.CFrame = CFrame.new(game.Workspace.zones.fishing["Great White Shark"].Position + offset)               -- Great White Shark
            WorldEventTPDropdownUI:SetValue(nil)
        elseif SelectedWorldEvent == "Whale Shark" then
            local offset = Vector3.new(0, 135, 0)
            local WorldEvent = game.Workspace.zones.fishing:FindFirstChild("Whale Shark")
            if not WorldEvent then WorldEventTPDropdownUI:SetValue(nil) return ShowNotification("Not found Whale Shark") end
            HumanoidRootPart.CFrame = CFrame.new(game.Workspace.zones.fishing["Whale Shark"].Position + offset)                     -- Whale Shark
            WorldEventTPDropdownUI:SetValue(nil)
        elseif SelectedWorldEvent == "The Depths - Serpent" then
            local offset = Vector3.new(0, 50, 0)
            local WorldEvent = game.Workspace.zones.fishing:FindFirstChild("The Depths - Serpent")
            if not WorldEvent then WorldEventTPDropdownUI:SetValue(nil) return ShowNotification("Not found The Depths - Serpent") end
            HumanoidRootPart.CFrame = CFrame.new(game.Workspace.zones.fishing["The Depths - Serpent"].Position + offset)            -- The Depths - Serpent
            WorldEventTPDropdownUI:SetValue(nil)
        end
    end)
    Tabs.Teleports:AddButton({
        Title = "Teleport to Traveler Merchant",
        Description = "Teleports to the Traveler Merchant.",
        Callback = function()
            local Merchant = game.Workspace.active:FindFirstChild("Merchant Boat")
            if not Merchant then return ShowNotification("Not found Merchant") end
            HumanoidRootPart.CFrame = CFrame.new(game.Workspace.active["Merchant Boat"].Boat["Merchant Boat"].r.HandlesR.Position)
        end
    })
    Tabs.Teleports:AddButton({
        Title = "Create Safe Zone",
        Callback = function()
            local SafeZone = Instance.new("Part")
            SafeZone.Size = Vector3.new(30, 1, 30)
            SafeZone.Position = Vector3.new(math.random(-2000,2000), math.random(50000,90000), math.random(-2000,2000))
            SafeZone.Anchored = true
            SafeZone.BrickColor = BrickColor.new("Bright purple")
            SafeZone.Material = Enum.Material.ForceField
            SafeZone.Parent = game.Workspace
            HumanoidRootPart.CFrame = SafeZone.CFrame + Vector3.new(0, 5, 0)
        end
    })

    -- // Character Tab // --
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
local WalkOnWater = Tabs.CharacterTab:AddToggle("WalkOnWater", {Title = "Walk On Water", Default = false })
WalkOnWater:OnChanged(function()
    for _, v in pairs(workspace.zones.fishing:GetChildren()) do
        if v.Name == WalkZone then
            v.CanCollide = Options.WalkOnWater.Value
            if v.Name == "Ocean" then
                for _, v in pairs(workspace.zones.fishing:GetChildren()) do
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

-- // Useful Features Section // --
local usefulSection = Tabs.CharacterTab:AddSection("Useful Features")

local AntiAFK = usefulSection:AddToggle("AntiAFK", {Title = "Anti-AFK", Default = true})
AntiAFK:OnChanged(function(m)
    if m then
        local virtualUser = game:GetService("VirtualUser")
        LocalPlayer.Idled:Connect(function()
            virtualUser:CaptureController()
            virtualUser:ClickButton2(Vector2.new())
        end)
    end
end)

local InfiniteOxygen = usefulSection:AddToggle("InfiniteOxygen", {Title = "Infinite Oxygen", Default = false})
InfiniteOxygen:OnChanged(function(m)
    if m then
        local divingTank = Instance.new("Glue")
        divingTank.Name = "DivingTank"
        divingTank:SetAttribute("Tier", 9e9)
        divingTank.Parent = LocalPlayer.Character
    else
        local existingTank = LocalPlayer.Character:FindFirstChild("DivingTank")
        if existingTank then existingTank:Destroy() end
    end
end)
    -- // Misc Tab // --
    local section = Tabs.Misc:AddSection("Misc")
    -- FREEZE CHARACTER
local FreezeCharacter = Tabs.Misc:AddToggle("FreezeCharacter", { Title = "Freeze Character", Default = false })
FreezeCharacter:OnChanged(function()
    pcall(function()
        local oldpos = HumanoidRootPart.CFrame
        FreezeChar = Options.FreezeCharacter.Value
        while FreezeChar and task.wait(math.random(0.1, 0.5)) do
            if HumanoidRootPart then
                HumanoidRootPart.CFrame = oldpos
            else
                break
            end
        end
    end)
end)
    local BypassRadar = Tabs.Misc:AddToggle("BypassRadar", {Title = "Bypass Fish Radar", Default = false })
    BypassRadar:OnChanged(function()
        for _, v in pairs(game:GetService("CollectionService"):GetTagged("radarTag")) do
            if v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
                v.Enabled = Options.BypassRadar.Value
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

    local JustUI = Tabs.Misc:AddToggle("JustUI", {Title = "Show/Hide UIs", Default = true })
    JustUI:OnChanged(function()
        local BlackShow = JustUI.Value
        if BlackShow then
            PlayerGui.hud.safezone.Visible = true
        else
            PlayerGui.hud.safezone.Visible = false
        end
    end)
    -- White Screen & Black Screen
local BlackGui = Instance.new("ScreenGui")
BlackGui.Name = "BlackGui"
BlackGui.ResetOnSpawn = false
local blackFrame = Instance.new("Frame")
blackFrame.Name = "BlackFrame"
blackFrame.Size = UDim2.new(1, 0, 1, 0)
blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
blackFrame.BackgroundTransparency = 1
blackFrame.Parent = BlackGui
BlackGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local WhiteGui = Instance.new("ScreenGui")
WhiteGui.Name = "WhiteGui"  -- Изменено здесь
WhiteGui.ResetOnSpawn = false
local whiteFrame = Instance.new("Frame") -- Изменено здесь
whiteFrame.Name = "WhiteFrame" -- Изменено здесь
whiteFrame.Size = UDim2.new(1, 0, 1, 0)
whiteFrame.BackgroundColor3 = Color3.new(1, 1, 1)  -- Цвет белого фрейма
whiteFrame.BackgroundTransparency = 1
whiteFrame.Parent = WhiteGui
WhiteGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local BlackGui5 = Tabs.Misc:AddToggle("BlackGui5", {Title = "Black Screen", Default = false })
BlackGui5:OnChanged(function()
    local Black123 = BlackGui5.Value
    if Black123 then
        blackFrame.BackgroundTransparency = 0
    else
        blackFrame.BackgroundTransparency = 1
    end
end)

local WhiteGui5 = Tabs.Misc:AddToggle("WhiteGui5", {Title = "White Screen", Default = false })
WhiteGui5:OnChanged(function()
    local White123 = WhiteGui5.Value
    if White123 then
        whiteFrame.BackgroundTransparency = 0  -- Изменено здесь
    else
        whiteFrame.BackgroundTransparency = 1  -- Изменено здесь
    end
end)
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
end

-- Add performance button
Tabs.Misc:AddButton({
    Title = "1-Click FPS Boost",
    Description = "Improves FPS by applying optimizations.",
    Callback = function()
        optimizeFPS()
    end
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

    local section = Tabs.Automatically:AddSection("Trade disable sorry.")
end
-- Execute Information
Window:SelectTab(1)
Fluent:Notify({
    Title = "Ancestral",
    Content = "Executed!",
    Duration = 8
})