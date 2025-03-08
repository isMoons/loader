--i learned how to make clean code so now you guys cant call me skids for sus looking code 😜

local FischAPI = {}

local VIM = game:GetService("VirtualInputManager")

local VI = {}

local Options = {
    AutoShake = false,
    AutoMinigame = false, --Later version
    AutoMinigameBlatant = false,
    AutoCast = false,
    PerfectCast = false, --Later version
    WebhookURL = "",
    WebhookNotifications = false,
    FloatOnWater = false,
    Lock = false,
    MegaladonHunting = false,
    Priorities={},
	PriorityWebhook=false,
	AutoMap=false,
	AutoTotem=false
}

local Internal = {
    AutoMinigameDownPerUp = 2,
    AutoMinigameDownPerUpInternal = AutoMinigameDownPerUp,
    Timer = 301,
    FloatPart = nil,
    LockedPosition = nil,
    MegaladonPosition = nil,
    Megaladon = false,
    MegHuntPlat = nil,
    MegHuntPos = nil,
	RodToBeEquipped = "",
	FishHunted = "",
	Pr = 0,
}

local Utils = {}

local UI = {}

local CalibrationData = {}

local FischUser = {}

local NEVERLOSE = loadstring(game:HttpGet("https://you.whimper.xyz/sources/ronix/ui.lua"))()

local Notification = NEVERLOSE.Notification();

NEVERLOSE:Theme("dark")

--UI

for Setting, Value in pairs(Options) do
    if Value == false then
        UI[Setting] = function(Val)
            Options[Setting] = Val
        end
    end
end

function UI.Initialize()
    --UI

    local Windows = NEVERLOSE:AddWindow("Ronix Hub","🌟Ronix Hub - Fisch - V0.1.8 - discord.gg/ronix🌟")

    local FishingTab = Windows:AddTab("Fishing", "earth")

    local PlayerTab = Windows:AddTab("Player", "earth")

    local ExclusivesTab = Windows:AddTab("FUN", "earth")

    local Interactions = Windows:AddTab("Interactions", "list")

    local AreaTeleportsTab = Windows:AddTab("Area Teleports", "earth")

    local ShopTab = Windows:AddTab("Shop", "earth")

    local MegaladonHunting = Windows:AddTab("Priority List", "earth")

    local WebhookTab = Windows:AddTab("Webhook", "list")

    local SettingsTab = Windows:AddTab('Settings','earth')

    local MechanicsSection = FishingTab:AddSection("Mechanics", "left")

	local FishingSection = FishingTab:AddSection("Fish AutoFarm", "left")

	local FishingSetSection = FishingTab:AddSection("Fish AutoFarm Settings", "left")

    local Convenience = FishingTab:AddSection("Convenience", "left")

    local CreditsSection = FishingTab:AddSection("Credits", "right")

    local Teleports = AreaTeleportsTab:AddSection("Teleports", "left")

    local Treasure = AreaTeleportsTab:AddSection("Treasure", "right")

    local Actions = Interactions:AddSection("Actions", "left")

    local WebhookSection = WebhookTab:AddSection("Webhook", "left")

    local ShopSection = ShopTab:AddSection("Shop All", "left")

    local SellerSection = FishingTab:AddSection("Seller", "left")

    local TotemsSection = AreaTeleportsTab:AddSection("Totems", "left")

    local WorldEvents = AreaTeleportsTab:AddSection('World Events', "right")

    local ExclusivesSection = ExclusivesTab:AddSection('FUN', "right")
  

    local PlayerSection = PlayerTab:AddSection("Player Modify", "left")

    local MiscSection = PlayerTab:AddSection("Misc Player", "right")

    local SettingsSection = SettingsTab:AddSection("Settings", "right")
    
    SellerSection:AddButton("Sell All",  FischUser.Sell)

    Convenience:AddToggle("Float On Water", false, UI.FloatOnWater)

    Convenience:AddLabel("Turn ON to walk around and choose spot.")
    
	Convenience:AddToggle("Auto Totem Use", false, UI.AutoTotem)

	Convenience:AddToggle("Auto TP To Treasure Map", false, UI.AutoMap)

Treasure:AddToggle("Teleport to Jack Marrow", false, function()
    local Player = game.Players.LocalPlayer
    local HumanoidRootPart = Player.Character:WaitForChild("HumanoidRootPart")
    HumanoidRootPart.CFrame = CFrame.new(-2824.359, 214.311, 1518.130)
end)
local NpcFolder = Workspace:FindFirstChild("world"):WaitForChild("npcs")

function rememberPosition()
    spawn(function()
        local initialCFrame = HumanoidRootPart.CFrame
 
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyVelocity.Parent = HumanoidRootPart
 
        local bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bodyGyro.D = 100
        bodyGyro.P = 10000
        bodyGyro.CFrame = initialCFrame
        bodyGyro.Parent = HumanoidRootPart
 
        while AutoFreeze do
            HumanoidRootPart.CFrame = initialCFrame
            task.wait(0.01)
        end
        if bodyVelocity then
            bodyVelocity:Destroy()
        end
        if bodyGyro then
            bodyGyro:Destroy()
        end
    end)
end
SellerSection:AddButton("Sell Fish (In Hand)", false, function()
        local currentPosition = HumanoidRootPart.CFrame
        local sellPosition = CFrame.new(464, 151, 232)
        local wasAutoFreezeActive = false
        if AutoFreeze then
            wasAutoFreezeActive = true
            AutoFreeze = false
        end
        HumanoidRootPart.CFrame = sellPosition
        task.wait(0.5)
        workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild("sell"):InvokeServer()
        task.wait(1)
        HumanoidRootPart.CFrame = currentPosition
        if wasAutoFreezeActive then
            AutoFreeze = true
            rememberPosition()
        end
    end)


local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui

Convenience :AddButton("Show Ui Buy Boat", function()
    if PlayerGui and PlayerGui:FindFirstChild("hud") and PlayerGui.hud:FindFirstChild("safezone") and PlayerGui.hud.safezone:FindFirstChild("shipwright") then
        PlayerGui.hud.safezone.shipwright.Visible = not PlayerGui.hud.safezone.shipwright.Visible
    else
        print("Error: Could not find the necessary UI elements.")
    end
end)
FishingSection:AddToggle("Auto Reel (Blatant)", false, UI.AutoMinigameBlatant)
Treasure:AddToggle("Repair Map", false, function()
    local Player = game.Players.LocalPlayer
    for _, v in pairs(Player.Backpack:GetChildren()) do
        if v.Name == "Treasure Map" then
            Player.Character.Humanoid:EquipTool(v)
            workspace.world.npcs["Jack Marrow"].treasure.repairmap:InvokeServer()
        end
    end
end)
FishingSection:AddToggle("Auto Cast", false, UI.AutoCast)
Treasure:AddToggle("Collect Treasure", false, function()
    for _, v in ipairs(game:GetService("Workspace"):GetDescendants()) do
        if v.ClassName == "ProximityPrompt" then
            v.HoldDuration = 0
        end
    end

    for _, v in pairs(workspace.world.chests:GetDescendants()) do
        if v:IsA("Part") and v:FindFirstChild("ChestSetup") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            for _, prompt in pairs(workspace.world.chests:GetDescendants()) do
                if prompt.Name == "ProximityPrompt" then
                    fireproximityprompt(prompt)
                end
            end
            task.wait(1)
        end
    end
end)

PlayerSection:AddToggle("Walk On Water", false, function(Value)
    local WalkZone = "Ocean" 

    if Value then

        for _, v in pairs(workspace.zones.fishing:GetChildren()) do
            if v.Name == WalkZone then
                v.CanCollide = true
            end
            if v.Name == "Deep Ocean" and WalkZone == "Ocean" then
                v.CanCollide = true
            end
        end
    else
--bro bdokkx is so sigma!
        for _, v in pairs(workspace.zones.fishing:GetChildren()) do
            if v.Name == WalkZone then
                v.CanCollide = false
            end
            if v.Name == "Deep Ocean" and WalkZone == "Ocean" then
                v.CanCollide = false
            end
        end
    end
end)


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")


