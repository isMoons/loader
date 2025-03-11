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
    local Backpack = LocalPlayer:WaitForChild("Backpack")

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

    local toggleInstantBobber = Tabs.Main:AddToggle("InstantBobber", { 
        Title = "Instant Bobber", 
        Default = false 
    })
    
    toggleInstantBobber:OnChanged(function(value)
        instantBobber = value
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
    local FishingToggle = Tabs.Config:AddToggle("FishingToggle", {
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