local oldpos = HumanoidRootPart.CFrame
local FreezePlayer = false 

local function FreezeCharacter()
    while FreezePlayer do
        task.wait()
        if HumanoidRootPart then
            HumanoidRootPart.CFrame = oldpos
        end
    end
end


PlayerSection:AddToggle("Freeze Player", false, function(Value)
    FreezePlayer = Value
    if FreezePlayer then
        oldpos = HumanoidRootPart.CFrame
        task.spawn(FreezeCharacter)
        print("Player freezing enabled.")
    else
        print("Player freezing disabled.")
    end
end)




--also i just uhh dont ask :skull got mad so i put everything and it works
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
local shadowCountLabel = Instance.new("TextLabel", screenGui)
local RenderStepped = RunService.RenderStepped
local WaitForSomeone = RenderStepped.Wait

Convenience:AddButton("Protect Identity", function()

    getgenv().name = "discord.gg/ronix on top"
    local Plr = game.Players.LocalPlayer
    for Index, Value in next, game:GetDescendants() do 
        if Value.ClassName == "TextLabel" then 
            local has = string.find(Value.Text,Plr.Name) 
            if has then 
                local str = Value.Text:gsub(Plr.Name,name)
                Value.Text = str 
            end
            Value:GetPropertyChangedSignal("Text"):Connect(function()
                local str = Value.Text:gsub(Plr.Name,name)
                Value.Text = str 
            end)
        end
    end
    game.DescendantAdded:Connect(function(Value)
        if Value.ClassName == "TextLabel" then 
            local has = string.find(Value.Text,Plr.Name)
            Value:GetPropertyChangedSignal("Text"):Connect(function()
                local str = Value.Text:gsub(Plr.Name,name)
                Value.Text = str 
            end)
            if has then 
                local str = Value.Text:gsub(Plr.Name,name)
                Value.Text = str 
            end
     
        end
    end)
    if UserPlayer:FindFirstChild("streak") then UserPlayer.streak.Text = "HIDDEN" end
    if UserPlayer:FindFirstChild("level") then UserPlayer.level.Text = "Level: HIDDEN" end
    if UserPlayer:FindFirstChild("level") then UserPlayer.user.Text = "HIDDEN" end
    local hud = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("hud"):WaitForChild("safezone")
    if hud:FindFirstChild("coins") then hud.coins.Text = "HIDDEN$" end
    if hud:FindFirstChild("lvl") then hud.lvl.Text = "HIDDEN LVL" end
    task.wait(0.01)
end)



PlayerSection:AddDropdown("Walk On Water Zone", {"Ocean", "Desolate Deep", "The Depths"}, Ocean, function(selectedZone)
    WalkZone = selectedZone 
end)

    AllFuncs['To Pos Stand'] = function()
        while Config['To Pos Stand'] and task.wait() do
            if not Config['SelectPositionStand'] then
                Notify("Pls Select Position")
                Config['To Pos Stand'] = false
                return
            end
            pcall(function()
                LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = Config['SelectPositionStand']
            end)
        end
    end

    local Config = {
        ['Toggle Walk Speed'] = false, 
        ['Set Walk Speed'] = 50,
        ['Toggle Jump Power'] = false,
        ['Set Jump Power'] = 50
    }
    
    local LocalPlayer = game.Players.LocalPlayer

        AllFuncs['Toggle Walk Speed'] = function()
        while true do
            if Config['Toggle Walk Speed'] then
                pcall(function()
                    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.WalkSpeed = Config['Set Walk Speed']
                    end
                end)
            else
                pcall(function()
                    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.WalkSpeed = 16 
                    end
                end)
            end
            task.wait(0.1) 
        end
    end




    
    
    AllFuncs['Toggle Jump Power'] = function()
        while true do
            if Config['Toggle Jump Power'] then
                pcall(function()
                    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.JumpPower = Config['Set Jump Power']
                    end
                end)
            else
                pcall(function()
                    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.JumpPower = 50
                    end
                end)
            end
            task.wait(0.1)
        end
    end

SettingsSection:AddLabel("Useless because anti afk auto loads!")
	ShopSection:AddLabel("Turn on when you first join")
    PlayerSection:AddToggle('Toggle Walk Speed', false, function(val)
        Config['Toggle Walk Speed'] = val
        print("Walk Speed Toggle:", val)
    end)
    
    PlayerSection:AddToggle('Toggle Jump Power', false, function(val)
        Config['Toggle Jump Power'] = val
        print("Jump Power Toggle:", val)
    end)
    
    PlayerSection:AddSlider('Walk Speed', 1, 500, 50, function(val)
        Config['Set Walk Speed'] = val
        print('Walk Speed Set to:', val)
    end)
    
    PlayerSection:AddSlider('Jump Power', 1, 500, 50, function(val)
        Config['Set Jump Power'] = val
        print('Jump Power Set to:', val)
    end)
    
    task.spawn(AllFuncs['Toggle Walk Speed'])
    task.spawn(AllFuncs['Toggle Jump Power'])
    
Convenience:AddToggle("Remove Fog", false, function(Value)
    if Value then
        if game:GetService("Lighting"):FindFirstChild("Sky") then
            game:GetService("Lighting"):FindFirstChild("Sky").Parent = game:GetService("Lighting").bloom
        end
    else
        if game:GetService("Lighting").bloom:FindFirstChild("Sky") then
            game:GetService("Lighting").bloom:FindFirstChild("Sky").Parent = game:GetService("Lighting")
        end
    end
end)

local RunService = game:GetService("RunService")

local DayOnlyLoop
Convenience:AddToggle("Day", false, function(Value)
    if Value then
        if DayOnlyLoop then return end  
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

local NightOnlyLoop
Convenience:AddToggle("Night", false, function(Value)
    if Value then
        if NightOnlyLoop then return end
        NightOnlyLoop = RunService.Heartbeat:Connect(function()
            game:GetService("Lighting").TimeOfDay = "22:00:00"
        end)
    else
        if NightOnlyLoop then
            NightOnlyLoop:Disconnect()
            NightOnlyLoop = nil
        end
    end
end)

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

Actions:AddButton("Rejoin Server", function()
    TeleportService:TeleportToPlaceInstance(game.placeId, game.JobId, Players.LocalPlayer)
end)

MiscSection:AddToggle("Fish Radar", false, function(Value)

    for _, v in pairs(game:GetService("CollectionService"):GetTagged("radarTag")) do
        if v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
            v.Enabled = Value
        end
    end
end)
--real bdokx super sigma
    local function GetPosition()
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            return character.HumanoidRootPart.Position
        end
        return Vector3.new(0, 0, 0)  
    end
    
    local function ExportValue(value)
        return string.format("%.2f", value) 
    end
    
    MiscSection:AddToggle("Gps", false, function(Value)
        local PlayerGui = game.Players.LocalPlayer.PlayerGui
        local hud = PlayerGui:WaitForChild("hud")
        local safezone = hud:WaitForChild("safezone")
        local backpack = safezone:WaitForChild("backpack")
    
        if Value then
            local XyzClone = game:GetService("ReplicatedStorage").resources.items.items.GPS.GPS.gpsMain.xyz:Clone()
            XyzClone.Parent = backpack

            local Pos = GetPosition()
            local StringInput = string.format("%s,%s,%s", ExportValue(Pos.X), ExportValue(Pos.Y), ExportValue(Pos.Z))
            XyzClone.Text = "<font color='#ff4949'>X</font><font color='#a3ff81'>Y</font><font color='#626aff'>Z</font>: "..StringInput

            BypassGpsLoop = game:GetService("RunService").Heartbeat:Connect(function()
                local Pos = GetPosition()
                local StringInput = string.format("%s,%s,%s", ExportValue(Pos.X), ExportValue(Pos.Y), ExportValue(Pos.Z))
                XyzClone.Text = "<font color='#ff4949'>X</font><font color='#a3ff81'>Y</font><font color='#626aff'>Z</font>: "..StringInput
            end)
        else
            if backpack:FindFirstChild("xyz") then
                backpack:FindFirstChild("xyz"):Destroy()
            end
            if BypassGpsLoop then
                BypassGpsLoop:Disconnect()
                BypassGpsLoop = nil
            end
        end
    end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui") 
local hud = PlayerGui:WaitForChild("hud") 
local safezone = hud:WaitForChild("safezone") 


safezone.Visible = true


MiscSection:AddToggle("Show/Hide UIs", false, function(Value)
    if Value then
        safezone.Visible = false
        print("UI is now visible.")
    else
        safezone.Visible = true
        print("UI is now hidden.")
    end
end)



MiscSection:AddToggle("Infinite Oxygen", false, function(Value)
    LocalPlayer.Character.client.oxygen.Disabled = Value
end)

MiscSection:AddToggle("Clear Weather", false, function(Value)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local weather = ReplicatedStorage:WaitForChild("world"):WaitForChild("weather")
    local OldWEA = OldWEA or weather.Value

    if Value then
        weather.Value = "Clear"
    else
        weather.Value = OldWEA
    end
end)
    

PlayerSection:AddToggle("Noclip", false, function(Value)
    Config['Toggle Noclip'] = Value 

    if Value then
        local charParts = LocalPlayer.Character:GetDescendants()
        for _, part in pairs(charParts) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    else
        local charParts = LocalPlayer.Character:GetDescendants()
        for _, part in pairs(charParts) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end)

MiscSection:AddToggle("Anti Lag", false, function(Value)
    if Value then
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
                if v.Transparency ~= 1 then
                    v.Material = Enum.Material.SmoothPlastic
                end
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v:Destroy()
            end
        end
    else
    end
end)
--bdokxk and diddy fish auto farm btw!
Config = _G.Config or {}  
Config['Farm Fish'] = false  

local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Backpack = LocalPlayer.Backpack
local PlayerGui = LocalPlayer.PlayerGui
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local RodName = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value

AllFuncs = {}

AllFuncs['Farm Fish'] = function()
    while Config['Farm Fish'] and task.wait() do
        if Backpack:FindFirstChild(RodName) then
            LocalPlayer.Character.Humanoid:EquipTool(Backpack:FindFirstChild(RodName))
        end
        if LocalPlayer.Character:FindFirstChild(RodName) and LocalPlayer.Character[RodName]:FindFirstChild("bobber") then

            repeat
                pcall(function()
                    PlayerGui:FindFirstChild("shakeui").safezone:FindFirstChild("button").Size = UDim2.new(1001, 0, 1001, 0)
                    VirtualUser:Button1Down(Vector2.new(1, 1))
                    VirtualUser:Button1Up(Vector2.new(1, 1))
                end)
                RunService.Heartbeat:Wait()
            until not LocalPlayer.Character:FindFirstChild(RodName) or LocalPlayer.Character[RodName].values.bite.Value or not Config['Farm Fish']

            repeat
                ReplicatedStorage.events.reelfinished:FireServer(1000000000000000000000000, true)
                task.wait(0.5)
            until not LocalPlayer.Character:FindFirstChild(RodName) or not LocalPlayer.Character[RodName].values.bite.Value or not Config['Farm Fish']
        else

            if LocalPlayer.Character:FindFirstChild(RodName) then
                LocalPlayer.Character[RodName].events.cast:FireServer(1000000000000000000000000)
                task.wait(2)
            end
        end
    end
end

function ExportValue(arg1, arg2)
    return tonumber(string.format("%." .. (arg2 or 1) .. 'f', arg1))
end

MechanicsSection:AddToggle("Auto Farm (Laggy v1)", false, function(state)
    Config['Farm Fish'] = state
    if state then
        AllFuncs['Farm Fish']()
    end
end)


ExclusivesSection:AddButton("Auto Heaven Rod", function() 
    spawn(function()
        local SharedRed, SharedBlue, SharedGreen, SharedYellow = false, false, false, false
        local IsBuying, IsBuying2, IsBuying3 = false, false, false
    
        Module:Run_Loop("Auto Get Heaven's Rod", function()
          if Module:IsHaveRod("Heaven's Rod") then
            Notification("You Already Have Heaven's Rod!")
            wait(5)
            return
          end
    
          if not World.map["Northern Summit"]:FindFirstChild("NorthFinalPuzzle") then
            Module:GetTo(CFrame.new(19990.3789, 1136.4281, 5536.5249, 0.984981179, -8.43332231e-08, -0.172661752, 7.71411734e-08, 1, -4.83640221e-08, 0.172661752, 3.43183189e-08, 0.984981179))
          else
            if Player.Backpack:FindFirstChild("Blue Energy Crystal") and not SharedBlue then
              if World.map["Northern Summit"].NorthFinalPuzzle.Shards.Blue.handle.Prompt.Enabled then
                if Module:GetMagnitude(CFrame.new(19967.16015625, 1137.2425537109375, 5362.26904296875)) > 5 then
                  Module:GetTo(CFrame.new(19967.16015625, 1137.2425537109375, 5362.26904296875))
                else
                  pcall(function()ReplicatedStorage.packages.Net["RE/NorthFinalPuzzleService/Place"]:FireServer("Blue")end)
                  Module:FirePrompt(World.map["Northern Summit"].NorthFinalPuzzle.Shards.Blue.handle.Prompt)
                  wait(2)
                  SharedBlue = true
                end
              elseif not World.map["Northern Summit"].NorthFinalPuzzle.Shards.Blue.handle.Prompt.Enabled then
                SharedBlue = true
              end
            end
      
            if Player.Backpack:FindFirstChild("Green Energy Crystal") and not SharedGreen then
              if World.map["Northern Summit"].NorthFinalPuzzle.Shards.Green.handle.Prompt.Enabled then
                if Module:GetMagnitude(CFrame.new(19967.16015625, 1137.2425537109375, 5362.26904296875)) > 5 then
                  Module:GetTo(CFrame.new(19967.16015625, 1137.2425537109375, 5362.26904296875))
                else
                  pcall(function()ReplicatedStorage.packages.Net["RE/NorthFinalPuzzleService/Place"]:FireServer("Green")end)
                  Module:FirePrompt(World.map["Northern Summit"].NorthFinalPuzzle.Shards.Green.handle.Prompt)
                  wait(2)
                  SharedGreen = true
                end
              elseif not World.map["Northern Summit"].NorthFinalPuzzle.Shards.Green.handle.Prompt.Enabled then
                SharedGreen = true
              end
            end
    
            if Player.Backpack:FindFirstChild("Red Energy Crystal") and not SharedRed then
              if World.map["Northern Summit"].NorthFinalPuzzle.Shards.Red.handle.Prompt.Enabled then
                if Module:GetMagnitude(CFrame.new(19967.16015625, 1137.2425537109375, 5362.26904296875)) > 5 then
                  Module:GetTo(CFrame.new(19967.16015625, 1137.2425537109375, 5362.26904296875))
                else
                  pcall(function()ReplicatedStorage.packages.Net["RE/NorthFinalPuzzleService/Place"]:FireServer("Red")end)
                  Module:FirePrompt(World.map["Northern Summit"].NorthFinalPuzzle.Shards.Red.handle.Prompt)
                  wait(2)
                  SharedRed = true
                end
              elseif not World.map["Northern Summit"].NorthFinalPuzzle.Shards.Red.handle.Prompt.Enabled then
                SharedRed = true
              end
            end
    
            if Player.Backpack:FindFirstChild("Yellow Energy Crystal") and not SharedYellow then
              if World.map["Northern Summit"].NorthFinalPuzzle.Shards.Yellow.handle.Prompt.Enabled then
                if Module:GetMagnitude(CFrame.new(19967.16015625, 1137.2425537109375, 5362.26904296875)) > 5 then
                  Module:GetTo(CFrame.new(19967.16015625, 1137.2425537109375, 5362.26904296875))
                else
                  pcall(function()ReplicatedStorage.packages.Net["RE/NorthFinalPuzzleService/Place"]:FireServer("Yellow")end)
                  Module:FirePrompt(World.map["Northern Summit"].NorthFinalPuzzle.Shards.Yellow.handle.Prompt)
                  wait(2)
                  SharedYellow = true
                end
              elseif not World.map["Northern Summit"].NorthFinalPuzzle.Shards.Yellow.handle.Prompt.Enabled then
                SharedYellow = true
              end
            end
      
            if SharedRed and SharedBlue and SharedGreen and SharedYellow then
              ReplicatedStorage.events.purchase:FireServer("Heaven's Rod", "Rod", nil, 1)
              wait(1)
            end
    
            if not Player.Backpack:FindFirstChild("Blue Energy Crystal") and not SharedBlue then
              if not Player.Backpack:FindFirstChild("Pickaxe") and not IsBuying2 then
                Module:BuyShop("Pickaxe", "Item", 1)
                IsBuying2 = true
                wait(10)
              else
                if Module:GetMagnitude(CFrame.new(20124.8711, 212.725845, 5449.35498, 0.793378353, 0, 0.608728826, 0, 1, 0, -0.608728826, 0, 0.793378353)) > 6 then
                  Module:GetTo(CFrame.new(20124.8711, 212.725845, 5449.35498, 0.793378353, 0, 0.608728826, 0, 1, 0, -0.608728826, 0, 0.793378353))
                else
                  if Module:NearestPromptCheck(10, "Blue Energy Crystal") then
                    pcall(function()ReplicatedStorage.packages.Net["RF/ItemSpawnCollect"]:InvokeServer("Blue Energy Crystal")end)
                    Module:NearestPrompt(10)
                  else
                    if Player.Character:FindFirstChild("Pickaxe") then
                      Player.Character:FindFirstChild("Pickaxe"):Activate()
                    else
                      Module:EquipTool("Pickaxe")
                    end
                  end
                end
              end
            elseif not Player.Backpack:FindFirstChild("Yellow Energy Crystal") and not SharedYellow then
              if Module:GetMagnitude(CFrame.new(19499.6953125, 335.21728515625, 5549.265625)) > 6 then
                Module:GetTo(CFrame.new(19499.6953125, 335.21728515625, 5549.265625))
              else
                if Module:NearestPromptCheck(10, "Yellow Energy Crystal") then
                  pcall(function()ReplicatedStorage.packages.Net["RF/ItemSpawnCollect"]:InvokeServer("Yellow Energy Crystal")end)
                  Module:NearestPrompt(10)
                else
                  if not Player.Backpack:FindFirstChild("Avalanche Totem") and not IsBuying then
                    Module:BuyShop("Avalanche Totem", "Item", 1)
                    IsBuying = true
                    wait(10)
                  end
    
                  if Player.Character:FindFirstChild("Avalanche Totem") then
                    Player.Character:FindFirstChild("Avalanche Totem"):Activate()
                    wait(20)
                  else
                    Module:EquipTool("Avalanche Totem")
                  end 
                end
              end
            elseif not Player.Backpack:FindFirstChild("Red Energy Crystal") and not SharedRed then
              if not IsBuying3 then
                ReplicatedStorage.packages.Net["RF/NorthExp/PurchaseShard"]:InvokeServer()
                IsBuying3 = true
                wait(10)
              end
            elseif not Player.Backpack:FindFirstChild("Green Energy Crystal") and not SharedGreen then
              if World.npcs:FindFirstChild("???") then
                Module:TalkToNPC("???", function()
                  if string.find(PlayerGui.options.safezone["1option"].text, "You're right, I'm freezing out here!") then
                    PlayerGui.options.safezone["1option"].Selectable = true
                    Module:ClickUi(PlayerGui.options.safezone["1option"].button)
                  elseif string.find(PlayerGui.options.safezone["1option"].text, "I'm fascinated by the mysteries this mountain holds.") then
                    PlayerGui.options.safezone["1option"].Selectable = true
                    Module:ClickUi(PlayerGui.options.safezone["1option"].button)
                  elseif string.find(PlayerGui.options.safezone["1option"].text, "Of course, that would be great") then
                    PlayerGui.options.safezone["1option"].Selectable = true
                    Module:ClickUi(PlayerGui.options.safezone["1option"].button)
                  end
                end)
              else
                Module:GetTo(CFrame.new(19872.7266, 448.0941, 5556.5830))
              end
            end
          end
        end)
      end)        
end)

local function fakeDupeFish(times)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local tool = character:FindFirstChildOfClass("Tool")

    if tool then
        for i = 1, times do
            local toolClone = tool:Clone()
            toolClone.Parent = backpack
        end
    else
        Notification:Notify("Failed to Dupe", "Please Hold a fish to Dupe ", 5)
    end
end

ExclusivesSection:AddButton("Dupe Fish [Visual]", function() 
fakeDupeFish(math.random(5,10))
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local l_Stats_0 = ReplicatedStorage:WaitForChild("playerstats"):WaitForChild(LocalPlayer.Name):WaitForChild("Stats")
local l_debris_0 = require(ReplicatedStorage:WaitForChild("modules"):WaitForChild("fx"):WaitForChild("debris"))
local l_fx_0 = require(ReplicatedStorage:WaitForChild("modules"):WaitForChild("fx"))

local function comma_value(value)
    local formatted = tostring(math.ceil(value))
    repeat
        formatted, _ = string.gsub(formatted, "^(-?%d+)(%d%d%d)", "%1,%2")
    until _ == 0
    return formatted
end

local function InsertCoin(amount)
    local l_Value_0 = l_Stats_0:WaitForChild("coins").Value
    local newValue = l_Value_0 + amount

    local l_NumberValue_0 = Instance.new("NumberValue")
    l_NumberValue_0.Value = l_Value_0

    game:GetService("TweenService"):Create(l_NumberValue_0, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Value = newValue
    }):Play()

    l_fx_0:PlaySound(ReplicatedStorage.resources.sounds.sfx.ui.currencygain, game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.coins, true)

    l_NumberValue_0:GetPropertyChangedSignal("Value"):Connect(function()
        game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.coins.Text = tostring(comma_value(l_NumberValue_0.Value) .. " C$")
    end)

    l_debris_0:AddItem(l_NumberValue_0, 0.7)

    if l_Value_0 > newValue then
        -- Displaying coin loss
        require(game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.coins:FindFirstAncestor("hud").Parent:WaitForChild("GeneralUIModule")):ListOnBottomRight(
            "-" .. comma_value(l_Value_0 - newValue) .. " C$",
            Color3.fromRGB(212, 62, 62),
            0
        )
        game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.coins.TextColor3 = Color3.fromRGB(212, 62, 62)
    else
        -- Displaying coin gain
        require(game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.coins:FindFirstAncestor("hud").Parent:WaitForChild("GeneralUIModule")):ListOnBottomRight(
            "+" .. comma_value(newValue - l_Value_0) .. " C$",
            Color3.fromRGB(99, 203, 61),
            0
        )
        game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.coins.TextColor3 = Color3.fromRGB(99, 203, 61)
    end

    -- Flashing effect
    for i = 1, 2 do
        task.wait(0.1)
        game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.coins.TextColor3 = Color3.fromRGB(255, 253, 228)
        task.wait(0.1)
        game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.coins.TextColor3 = (l_Value_0 > newValue) and Color3.fromRGB(212, 62, 62) or Color3.fromRGB(99, 203, 61)
    end

    l_Value_0 = newValue
    l_Stats_0:WaitForChild("coins").Value = newValue
    game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.coins.Text = tostring(comma_value(newValue) .. " C$")
    game:GetService("Players").LocalPlayer.leaderstats["C$"].Value = game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.coins.Text
end

getgenv().VisualDupCoins = false
ExclusivesSection:AddToggle("Auto Dupe Coin [Visual]", false, function(toggle)
getgenv().VisualDupCoins = toggle
if getgenv().VisualDupCoins then
while getgenv().VisualDupCoins do
    local Real3itx = math.random(60000, 105000)
    InsertCoin(Real3itx)
    task.wait()
end
end
end)

local CastMode = "Legit"
local ShakeMode = "Navigation"
local ReelMode = "Blatant"

local autoCastEnabled = false
local autoShakeEnabled = false
local autoReelEnabled = false



local autoShakeEnabled = false
local ShakeMode = "Navigation" 
local autoShakeConnection = nil
local lastMouseShakeTime = 0 

local PlayerService = game:GetService("Players")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local LocalPlayer = PlayerService.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local function autoShake()
    if not autoShakeEnabled then return end 

    if ShakeMode == "Navigation" then
        xpcall(function()
            local shakeui = PlayerGui:FindFirstChild("shakeui")
            if not shakeui then return end

            local safezone = shakeui:FindFirstChild("safezone")
            local button = safezone and safezone:FindFirstChild("button")
            if not button then return end

            task.wait(0.2) 
            GuiService.SelectedObject = button

            if GuiService.SelectedObject == button then
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            end

            task.wait(0.1)
            GuiService.SelectedObject = nil 
        end, function(err)
        end)

    elseif ShakeMode == "Mouse" then
        local currentTime = tick()
        if currentTime - lastMouseShakeTime < 0.1 then return end 
        lastMouseShakeTime = currentTime

        xpcall(function()
            local shakeui = PlayerGui:FindFirstChild("shakeui")
            if not shakeui then return end

            local safezone = shakeui:FindFirstChild("safezone")
            local button = safezone and safezone:FindFirstChild("button")
            if not button then return end

            local pos = button.AbsolutePosition
            local size = button.AbsoluteSize
            local centerX, centerY = pos.X + size.X / 2, pos.Y + size.Y / 2
            VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, true, LocalPlayer, 0)
            task.wait(0.07) 
            VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, false, LocalPlayer, 0)
        end, function(err)
        end)
    end
end

local function startAutoShake()
    if not autoShakeConnection and autoShakeEnabled then
        autoShakeConnection = RunService.RenderStepped:Connect(autoShake)
    end
end

local function stopAutoShake()
    if autoShakeConnection then
        autoShakeConnection:Disconnect()
        autoShakeConnection = nil
    end
end

if FishingSection and FishingSection.AddToggle then
    FishingSection:AddToggle("Auto Shake", false, function(toggle)
        autoShakeEnabled = toggle
        if toggle then
            startAutoShake()
        else
            stopAutoShake()
        end
    end)
end



local HuntOrNo = Convenience:AddToggle("Hunt Megaladon", false, UI.MegaladonHunting)

FishingSetSection:AddDropdown('Auto Cast Mode', {'Legit', 'Blatant'}, 'Blatant', function(val)
    CastMode = val
end)

FishingSetSection:AddDropdown('Auto Shake Mode', {'Navigation', 'Mouse'}, 'Navigation', function(val)
    ShakeMode = val
end)

FishingSetSection:AddDropdown('Auto Reel Mode', {'Legit', 'Blatant'}, 'Blatant', function(val)
    ReelMode = val
end)



Actions:AddButton("Hop Server", function()
    AllFuncs.HopServer(true)
end)

    WebhookSection:AddButton(
    "Set Webhook URL",
    function()
        NEVERLOSE:KeySystem(
            "Webhook URL - Put URL as key and click Submit to set it.",
            "",
            function(URL)
                Options.WebhookURL = URL
                Notification:Notify("info", "Set Webhook Successfully", "Set webhook to "..URL, 5)
                return true
            end
        ):Callback(function()end)
    end
    )

    WebhookSection:AddToggle(
        "Send Webhook Notifications",
        false,
        UI.WebhookNotifications
    )

    WebhookSection:AddToggle(
        "Webhook Notifications for Priority Events",
        false,
        UI.PriorityWebhook
    )

    local TpSpotsFolder = Workspace:FindFirstChild("world"):WaitForChild("spawns"):WaitForChild("TpSpots")
    local teleportSpots = {}
    
    for i, v in pairs(TpSpotsFolder:GetChildren()) do
        if table.find(teleportSpots, v.Name) == nil then
            table.insert(teleportSpots, v.Name)
        end
    end


    for _, Place in pairs(teleportSpots) do

        local Position = TpSpotsFolder:FindFirstChild(Place) and TpSpotsFolder[Place].Position


        if Position then
            Teleports:AddButton(
                "Teleport to " .. Place,
                function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Position
                end
            )
        end
    end


TotemsSection:AddButton(
    "Teleport to Aurora",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1811, -137, -3282)
    end
)


TotemsSection:AddButton(
    "Teleport to Sundial",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1148, 135, -1075)
    end
)


TotemsSection:AddButton(
    "Teleport to Windset",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2849, 178, 2702)
    end
)


TotemsSection:AddButton(
    "Teleport to Smokescreen",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2789, 140, -625)
    end
)
TotemsSection:AddButton(
    "Teleport to Tempest",
    function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(35, 133, 1943)
    end
)
    
WorldEvents:AddButton(
    "Teleport to Strange Whirlpool",
    function()
        local offset = Vector3.new(25, 135, 25)
        local WorldEvent = game.Workspace.zones.fishing:FindFirstChild("Isonade")
        if not WorldEvent then 
            return ShowNotification("Not found Strange Whirlpool")
        end
        HumanoidRootPart.CFrame = CFrame.new(WorldEvent.Position + offset)
    end
)


WorldEvents:AddButton(
    "Teleport to Great Hammerhead Shark",
    function()
        local offset = Vector3.new(0, 135, 0)
        local WorldEvent = game.Workspace.zones.fishing:FindFirstChild("Great Hammerhead Shark")
        if not WorldEvent then 
            return ShowNotification("Not found Great Hammerhead Shark")
        end
        HumanoidRootPart.CFrame = CFrame.new(WorldEvent.Position + offset)
    end
)


WorldEvents:AddButton(
    "Teleport to Great White Shark",
    function()
        local offset = Vector3.new(0, 135, 0)
        local WorldEvent = game.Workspace.zones.fishing:FindFirstChild("Great White Shark")
        if not WorldEvent then 
            return ShowNotification("Not found Great White Shark")
        end
        HumanoidRootPart.CFrame = CFrame.new(WorldEvent.Position + offset)
    end
)


WorldEvents:AddButton(
    "Teleport to Whale Shark",
    function()
        local offset = Vector3.new(0, 135, 0)
        local WorldEvent = game.Workspace.zones.fishing:FindFirstChild("Whale Shark")
        if not WorldEvent then 
            return ShowNotification("Not found Whale Shark")
        end
        HumanoidRootPart.CFrame = CFrame.new(WorldEvent.Position + offset)
    end
)


WorldEvents:AddButton(
    "Teleport to The Depths - Serpent",
    function()
        local offset = Vector3.new(0, 50, 0)
        local WorldEvent = game.Workspace.zones.fishing:FindFirstChild("The Depths - Serpent")
        if not WorldEvent then 
            return ShowNotification("Not found The Depths - Serpent")
        end
        HumanoidRootPart.CFrame = CFrame.new(WorldEvent.Position + offset)
    end
)

    Teleports:AddButton("Best Spot", function()

        local forceFieldPart = Instance.new("Part")
        forceFieldPart.Size = Vector3.new(10, 1, 10) 
        forceFieldPart.Position = Vector3.new(1447.8507080078125, 131.49998474121094, -7649.64501953125) 
        forceFieldPart.Anchored = true 
        forceFieldPart.BrickColor = BrickColor.new("White")
        forceFieldPart.Material = Enum.Material.SmoothPlastic 
        forceFieldPart.Parent = game.Workspace
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Adornee = forceFieldPart 
        billboardGui.Size = UDim2.new(0, 200, 0, 50) 
        billboardGui.StudsOffset = Vector3.new(0, 5, 0) 
        billboardGui.Parent = game.Workspace 
        --this is the part we get to be This is forced labor for bdokkx, dynamicarrays
        local textLabel = Instance.new("TextLabel")
        textLabel.Text = "This is forced labor for bdokkx, dynamicarrays"
        textLabel.TextColor3 = Color3.fromRGB(255, 0, 0) 
        textLabel.TextSize = 20
        textLabel.BackgroundTransparency = 1 
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.TextScaled = true 
        textLabel.Parent = billboardGui 
    --ronix owner whips us
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1447.8507080078125, 133.49998474121094, -7649.64501953125)
    end)
-- NO NO STOP RONIX OWW OWWW!
Teleports:AddButton("Safe Place", function()
    local SafeZone = Instance.new("Part")
    SafeZone.Size = Vector3.new(30, 1, 30)
    SafeZone.Position = Vector3.new(math.random(-2000, 2000), math.random(50000, 90000), math.random(-2000, 2000))
    SafeZone.Anchored = true
    SafeZone.BrickColor = BrickColor.new("Bright purple")
    SafeZone.Material = Enum.Material.ForceField
    SafeZone.Parent = workspace 
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(SafeZone.Position + Vector3.new(0, 5, 0))
    end
end)

local createdButtons = {}

ShopSection:AddToggle("Teleport To Buy", false, function(state)
    if not createdButtons["TeleportToBuy"] then
        for _, v in pairs(workspace.world.interactables:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                v.HoldDuration = 0
                ShopSection:AddButton("Buy " .. v.Parent.Name, function()
                    local humanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        if fireproximityprompt and not state then
                            local OldCFrame = humanoidRootPart.CFrame
                            humanoidRootPart.CFrame = v.Parent:GetPivot()
                            delay(0.3, function()
                                fireproximityprompt(v, 1)
                                humanoidRootPart.CFrame = OldCFrame
                            end)
                        else
                            if not fireproximityprompt then
                                Notify("Execution does not support 'fireproximityprompt'.")
                            else
                                humanoidRootPart.CFrame = v.Parent:GetPivot()
                            end
                        end
                    else
                        Notify("HumanoidRootPart not found.")
                    end
                end)
            end
        end
        createdButtons["TeleportToBuy"] = true
    end
end)

ShopSection:AddButton("Buy Enchant Relic", function()
    if not buttonEnabled then
        warn("Button is currently disabled!")
        return
    end

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart then
        warn("HumanoidRootPart not found!")
        return
    end

    local previousPosition = humanoidRootPart.Position


    local targetPosition = Vector3.new(-931.525, 223.784, -986.849)
    humanoidRootPart.CFrame = CFrame.new(targetPosition)

    local success, err = pcall(function()
        local merlin = workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("power")
        if merlin then
            merlin:InvokeServer()
        else
            warn("Merlin power function not found!")
        end
    end)

    if not success then
        warn("Error invoking Merlin power:", err)
    end

    task.wait(0.1) 

    humanoidRootPart.CFrame = CFrame.new(previousPosition)
end)

task.delay(5, function()
    buttonEnabled = true
    print("Button is now enabled!")
end)

	Teleports:AddButton(
    "Goto GPS Position",
    function()
        NEVERLOSE:KeySystem(
            "Put position like this WITHOUT SPACES: X,Y,Z",
            "",
            FischUser.TPToPos
        ):Callback(function()end)
    end
    )

    local MegHunt = MegaladonHunting:AddSection("Hunting", "left")

    local HuntOrNo = MegHunt:AddToggle("Hunt Priorities", false, UI.MegaladonHunting)
	MegHunt:AddButton("Add Fish To List", function() 
		Internal.Pr = Internal.Pr + 1
		local Section = MegaladonHunting:AddSection("Priority "..tostring(Internal.Pr), "right")
		local Rod = Section:AddLabel("Rod: None")
		local Fish = Section:AddLabel("Fish: None")
		Options.Priorities[Internal.Pr] = {Fish = "Nothing lol", Rod = "None"}
		Section:AddButton("Change Rod To Current Rod", function() 
			Options.Priorities[Internal.Pr].Rod = CalibrationData.FishingRod
            Rod:Text("Rod: "..CalibrationData.FishingRod)
        end)
		Section:AddButton("Set Fish",function()
			NEVERLOSE:KeySystem(
					"Type Fish Name In, MAKE SURE TO SPELL IT RIGHT",
					"",
					function(a)
						Options.Priorities[Internal.Pr].Fish = a 
                        Fish:Text("Fish: "..a)
						return true
					end
				):Callback(function()end)
		end)
	end)

    CreditsSection:AddLabel("Fisch Ronix Hub Script by dynamicarrays, bdokkx")
    CreditsSection:AddButton(
        "Copy Discord Link",
        function()
            setclipboard("discord.gg/ronix")
            Notification:Notify("Copied","Copied","Copied discord link to clipboard",4)
        end
    )

    local AbundanceZoneSection = FishingTab:AddSection("Abundances", "right")
    
    local Ab = {}

    local Ab2 = {}

    local Choice = nil

    local LabeledChance = nil

    local AbundanceChoice = AbundanceZoneSection:AddDropdown("Abundances", Ab, "Loading", function(D)
        LabeledChance:Text("Chance: "..tostring(Ab2[D].Chance).."%")
        Choice = Ab2[D]
    end)

    LabeledChance = AbundanceZoneSection:AddLabel("Chance: 0%")

    local GotoAbundance = AbundanceZoneSection:AddButton("Go to Abundance", function() 
        game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(Choice.Position.X, 137.77, Choice.Position.Z)
    end)
    local TweenService = game:GetService("TweenService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local VirtualUser = game:GetService("VirtualUser")
    local RunService = game:GetService("RunService")
    

local Config = _G.Config or {}
local AllFuncs = {}

Config['Farm Fish'] = false

local AutofarmButton = AbundanceZoneSection:AddButton("Autofarm selected fish", function()
    if not Choice then
        warn("No abundance selected.")
        return
    end

    local targetPosition = Vector3.new(Choice.Position.X, 137.77, Choice.Position.Z)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Position = targetPosition

    local blockPosition = Vector3.new(targetPosition.X, targetPosition.Y - 5, targetPosition.Z)
    local block = Instance.new("Part")
    block.Position = blockPosition
    block.Size = Vector3.new(5, 1, 5)
    block.Anchored = true
    block.Color = Color3.new(0, 1, 0)
    block.Name = "AutoFarmBlock"
    block.Parent = workspace

    if not Config['Farm Fish'] then
        print("Starting Farm Fish...")
        Config['Farm Fish'] = true
        AllFuncs['Farm Fish'](block) 
    else
        print("Farm Fish is already running.")
    end
end)

AllFuncs['Farm Fish'] = function(block)
    local player = game.Players.LocalPlayer
    local RodName = game.ReplicatedStorage.playerstats[player.Name].Stats.rod.Value

    while Config['Farm Fish'] and task.wait() do
 
        if Backpack:FindFirstChild(RodName) then
            player.Character.Humanoid:EquipTool(Backpack:FindFirstChild(RodName))
        end

        if player.Character:FindFirstChild(RodName) and player.Character[RodName]:FindFirstChild("bobber") then

            repeat
                pcall(function()
                    player.PlayerGui:FindFirstChild("shakeui").safezone:FindFirstChild("button").Size = UDim2.new(1001, 0, 1001, 0)
                    VirtualUser:Button1Down(Vector2.new(1, 1))
                    VirtualUser:Button1Up(Vector2.new(1, 1))
                end)
                RunService.Heartbeat:Wait()
            until not Config['Farm Fish'] or not player.Character:FindFirstChild(RodName) or player.Character[RodName].values.bite.Value

            repeat
                if game.ReplicatedStorage:FindFirstChild("events") and game.ReplicatedStorage.events:FindFirstChild("reelfinished") then
                    game.ReplicatedStorage.events.reelfinished:FireServer(1000000000000000000000000, true)
                end
                task.wait(0.5)
            until not Config['Farm Fish'] or not player.Character:FindFirstChild(RodName) or not player.Character[RodName].values.bite.Value
        else

            if player.Character:FindFirstChild(RodName) then
                player.Character[RodName].events.cast:FireServer(1000000000000000000000000)
                task.wait(2)
            end
        end
    end

    if block and block.Parent then
        block:Destroy()
    end
    print("Farm Fish loop has exited.")
end


AbundanceZoneSection:AddButton("Stop AutoFarm", function()
    Config['Farm Fish'] = false
    print("AutoFarm has been stopped.")

    local block = workspace:FindFirstChild("AutoFarmBlock")
    if block then
        block:Destroy()
    end
end)

    local FishRadarPlaces = {}

    local I = 0

    while I < 100 do
        I = I + 1
        FishingTab:AddSection("Scrolling Space", "right")
    end

    while task.wait(5) do
        local Places = FischAPI.GetAllAbundanceZones()
        Ab2 = Places
        Ab = {}
        for Fish, Info in pairs(Ab2) do
            table.insert(Ab, Fish)
        end
		FischUser.CheckForAbundancesInPriorityListAndTakeAction()
        AbundanceChoice:Refresh(Ab)
    end
end

--Utils

function Utils.Overlap(gui1, gui2)
    local gui1_topLeft = gui1.AbsolutePosition
    local gui1_bottomRight = gui1_topLeft + gui1.AbsoluteSize

    local gui2_topLeft = gui2.AbsolutePosition
    local gui2_bottomRight = gui2_topLeft + gui2.AbsoluteSize
    
    return ((gui1_topLeft.x < gui2_bottomRight.x and gui1_bottomRight.x > gui2_topLeft.x) and (gui1_topLeft.y < gui2_bottomRight.y and gui1_bottomRight.y > gui2_topLeft.y))
end

function Utils.SendWebhookData(Link, Text)
    local DataForm = Text
    local maxLength = 1950
    local chunks = {}
    local HttpService = game:GetService("HttpService")

    while #DataForm > 0 do
        local chunk = DataForm:sub(1, maxLength)
        if #DataForm > maxLength then
            local lastNewline = chunk:match(".*\n()")
            if lastNewline then
                chunk = DataForm:sub(1, lastNewline - 1)
            end
        end
        table.insert(chunks, chunk)
        DataForm = DataForm:sub(#chunk + 1)
    end

    for i, chunk in chunks do
        local data = {
            content = chunk
        }
        
        request({
            Url = Link,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode(data)
        })
    end
end

function Utils.Split(str, sep)
	local result = {}
	local regex = ("([^%s]+)"):format(sep)
	for each in str:gmatch(regex) do
	   table.insert(result, each)
	end
	return result
 end

--VI

VI.State = false

function VI.ClickUI(ui)
    local x = ui.AbsolutePosition.X + (ui.AbsoluteSize.X / 2)
    local y = ui.AbsolutePosition.Y + (ui.AbsoluteSize.Y / 2)
    VIM:SendMouseButtonEvent(x, y, 0, true, game, 0)
    task.wait(0.05)
    VIM:SendMouseButtonEvent(x, y, 0, false, game, 0)
end

function VI.Down(ui)
    VI.State = true
    local x = ui.AbsolutePosition.X + (ui.AbsoluteSize.X / 2)
    local y = ui.AbsolutePosition.Y + (ui.AbsoluteSize.Y / 2)
    VIM:SendMouseButtonEvent(x, y, 0, true, game, 0)
end

function VI.Up(ui)
    VI.State = false
    local x = ui.AbsolutePosition.X + (ui.AbsoluteSize.X / 2)
    local y = ui.AbsolutePosition.Y + (ui.AbsoluteSize.Y / 2)
    VIM:SendMouseButtonEvent(x, y, 0, false, game, 0)
end



Config = _G.Config or {}  
Config['Farm Fish'] = false  

local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Backpack = LocalPlayer.Backpack
local PlayerGui = LocalPlayer.PlayerGui
local VirtualUser = game:GetService("VirtualUser")
local RodName = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value

-- Fish Auto Farm diddy
AllFuncs = {}

AllFuncs['Farm Fish'] = function()
    while Config['Farm Fish'] and task.wait() do
        if Backpack:FindFirstChild(RodName) then
            LocalPlayer.Character.Humanoid:EquipTool(Backpack:FindFirstChild(RodName))
        end
        if LocalPlayer.Character:FindFirstChild(RodName) and LocalPlayer.Character[RodName]:FindFirstChild("bobber") then
            repeat
                pcall(function()
                    PlayerGui:FindFirstChild("shakeui").safezone:FindFirstChild("button").Size = UDim2.new(1001, 0, 1001, 0)
                    VirtualUser:Button1Down(Vector2.new(1, 1))
                    VirtualUser:Button1Up(Vector2.new(1, 1))
                end)
                RunService.Heartbeat:Wait()
            until not LocalPlayer.Character:FindFirstChild(RodName) or LocalPlayer.Character[RodName].values.bite.Value or not Config['Farm Fish']

            repeat
                ReplicatedStorage.events.reelfinished:FireServer(1000000000000000000000000, true)
                task.wait(0.5)
            until not LocalPlayer.Character:FindFirstChild(RodName) or not LocalPlayer.Character[RodName].values.bite.Value or not Config['Farm Fish']
        else
            if LocalPlayer.Character:FindFirstChild(RodName) then
                LocalPlayer.Character[RodName].events.cast:FireServer(1000000000000000000000000)
                task.wait(2)
            end
        end
    end
end

--Teleport Service for speds
AllFuncs.HopServer = function(FullServer) 
	local FullServer = FullServer or false

	local Http = game:GetService("HttpService")
	local Api = "https://games.roblox.com/v1/games/"

	local _place = game.PlaceId
	local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
	local ListServers = function (cursor)
		local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
		return Http:JSONDecode(Raw)
	end

	local Server, Next; repeat
		local Servers = ListServers(Next)
		Server = Servers.data[1]
		Next = Servers.nextPageCursor
	until Server
	repeat
		if not FullServer then
			game:GetService("TeleportService"):TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
		else
			if request then
				local servers = {}
				local req = request(
					{
						Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)
					}
				).Body;
				local body = game:GetService("HttpService"):JSONDecode(req)
				if body and body.data then
					for i, v in next, body.data do
						if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
							table.insert(servers, 1, v.id)
						end
					end
				end
				if #servers > 0 then
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
				else
					return "Couldn't find a server."
				end
			end
		end
		wait()
	until game.PlaceId ~= game.PlaceId
end

function ExportValue(arg1, arg2)
    return tonumber(string.format("%." .. (arg2 or 1) .. 'f', arg1))
end
AllFuncs['Farm Fish']()


function FischAPI.RepairMap()
	workspace.world.npcs["Jack Marrow"].treasure.repairmap:InvokeServer()
end

function FischAPI.InstantReel()
    game:GetService("ReplicatedStorage").events.reelfinished:FireServer(100, true)
end

function FischAPI.Cast()
    game.Players.LocalPlayer.Character[CalibrationData.FishingRod].events.cast:FireServer(100,1)
end

function FischAPI.GetAllAbundanceZones()
    local Abundances = {}
    for i, Zone in pairs(game:GetService("Workspace").zones.fishing:GetChildren()) do
        local Info = {}
        if Zone:FindFirstChild("Abundance") then
            if Zone:FindFirstChild("Abundance"):FindFirstChild("Chance") then
                Info.Chance = Zone.Abundance.Chance.Value
            else
                Info.Chance = 1
            end
            Info.Position = Zone.Position
            if Abundances[Zone.Abundance.Value] == nil then
                Abundances[Zone.Abundance.Value] = Info
            elseif Abundances[Zone.Abundance.Value].Chance < Info.Chance then
                Abundances[Zone.Abundance.Value] = Info
            end
        end
    end
    return Abundances
end

function FischAPI.SellAll()
    workspace.world.npcs["Marc Merchant"].merchant.sellall:InvokeServer()
end

function FischAPI.InitializePossibleDetections(Power)
    --This is just for guidement, don't use this function lol IT'S NOT USELESS STOP BEING MEAN!
    game:GetService("ReplicatedStorage").modules.fishing.rodresources.events.cast:FireServer(Power,1)
end
-- did you know that bdokkx scams kids yea yea dynamicarrays
function FischAPI.DetermineClickActionMinigame()

end

function FischAPI.GetFish()
    local Text = "Items/Fish:\n"
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        Text=Text..v.Name.."\n"
    end
    return Text
end
--bro bdokkx is a nexam developer / Ronix Arsenal V1.0 - discord.gg/ronix
--User

function FischUser.CheckForAbundancesInPriorityListAndTakeAction()
	local Oppurtunities = FischAPI.GetAllAbundanceZones()
	local MostImportant = math.huge
	local MostImportantFish = "Nothing Lol"
	for Importance, Data in pairs(Options.Priorities) do
		if Importance < MostImportant then
			if Oppurtunities[Data.Fish] then
				MostImportant = Importance
				MostImportantFish = Data.Fish
				Internal.RodToBeEquipped = Data.Tool
				Internal.FishHunted = MostImportantFish
			end
		end
	end
	if MostImportantFish == "Nothing Lol" then
		Internal.Megaladon = false
		Internal.MegaladonPosition = nil
		pcall(function()  
			Internal.MegHuntPlat:Destroy()
		end)
	else
		Internal.Megaladon = true
		Internal.MegaladonPosition = Oppurtunities[MostImportantFish].Position
	end
	return MostImportantFish
end

function FischUser.AutoTotem()
	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v:IsA("Tool") then
			v:Activate()
		end
	end
end

function FischUser.TPToPos(pos)
	local Temp = Utils.Split(pos, ",")
	local New = {}
	for i, v in pairs(Temp) do
		New[i] = tonumber(v)
	end
	game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(unpack(New))
    return true
end

function FischUser.TPToPoXYZ(pos)
	local Temp = Utils.Split(pos, ", ")
	for i, v in pairs(Temp) do
        print(i,v)
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(tonumber(Temp[2]), Temp[4], tonumber(Temp[6]))
end

function FischUser.Sell()
    FischAPI.SellAll()
end

function FischUser.AutoShake()
    FischAPI.TapShake()
end

function FischUser.RepairMap()
	FischAPI.RepairMap()
end

function FischUser.TPMap()
    FischUser.TPToPoXYZ(game:GetService("Players").rbxDistribution.PlayerGui["Treasure Map"].Main.CoordinatesLabel.Text)
end

function FischUser.OpenBoatUI()
    game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.shipwright.Visible = not game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.shipwright.Visible
end

function FischUser.LockPosition()
    if Internal.Megaladon == true then
        if Options.MegaladonHunting == true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Internal.MegHuntPos
            return
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Internal.LockedPosition
end

function FischUser.FloatOnWater()
    pcall(function()
        Internal.FloatPart:Destroy()
    end)
    Internal.FloatPart = Instance.new("Part", workspace)
    Internal.FloatPart.Anchored = true
    Internal.FloatPart.Size = Vector3.new(10,1,10)
    Internal.FloatPart.Position = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, 133.77, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, 150, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
end

function FischUser.AutoMinigame()
    local action = FischAPI.DetermineClickActionMinigame()
    local PlayerBar = game:GetService("Players").LocalPlayer.PlayerGui.reel.bar.playerbar
    if action == true then
        if VI.State == false then
            VI.Down(PlayerBar)
        end
    else
        if VI.State == true then
            VI.Up(PlayerBar)
        end
    end
end

function FischUser.SecondUpdateWebhook()
    local a, b = pcall(function()
        Internal.Timer = Internal.Timer + 1
        if Internal.Timer >= 300 then
            Internal.Timer = 0
            local Data = FischAPI.GetFish()
            Utils.SendWebhookData(Options.WebhookURL, Data)
            Notification:Notify("info", 
                "Webhook Notification Sent",
                "The next webhook notification is in 5 minutes."            )
        end
    end)
    print(a, b)
end

function FischUser.AutoCast()
    FischAPI.Cast()
end

function FischUser.AutoReel()
    if LocalPlayer.PlayerGui:FindFirstChild("reel") then
    FischAPI.InstantReel()
    end
end

function FischUser.StepLoop()
    if Options.FloatOnWater == true then
        pcall(function()
            FischUser.FloatOnWater()
        end)
    end
    if Options.AutoShake == true then
        pcall(function()
            FischUser.AutoShake()
        end)
    end
    if Options.AutoMinigameBlatant == true then
        pcall(function()
            FischUser.AutoReel()
        end)
    end
	if Options.AutoTotem == true then
		pcall(FischUser.AutoTotem)
	end
end

function FischUser.MegaladonHuntInstant()
    if Internal.Megaladon == true then
        if Internal.MegHuntPlat then
            return
        end
		if Options.PriorityWebhook == true then
			Utils.SendWebhookData(Options.WebhookURL, "FISH PRIORITY EVENT - "..Internal.FishHunted)
		end
        repeat task.wait() until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel") == nil
		game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
		game:GetService("ReplicatedStorage").events.equiprod:FireServer(Internal.RodToBeEquipped)
		task.wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(Internal.MegaladonPosition.X, 500.77, Internal.MegaladonPosition.Z)
        Internal.MegHuntPlat = Instance.new("Part", workspace)
        Internal.MegHuntPlat.Anchored = true
        Internal.MegHuntPlat.Size = Vector3.new(10,1,10)
        Internal.MegHuntPlat.Position = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, 133.77, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, 150, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
		task.wait(5)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[CalibrationData.FishingRod])
        Internal.MegHuntPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    end
end

function FischUser.Heartbeat()
    CalibrationData.FishingRod = game:GetService("ReplicatedStorage").playerstats[tostring(game.Players.LocalPlayer.Name)].Stats.rod.Value
end

function FischUser.OneStep()

end

function FischUser.Relaxed1Sec()
    if Options.WebhookNotifications == true then
        pcall(function()
            FischUser.SecondUpdateWebhook()
        end)
    end
    if Options.AutoCast == true then
        pcall(function()
            if Options.Lock == true then
                FischUser.LockPosition()
            end
            FischUser.AutoCast()
        end)
    end
    if Options.MegaladonHunting == true then
        pcall(function()
            FischUser.MegaladonHuntInstant()
        end)
    end
	if Options.AutoMap == true then
		pcall(FischUser.RepairMap)
        pcall(FischUser.TPMap)
	end
end

function FischUser.Initialize()
    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            FischUser.Heartbeat()
        end)
    end)
    spawn(function()
        FischUser.OneStep()
    end)
    spawn(function()
        while task.wait(0.005) do
            pcall(function()
                FischUser.StepLoop()
            end)
        end
    end)
    spawn(function()
        while task.wait(1) do
            FischUser.Relaxed1Sec()
        end
    end)
end
    
CalibrationData.Positions = {}
for i, v in game:GetService("Workspace").active["OceanPOI's"]:GetChildren() do
    CalibrationData.Positions[v.Name] = v.Position
end
for i, v in game:GetService("Workspace").zones.player:GetChildren() do
    CalibrationData.Positions[v.Name] = v.Position
end

task.spawn(function(InitializeService)
    warn("ANTI AFK STARTING")
    pcall(function()
        for i,v in pairs(getconnections(Client.Idled)) do
            v:Disable() 
        end
        Client.Idled:connect(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
        while wait(300) do
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end
    end)
end)

FischUser.Initialize()
UI.Initialize()
--bdokkx on top more lines = better?