-- all dependencies backed up by 25ms :>
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/isMoons/loader/refs/heads/main/ObfuscatedSource"))()
local FlagsManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/isMoons/loader/refs/heads/main/ObfuscatedConfigSource"))()

-- print = function() end
-- warn = function() end
-- local PreventSkidsToMakeGayThings = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/InfiniX/main/Library/Anti/AntiDebug/main.lua", true))()

-- if not (type(PreventSkidsToMakeGayThings) == "table") then
--   while true do end
-- end

if not isfile('Lunor_Trans.png') then
    writefile("Lunor_Trans.png", game:HttpGet('https://you.whimper.xyz/sources/lunor/Backup/Lunor_Trans.png'))
end

local GetService,cloneref=game.GetService,cloneref or function(r)return r end
local services=setmetatable({},{
    __index=function(self,service)
        local r=cloneref(GetService(game,service))
        self[service]=r
        return r
    end
})
local genv = getgenv and getgenv() or shared or _G or {}

local LRM_UserNote = "Owner" -- Debugging Purpose Only
local LRM_ScriptVersion = "v0030" -- Debugging Purpose Only

--[[Please Commnet When you are about to upload]]--
local function RoleChecker()
    if string.find(LRM_UserNote, "Ad Reward") then
        return "Free Version"
    elseif string.find(LRM_UserNote, "Premium") then
        return "Premium Version"
    elseif string.find(LRM_UserNote, "Owner") then
        return "Dev Version"
    else
        return "No Role Assigned"
    end
end

local function formatVersion(version)
    local formattedVersion = "v" .. version:sub(2):gsub(".", "%0.") -- Keep 'v' and add dot between digits
    return formattedVersion:sub(1, #formattedVersion - 1) -- Remove last dot
end

local function interpolate_color(color1, color2, t)
    local r = math.floor((1 - t) * color1[1] + t * color2[1])
    local g = math.floor((1 - t) * color1[2] + t * color2[2])
    local b = math.floor((1 - t) * color1[3] + t * color2[3])
    return string.format("#%02x%02x%02x", r, g, b)
end

local function hex_to_rgb(hex)
    return {
        tonumber(hex:sub(1, 2), 16),
        tonumber(hex:sub(3, 4), 16),
        tonumber(hex:sub(5, 6), 16)
    }
end

local function gradient(word)
    if not word or #word == 0 then
        return "Error"
    end

    if genv.GradientColor == nil then
        start_color = hex_to_rgb("ea00ff")
        end_color = hex_to_rgb("5700ff")
    else
        -- print(genv.GradientColor.startingColor, genv.GradientColor.endingColor)
        start_color = hex_to_rgb(genv.GradientColor.startingColor)
        end_color = hex_to_rgb(genv.GradientColor.endingColor)
    end

    local gradient_word = ""
    local word_len = #word
    local step = 1.0 / math.max(word_len - 1, 1)

    for i = 1, word_len do
        local t = step * (i - 1)
        local color = interpolate_color(start_color, end_color, t)
        gradient_word = gradient_word .. string.format('<font color="%s">%s</font>', color, word:sub(i, i))
    end

    return gradient_word
end

-- Example usage
-- print(gradient("Hello"))
local function getLunorIcon()
    local asset
    local success, product = pcall(function()
        return getcustomasset(readfile('Lunor_Trans2.png'))
    end)

    if not success or identifyexecutor():find("Cryptic") then
        asset = "http://www.roblox.com/asset/?id=115594743966251"
    else
        asset = product
    end
    return asset
end

local lib = lib or {}  -- Jika lib nil, buat lib sebagai table kosong
function lib:Load(args)
    print("Bypassed Load Function")
    return {
        AddTab = function() return { AddSection = function() return {} end } end,
        SelectTab = function() end,
        Notification = function() end
    }  -- Mengembalikan objek kosong yang kompatibel
end

local main = lib:Load({
    Title = 'Fisch '..formatVersion(LRM_ScriptVersion)..' | ' .. gradient("discord.gg/lunor").. " | ".. RoleChecker(),
    ToggleButton = getLunorIcon()
})



local tabs = {
    Main = main:AddTab("Main"),
    AutoFarm = main:AddTab("Auto Farm"),
    Items = main:AddTab("Items"),
    Teleporation = main:AddTab("Teleports"),
    Misc = main:AddTab("Misc"),
    Webhook = main:AddTab("Webhook"),
    Visuals = main:AddTab("Visuals"),
    Config = main:AddTab("Configs")
}
main:SelectTab()



local sections = {
    Welcome = tabs.Main:AddSection({Defualt = true , Locked = true}),
    -- FishPremium = tabs.AutoFarm:AddSection({Title = gradient("Premium - Rod Exploit"), Description = "", Defualt = false , Locked = false}),
    Fish = tabs.AutoFarm:AddSection({Title = gradient("Auto Fishing"), Description = "", Defualt = true , Locked = false}),
    FishPlus = tabs.AutoFarm:AddSection({Title = gradient("Advanced Auto Fish"), Description = "", Defualt = false , Locked = false}),
    FishBait = tabs.AutoFarm:AddSection({Title = gradient("Baits"), Description = "", Defualt = false , Locked = false}),
    -- FishSell = tabs.AutoFarm:AddSection({Title = gradient("Selling"), Description = "", Defualt = false , Locked = false}),
    Webhook1 = tabs.Webhook:AddSection({Title = gradient(""), Description = "", Defualt = true , Locked = true}),
    Webhook2 = tabs.Webhook:AddSection({Title = gradient("Webhook Settings"), Description = "", Defualt = true , Locked = false}),
    Webhook3 = tabs.Webhook:AddSection({Title = gradient("Start Webhooks"), Description = "", Defualt = true , Locked = false}),
    FishSettings = tabs.AutoFarm:AddSection({Title = gradient("Auto Fish Settings"), Description = "", Defualt = false , Locked = false}),
    Item0 = tabs.Items:AddSection({Defualt = true , Locked = true}),
    Item = tabs.Items:AddSection({Title = gradient("Purchase"), Description = "", Defualt = false , Locked = false}),
    Item5 = tabs.Items:AddSection({Title = gradient("Selling & Favouriting"), Description = "", Defualt = false , Locked = false}),
    Item1 = tabs.Items:AddSection({Title = gradient("Appraise"), Description = "", Defualt = false , Locked = false}),
    Item2 = tabs.Items:AddSection({Title = gradient("Enchant"), Description = "", Defualt = false , Locked = false}),
    Item3 = tabs.Items:AddSection({Title = gradient("Totems"), Description = "", Defualt = false , Locked = false}),
    Item4 = tabs.Items:AddSection({Title = gradient("Treasures"), Description = "", Defualt = false , Locked = false}),
    Tele = tabs.Teleporation:AddSection({Defualt = true , Locked = true}),
    Tele1 = tabs.Teleporation:AddSection({Title = gradient("Teleports"), Description = "", Defualt = false , Locked = false}),
    Tele2 = tabs.Teleporation:AddSection({Title = gradient("Advanced Teleports"), Description = "", Defualt = false , Locked = false}),
    Misc = tabs.Misc:AddSection({Title = gradient("Character"), Description = "", Defualt = false , Locked = false}),
    Misc1 = tabs.Misc:AddSection({Title = gradient("Anti Staff"), Description = "", Defualt = false , Locked = false}),
    Misc3 = tabs.Misc:AddSection({Title = gradient("Platform"), Description = "", Defualt = false , Locked = false}),
    Misc2 = tabs.Misc:AddSection({Title = gradient("Gifting"), Description = "", Defualt = false , Locked = false}),
    Misc4 = tabs.Misc:AddSection({Title = gradient("Boats"), Description = "", Defualt = false , Locked = false}),
    -- Misc5 = tabs.Misc:AddSection({Title = gradient("Exploits"), Description = "", Defualt = false , Locked = false}),
    Visuals = tabs.Visuals:AddSection({Title = gradient("Visuals"), Description = "", Defualt = false , Locked = false}),
    Visuals1 = tabs.Visuals:AddSection({Title = gradient("FPS"), Description = "", Defualt = false , Locked = false}),
    Visuals2 = tabs.Visuals:AddSection({Title = gradient("Hide Identity"), Description = "", Defualt = false , Locked = false}),
    Visuals3 = tabs.Visuals:AddSection({Title = gradient("ESP (soon)"), Description = "", Defualt = false , Locked = false}),
    Visuals4 = tabs.Visuals:AddSection({Title = gradient("Rod Skin"), Description = "", Defualt = false , Locked = false}),
    Gradient = tabs.Config:AddSection({Title = gradient("Gradient"), Description = "", Defualt = false , Locked = false}),
}

local variables = {
    autoSellDelay = 0,
    autoselling = false,
    TweenMethod = false,
    TeleportMethod = true,
    AutoCast = false,
    AutoShake = false,
    AutoCatch = false,
    AlreadyRequested = false,
    AutoToggleRadar = false,
    Method1 = false,
    Coords = "",
    AutoCastZone = false,
    baits = {},
    SelectedBait = nil,
    AutoPredictor = false,
    AutoDrop = false
}

genv.WelcomeParagraph  = sections.Welcome:AddParagraph({Title = gradient("Loading..."), Description = "Please wait..\nIf you've been stuck on this for a long time please join our discord and report it."})
data = loadstring(game:HttpGet("https://you.whimper.xyz/sources/lunor/data.lua"))()


local function prompt(npc)
    local promptInstance = npc:FindFirstChild("dialogprompt")
    if promptInstance then

        local player = services.Players.LocalPlayer
        local char = player.Character
        local oldParent = promptInstance.Parent
        local oldDistance = promptInstance.MaxActivationDistance

        promptInstance.MaxActivationDistance = math.huge
        promptInstance.Parent = char

        for _, obj in ipairs(char:GetChildren()) do
            if obj:IsA("ProximityPrompt") then
                obj:InputHoldBegin()
                task.wait(0.01) -- Adjust this as needed for reliability
                obj:InputHoldEnd()
            end
        end

        promptInstance.Parent = oldParent
        promptInstance.MaxActivationDistance = oldDistance
    end
end

if not genv.LunorDependencies then
    local players = services.Players
    local player = players.LocalPlayer
    local workspaceService = game:GetService("Workspace")
    local replicatedStorage = services.ReplicatedStorage
    local virtualUser = game:GetService("VirtualUser")
    
    player.Idled:Connect(function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end)

    local npcData = {
        {name = "Marc Merchant", position = Vector3.new(466, 151, 224)},
        {name = "Appraiser", position = Vector3.new(453.182373046875, 150.50003051757812, 206.90878295898438)},
        {name = "Merlin", position = Vector3.new(-928.0328369140625, 223.7000274658203, -998.7449951171875)},
        {name = "Jack Marrow", position = Vector3.new(-2829.855712890625, 212.09266662597656, 1517.4398193359375)},
        {name = "Mods Latern Keeper", position = Vector3.new(-39, -247, 196)},
        {name = "Terrapin Shipwright", position = Vector3.new(5869.421875, 143.49795532226562, 7.101318359375)}
    }

    for _, npcInfo in ipairs(npcData) do
        player:RequestStreamAroundAsync(npcInfo.position)
        local npc = workspaceService.world.npcs:FindFirstChild(npcInfo.name)
        if npc then
            npc.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
            prompt(npc)
        end
    end

    player:GetPropertyChangedSignal("GameplayPaused"):Connect(function()
        if player.GameplayPaused then
            player.GameplayPaused = false
        end
    end)

    -- Anti Death Screen
    local deathGui = player.PlayerGui:FindFirstChild("death")
    if deathGui then
        deathGui:GetPropertyChangedSignal("Enabled"):Connect(function()
            if deathGui.Enabled then
                deathGui.Enabled = false
            end
        end)
    end

    -- File Setup
    if not isfolder("Lunor/Fisch") then
        makefolder("Lunor/Fisch")
    else
    end
    if not isfile("Lunor/Fisch/saved_teleports.json") then
        writefile("Lunor/Fisch/saved_teleports.json", "{}")
    end
     
    if workspace.zones.fishing:FindFirstChild("Brine Pool Water") then
        workspace.zones.fishing:FindFirstChild("Brine Pool Water"):Destroy()
    end
    
    player:RequestStreamAroundAsync("-1969.1385498046875, 312.765869140625, 255.92677307128906")
    if workspace.world.map["Roslit Bay"]:FindFirstChild("Lava") then
        for _,v in pairs(workspace.world.map["Roslit Bay"].Lava:GetDescendants()) do
            if v.Name == "Lava" then
                v:Destroy()
            end
        end
    end

    player:RequestStreamAroundAsync("1288.759765625, -899.0166015625, -191.36984252929688")
    for _,v in pairs(workspace.world.map["Enchant Room"]:GetDescendants()) do
        if v:IsA("TouchTransmitter") then
            v.Parent:Destroy()
        end
    end
    -- Rename Fisch Dev Mistake
    workspace.world.npcs["Terrapin Shipwright"].Name = "Ancient Shipwright"
    genv.LunorDependencies = true
    services.ReplicatedStorage.events.anno_localthought:Fire([[<b><font color="#5359bf">L</font><font color="#4c4eb9">u</font><font color="#4644b3">n</font><font color="#403aad">o</font><font color="#3a30a8">r</font> Has Been loaded</b>]],5)
end

lib:Notification("Loaded!","Anti AFK and more have been loaded.", 5)


local Players = services.Players
local CoreGui = game:GetService("StarterGui")
local GuiService = game:GetService('GuiService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local VIM = game:GetService('VirtualInputManager')
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local HttpService = services.HttpService
local LocalPlayer = Players.LocalPlayer
local Enabled = false
local Rod = false
local Progress = false
local Finished = false

local PlayerStats = ReplicatedStorage:WaitForChild("playerstats")[LocalPlayer.Name].Stats
local character = LocalPlayer.Character

function CreatePrice(Path, Price)
    _G.existingLabel = Path:FindFirstChild("STOP SKIDDING >:(")
    if _G.existingLabel then
        _G.existingLabel.Text = tostring(Price) .. "C$"
    else
        _G.itemPrice = Instance.new("TextLabel", Path)
        _G.itemPrice.Position = UDim2.new(0, 1, 0, 0)
        _G.itemPrice.Size = UDim2.new(1, 0, 0.183, 0)
        _G.itemPrice.ZIndex = 99999
        _G.itemPrice.Transparency = 1
        _G.itemPrice.Text = tostring(Price) .. "C$"
        _G.itemPrice.TextXAlignment = Enum.TextXAlignment.Right
        _G.itemPrice.Name = "STOP SKIDDING >:("
        _G.itemPrice.TextSize = 14
        _G.itemPrice.TextScaled = false
        _G.itemPrice.Font = Enum.Font.SourceSans

        _G.uiStroke = Instance.new("UIStroke", _G.itemPrice)
        _G.uiStroke.Color = Color3.fromRGB(255, 255, 255)
        _G.uiStroke.Thickness = 0
        _G.uiStroke.Transparency = 0

        _G.uiGradient = Instance.new("UIGradient", _G.uiStroke)
        _G.uiGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0.000, Color3.fromRGB(116, 46, 255)),
            ColorSequenceKeypoint.new(1.000, Color3.fromRGB(205, 113, 255))
        }
    end
end

function getFishInventorySetting(fishName)
    _G.playerName = game.Players.LocalPlayer.Name
    _G.playerInventory = ReplicatedStorage.playerstats:FindFirstChild(_G.playerName).Inventory
    _G.fishItem = _G.playerInventory:FindFirstChild(tostring(fishName))

    if _G.fishItem then
        _G.fishSettings = {}
        _G.fishSettings["Name"] = _G.fishItem.Value

        for _, child in ipairs(_G.fishItem:GetChildren()) do
            if child:IsA("ValueBase") then 
                _G.fishSettings[child.Name] = child.Value
            end
        end

        return _G.fishSettings
    else
        return nil
    end
end

function GetBackPackItemValue(Name)
    _G.Price = nil

    if type(getFishInventorySetting(Name)) == "table" then
        if getFishInventorySetting(Name).Weight then
            _G.Price = math.ceil(data.Fish[getFishInventorySetting(Name).Name].Price / data.Fish[getFishInventorySetting(Name).Name].WeightPool[2] * getFishInventorySetting(Name).Weight * 10)
        else return 0
        end
        if getFishInventorySetting(Name).Shiny then
            _G.Price = _G.Price * 1.85
        end
        if getFishInventorySetting(Name).Sparkling then
            _G.Price = _G.Price * 1.85
        end
        if getFishInventorySetting(Name).Mutation then
            _G.Price = _G.Price * data.Mutations[tostring(getFishInventorySetting(Name).Mutation)].PriceMultiply
        end
        if getFishInventorySetting(Name).Stack then
            _G.Price = _G.Price * getFishInventorySetting(Name).Stack
        end
        return math.ceil(_G.Price)
    else
        return getFishInventorySetting(Name)
    end
end

function UpdatePrice(item)
    _G.itemValue = item.Value
    _G.price = GetBackPackItemValue(_G.itemValue)
    if _G.price then
        CreatePrice(item.Parent, _G.price)
    end
end

function clearPriceLabels()
    for _, descendant in ipairs(game.Players.LocalPlayer.PlayerGui.hud.safezone:WaitForChild("backpack"):GetDescendants()) do
        if descendant:IsA("TextLabel") and descendant.Name == "STOP SKIDDING >:(" then
            descendant:Destroy()
        end
    end
end


_G.connections = {}
_G.running = false
genv.AutoPriceCheck = false
function monitorBackpack()
    _G.running = true 

    _G.backpack = game.Players.LocalPlayer.PlayerGui.hud.safezone:WaitForChild("backpack")

    function processItem(descendant)
        if not _G.running then return end
        if descendant:IsA("ValueBase") and descendant.Name == "item" then
            _G.price = GetBackPackItemValue(descendant.Value)
            if _G.price then
                CreatePrice(descendant.Parent, _G.price)
            end
        end
    end

    _G.descendantAddedConnection = _G.backpack.DescendantAdded:Connect(function(descendant)
        if not _G.running then return end
        task.defer(function()
            processItem(descendant)
        end)
    end)
    table.insert(_G.connections, _G.descendantAddedConnection)


    for _, descendant in ipairs(_G.backpack:GetDescendants()) do
        processItem(descendant)
        if descendant:IsA("ValueBase") and descendant.Name == "item" then
            _G.propertyChangedConnection = descendant:GetPropertyChangedSignal("Value"):Connect(function()
                if not _G.running then return end
                processItem(descendant)
            end)
            table.insert(_G.connections, _G.propertyChangedConnection)
        end
    end
end


function ChangePlayerCFrame(X, Y, Z)
    if variables.TweenMethod then
        for _, model in pairs(workspace:GetChildren()) do
            if model:IsA("Model") then
                for _, obj in pairs(model:GetDescendants()) do
                    if obj:IsA("Seat") then
                        obj.Disabled = true
                    end
                end
            end
        end

        local TargetTween = game:GetService("TweenService"):Create(
            LocalPlayer.Character:WaitForChild("HumanoidRootPart"),
            TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
            {CFrame = CFrame.new(X, Y, Z) + CFrame.new(0, 5, 0)}
        )
        TargetTween:Play()
        TargetTween.Completed:Connect(function()
            for _, model in pairs(workspace:GetChildren()) do
                if model:IsA("Model") then
                    for _, obj in pairs(model:GetDescendants()) do
                        if obj:IsA("Seat") then
                            obj.Disabled = false
                        end
                    end
                end
            end
        end)
    elseif variables.TeleportMethod == true then
        LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(X, Y + 3, Z)
    end
end


function clickButton()
    if LocalPlayer.PlayerGui:FindFirstChild("shakeui") then
        if LocalPlayer.PlayerGui:FindFirstChild("shakeui"):FindFirstChild("safezone") then
            if LocalPlayer.PlayerGui:FindFirstChild("shakeui"):FindFirstChild("safezone"):FindFirstChild("button") then
                local VirtualInputManager = game:GetService("VirtualInputManager")
                local buttonPosition = LocalPlayer.PlayerGui:FindFirstChild("shakeui"):FindFirstChild("safezone"):FindFirstChild("button").AbsolutePosition
                local buttonSize = LocalPlayer.PlayerGui:FindFirstChild("shakeui"):FindFirstChild("safezone"):FindFirstChild("button").AbsoluteSize

                VirtualInputManager:SendMouseButtonEvent(
                    buttonPosition.X + buttonSize.X / 2,
                    buttonPosition.Y + buttonSize.Y / 2,
                    0,
                    true,
                    game,
                    1
                )

                VirtualInputManager:SendMouseButtonEvent(
                    buttonPosition.X + buttonSize.X / 2,
                    buttonPosition.Y + buttonSize.Y / 2,
                    0,
                    false,
                    game,
                    1
                )
            end
        end
    end
end




local function brightFunc()
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
end

local function getEquippedRod()
    return ReplicatedStorage.playerstats[tostring(LocalPlayer)].Stats.rod.Value
end

local function equipRod()
    local rodName = getEquippedRod()
    if rodName and not LocalPlayer.Character:FindFirstChild(rodName) then
        local rod = LocalPlayer.Backpack:FindFirstChild(rodName)
        if rod then rod.Parent = LocalPlayer.Character end
    end
end

local function determineBestBait()
    local bestBait = nil
    local bestValue = -math.huge

    if genv.SelectedBait == "Most" or genv.SelectedBait == "Least" then
        -- Handle "Most" and "Least"
        for _, baitName in ipairs(availableBaits) do
            local baitStat = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.bait:FindFirstChild("bait_" .. baitName)
            if baitStat then
                local baitValue = baitStat.Value
                if genv.SelectedBait == "Most" then
                    if baitValue > bestValue then
                        bestValue = baitValue
                        bestBait = baitName
                    end
                elseif genv.SelectedBait == "Least" then
                    if baitValue < bestValue or bestValue == -math.huge then
                        bestValue = baitValue
                        bestBait = baitName
                    end
                end
            end
        end
    else
        -- Handle other cases based on the selected bait property
        for _, baitName in ipairs(availableBaits) do
            if data.Bait[baitName] then
                local baitData = data.Bait[baitName]
                local baitValue = baitData[genv.SelectedBait]
                if baitValue then
                    baitValue = tonumber(baitValue)
                    if baitValue and baitValue > bestValue then
                        bestValue = baitValue
                        bestBait = baitName
                    end
                end
            end
        end
    end

    -- Equip the best bait
    if bestBait then
        if ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.bait.Value ~= bestBait then
            if services.Players.LocalPlayer.PlayerGui:FindFirstChild("reel") then
                repeat task.wait() until not services.Players.LocalPlayer.PlayerGui:FindFirstChild("reel")
            end
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
            LocalPlayer.Backpack["Equipment Bag"].Parent = LocalPlayer.Character
            services.ReplicatedStorage.packages.Net["RE/Bait/Equip"]:FireServer(bestBait)
            LocalPlayer.Character["Equipment Bag"].Parent = LocalPlayer.Backpack
            -- Get the rarity of the best bait
            local baitData = data.Bait[bestBait]
            local baitRarity = baitData and baitData.Rarity or "Unknown"
            local baitLureSpeed = baitData and baitData.LureSpeed or "Unknown"
            local baitLuck = baitData and baitData.Luck or "Unknown"
            local baitGeneralLuck = baitData and baitData.GenerelLuck or "Unknown"
            local baitResilience = baitData and baitData.Resilience or "Unknown"

            -- Notify the player about the bait and its rarity
            lib:Notification("Auto Bait", "Equipped " .. bestBait, 5)
            

            -- Paragraph part.. very overkill, I know.
            local rarityColors = {
                Common = "<font color='rgb(142, 187, 191)'>Common</font>",
                Uncommon = "<font color='rgb(161, 255, 169)'>Uncommon</font>",
                Rare = "<font color='rgb(119, 108, 181)'>Rare</font>",
                Legendary = "<font color='rgb(240, 181, 109)'>Legendary</font>",
                Mythical = "<font color='rgb(255, 62, 120)'>Mythical</font>",
                Unusual = "<font color='rgb(192, 135, 198)'>Unusual</font>",
                Unknown = "<font color='rgb(255, 255, 255)'>Unknown</font>"
            }

            -- Function to determine the rich text color based on the value
            local function getValueColor(value)
                if value == "Unknown" then
                    return value -- If the value is unknown, return it as is
                elseif tonumber(value) then
                    local numValue = tonumber(value)
                    if numValue > 0 then
                        return "<font color='rgb(0, 255, 0)'>" .. value .. "</font>" -- Green for positive numbers
                    elseif numValue < 0 then
                        return "<font color='rgb(255, 0, 0)'>" .. value .. "</font>" -- Red for negative numbers
                    elseif numValue == 0 then
                        return "<font color='rgb(255, 255, 255)'>" .. value .. "</font>" -- White for 0
                    end
                end
                return value -- Return as is if it's not a number
            end

            -- Safely update the UI with rich text formatting
            pcall(function()
                local baitRarityColor = rarityColors[baitRarity] or rarityColors.Unknown
            
                -- Apply the rarity color to the best bait name
                local bestBaitColor = baitRarityColor:gsub("Common", bestBait)
                    :gsub("Uncommon", bestBait)
                    :gsub("Rare", bestBait)
                    :gsub("Legendary", bestBait)
                    :gsub("Mythical", bestBait)
                    :gsub("Unusual", bestBait)
                    :gsub("Unknown", bestBait)
            
                local baitLureSpeedColor = getValueColor(baitLureSpeed)
                local baitLuckColor = getValueColor(baitLuck)
                local baitGeneralLuckColor = getValueColor(baitGeneralLuck)
                local baitResilienceColor = getValueColor(baitResilience)
            
                genv.BaitParagraph:SetTitle("Optimal Bait: " .. bestBaitColor)
                genv.BaitParagraph:SetDesc("Lure Speed: " .. baitLureSpeedColor .. " | Luck: " .. baitLuckColor .. " | General Luck: " .. baitGeneralLuckColor .. " | Resilience: " .. baitResilienceColor)
            end)

        end
    else
        lib:Notification("Auto Bait", "No suitable baits found.", 5)
        genv.AutoBaitToggle:Set(false)
    end
end


local function DestroyGhostItems()
    for i,v in pairs(LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("link") then
            if v.link.Value and v.link.Value:IsDescendantOf(game) then
                continue
            else
                v:Destroy()
            end
        end
    end
    for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("link") then
            if v.link.Value and v.link.Value:IsDescendantOf(game) then
                continue
            else
                v:Destroy()
            end
        end
    end
    for _, child in ipairs(LocalPlayer.PlayerGui.hud.safezone.backpack.inventory.scroll:GetChildren()) do
        local item = child:FindFirstChild("item")
        if item and item.Value == nil then
            child:Destroy()
        end
    end
end



local function formatPrice(price)
    return string.format("%s$", tostring(price):reverse():gsub("%d%d%d", "%0,"):reverse():gsub("^,", ""))
end

local function unformatPrice(formattedPrice)
    local cleanPrice = formattedPrice:gsub("[^0-9]", "")
    return tonumber(cleanPrice)
end

local function rgbToRichText(rgbString, text)
    -- Split the RGB string into individual components
    local r, g, b = rgbString:match("([^,]+),([^,]+),([^,]+)")
    r, g, b = tonumber(r), tonumber(g), tonumber(b)

    -- Return the text in rich text format with the specified RGB color
    return string.format("<font color=\"rgb(%d,%d,%d)\">%s</font>", r * 255, g * 255, b * 255, text)
end


local function gift(user, item)
    local checkFish = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    local inventoryItem = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[tostring(checkFish.link.Value)]

    if genv.ExcludeFavourite then
        if inventoryItem:FindFirstChild("Favourited") then
        else
            pcall(function()
                local args = {
                    [1] = Players:WaitForChild(user)
                }
            
                LocalPlayer.Character[item].offer:FireServer(unpack(args))
            end)
        end
    else
        pcall(function()
            local args = {
                [1] = Players:WaitForChild(user)
            }
        
            LocalPlayer.Character[item].offer:FireServer(unpack(args))
        end)
    end
end    

local function validToolCheck()
    local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    
    if tool and tool:FindFirstChild("offer") then
        return true
    else
        return false
    end
end

local function giftAll()
    for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("offer") then
            v.Parent = LocalPlayer.Character
            gift(genv.SelectedPlayer, v.Name) 
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
            wait()
        end
    end
end

function formatNumber(number)
    return tostring(number):reverse():gsub("(%d%d%d)", "%1,"):gsub(",$", ""):reverse()
end

if RoleChecker() == "Free Version" or RoleChecker() == "No Role Assigned" then
    sections.Premium = tabs.Main:AddSection({Defualt = true , Locked = true})
    sections.Premium:AddParagraph({Title = '<font color="rgb(255,0,0)">Tired of the key system?</font>', Description = "Buy premium by joining our Discord."})
    sections.Premium:AddButton({
        Title = "Copy Discord Invite",
        Callback = function()
            setclipboard("https://discord.gg/25ms")
            lib:Notification("Discord","Copied invite to clipboard, just paste it.", 5)
        end,
    })
end

-- sections.Welcome:AddParagraph({Title = '<font color="#ea00ff" size="30">W</font><font color="#d500ff" size="30">e</font><font color="#c000ff" size="30">l</font><font color="#aa00fe" size="30">c</font><font color="#9600ff" size="30">o</font><font color="#8100ff" size="30">m</font><font color="#6c00ff" size="30">e</font><font color="#5700ff" size="30">!</font>', 
--                                Description = "Here's what's new:\n-\n-\n-"})

genv.WelcomeParagraph:SetTitle(gradient("Welcome!"))
genv.WelcomeParagraph:SetDesc([[<font color="rgb(255,255,255)">Here's what's new:</font>
[+] Tidebreaker Speed
[+] Toggle to Make TideBreaker Easier to Control
[+] If your executor support u can change the MaxSpeed,TurningSpeed,Acceleration
]])


-- genv.FishPremiumParagraph = sections.FishPremium:AddParagraph({Title = 'Original Rod & Enchant:', Description = "Rod: Will update after 'Use Rod'\nEnchant: Will update after 'Use Enchant'"})

-- local rodNamesExploit = {}
-- for name, _ in pairs(data.Rods) do
--     table.insert(rodNamesExploit, name)
-- end

-- sections.FishPremium:AddDropdown("RodsList", {
--     Title = "Rods List",
--     Description = "",
--     Options = rodNamesExploit,
--     Default = "",
--     PlaceHolder = "Select Rod",
--     Multiple = false,
--     Callback = function(selectRod)
--         genv.selectedExploitRod = selectRod
--     end,
-- })

-- local enchantNamesExploit = {}
-- for name, _ in pairs(data.Enchants) do
--     table.insert(enchantNamesExploit, name)
-- end

-- sections.FishPremium:AddDropdown("EnchantsList", {
--     Title = "Enchants List",
--     Description = "",
--     Options = enchantNamesExploit,
--     Default = "",
--     PlaceHolder = "Select Enchant",
--     Multiple = false,
--     Callback = function(selectEnchant)
--         genv.selectedExploitEnchant = selectEnchant
--     end,
-- })


-- local exploitGroupButton = sections.FishPremium:AddGroupButton()

-- exploitGroupButton:AddButton({
--     Title = "Use Last Known",
--     Variant = "Outline",
--     Callback = function()
--         if genv.realRod ~= nil then
--             if services.Players.LocalPlayer.Backpack:FindFirstChild(genv.latestRod) then
--                 services.Players.LocalPlayer.Backpack[genv.latestRod].Name = genv.realRod
--             else
--                 services.Players.LocalPlayer.Character[genv.latestRod].Name = genv.realRod
--             end
--         end
--         if genv.realEnchant ~= nil then
--             services.ReplicatedStorage.playerstats[LocalPlayer.Name].Rods[genv.lastKnownRod].Value = genv.realEnchant
--         end
--     end
-- })

-- exploitGroupButton:AddButton({
--     Title = "Use Rod",
--     Variant = "Primary",
--     Callback = function()
--         if genv.realRod == nil then
--             genv.realRod = tostring(services.ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value)
--         end
--         genv.lastKnownRod = tostring(services.ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value)
--         services.ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value = genv.selectedExploitRod
--         if services.Players.LocalPlayer.Backpack:FindFirstChild(genv.lastKnownRod) then
--             services.Players.LocalPlayer.Backpack[genv.lastKnownRod].Name = genv.selectedExploitRod
--             genv.latestRod = genv.selectedExploitRod
--         end
--         genv.FishPremiumParagraph:SetDesc(
--             "Rod: " .. (genv.realRod or "Will update after 'Use Rod'") .. 
--             "\nEnchant: " .. (genv.realEnchant or "Will update after 'Use Enchant'")
--         )
--     end,
-- })

-- exploitGroupButton:AddButton({
--     Title = "Use Enchant",
--     Variant = "Primary",
--     Callback = function()
--         print(genv.lastKnownRod)
--         print(tostring(genv.latestRod))
--         print(tostring(services.ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value))
--         local currentRod = genv.latestRod or tostring(services.ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value)
--         if genv.realEnchant == nil then
--             if genv.lastKnownRod ~= nil then
--                 genv.realEnchant = tostring(services.ReplicatedStorage.playerstats[LocalPlayer.Name].Rods[genv.lastKnownRod].Value)
--             else
--                 genv.realEnchant = tostring(services.ReplicatedStorage.playerstats[LocalPlayer.Name].Rods[currentRod].Value)
--             end
--         end
--         if genv.lastKnownRod ~= nil then
--             if services.ReplicatedStorage.playerstats[LocalPlayer.Name].Rods:FindFirstChild(genv.lastKnownRod) then
--                 services.ReplicatedStorage.playerstats[LocalPlayer.Name].Rods[genv.lastKnownRod].Value = genv.selectedExploitEnchant
--             else
--                 services.ReplicatedStorage.playerstats[LocalPlayer.Name].Rods[genv.latestRod].Value = genv.selectedExploitEnchant
--             end
--         else
--             services.ReplicatedStorage.playerstats[LocalPlayer.Name].Rods[currentRod].Value = genv.selectedExploitEnchant
--         end
--         genv.FishPremiumParagraph:SetDesc(
--             "Rod: " .. (genv.realRod or "Will update after 'Use Rod'") .. 
--             "\nEnchant: " .. (genv.realEnchant or "Will update after 'Use Enchant'")
--         )
--     end,
-- })


sections.Fish:AddToggle("AutoCast", {
    Title = "Auto Equip Rod",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        variables.AutoEquipRod = isEnabled
        
        spawn(function()
            while variables.AutoEquipRod do
                if not genv.TotemInUse then
                    equipRod()
                    task.wait(0.1)
                -- end
                end
            end
        end)
    end
})

variables.Caster = sections.Fish:AddToggle("AutoCast", {
    Title = "Auto Cast",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        variables.AutoCast = isEnabled

        spawn(function()
            while variables.AutoCast do
                local character = LocalPlayer.Character
                if character then
                    local equippedRod = character:FindFirstChild(getEquippedRod())
                    if equippedRod then
                        local bobber = equippedRod:FindFirstChild("bobber")
                        if not bobber and not genv.TotemInUse then
                            equippedRod.events.cast:FireServer(variables.autoCastPower, 1)
                            task.wait(variables.AutoCastDelay)
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
})


local connection

sections.Fish:AddToggle("AutoShake", {
    Title = "Auto Shake",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        variables.AutoShake = isEnabled
        if variables.AutoShake then
            lib:Notification("Auto Shake","Adjust the speed to your liking in the settings.", 4)
        end
        -- local pressedBackSlash = false
        while variables.AutoShake do
            task.wait(variables.AutoShakeDelay)
            if not LocalPlayer.PlayerGui:FindFirstChild("shakeui") then
                continue
            end
            GuiService.SelectedObject = nil
            if not variables.Method1 then
                pcall(function()
                    local button = LocalPlayer.PlayerGui:WaitForChild("shakeui", 1):WaitForChild("safezone", 1):WaitForChild("button", 1)

                    button.Selectable = true
                    GuiService.SelectedObject = button
                
                    -- if not pressedBackSlash then
                    --     GuiService.GuiNavigationEnabled = false
                    --     pressedBackSlash = true
                    -- end
                
                    VIM:SendKeyEvent(true, Enum.KeyCode.Return, false, LocalPlayer.PlayerGui)
                    VIM:SendKeyEvent(false, Enum.KeyCode.Return, false, LocalPlayer.PlayerGui)
                end)
            else
                clickButton()
            end 
        end
        GuiService.SelectedObject = nil
    end
})


sections.Fish:AddToggle("AutoDropper", {
    Title = "Auto Drop Bobber",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        variables.AutoDrop = isEnabled

        if variables.AutoDrop then
            local rod = character:WaitForChild(PlayerStats.rod.Value)
            variables.autoDropConnection = rod.ChildAdded:Connect(function(child)
                if child.Name == "bobber" then
                    task.wait(0.16)

                    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                    local nearestWaterPosition = nil
                    local closestDistance = math.huge
                    local desiredOffset = 1

                    for x = -50, 50, 5 do
                        for z = -50, 50, 5 do
                            local checkPosition = humanoidRootPart.Position + Vector3.new(x, 0, z)
                            local rayOrigin = Vector3.new(checkPosition.X, humanoidRootPart.Position.Y + 50, checkPosition.Z)
                            local rayDirection = Vector3.new(0, -100, 0)

                            local raycastParams = RaycastParams.new()
                            raycastParams.FilterDescendantsInstances = {workspace.Terrain}
                            raycastParams.FilterType = Enum.RaycastFilterType.Whitelist

                            local rayResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
                            if rayResult then
                                local hitPosition = rayResult.Position
                                local hitMaterial = rayResult.Material

                                if hitMaterial == Enum.Material.Water then
                                    local distance = (humanoidRootPart.Position - hitPosition).Magnitude
                                    if distance < closestDistance and distance > desiredOffset then
                                        closestDistance = distance
                                        nearestWaterPosition = hitPosition
                                    end
                                end
                            end
                        end
                    end

                    if nearestWaterPosition then
                        print("Water found at:", nearestWaterPosition)
                        local offsetDirection = (nearestWaterPosition - humanoidRootPart.Position).Unit
                        local finalPosition = nearestWaterPosition + offsetDirection * desiredOffset
                        child.CFrame = CFrame.new(finalPosition)
                        print("Bobber moved to water.")
                    else
                        print("No suitable water found.")
                    end
                end
            end)
        else
            if variables.autoDropConnection then
                variables.autoDropConnection:Disconnect()
                variables.autoDropConnection = nil
                print("AutoDropper turned off.")
            end
        end
    end
})



local function generateRandomNumber(min, max)
    return math.random() * (max - min) + min
end

sections.Fish:AddToggle("AutoCatch", {
    Title = "Auto Reel",
    Default = false,
    IgnoreFirst = true,
    Description = "",
    Callback = function(isEnabled)
        variables.AutoCatch = isEnabled

        if isEnabled then
            variables.AlreadyRequested = false
            coroutine.wrap(function()
                while variables.AutoCatch do
                    task.wait(0.1)

                    local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
                    if not (reelGui and reelGui.Enabled) then
                        continue
                    end
                    
                    -- print("enabled")
                    -- print("making sure of position..")
                    repeat task.wait() until services.Players.LocalPlayer.PlayerGui.reel.bar.fish.Position == UDim2.new(0.5, 0, 0.5, 0)
                    -- print("correct position")
                    local bar = reelGui:FindFirstChild("bar")
                    local playerBar = bar and bar:FindFirstChild("playerbar")
                    local fish = bar and bar:FindFirstChild("fish")
                    if not bar or not playerBar or not fish then
                        continue -- Skip if essential components are missing
                    end
                    -- print("found bar, waiting for move")
                    if variables.ReelMethod1 == false then
                        -- Wait for bar to move before firing the event
                        local startPosition = LocalPlayer.PlayerGui:WaitForChild("reel").bar.playerbar.AbsolutePosition.X
                        repeat task.wait() until LocalPlayer.PlayerGui:WaitForChild("reel").bar.playerbar.AbsolutePosition.X ~= startPosition
                        -- print("moved!")

                        if variables.snapChance and math.random(1, 100) <= variables.snapChance then
                            local args = {generateRandomNumber(-0.05, 0.1), false}
                            -- print("nuh uh")
                            ReplicatedStorage:WaitForChild("events"):WaitForChild("reelfinished"):FireServer(unpack(args))
                        else
                            -- print('remote.')
                            if genv.PerfectCatch then
                                ReplicatedStorage:WaitForChild("events"):WaitForChild("reelfinished"):FireServer(100, true)
                            else
                                ReplicatedStorage:WaitForChild("events"):WaitForChild("reelfinished"):FireServer(100, false)
                            end
                        end

                        repeat task.wait(0.1) until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                    else
                        -- Follow Bar Method
                        repeat
                            task.wait()
                            if playerBar and fish then
                                playerBar.Position = fish.Position
                            else
                                break
                            end
                        until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                    end
                end
            end)()
        else
            variables.AutoCatch = false
        end
    end
})







-- sections.Fish:AddToggle("AutoCatch", {
--     Title = "Auto Reel",
--     Default = false,
--     IgnoreFirst = true,
--     Description = "",
--     Callback = function(isEnabled)
--         variables.AutoCatch = isEnabled
        
--         if isEnabled then
--             variables.AlreadyRequested = false

--             -- Check the method type
--             if not variables.Method1 then
--                 -- Method 1: Auto Reel
--                 spawn(function()
--                     while variables.AutoCatch do
--                         task.wait()
--                         local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
--                         if reelGui and not variables.AlreadyRequested then
--                             variables.AlreadyRequested = true
                            
--                             -- Fire server event
--                             local reelfinished = ReplicatedStorage:WaitForChild("events"):FindFirstChild("reelfinished")
--                             if reelfinished then
--                                 reelfinished:FireServer(100, true)
--                             end

--                             -- Adjust GUI bar properties
--                             local playerBar = LocalPlayer.PlayerGui:FindFirstChild("reel"):FindFirstChild("bar"):FindFirstChild("playerbar")
--                             if playerBar then
--                                 playerBar.Size = UDim2.new(1, 0, 1.3, 0)
--                                 playerBar.Position = UDim2.new(0.5, 0, 0.5, 0)
--                             end

--                             variables.AlreadyRequested = false
--                         end
--                     end
--                 end)
--             else
--                 -- Method 2: Match Bar Position
--                 spawn(function()
--                     while variables.AutoCatch do
--                         task.wait()
--                         local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
--                         if reelGui and reelGui:FindFirstChild("bar") then
--                             local playerBar = reelGui.bar:FindFirstChild("playerbar")
--                             local fishBar = reelGui.bar:FindFirstChild("fish")
--                             if playerBar and fishBar then
--                                 playerBar.Position = fishBar.Position
--                             end
--                         end
--                     end
--                 end)
--             end
--         else
--             -- Disable AutoCatch
--             variables.AutoCatch = false
--         end
--     end
-- })


sections.Fish:AddToggle("FreezeCharacter", {
    Title = "Freeze Character",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        variables.FreezeCharacter = isEnabled
        local oldpos = nil

        while variables.FreezeCharacter do
            local player = LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
            if oldpos == nil then
                oldpos = humanoidRootPart.CFrame
            end
        
            humanoidRootPart.CFrame = oldpos
            humanoidRootPart.Velocity = Vector3.zero
        
            task.wait() 
        end
    end
})
local Connections2
sections.Fish:AddToggle("AutoBalanceNuke", {
    Title = "Auto Balance Nuke",
    Default = true,
    Description = "",
    Callback = function(isEnabled)
        genv.AutoBalanceNuke = isEnabled
        
        local StartMinigame

        if genv.getgc then
        task.spawn(function()
            for i, v in pairs(getgc(true)) do
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
                                while true do
                                    if true then -- Toggle to balance nuke : )
                                        local success, result = pcall(function()
                                            debug.setupvalue(v, 13, os.clock() - 10)
                                        end)

                                        if not success then
                                            break
                                        end
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
            if genv.AutoBalanceNuke then
                task.wait(1)
                if LocalPlayer.PlayerGui:FindFirstChild("NukeMinigame") then
                    Connections2.AutoBalanceNuke = LocalPlayer.PlayerGui.NukeMinigame.Center.Marker.Pointer.Frame:GetPropertyChangedSignal("AbsoluteRotation"):Connect(function()
                        local rot = LocalPlayer.PlayerGui.NukeMinigame.Center.Marker.Pointer.Frame.AbsoluteRotation
                        if rot < -35 then
                            VIM:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                            VIM:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                        elseif rot > 35 then
                            VIM:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
                            VIM:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
                        end
                    end)
                end
            else
                if Connections2.AutoBalanceNuke then
                    Connections2.AutoBalanceNuke:Disconnect()
                    Connections2.AutoBalanceNuke = nil
                end
            end
        end
    end
})


-- sections.FishPlus:AddParagraph({Title = '<font color="#ea00ff">A</font><font color="#e100ff">d</font><font color="#d800ff">v</font><font color="#d000ff">a</font><font color="#c700ff">n</font><font color="#be00fe">c</font><font color="#b600ff">e</font><font color="#ad00ff">d</font><font color="#a400ff"> </font><font color="#9c00ff">A</font><font color="#9300ff">u</font><font color="#8a00ff">t</font><font color="#8200ff">o</font><font color="#7900ff"> </font><font color="#7000ff">F</font><font color="#6800ff">a</font><font color="#5f00ff">r</font><font color="#5700ff">m</font>', Description = "Usage:\n- Select Zone\n- Create Safe Zone\n- Freeze Character\n- Auto Cast and others.."})

local uniqueNames = {}
for _, descendant in ipairs(workspace.zones.fishing:GetDescendants()) do
    if descendant:FindFirstChild("CrabZone") then
        if not uniqueNames[descendant.Name] then
            uniqueNames[descendant.Name] = true
        end
    end
end

local zoneNames = {}
for name, _ in pairs(uniqueNames) do
    table.insert(zoneNames, name)
end

sections.FishPlus:AddDropdown("FishZones", {
    Title = "Fishing Zone",
    Description = "",
    Options = zoneNames,
    Default = "",
    PlaceHolder = "Select Zone",
    Multiple = false,
    Callback = function(selectedZone)
        genv.selectedZone = selectedZone
    end,
})

sections.FishPlus:AddDropdown("FishOverridesZones", {
    Title = "Event Overrides",
    Description = "",
    Options = {"The Depths - Serpent", "Megalodon", "Great Hammerhead Shark", "Great White Shark", "Whale Shark", "Isonade", "Bluefin Tuna Abundance", "Arapaima Abundance", "Swordfish Abundance", "Chinook Salmon Abundance", "Amberjack Abundance", "Mackerel Abundance","Ancient Algae","Mushgrove Algae","Forsaken Algae","Snowcap Algae","Golden Tide Pool"},
    Default = "This feature is a WIP, it will work in the next few days!",
    PlaceHolder = "Select Zone",
    Multiple = true,
    Callback = function(selectedEvents)
        genv.selectedEventOverrides = selectedEvents
    end,
})

genv.RunningFishZone = false

local function checkOverrides()
    for _, child in ipairs(workspace.zones.fishing:GetChildren()) do
        for _, overrideEvent in ipairs(genv.selectedEventOverrides or {}) do
            if string.find(overrideEvent:lower(), "algae") and string.find(child.Name:lower(), overrideEvent:lower()) then
                return child
            end
        end

        if child:FindFirstChild("beacon") then
            local poiHeader = child:FindFirstChild("POIHeader")
            if poiHeader and poiHeader:FindFirstChild("title") and poiHeader.title:IsA("TextLabel") then
                local titleText = poiHeader.title.Text
                -- Match the event name using string.find
                for _, overrideEvent in ipairs(genv.selectedEventOverrides or {}) do
                    if string.find(titleText, overrideEvent) then
                        return child -- Return the matching zone
                    end
                end
            end
        end

        -- Check for abundance properties
        local abundance = child:FindFirstChild("Abundance")
        if abundance and abundance:FindFirstChild("Chance") and abundance:FindFirstChild("Mutation") then
            for _, overrideEvent in ipairs(genv.selectedEventOverrides or {}) do
                if string.find(child.Name, overrideEvent) then
                    return child -- Return the matching zone
                end
            end
        end
    end
    return nil -- Return nil if no match is found
end


sections.FishPlus:AddToggle("FreezeInZone", {
    Title = "Freeze In Zone",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        local player = LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        local rootPart = character:WaitForChild("HumanoidRootPart")
        local workspace = game:GetService("Workspace")
        local oldPos = nil

        genv.RunningFishZone = isEnabled
        if genv.RunningFishZone then
            oldPos = rootPart.CFrame

            coroutine.wrap(function()
                while genv.RunningFishZone do
                    task.wait()
                    rootPart.Velocity = Vector3.zero
                    workspace.FallenPartsDestroyHeight = 0/0
                    humanoid.PlatformStand = true

                    local eventZone = checkOverrides()
                    local targetZone = eventZone or workspace.zones.fishing:FindFirstChild(genv.selectedZone)

                    if targetZone then
                        local position = targetZone.Position
                        local size = targetZone.Size
                        if eventZone then
                            rootPart.CFrame = CFrame.new(position.X, position.Y + (size.Y / 3) - 2, position.Z)
                        else
                            rootPart.CFrame = CFrame.new(position.X, position.Y - (size.Y / 2) + 2, position.Z)
                        end
                    end
                end
                humanoid.PlatformStand = false
                workspace.FallenPartsDestroyHeight = -1200
                if oldPos then
                    rootPart.CFrame = oldPos
                end
            end)()
        else
            genv.RunningFishZone = false
            humanoid.PlatformStand = false
            workspace.FallenPartsDestroyHeight = -1200
            if oldPos then
                rootPart.CFrame = oldPos
            end
        end
    end,
})



genv.StartFishingInZone = false

sections.FishPlus:AddToggle("StartFishingInZone", {
    Title = "Start Fishing In Zone",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        local player = services.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local head = character:WaitForChild("Head")

        genv.StartFishingInZone = isEnabled
        while genv.StartFishingInZone do
            task.wait()

            -- Find the fishing rod and its bobber
            local rod = character:FindFirstChild(PlayerStats.rod.Value)
            if rod then
                local bobber = rod:FindFirstChild("bobber")
                if bobber then
                    
                    local eventZone = checkOverrides()
                    local targetZone = eventZone or workspace.zones.fishing:FindFirstChild(genv.selectedZone)

                    if targetZone then
                        if eventZone then
                            local targetPosition = targetZone.Position
                            local targetSize = targetZone.Size
                            local surfacePos = Vector3.new(
                                targetPosition.X,
                                targetPosition.Y + (targetSize.Y / 2), -- Top surface
                                targetPosition.Z
                            )
                            bobber.CFrame = CFrame.new(surfacePos)
                        else
                            -- For regular fish, place the bobber above the player's head
                            local bobberPos = head.Position + Vector3.new(0, 2, 0) -- 2 studs above the head
                            bobber.CFrame = CFrame.new(bobberPos)
                        end
                    end
                end
            end
        end
    end
})








genv.AutoBestiaryParagraph = sections.FishPlus:AddParagraph({
    Title = gradient("Auto Bestiary"),
    Description = "<font color=\"rgb(255, 0, 0)\">NOTE: Auto Bestiary was rushed, expect bugs. You need to use reinforced rod.</font>"
})

sections.FishPlus:AddToggle("AutoBestiary", {
    Title = "Auto Bestiary",
    Default = false,
    Description = "Automatically complete the bestiary by fishing in required zones.",
    Callback = function(isEnabled)
        genv.AutoBestiaryEnabled = isEnabled

        if genv.AutoBestiaryEnabled then
            coroutine.wrap(function()
                local player = services.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
                local rootPart = character:WaitForChild("HumanoidRootPart")
                local workspace = game:GetService("Workspace")
                local replicatedStorage = services.ReplicatedStorage
                local bestiary = replicatedStorage.playerstats[player.Name].Bestiary

                -- Load fish data
                local data = loadstring(game:HttpGet("https://raw.githubusercontent.com/Catto-YFCN/GoofyData/refs/heads/main/data"))()
                local allFish = {}
                if type(data.Fish) == "table" then
                    for fishName, fishData in pairs(data.Fish) do
                        allFish[fishName] = fishData.From or "Unknown"
                    end
                end

                -- Zone Failsafe Map
                local zoneFailsafeMap = {
                    Snowcap = "Snowcap Ocean",
                    Terrapin = "Terrapin Ocean",
                    Roslit = "Roslit Bay Clam",
                    ["Roslit Volcano"] = "Lava",
                    Mushgrove = "Mushgrove Water",
                    Moosewood = "Moosewood Ocean",
                    ["Ancient Isle"] = "Ancient Isle Ocean"
                }

                local function getUncompletedFish()
                    local completedFish = {}
                    for _, entry in ipairs(bestiary:GetChildren()) do
                        completedFish[entry.Name] = true
                    end

                    local uncompletedFish = {}
                    for fishName, zone in pairs(allFish) do
                        -- Skip fish with "N/A" zone
                        if not completedFish[fishName] and zone ~= "N/A" then
                            table.insert(uncompletedFish, { name = fishName, zone = zone })
                        end
                    end

                    return uncompletedFish
                end

                local function findZone(zoneName)
                    -- Check for zone and fallback
                    local zone = workspace.zones.fishing:FindFirstChild(zoneName)
                    if not zone and zoneFailsafeMap[zoneName] then
                        zone = workspace.zones.fishing:FindFirstChild(zoneFailsafeMap[zoneName])
                    end
                    return zone
                end

                local function freezeCharacter(position)
                    humanoid.PlatformStand = true
                    rootPart.Velocity = Vector3.zero
                    rootPart.CFrame = CFrame.new(position)
                end

                while genv.AutoBestiaryEnabled do
                    task.wait()

                    local uncompletedFish = getUncompletedFish()
                    if #uncompletedFish == 0 then
                        print("All bestiary entries are completed!")
                        break
                    end

                    -- Get the next fish to complete
                    local nextFish = uncompletedFish[1]
                    print("Fishing for: " .. nextFish.name .. " in zone: " .. nextFish.zone)
                    genv.AutoBestiaryParagraph:SetDesc("<font color=\"rgb(255, 0, 0)\">NOTE: Auto Bestiary is new and was rushed, expect bugs. </font>\n<font color=\"rgb(255, 255, 255)\">Fishing for: </font>" .. nextFish.name .. "\n<font color=\"rgb(255, 255, 255)\">Zone: </font>" .. nextFish.zone)


                    -- Find the required zone
                    local targetZone = findZone(nextFish.zone)
                    if targetZone then
                        local targetPosition = targetZone.Position
                        local targetSize = targetZone.Size
                        local zonePosition = Vector3.new(
                            targetPosition.X,
                            targetPosition.Y + (targetSize.Y / 2), 
                            targetPosition.Z
                        )

                        -- Move to zone and freeze
                        rootPart.CFrame = CFrame.new(zonePosition)
                        task.wait(1) -- Allow some time for positioning
                        freezeCharacter(zonePosition)

                        while genv.AutoBestiaryEnabled and #getUncompletedFish() > 0 do
                            task.wait()

                            local rod = character:FindFirstChild(getEquippedRod())
                            if rod then
                                local bobber = rod:FindFirstChild("bobber")
                                if bobber then
                                    -- Simulate casting the rod
                                    bobber.CFrame = CFrame.new(zonePosition)
                                end
                            end

                            -- Ensure character stays in place
                            freezeCharacter(zonePosition)
                        end
                    else
                        warn("Zone not found for: " .. nextFish.zone)
                    end
                end

                -- Reset character state when Auto Bestiary stops
                humanoid.PlatformStand = false
                print("Auto Bestiary completed or stopped.")
            end)()
        else
            -- Disable Auto Bestiary
            genv.AutoBestiaryEnabled = false
            print("Auto Bestiary disabled.")
        end
    end,
})




-- sections.FishPlus:AddButton({
--     Title = "Create Safe Zone",
--     Variant = "Primary",
--     Callback = function()
--         local SafeZone = Instance.new("Part")
--         SafeZone.Size = Vector3.new(15, 1, 15)
--         SafeZone.Position = Vector3.new(math.random(-2000,2000), math.random(50000,90000), math.random(-2000,2000))
--         SafeZone.Anchored = true
--         SafeZone.BrickColor = BrickColor.new("Royal purple")
--         SafeZone.Material = Enum.Material.ForceField
--         SafeZone.Parent = game.Workspace
--         LocalPlayer.Character.HumanoidRootPart.CFrame = SafeZone.CFrame + Vector3.new(0, 5, 0)
--     end,
-- })


genv.BaitParagraph = sections.FishBait:AddParagraph({
    Title = gradient("Optimal Bait:"),
    Description = "Info"
})

sections.FishBait:AddDropdown("FishBait", {
    Title = "Prioritized Bait",
    Description = "Most & Least uses the baits you have the most or least of.",
    Options = {"Most", "Least", "Lure Speed", "Luck", "Universal Luck", "Resilience"},
    Default = "",
    PlaceHolder = "Select Bait",
    Multiple = false,
    Callback = function(selectedBait)
        genv.SelectedBait = selectedBait
        if genv.SelectedBait == "Lure Speed" then
            genv.SelectedBait = "LureSpeed"
        elseif genv.SelectedBait == "Universal Luck" then
            genv.SelectedBait = "GenerelLuck"
        end
    end
})



genv.AutoBaitToggle = sections.FishBait:AddToggle("Auto Bait", {
    Title = "Auto Bait",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.AutoBait = isEnabled
        while genv.AutoBait do
            local bait = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.bait
            availableBaits = {}

            for _, child in ipairs(bait:GetChildren()) do
                if child.Value ~= 0 then
                    local baitName = string.sub(child.Name, 6) -- Remove the "bait_" prefix
                    table.insert(availableBaits, baitName)
                end
            end

            determineBestBait()
            wait(1)
        end
    end
})

-- local giantBarConnection

-- sections.FishSettings:AddToggle("GiantBar", {
--     Title = "Giant Reel Bar",
--     Default = false,
--     Description = "Broken",
--     Callback = function(isEnabled)
--         genv.GiantBar = isEnabled

--         if giantBarConnection then
--             giantBarConnection:Disconnect()
--             giantBarConnection = nil
--         end

--         if isEnabled then
--             local playerGui = LocalPlayer.PlayerGui
--             giantBarConnection = playerGui.ChildAdded:Connect(function(child)
--                 if child.Name == "reel" then
--                     local playerBar = child:FindFirstChild("bar") and child.bar:FindFirstChild("playerbar")
--                     if playerBar then
--                         task.wait(0.3)
--                         playerBar.Size = UDim2.new(1, 0, 1.3, 0)
--                         playerBar.Position = UDim2.new(0.5, 0, 0.5, 0)
--                     end
--                 end
--             end)

--             -- Apply changes to existing reel, if any
--             local reel = playerGui:FindFirstChild("reel")
--             if reel then
--                 local playerBar = reel:FindFirstChild("bar") and reel.bar:FindFirstChild("playerbar")
--                 if playerBar then
--                     playerBar.Size = UDim2.new(1, 0, 1.3, 0)
--                     playerBar.Position = UDim2.new(0.5, 0, 0.5, 0)
--                 end
--             end
--         end
--     end
-- })


-- local playerBar = LocalPlayer.PlayerGui:FindFirstChild("reel"):FindFirstChild("bar"):FindFirstChild("playerbar")
-- if playerBar then
--     playerBar.Size = UDim2.new(1, 0, 1.3, 0)
--     playerBar.Position = UDim2.new(0.5, 0, 0.5, 0)
-- end

sections.FishSettings:AddToggle("PerfectCatch", {
    Title = "Perfect Catch",
    Default = true,
    Description = "",
    Callback = function(isEnabled)
        genv.PerfectCatch = isEnabled
    end,
})

sections.FishSettings:AddSlider("AutoShakeDelay", {
    Title = "Auto Shake Delay",
    Description = "Set this to 0 if you want super fast.",
    Default = 0,
    Min = 0,
    Max = 100,
    Increment = 1,
    Callback = function(value)
        variables.AutoShakeDelay = value * 0.001
        -- print(variables.AutoShakeDelay)
    end,
})

sections.FishSettings:AddSlider("AutoCastPower", {
    Title = "Auto Cast Power",
    Description = "",
    Default = 100,
    Min = 1,
    Max = 100,
    Increment = 1,
    Callback = function(value)
        variables.autoCastPower = value
    end,
})

sections.FishSettings:AddSlider("AutoCastDelay", {
    Title = "Auto Cast Delay",
    Description = "This is in 100ms increments (0.1s)",
    Default = 5,
    Min = 0,
    Max = 20,
    Increment = 1,
    Callback = function(value)
        variables.AutoCastDelay = value * 0.1
        -- print(variables.AutoShakeDelay)
    end,
})

sections.FishSettings:AddDropdown("FischShakeMethod", {
    Title = "Auto Shake Method",
    Description = "",
    Options = {"Navigation","Click"},
    Default = "Navigation",
    PlaceHolder = "Select Method",
    Multiple = false,
    Callback = function(selectedOptions)
        if selectedOptions == "Navigation" then
            variables.Method1 = false
        elseif selectedOptions == "Click" then
            variables.Method1 = true
        end
    end
})

sections.FishSettings:AddDropdown("FischCatchMethod", {
    Title = "Auto Reel Method",
    Description = "",
    Options = {"Instant","Follow Bar"},
    Default = "Instant",
    PlaceHolder = "Select Method",
    Multiple = false,
    Callback = function(selectedOptions)
        if selectedOptions == "Instant" then
            variables.ReelMethod1 = false
        elseif selectedOptions == "Follow Bar" then
            variables.ReelMethod1 = true
        end
    end
})

sections.FishSettings:AddSlider("SnapChance", {
    Title = "Snap Chance",
    Description = "",
    Default = 0,
    Min = 0,
    Max = 100,
    Increment = 1,
    Callback = function(value)
        variables.snapChance = value
    end,
})

-- ill finish it tmr
sections.FishSettings:AddDropdown("IgnoreSnapRarity", {
    Title = "Ignore Snap Rarity",
    Description = "",
    Options = {"Trash", "Common", "Rare", "Legendary", "Mythical", "Unusual", "Limited"},
    Default = "",
    PlaceHolder = "Select Rarity",
    Multiple = false,
    Callback = function(selectedOptions)
        if selectedOptions == "Instant" then
            variables.Method1 = false
        elseif selectedOptions == "Follow Bar" then
            variables.Method1 = true
        end
    end
})





genv.InventoryValue = sections.Item0:AddParagraph({
    Title = gradient("Inventory Information"),
    Description = "Inventory Info: <font color=\"rgb(255,0,0)\">Offline</font>\nInventory Value: <font color=\"rgb(255,0,0)\">Offline</font>\nHeld Item Value: <font color=\"rgb(255,0,0)\">Offline</font>"
})

sections.Item0:AddToggle("CheckValue", {
    Title = "Check Value",
    Default = false,
    Description = "Off by default because performance.",
    Callback = function(isEnabled)
        genv.CheckValue = isEnabled
    end,
})

function calculateInventoryValue()
    _G.totalValue = 0
    _G.handValue = 0
    _G.backpackItems = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory:GetChildren()

    for _, v in ipairs(_G.backpackItems) do
        _G.itemValue = GetBackPackItemValue(v)
        if _G.itemValue then
            _G.totalValue += _G.itemValue
        end
    end

    local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if tool and tool:FindFirstChild("link") then
        _G.handValue = GetBackPackItemValue(tool.link.Value)
    end

    local favourited = 0
    local totalFish = 0
    for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if not item:FindFirstChild("link") then continue end
        local link = item.link.Value
    
        if link:FindFirstChild("Favourited") then
            favourited += 1
        end
        if link:FindFirstChild("Stack") then
            totalFish += link.Stack.Value
        end
    end
    
    genv.InventoryValue:SetDesc(string.format(
        'You have <font color="#FFFFFF">%s</font> fish, <font color="#FFFF00">%s</font> favourited.\nInventory Value: <font color="#FFFDE4">%s</font>\nHeld Item Value: <font color="#FFFDE4">%s</font>',
        formatNumber(totalFish),  -- Total fish in white
        formatNumber(favourited), -- Favourited in yellow
        formatPrice(_G.totalValue),
        formatPrice(_G.handValue)
    ))    
    pcall(function()
        genv.InventoryValueGift:SetDesc(string.format(
            'You have <font color="#FFFFFF">%s</font> fish, <font color="#FFFF00">%s</font> favourited.\nInventory Value: <font color="#FFFDE4">%s</font>\nHeld Item Value: <font color="#FFFDE4">%s</font>',
            formatNumber(totalFish),  -- Total fish in white
            formatNumber(favourited), -- Favourited in yellow
            formatPrice(_G.totalValue),
            formatPrice(_G.handValue)
        ))
    end)
    return formatPrice(_G.totalValue)
end

function getInventoryValue()
    local totalValue = 0
    local backpackItems = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory:GetChildren()

    for _, v in ipairs(backpackItems) do
        local itemValue = GetBackPackItemValue(v)
        if itemValue then
            totalValue = totalValue + itemValue  -- Use the = operator for addition
        end
    end

    return totalValue
end



task.spawn(function()
    while task.wait(1) do
        if genv.CheckValue then
            calculateInventoryValue()
        end
    end
end)

        local text
        local currentModel2
        genv.BobberVisuals = false
        genv.BovverTextVisualColor = Color3.new(1, 1, 1)
        genv.BobberGlow = false
        local glow
        genv.BobberGlowColor = Color3.new(255, 255, 255)

sections.Visuals3:AddColorpicker("BobberVisualsTextColor", {
    Title = "Bobber Visuals Text Color ",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(selectedColor)
    genv.BovverTextVisualColor = selectedColor
    if text and genv.BobberGlow then
    text.Color = selectedColor
    end
    end,
})

sections.Visuals3:AddToggle("ToggleBobberVisuals", {
    Title = "Bobber Visuals",
    Default = false,
    Description = "Display Cool info on your bobber",
    Callback = function(isEnabled)
genv.BobberVisuals =  isEnabled
while genv.BobberVisuals do
    local PlayerStats = services.ReplicatedStorage.playerstats[tostring(services.Players.LocalPlayer.Name)].Stats
    local character = game.Players.LocalPlayer.Character
    local rod = character:FindFirstChild(PlayerStats.rod.Value)

    if rod then
        local bobber = rod:FindFirstChild("bobber")
        if bobber then
            local camera = workspace.CurrentCamera
            local screenPosition, onScreen = camera:WorldToViewportPoint(bobber.Position)
            
            if onScreen then
                if not text then
                    text = Drawing.new("Text")
                    text.Size = 20
                    text.Color = genv.BovverTextVisualColor
                    text.Center = true
                    text.Outline = true
                    text.OutlineColor = Color3.new(0, 0, 0)
                    text.Visible = true
                end

                for _, child in ipairs(bobber:GetChildren()) do
                    if child:IsA("Model") and child.Name ~= PlayerStats.bait.Value and child.Name ~= PlayerStats.bobber.Value then
                        if currentModel2 ~= child.Name then
                            currentModel2 = child.Name
                        end
                    end
                end
                
                if currentModel2 and not bobber:FindFirstChild(currentModel2) then
                    currentModel2= nil
                end

                local lureText
                if rod.values.lure.Value == 100 then
                    lureText = "Catching: " .. (currentModel2 or "Unknown")
                else
                    lureText = "Lure: " .. string.format("%.3f", rod.values.lure.Value) .. "%"
                end

                text.Text = "Bobber | Zone: " .. tostring(rod.values.bobberzone.Value) .. " | " .. lureText
                text.Position = Vector2.new(screenPosition.X, screenPosition.Y)
            else
                if text then
                    text:Remove()
                    text = nil
                end
            end
        else
            if text then
                text:Remove()
                text = nil
            end
        end
    else
        if text then
            text:Remove()
            text = nil
        end
    end
    
    task.wait() 
end
    if text and not genv.BobberVisuals then
        text:Remove()
        text = nil
    end
    end,
})

sections.Visuals3:AddColorpicker("BobberVisualsTextColor", {
    Title = "Bobber Glow Color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(selectedColor)
        genv.BobberGlowColor = selectedColor
        if genv.BobberGlow then
            local player = services.Players.LocalPlayer
            local bobberName = services.ReplicatedStorage.playerstats[tostring(player.Name)].Stats.bobber.Value
            local character = player.Character or player.CharacterAdded:Wait()
            local rod = character:FindFirstChild(PlayerStats.rod.Value)

            local bobber = rod:FindFirstChild("bobber")
            if bobber then
            local bobberBobber =  bobber:FindFirstChild(bobberName)
            if bobberBobber then
                local glowEffect = bobberBobber:FindFirstChild("Lunor_GlowEffect")
                if glowEffect then
                    bobberBobber:FindFirstChild("Lunor_GlowEffect").OutlineColor = selectedColor
                end
            end
            end
        end
    end,
})



sections.Visuals3:AddToggle("ToggleBobberGlow", {
    Title = "Bobber Glow",
    Default = false,
    Description = "Make your Bobber Glow",
    Callback = function(isEnabled)
        genv.BobberGlow = isEnabled
        while genv.BobberGlow do
            local player = services.Players.LocalPlayer
            local playerStats = services.ReplicatedStorage.playerstats[tostring(player.Name)].Stats
            local character = player.Character or player.CharacterAdded:Wait()  -- Ensure the character exists
            local rodName = playerStats.rod.Value
            local bobberName = playerStats.bobber.Value

            local rod = character:FindFirstChild(rodName)
            if rod then
                local bobber = rod:FindFirstChild("bobber")
                if bobber then
                    local bobberPart = bobber:FindFirstChild(bobberName)
                    if bobberPart and not bobberPart:FindFirstChild("Lunor_GlowEffect") then
                        local glow = Instance.new("Highlight", bobberPart)
                        glow.Name = "Lunor_GlowEffect"
                        glow.FillTransparency = 1
                        glow.OutlineColor = genv.BobberGlowColor or Color3.new(1, 1, 1)  -- Default color if not set
                    end
                end
            end

            task.wait()
        end
    end,
})


-- sections.Visuals3:AddToggle("Inventory Value", {
--     Title = "Exact Inventory Value",
--     Default = true,
--     Description = "Displays a text showing the total value of items",
--     Callback = function(isEnabled)
--         if isEnabled then
--                 function calculateInventoryValue()
--                 _G.totalValue = 0
--                 _G.backpackItems = LocalPlayer.PlayerGui.hud.safezone.backpack:GetDescendants()

--                 for _, v in ipairs(_G.backpackItems) do
--                     if v:IsA("ValueBase") and v.Name == "item" then
--                         print(v)
--                         _G.itemValue = GetBackPackItemValue(v.Value)
--                         if _G.itemValue then
--                             _G.totalValue += _G.itemValue
--                         end
--                     end
--                 end

--                 genv.InventoryValue:SetDesc(string.format("Inventory Value: %s", _G.totalValue.."C$"))
--             end

--             calculateInventoryValue()
--             task.spawn(function()
--                 while isEnabled do
--                     calculateInventoryValue()
--                     task.wait(1)
--                 end
--             end)
--         else
--             genv.InventoryValue:SetDesc("Inventory Value: Offline")
--         end
--     end,
-- })


sections.Item:AddToggle("AutoOpenItem", {
    Title = "Auto Open Held Item",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.AutoOpenItem = isEnabled
        while genv.AutoOpenItem do
            local item = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if item then
                item:Activate()
            else
                lib:Notification("Auto Open Item", "No item found to activate.", 5)
                genv.AutoOpenItem = false
                return
            end
            task.wait()
        end
    end,
})


genv.SkinCrateToggle = sections.Item:AddToggle("AutoOpenSkinCrate", {
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

                    genv.SkinCrateToggle:Set(false)
                    lib:Notification("Auto Open Skin Crate", "Completed", 5)

                else
                    lib:Notification("Auto Open Skin Crate", "You're not holding a Skin Crate...", 5)
                    genv.SkinCrateToggle:Set(false)
                end
            else
                lib:Notification("Auto Open Skin Crate", "You're not holding a Skin Crate...", 5)
                genv.SkinCrateToggle:Set(false)
            end
        end
    end,
})


local validItems = {}
if type(data.Items) == "table" then
    for itemName, itemData in pairs(data.Items) do
        if itemData.Price ~= "inf" and itemData.Price ~= "No Price" then
            local formattedPrice = formatPrice(itemData.Price)
            table.insert(validItems, itemName .. " - " .. formattedPrice)
        end
    end
end

-- Add the valid items to the dropdown
sections.Item:AddDropdown("PurchaseItem", {
    Title = gradient("Items"),
    Description = "",
    Options = validItems,  -- Use the formatted item names and prices
    Default = "",
    PlaceHolder = "Select Item",
    Multiple = false,
    Callback = function(selectedItem)
        -- print("Selected Item:", selectedItem)
        genv.SelectedPurchaseItem = selectedItem
    end,
})


sections.Item:AddTextbox({
    Title = "Items - Amount",
    Default = "",
    Description = "",
    PlaceHolder = "Input",
    TextDisappear = false,
    Callback = function(purchaseAmount)
        genv.PurchaseItemAmount = tonumber(purchaseAmount)
        -- print(purchaseAmount)
    end
})

sections.Item:AddButton({
    Title = "Purchase - Item(s)",
    Callback = function()
        local itemName, formattedPrice = genv.SelectedPurchaseItem:match("^(.-) %- (.+)$")
        local price = unformatPrice(formattedPrice)

        if genv.PurchaseItemAmount == nil then
            genv.PurchaseItemAmount = 1
        end

        -- Get the item type from data.Items
        local itemType = data.Items[itemName] and data.Items[itemName].Type or "Unknown"

        -- Check if the player has enough coins
        if price * genv.PurchaseItemAmount > ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value then
            lib:Notification("Purchase - Item(s)", "Insufficient cash, you need " .. formatNumber(price * genv.PurchaseItemAmount) .. "$ but you have only " .. formatNumber(math.floor(ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value)) .. "$", 5)
            return
        end
        -- Fire the purchase event
        game:GetService('ReplicatedStorage').events.purchase:FireServer(itemName, itemType, nil, genv.PurchaseItemAmount)

        -- Notify successful purchase
        lib:Notification("Purchase - Item(s)", "Successfully purchased " .. genv.PurchaseItemAmount .. " " .. itemName, 5)
    end,
})



local playerRods = ReplicatedStorage.playerstats[LocalPlayer.Name].Rods

local playerRodsSet = {}
for _, rod in ipairs(playerRods:GetChildren()) do
    playerRodsSet[rod.Name] = true
end

local validRods = {}

if type(data.Rods) == "table" then
    for rodName, rodData in pairs(data.Rods) do
        if not playerRodsSet[rodName] and type(rodData) == "table" and rodData.Price ~= "inf" and rodData.Price ~= "No Price" then
            local formattedPrice = formatPrice(rodData.Price)
            table.insert(validRods, rodName .. " - " .. formattedPrice)
        end
    end
end


local purchaseRodDropdown = sections.Item:AddDropdown("PurchaseRod", {
    Title = gradient("Rods"),
    Description = "",
    Options = validRods,  -- Use the formatted rod names and prices
    Default = "",
    PlaceHolder = "Select Rod",
    Multiple = false,
    Callback = function(selectedRod)
        -- print(selectedRod)
        variables.SelectedPurchaseRod = selectedRod
    end,
})

sections.Item:AddButton({
    Title = "Purchase - Rod",
    Callback = function()
        local rodName, formattedPrice = variables.SelectedPurchaseRod:match("^(.-) %- (.+)$")
        local price = unformatPrice(formattedPrice)

        -- Cash check
        if price > ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value then
            lib:Notification("Purchase - Rod", "Insufficient cash, you need " .. formatNumber(tonumber(price)) .. "$ but you have only " .. formatNumber(tonumber(math.floor(ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value))) .. "$", 5)
            return -- Prevent purchase if not enough cash
        end

        -- Proceed with purchase
        game:GetService('ReplicatedStorage').events.purchase:FireServer(rodName, 'Rod', price, 1)
        lib:Notification("Purchase - Rod", "Successfully purchased " .. rodName, 5)

        -- Remove the rod from valid rods
        for i, rod in ipairs(validRods) do
            if rod:match("^" .. rodName) then
                table.remove(validRods, i)
                break
            end
        end

        -- Refresh the rod dropdown
        purchaseRodDropdown:Refresh(validRods, true)
        purchaseRodDropdown:Set(validRods)
    end,
})

lanternsTable = {}

for _, v in ipairs(ReplicatedStorage.resources.replicated.instances.lanterns:GetChildren()) do
    table.insert(lanternsTable, v.Name)
end

for _, v in ipairs(ReplicatedStorage.playerstats[LocalPlayer.Name].Lanterns:GetChildren()) do
    for i = #lanternsTable, 1, -1 do
        if lanternsTable[i] == v.Name then
            table.remove(lanternsTable, i)
        end
    end
end


local lanternSelected = nil

local LanternDropdown = sections.Item:AddDropdown("PurchaseLanter", {
    Title = gradient("Lantern"),
    Description = "",
    Options = lanternsTable,  -- Use the formatted rod names and prices
    Default = "",
    PlaceHolder = "Select Lantern",
    Multiple = false,
    Callback = function(selectedRod)
        lanternSelected = selectedRod
    end,
})

sections.Item:AddTextbox({
    Title = "Lantern - Amount",
    Default = "",
    Description = "",
    PlaceHolder = "Input",
    TextDisappear = false,
    Callback = function(purchaseAmount)
        genv.PurchaseLanternAmount = tonumber(purchaseAmount)
    end
})

sections.Item:AddButton({
    Title = "Purchase - Lantern(s)",
    Callback = function()
        if  genv.PurchaseLanternAmount == nil then
            genv.PurchaseLanternAmount = 1
        end
        if ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value < genv.PurchaseLanternAmount * 500 then
            lib:Notification(
                "Auto Buy Lantern",
                "Insufficient cash, you need " .. formatNumber(genv.PurchaseLanternAmount * 500) .. "$ but you have only " .. formatNumber(math.floor(ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value)) .. "$",
                5
            )
            return
        end

        lib:Notification("Purchase - Item(s)", "Starting purchase of " .. genv.PurchaseLanternAmount, 5)

        for i = 1, genv.PurchaseLanternAmount do
            local success, err = pcall(function()
                workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Mods Latern Keeper"):WaitForChild("mods lantern"):WaitForChild("purchase"):InvokeServer()
            end)

            if not success then
                lib:Notification("Purchase Error", "Failed to purchase lantern: " .. err, 5)
                return
            end
        end
        lib:Notification("Purchase - Lantern(s)", "Successfully purchased " .. genv.PurchaseLanternAmount, 5)
    end,
})

genv.AutoBuyLantern = sections.Item:AddToggle("AutoBuyLantern", {
    Title = "Auto Buy Lantern Till Selected",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        while isEnabled do
            if ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value < 500 then
                lib:Notification("Auto Buy Lantern", "Insufficient cash, you need " .. formatNumber(tonumber(500)) .. "$ but you have only " .. formatNumber(tonumber(math.floor(ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value))) .. "$", 5)
                genv.AutoBuyLantern:Set(false)
                return
            end

            local lanterns = ReplicatedStorage.playerstats[LocalPlayer.Name].Lanterns:GetChildren()
            local foundLantern = false
            for _, v in ipairs(lanterns) do
                if v.Name == lanternSelected then
                    foundLantern = true
                    break
                end
            end

            if foundLantern then
                lib:Notification("Auto Buy Lantern", "Lantern '" .. lanternSelected .. "' has been successfully acquired.", 5)
                genv.AutoBuyLantern:Set(false)
                break
            end

            if isEnabled then
                local success, err = pcall(function()
                    workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Mods Latern Keeper"):WaitForChild("mods lantern"):WaitForChild("purchase"):InvokeServer()
                end)

                if not success then
                    lib:Notification("Purchase Error", "Failed to purchase lantern: " .. err, 5)
                    genv.AutoBuyLantern:Set(false)
                    return
                end
            else
                genv.AutoBuyLantern:Set(false)
            end

            task.wait()
        end
    end,
})

local formattedOptions = {}

-- Format the options using the provided formatPrice function
for crateName, crateData in pairs(data.SkinCrates) do
    local formattedPrice = formatPrice(crateData.Price)
    table.insert(formattedOptions, crateName .. " - " .. formattedPrice)
end

local SelectedCrate = nil
local SelectedCrateAmount = 1

sections.Item:AddDropdown("PurchaseCrates", {
    Title = gradient("Skin Crates"),
    Description = "",
    Options = formattedOptions,  -- Use the formatted options from data.SkinCrates
    Default = "",
    PlaceHolder = "Select a Skin Crate ",
    Multiple = false,
    Callback = function(selectedRod)
        SelectedCrate = selectedRod:split(" - ")[1]
    end,
})

sections.Item:AddTextbox({
    Title = "Skin Crates - Amount",
    Default = "",
    Description = "",
    PlaceHolder = "Input",
    TextDisappear = false,
    Callback = function(purchaseAmount)
        SelectedCrateAmount = tonumber(purchaseAmount)
    end
})

sections.Item:AddButton({
    Title = "Purchase - Skin Crate(s)",
    Callback = function()
        if SelectedCrateAmount == nil then
            SelectedCrateAmount = 1
        end
        for i = 1, SelectedCrateAmount do
            local success, err = pcall(function()
                ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/SkinCrates/Purchase"):InvokeServer(SelectedCrate)
                task.wait(0.2)
            end)

            if not success then
                lib:Notification("Purchase Error", "Failed to purchase Skin Crates: " .. err, 5)
                return -- Exit the loop if there's an error
            end
        end

        lib:Notification("Purchase - Skin Crate(s)", "Successfully purchased " .. SelectedCrateAmount, 5)
    end,
})



sections.Item:AddDropdown("PurchaseMerlin", {
    Title = gradient("Merlin"),
    Description = "",
    Options = {"Enchant Relic","Luck"},
    Default = "",
    Multiple = false,
    PlaceHolder = "Select Magic",
    Callback = function(selectedMerlin)
        variables.SelectedPurchaseMerlin = selectedMerlin
    end
})

genv.AutoBuyLuckToggle = sections.Item:AddToggle("AutoBuyMerlinLuck", {
    Title = "Auto Buy Luck",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        variables.AutoBuyMerlinLuck = isEnabled
        while variables.AutoBuyMerlinLuck do
            if not LocalPlayer.PlayerGui.hud.safezone.statuses:FindFirstChild("statusUI") then
                workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("luck"):InvokeServer()
            end
            if ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value < 5000 then
                lib:Notification("Auto Buy Luck", "Insufficient cash, you need " .. formatNumber(tonumber(5000)) .. "$ but you have only " .. formatNumber(tonumber(math.floor(ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value))) .. "$", 5)
                genv.AutoBuyLuckToggle:Set(false)
                return
            end
            wait(1)
            if not variables.AutoBuyMerlinLuck then break end
        end
    end,
})

sections.Item:AddButton({
    Title = "Purchase - Merlin",
    Callback = function()
        if variables.SelectedPurchaseMerlin == "Enchant Relic" then
            if ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value < 11000 then
                lib:Notification("Purchase - Merlin", "Insufficient cash, you need " .. formatNumber(tonumber(11000)) .. "$ but you have only " .. formatNumber(tonumber(math.floor(ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value))) .. "$", 5)
                return -- Prevent purchase if not enough cash
            end
            workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("power"):InvokeServer()
        elseif variables.SelectedPurchaseMerlin == "Luck" then
            if ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value < 5000 then
                lib:Notification("Purchase - Merlin", "Insufficient cash, you need " .. formatNumber(tonumber(5000)) .. "$ but you have only " .. formatNumber(tonumber(math.floor(ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value))) .. "$", 5)
                return -- Prevent purchase if not enough cash
            end
            workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("luck"):InvokeServer()
        end
        lib:Notification("Purchase - Merlin","Successfully purchased " .. variables.SelectedPurchaseMerlin, 5)
    end,
})

sections.Item5:AddParagraph({Title = gradient("Selling")})
sections.Item5:AddToggle("AutoSell", {
    Title = "Auto Sell",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        variables.autoselling = isEnabled
        if isEnabled then
            coroutine.wrap(function()
                while variables.autoselling do
                    pcall(function()
                        ReplicatedStorage.events.SellAll:InvokeServer()
                    end)
                    task.wait(variables.autoSellDelay)
                    if not variables.autoselling then break end
                end
            end)()
        end
    end,
})



sections.Item5:AddSlider("Auto Sell Delay", {
    Title = "Auto Sell Delay [Seconds]",
    Description = "",
    Default = 60,
    Min = 0,
    Max = 600,
    Increment = 1,
    Callback = function(value)
        variables.autoSellDelay = value
    end,
})

local sellFishGroupButton = sections.Item5:AddGroupButton()

sellFishGroupButton:AddButton({
    Title = "Sell All",
    Variant = "Primary",
    Callback = function()
        ReplicatedStorage.events.SellAll:InvokeServer()
    end,
})

sellFishGroupButton:AddButton({
    Title = "Sell Hand",
    Variant = "Primary",
    Callback = function()
        ReplicatedStorage.events.Sell:InvokeServer()
    end,
})

sections.Item5:AddToggle("AutoSellHand", {
    Title = "Auto Sell Held Item",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        variables.autosellingHand = isEnabled
        while isEnabled do
            ReplicatedStorage.events.Sell:InvokeServer()
            task.wait()
        end
    end,
})

sections.Item5:AddParagraph({Title = gradient("Favouriting")})

local fishNames = {}
if type(data.Fish) == "table" then
    for fishName, fishData in pairs(data.Fish) do
        table.insert(fishNames, fishName)
    end
end

sections.Item5:AddDropdown("FishFavSelectDropDown", {
    Title = "Select Fishes",
    Description = "",
    Options = fishNames,
    Default = "",
    PlaceHolder = "Select Fish(s)",
    Multiple = true,
    Callback = function(selectedFishes)
        genv.SelectedFishes = selectedFishes
        
        -- Convert the selectedFishes table to a string and print it
        local selectedFishesStr = table.concat(selectedFishes, ", ")
        print("Selected Fishes: " .. selectedFishesStr)
    end,
})



local connection

sections.Item5:AddToggle("AutoFav", {
    Title = "Auto Favourite",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.AutoFav = isEnabled
        if connection then
            connection:Disconnect()
        end
        if genv.AutoFav then
            connection = LocalPlayer.Backpack.ChildAdded:Connect(function(child)
                if table.find(genv.SelectedFishes, child.Name) then
                    LocalPlayer.PlayerGui.hud.safezone.backpack.events.favourite:FireServer(child)
                end
            end)
        end
    end,
})

local favFishGroupButton = sections.Item5:AddGroupButton()

favFishGroupButton:AddButton({
    Title = "Fav All",
    Variant = "Primary",
    Callback = function()
        for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if not item:FindFirstChild("link") then continue end
            local link = item.link.Value
        
            if not link:FindFirstChild("Favourited") then
                services.ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Backpack/Favourite"):FireServer(item)
            end
        end
    end,
})



favFishGroupButton:AddButton({
    Title = "Unfav All",
    Variant = "Primary",
    Callback = function()
        for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if not item:FindFirstChild("link") then continue end
            local link = item.link.Value
        
            if link:FindFirstChild("Favourited") then
                services.ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Backpack/Favourite"):FireServer(item)
            end
        end
    end,
})



genv.AppraiseParagraph = sections.Item1:AddParagraph({Title = "", Description = "Info"})

local mutationNames = {}

-- Assuming `Mutations` holds the mutation data
if type(data.Mutations) == "table" then
    for mutationName, mutationData in pairs(data.Mutations) do
        -- Debugging: Print the Chance value to check its format
        -- print(mutationName, mutationData.Chance)

        -- Check if the Chance value is not "0"
        if mutationData.Chance ~= "0" then
            -- Add mutation name to the list if Chance is not "0"
            table.insert(mutationNames, mutationName)
        end
    end
end

-- Function to convert RGB to rich text
local function rgbToRichText(rgbString, text)
    -- Split the RGB string into individual components
    local r, g, b = rgbString:match("([^,]+),([^,]+),([^,]+)")
    r, g, b = tonumber(r), tonumber(g), tonumber(b)

    -- Return the text in rich text format with the specified RGB color
    return string.format("<font color=\"rgb(%d,%d,%d)\">%s</font>", r * 255, g * 255, b * 255, text)
end

local function updateAppraiseDescription()
    local selectedMutation = genv.SelectedMutation or {}
    local selectedMutationText = ""

    -- If there are multiple selected mutations, display them as "Name/Name" with colors
    if #selectedMutation > 0 then
        local coloredMutations = {}
        for _, mutationName in ipairs(selectedMutation) do
            local mutationData = data.Mutations[mutationName]
            local mutationColor = mutationData and mutationData.Color or "1,1,1" -- Default to white if no color is defined
            table.insert(coloredMutations, rgbToRichText(mutationColor, mutationName))
        end
        selectedMutationText = table.concat(coloredMutations, "/")
    end

    -- Calculate chance and value multiplier for the selected mutation
    local totalChance = 0
    for _, mutationName in pairs(mutationNames) do
        local mutation = data.Mutations[mutationName]
        if mutation and mutation.Chance and mutation.Chance ~= "0" then
            totalChance = totalChance + tonumber(mutation.Chance)
        end
    end
    local selectedMutationData = data.Mutations[selectedMutation[1]] -- Assume the first selected mutation for chance calculation
    local selectedChance = selectedMutationData and selectedMutationData.Chance or "0"
    local chancePercentage = tonumber(selectedChance) / totalChance * 100
    local formattedChance = string.format("%.2f", chancePercentage)
    local mutationPrice = selectedMutationData and selectedMutationData.PriceMultiply or "N/A"

    -- Build the `SelectedMutationPlus` description
    local result = {}
    local hasSparkling, hasShiny, hasBig, hasGiant = false, false, false, false

    -- Check if SelectedMutationPlus exists and is not empty
    if genv.SelectedMutationPlus and #genv.SelectedMutationPlus > 0 then
        for _, mutation in ipairs(genv.SelectedMutationPlus) do
            if mutation == "Sparkling" then
                hasSparkling = true
            elseif mutation == "Shiny" then
                hasShiny = true
            elseif mutation == "Big" then
                hasBig = true
            elseif mutation == "Giant" then
                hasGiant = true
            end
        end

        if hasSparkling and hasShiny then
            table.insert(result, "<font color='#fff0bc'>Sparkling, Shiny</font>")
        elseif hasSparkling then
            table.insert(result, "<font color='#fff0bc'>Sparkling</font>")
        elseif hasShiny then
            table.insert(result, "<font color='#fff0bc'>Shiny</font>")
        end

        if hasBig and hasGiant then
            table.insert(result, "<font color='#8bff89'>Big/Giant</font>")
        elseif hasBig then
            table.insert(result, "<font color='#8bff89'>Big</font>")
        elseif hasGiant then
            table.insert(result, "<font color='#8bff89'>Giant</font>")
        end
    end

    -- Combine all parts of the description
    local descriptionParts = {}
    if selectedMutationText ~= "" then
        table.insert(descriptionParts, selectedMutationText)
    end
    if #result > 0 then
        table.insert(descriptionParts, table.concat(result, ", "))
    end

    local richDescription = table.concat(descriptionParts, ", ")

    -- Update the description in the UI
    genv.AppraiseParagraph:SetDesc(richDescription)
end


-- SelectedMutation dropdown
genv.SelectedMutationToggle = sections.Item1:AddDropdown("SelectedMutation", {
    Title = "Select Mutation",
    Description = "If you select multiple, it'll stop at any it gets.",
    Options = mutationNames,
    Default = "",
    PlaceHolder = "Select Mutation",
    Multiple = true,
    AllowNull = true,  -- Allow deselection
    Callback = function(selectedMutation)
        genv.SelectedMutation = selectedMutation or ""  -- Handle null case
        updateAppraiseDescription()
    end,
})

-- SelectedMutationPlus dropdown
genv.SelectedMutationPlusToggle = sections.Item1:AddDropdown("SelectedMutationPlus", {
    Title = "Select Mutation Plus",
    Description = "If you select both sparkling and shiny, it'll go until you get both. If you select both big and giant it'll stop at either one.",
    Options = {"Sparkling", "Shiny", "Big", "Giant"},
    Default = {},
    PlaceHolder = "Select Mutation Plus",
    Multiple = true,
    AllowNull = true,
    Callback = function(selectedMutationPlus)
        genv.SelectedMutationPlus = selectedMutationPlus or {}  -- Handle null case
        updateAppraiseDescription()
    end,
})


genv.AutoAppraiseToggle = sections.Item1:AddToggle("AutoAppraise", {
    Title = "Auto Appraise",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.AutoAppraise = isEnabled
        if genv.AutoAppraise then
            validFish = ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/AppraiseAnywhere/HaveValidFish"):InvokeServer()
            if not validFish then
                lib:Notification("Auto Appraise", "Not holding fish or invalid fish.", 5)
                genv.AutoAppraiseToggle:Set(false)
                return
            elseif validFish then
                print("normal mode..")
                local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                local currentTool = tostring(tool:WaitForChild("link").Value)

                local inventoryConnection

                -- Check if the current fish already meets criteria
                local inventory = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]
                local criteria = {}
                local requirementsMet = {}
                local meetsRequirements = true

                if genv.SelectedMutation and #genv.SelectedMutation > 0 then
                    -- Add all selected mutations to criteria
                    for _, selectedMutation in ipairs(genv.SelectedMutation) do
                        table.insert(criteria, selectedMutation)
                    end
                
                    -- Check if Mutation.Value exists in SelectedMutation
                    if inventory:FindFirstChild("Mutation") and table.find(genv.SelectedMutation, inventory.Mutation.Value) then
                        table.insert(requirementsMet, inventory.Mutation.Value)
                    else
                        meetsRequirements = false
                    end
                end
                

                for _, mutation in ipairs(genv.SelectedMutationPlus or {}) do
                    table.insert(criteria, mutation)
                    if mutation == "Sparkling" and not inventory:FindFirstChild("Sparkling") then
                        meetsRequirements = false
                    elseif mutation == "Shiny" and not inventory:FindFirstChild("Shiny") then
                        meetsRequirements = false
                    elseif mutation == "Big" or mutation == "Giant" then
                        local weight = tonumber(inventory:FindFirstChild("Weight").Value)
                        print(weight)
                        local baseWeight = tonumber(data.Fish[tool.Name].WeightPool[2] / 10)
                        print(baseWeight)
                        if mutation == "Giant" and weight <= baseWeight * 1.99 then
                            meetsRequirements = false
                        elseif mutation == "Big" and weight <= baseWeight then
                            meetsRequirements = false
                        else
                            table.insert(requirementsMet, mutation)
                        end
                    end
                end

                print("Criteria: " .. table.concat(criteria, ", "))
                print("Requirements met: " .. table.concat(requirementsMet, ", "))

                if meetsRequirements then
                    print("Current fish meets all criteria. No need to appraise.")
                    genv.AutoAppraiseToggle:Set(false)
                    return
                end

                -- If not meeting criteria, appraise the fish
                task.spawn(function()
                    workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
                end)

                inventoryConnection = LocalPlayer.Backpack.ChildAdded:Connect(function(item)
                    if not genv.AutoAppraise then
                        if inventoryConnection then
                            inventoryConnection:Disconnect()
                            inventoryConnection = nil
                        end
                    end

                    if tostring(item:WaitForChild("link").Value) ~= currentTool then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
                        item = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                        task.wait()
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
                        task.wait(1)
                        currentTool = tostring(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):WaitForChild("link").Value)

                        -- Repeat criteria checks for the new item
                        inventory = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]
                        criteria = {}
                        requirementsMet = {}
                        meetsRequirements = true

                        if genv.SelectedMutation and #genv.SelectedMutation > 0 then
                            -- Add all selected mutations to criteria
                            for _, selectedMutation in ipairs(genv.SelectedMutation) do
                                table.insert(criteria, selectedMutation)
                            end
                        
                            -- Check if Mutation.Value exists in SelectedMutation
                            if inventory:FindFirstChild("Mutation") and table.find(genv.SelectedMutation, inventory.Mutation.Value) then
                                table.insert(requirementsMet, inventory.Mutation.Value)
                            else
                                meetsRequirements = false
                            end
                        end
                        

                        for _, mutation in ipairs(genv.SelectedMutationPlus or {}) do
                            table.insert(criteria, mutation)
                            if mutation == "Sparkling" and not inventory:FindFirstChild("Sparkling") then
                                meetsRequirements = false
                            elseif mutation == "Shiny" and not inventory:FindFirstChild("Shiny") then
                                meetsRequirements = false
                            elseif mutation == "Big" or mutation == "Giant" then
                                local weight = tonumber(inventory:FindFirstChild("Weight").Value)
                                local baseWeight = tonumber(data.Fish[item.Name].WeightPool[2])
                                if mutation == "Giant" and weight <= baseWeight * 1.99 then
                                    meetsRequirements = false
                                elseif mutation == "Big" and weight <= baseWeight then
                                    meetsRequirements = false
                                else
                                    table.insert(requirementsMet, mutation)
                                end
                            end
                        end

                        print("Criteria: " .. table.concat(criteria, ", "))
                        print("Requirements met: " .. table.concat(requirementsMet, ", "))

                        if meetsRequirements then
                            print("All requirements met! Stopping auto-appraise.")
                            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                            if inventoryConnection then
                                genv.AutoAppraiseToggle:Set(false)
                                inventoryConnection:Disconnect()
                                inventoryConnection = nil
                                return
                            end
                        else
                            pcall(function()
                                workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
                            end)
                            repeat task.wait() until not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                        end
                    end
                end)
            end
        end
    end,
})
sections.Item1:AddButton({
    Title = "Appraise Once",
    Variant = "Outline",
    Callback = function()
        validFish = ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/AppraiseAnywhere/HaveValidFish"):InvokeServer()
        if not validFish then
            lib:Notification("Auto Appraise", "Not holding fish or invalid fish.", 5)
            genv.AutoAppraiseToggle:Set(false)
            return
        else
            task.spawn(function()
                workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
            end)
            inventoryConnection2 = LocalPlayer.Backpack.ChildAdded:Connect(function(item)
                -- set the item parent to character
                if item:IsA("Tool") then
                    item.Parent = LocalPlayer.Character
                end
            end)
        end
    end,
})


-- genv.AutoAppraiseToggle = sections.Item1:AddToggle("AutoAppraise", {
--     Title = "Auto Appraise",
--     Default = false,
--     Description = "",
--     Callback = function(isEnabled)
--         genv.AutoAppraise = isEnabled
--         if genv.AutoAppraise then
--             validFish = ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/AppraiseAnywhere/HaveValidFish"):InvokeServer()
--             if not validFish then
--                 lib:Notification("Auto Appraise", "Not holding fish or invalid fish.", 5)
--                 genv.AutoAppraiseToggle:Set(false)
--                 return
--             elseif validFish then
--                 print("normal mode..")
--                 local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--                 local currentTool = tostring(tool:WaitForChild("link").Value)

--                 local inventoryConnection

--                 task.spawn(function()
--                     workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
--                 end)
                
--                 inventoryConnection = LocalPlayer.Backpack.ChildAdded:Connect(function(item)
--                     if not genv.AutoAppraise then
--                         if inventoryConnection then
--                             inventoryConnection:Disconnect()
--                             inventoryConnection = nil
--                         end
--                     end

--                     if tostring(item:WaitForChild("link").Value) ~= currentTool then
--                         game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
--                         item = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--                         LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                         task.wait()
--                         game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
--                         currentTool = tostring(item:WaitForChild("link").Value)

--                         local inventory = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]
                        
--                         -- Build criteria string
--                         local criteria = {}
--                         if genv.SelectedMutation and genv.SelectedMutation ~= "" then
--                             table.insert(criteria, genv.SelectedMutation)
--                         end
--                         for _, mutation in ipairs(genv.SelectedMutationPlus or {}) do
--                             table.insert(criteria, mutation)
--                         end
--                         print("Criteria: " .. table.concat(criteria, ", "))
                        
--                         -- Track requirements met
--                         local requirementsMet = {}
--                         local meetsRequirements = true
                        
--                         -- Check regular mutation first
--                         if genv.SelectedMutation and genv.SelectedMutation ~= "" then
--                             if inventory:FindFirstChild("Mutation") and 
--                                inventory:FindFirstChild("Mutation").Value == genv.SelectedMutation then
--                                 table.insert(requirementsMet, genv.SelectedMutation)
--                             else
--                                 meetsRequirements = false
--                             end
--                         end
                        
--                         -- Check mutation plus requirements if any are selected and mutation requirement was met
--                         if meetsRequirements and #genv.SelectedMutationPlus > 0 then
--                             -- Check Sparkling
--                             if table.find(genv.SelectedMutationPlus, "Sparkling") then
--                                 if inventory:FindFirstChild("Sparkling") then
--                                     table.insert(requirementsMet, "Sparkling")
--                                 else
--                                     meetsRequirements = false
--                                 end
--                             end
                            
--                             -- Check Shiny
--                             if table.find(genv.SelectedMutationPlus, "Shiny") then
--                                 if inventory:FindFirstChild("Shiny") then
--                                     table.insert(requirementsMet, "Shiny")
--                                 else
--                                     meetsRequirements = false
--                                 end
--                             end
                            
--                             -- Check Big/Giant
--                             local requiresBig = table.find(genv.SelectedMutationPlus, "Big") ~= nil
--                             local requiresGiant = table.find(genv.SelectedMutationPlus, "Giant") ~= nil
                            
--                             if requiresBig or requiresGiant then
--                                 local weight = tonumber(inventory:FindFirstChild("Weight").Value)
--                                 local baseWeight = tonumber(data.Fish[item.Name].WeightPool[2])
                                
--                                 if requiresGiant and weight > baseWeight * 1.99 then
--                                     table.insert(requirementsMet, "Giant")
--                                 elseif requiresBig and weight > baseWeight then
--                                     table.insert(requirementsMet, "Big")
--                                 else
--                                     meetsRequirements = false
--                                 end
--                             end
--                         end
                        
--                         -- Print current fish info
--                         if inventory:FindFirstChild("Mutation") then
--                             print("Current fish mutation: " .. inventory.Mutation.Value)
--                         end
--                         print("Requirements met: " .. table.concat(requirementsMet, ", "))
                        
--                         -- If all requirements are met, stop auto-appraising
--                         if meetsRequirements then
--                             print("All requirements met! Stopping auto-appraise.")
--                             LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                             if inventoryConnection then
--                                 genv.AutoAppraiseToggle:Set(false)
--                                 inventoryConnection:Disconnect()
--                                 inventoryConnection = nil
--                                 return
--                             end
--                         else
--                             -- Continue appraising if requirements aren't met
--                             pcall(function()
--                                 workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
--                             end)
--                             repeat task.wait() until not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--                         end
--                     end
--                 end)
--             end
--         end
--     end,
-- })

-- genv.AutoAppraiseToggle = sections.Item1:AddToggle("AutoAppraise", {
--     Title = "Auto Appraise",
--     Default = false,
--     Description = "",
--     Callback = function(isEnabled)
--         genv.AutoAppraise = isEnabled
--         if genv.AutoAppraise then
--             validFish = ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/AppraiseAnywhere/HaveValidFish"):InvokeServer()
--             if not validFish then
--                 lib:Notification("Auto Appraise","Not holding fish or invalid fish.", 5)
--                 genv.AutoAppraiseToggle:Set(false)
--                 return
--             elseif validFish then
--                 print("normal mode..")
--                 local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--                 local currentTool = tostring(tool:WaitForChild("link").Value)


--                 local inventoryConnection

--                 task.spawn(function()
--                     workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
--                 end)
--                 inventoryConnection = LocalPlayer.Backpack.ChildAdded:Connect(function(item)

--                     if not genv.AutoAppraise then
--                         if inventoryConnection then
--                             inventoryConnection:Disconnect()
--                             inventoryConnection = nil
--                         end
--                     end

--                     if tostring(item:WaitForChild("link").Value) ~= currentTool then

--                         game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
--                         item = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--                         LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                         task.wait()
--                         game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
--                         currentTool = tostring(item:WaitForChild("link").Value)

--                         if ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]:FindFirstChild("Mutation") then
--                             -- print(ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]:FindFirstChild("Mutation").Value)
--                             -- print(genv.SelectedMutation)
--                             if #genv.SelectedMutationPlus > 0 then
--                                 -- if in there is sparkling then
--                                 if ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]:FindFirstChild("Sparkling") ~= nil then
--                                     -- print("sparkling is in there")
--                                 end
--                                 -- if in there is shiny then
--                                 if ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]:FindFirstChild("Shiny") ~= nil then
--                                     -- print("shiny is in there")
--                                 end
--                                 -- if in there is big then
--                                 if tonumber(ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]:FindFirstChild("Weight").Value) > tonumber(data.Fish[item.Name].WeightPool[2]) then
--                                     -- print("big")
--                                 end
--                                 if tonumber(ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]:FindFirstChild("Weight").Value) > tonumber(data.Fish[item.Name].WeightPool[2] * 1.99) then
--                                     -- print("giant")
--                                 end
--                                 -- and if it's big/giant then just use the big's threshold..

--                                 -- anyways, after that, move onto the next part below where it does the mutation check.


--                             if ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]:FindFirstChild("Mutation").Value == genv.SelectedMutation then
--                                 LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                 if inventoryConnection then
--                                     genv.AutoAppraiseToggle:Set(false)
--                                     inventoryConnection:Disconnect()
--                                     inventoryConnection = nil
--                                     return
--                                 end
--                             end
--                         end
--                         pcall(function()
--                             workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
--                         end)
--                         repeat task.wait() until not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--                     end
--                 end
--                 end)
--             end
--         end
--     end,
-- })

genv.EnchantParagraph = sections.Item2:AddParagraph({Title = "", Description = "Info"})


-- Populate the enchant names for the dropdown
local enchantNames = {}
if type(data.Enchants) == "table" then
    for enchantName, enchantData in pairs(data.Enchants) do
        -- Add enchant name to list
        table.insert(enchantNames, enchantName)
    end
end

-- Add the enchant dropdown
sections.Item2:AddDropdown("EnchantSelectDropDown", {
    Title = "Selected Enchant",
    Description = "",
    Options = enchantNames,  -- Populate with enchant names
    Default = "",
    PlaceHolder = "Select Enchant",
    Multiple = false,
    Callback = function(selectedEnchant)
        -- Store the selected enchant name
        genv.SelectedEnchant = selectedEnchant
        
        -- Fetch the description and color of the selected enchant
        local enchantDescription = data.Enchants[selectedEnchant] and data.Enchants[selectedEnchant].Description or "No description available"
        local enchantColor = data.Enchants[selectedEnchant] and data.Enchants[selectedEnchant].Color or "1,1,1"  -- Default to white if no color
        
        -- Convert the color and description to rich text format
        local coloredText = rgbToRichText(enchantColor, selectedEnchant)
        local richDescription = coloredText .. "\n" .. enchantDescription
        
        -- Update the description
        genv.EnchantParagraph:SetDesc(richDescription)
    end,
})

genv.AutoEnchantToggle = sections.Item2:AddToggle("AutoEnchantToggle", {
    Title = "Auto Enchant",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.AutoEnchant = isEnabled
        
        if genv.AutoEnchant then
            if data.Enchants[genv.SelectedEnchant].IsExalted then
                if not workspace[LocalPlayer.Name]:FindFirstChild("Exalted Relic") then
                    lib:Notification("Auto Enchant","Please hold an Exalted Relic.", 5)
                    genv.AutoEnchantToggle:Set(false)
                    return
                end
            elseif not data.Enchants[genv.SelectedEnchant].IsExalted then
                if not workspace[LocalPlayer.Name]:FindFirstChild("Enchant Relic") then
                    lib:Notification("Auto Enchant","Please hold an Enchant Relic.", 5)
                    genv.AutoEnchantToggle:Set(false)
                    return
                end
            end
            if ReplicatedStorage.world.cycle.Value ~= "Night" then
                lib:Notification("Auto Enchant","It needs to be night time.", 5)
                genv.AutoEnchantToggle:Set(false)
                return 
            end
            if ReplicatedStorage.playerstats[LocalPlayer.Name].Rods[getEquippedRod()].Value == genv.SelectedEnchant then
                lib:Notification("Auto Enchant","You already have this enchant.", 5)
                genv.AutoEnchantToggle:Set(false)
                return 
            end
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1310, -799, -82)
        end
        task.wait(1)
        while genv.AutoEnchant do
            task.wait(0.1)
            if workspace.world.interactables:FindFirstChild("Enchant Altar"):FindFirstChild("ProximityPrompt").Enabled and genv.AutoEnchant then
                if data.Enchants[genv.SelectedEnchant].IsExalted then
                    if not workspace[LocalPlayer.Name]:FindFirstChild("Exalted Relic") then
                        lib:Notification("Auto Enchant","Please hold an Exalted Relic.", 5)
                        genv.AutoEnchantToggle:Set(false)
                        return
                    end
                elseif not data.Enchants[genv.SelectedEnchant].IsExalted then
                    if not workspace[LocalPlayer.Name]:FindFirstChild("Enchant Relic") then
                        lib:Notification("Auto Enchant","Please hold an Enchant Relic.", 5)
                        genv.AutoEnchantToggle:Set(false)
                        return
                    end
                end

                -- fireproximityprompt(workspace.world.interactables["Enchant Altar"].ProximityPrompt, 0)
                workspace.world.interactables:FindFirstChild("Enchant Altar"):FindFirstChild("ProximityPrompt").Parent = LocalPlayer.Character
                local player = services.Players.LocalPlayer
                local char = player.Character

                for _, obj in ipairs(char:GetChildren()) do
                    if obj:IsA("ProximityPrompt") then
                        obj.HoldDuration = 0
                        obj:InputHoldBegin()
                        task.wait(0.01)
                        obj:InputHoldEnd()
                        obj.Parent = workspace.world.interactables:FindFirstChild("Enchant Altar")
                    end
                end              
                task.wait(0.5)
                if LocalPlayer.PlayerGui.over:FindFirstChild("prompt") then
                    local confirmButton = LocalPlayer.PlayerGui.over.prompt.confirm
                    if getconnections then
                        for i, v in pairs(getconnections(confirmButton.MouseButton1Click)) do
                            v.Function()
                        end
                    else
                        firesignal(confirmButton.MouseButton1Click)
                    end
                end                
            end
            if ReplicatedStorage.playerstats[LocalPlayer.Name].Rods[getEquippedRod()].Value == genv.SelectedEnchant then
                genv.AutoEnchantToggle:Set(false)
            end
        end
    end,
})

-- sections.Item3:AddParagraph({Title = '<font color="#ea00ff">T</font><font color="#cc00ff">o</font><font color="#af00ff">t</font><font color="#9100ff">e</font><font color="#7400ff">m</font><font color="#5700ff">s</font>', Description = ""})

-- Create a list for totems
local totemItems = {}
if type(data.Items) == "table" then
    for itemName, itemData in pairs(data.Items) do
        if itemName:find("Totem") then
            -- Add items containing "Totem" to the totem list
            table.insert(totemItems, itemName)
        end
    end
end

-- Add the totems to the dropdown
sections.Item3:AddDropdown("DayTotem", {
    Title = "Totem - Day",
    Description = "",
    PlaceHolder = "Select Totem - Day",
    Options = totemItems,  -- Populate the dropdown with filtered totems
    Default = "",
    Multiple = false,
    Callback = function(SelectedTotem)
        -- print("Selected Totem:", SelectedTotem)
        genv.SelectedDayTotem = SelectedTotem
    end,
})


sections.Item3:AddDropdown("NightTotem", {
    Title = "Totem - Night",
    Description = "",
    Options = totemItems,
    Default = "",
    PlaceHolder = "Select Totem - Night",
    Multiple = false,
    Callback = function(SelectedTotem)
        -- print("Selected Totem:", SelectedTotem)
        genv.SelectedNightTotem = SelectedTotem
        
    end
})

genv.LastCycle = nil
genv.AutoPurchaseIfNone = false
genv.TotemInUse = false
sections.Item3:AddToggle("AutoTotemToggle", {
    Title = "Auto Totem",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.AutoTotemToggle = isEnabled
        if genv.AutoTotemToggle then
            if variables.AutoCast then
                lib:Notification("Auto Totem", "Auto Totem has compatibility issues with auto fishing and will be very glitchy.", 5)
            end
        end
        while genv.AutoTotemToggle do
            task.wait(1)
            
            local currentCycle = ReplicatedStorage.world.cycle.Value

            if currentCycle ~= genv.LastCycle then
                if currentCycle == "Day" then
                    if not LocalPlayer.Backpack:FindFirstChild(genv.SelectedDayTotem) and genv.AutoPurchaseIfNone == true then
                        game:GetService('ReplicatedStorage').events.purchase:FireServer(genv.SelectedDayTotem, "Item", nil, 1)
                        task.wait(1)
                    end

                    if LocalPlayer.Backpack:FindFirstChild(genv.SelectedDayTotem) then
                        genv.TotemInUse = true
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                        LocalPlayer.Backpack:FindFirstChild(genv.SelectedDayTotem).Parent = LocalPlayer.Character
                    end

                    if workspace[LocalPlayer.Name]:FindFirstChild(genv.SelectedDayTotem) then
                        workspace[LocalPlayer.Name][genv.SelectedDayTotem]:Activate()
                    end
                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                    genv.TotemInUse = false
                elseif currentCycle == "Night" then
                    if not LocalPlayer.Backpack:FindFirstChild(genv.SelectedNightTotem) and genv.AutoPurchaseIfNone == true then
                        game:GetService('ReplicatedStorage').events.purchase:FireServer(genv.SelectedDayTotem, "Item", nil, 1)
                        task.wait(1)
                    end

                    if LocalPlayer.Backpack:FindFirstChild(genv.SelectedNightTotem) then
                        genv.TotemInUse = true
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                        LocalPlayer.Backpack:FindFirstChild(genv.SelectedNightTotem).Parent = LocalPlayer.Character
                    end

                    if workspace[LocalPlayer.Name]:FindFirstChild(genv.SelectedNightTotem) then
                        workspace[LocalPlayer.Name][genv.SelectedNightTotem]:Activate()
                    end
                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                    genv.TotemInUse = false
                end

                genv.LastCycle = currentCycle
                genv.TotemInUse = false
            end
        end
    end,
})

sections.Item3:AddToggle("AutoTotemToggle", {
    Title = "Auto Purchase Totem",
    Default = false,
    Description = " Auto Purcahse(s) Totem if you got none",
    Callback = function(isEnabled)
        genv.AutoPurchaseIfNone = isEnabled
    end,
})

sections.Item3:AddParagraph({
    Title = gradient("Sundial"),
    Description = "Uses Sundial Totem until the event."
})


local eventList = {"Megalodon", "Night of the Fireflies", "Night of the Luminous", "Shiny Surge", "Mutation Surge"}
sections.Item3:AddDropdown("EventTotem", {
    Title = "Select Event",
    Description = "",
    Options = eventList,
    Default = "",
    PlaceHolder = "Select Event",
    Multiple = false,
    Callback = function(SelectedEvent)
        genv.SelectedEvent = SelectedEvent
    end
})


sections.Item3:AddToggle("AutoTotemToggle", {
    Title = "Auto Sundial",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.AutoSundial = isEnabled
        if genv.AutoSundial then
            if variables.AutoCast then
                lib:Notification("Auto Sundial", "Auto Sundial has compatibility issues with auto fishing and will be very glitchy.", 5)
            end
        end
        while genv.AutoSundial do
            local currentCycle = ReplicatedStorage.world.cycle.Value

            if currentCycle ~= genv.LastCycle then
                -- Special case for "Megalodon"
                if genv.SelectedEvent == "Megalodon" then
                    local foundMegalodon = false

                    for _, child in pairs(workspace.zones.fishing:GetChildren()) do
                        if child:FindFirstChild("beacon") then
                            local poiHeader = child:FindFirstChild("POIHeader")
                            if poiHeader and poiHeader:FindFirstChild("title") and poiHeader.title:IsA("TextLabel") then
                                print("Event title:", poiHeader.title.Text)
                                if poiHeader.title.Text:find("Megalodon") then
                                    print("Megalodon detected in POIHeader, waiting for it to end.")
                                    foundMegalodon = true
                    
                                    -- Wait until "Megalodon" is no longer present
                                    while genv.AutoSundial do
                                        local currentText = poiHeader.title.Text
                                        if not currentText:find("Megalodon") then
                                            print("Megalodon event ended.")
                                            break
                                        end
                                        task.wait(1)
                                    end
                    
                                    -- Exit loop since "Megalodon" was found
                                    break
                                end
                            end
                        end
                    
                        local abundance = child:FindFirstChild("Abundance")
                        if abundance and abundance:FindFirstChild("Chance") and abundance:FindFirstChild("Mutation") then
                            print("Fishing zone:", child.Name)
                            if child.Name:find("Megalodon") then
                                print("Megalodon detected in fishing zone name, waiting for it to end.")
                                foundMegalodon = true
                    
                                -- Wait until "Megalodon" is no longer in the name
                                while genv.AutoSundial do
                                    if not child.Name:find("Megalodon") then
                                        print("Megalodon event ended in fishing zone name.")
                                        break
                                    end
                                    task.wait(1)
                                end
                    
                                -- Exit loop since "Megalodon" was found
                                break
                            end
                        end
                    end
                    
                    -- If Megalodon was not found, execute fallback behavior
                    if not foundMegalodon then
                        if variables.AutoCast then
                            _G.setToFalse = true
                            variables.Caster:Set(false)
                        end
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                        LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack["Sundial Totem"])
                        LocalPlayer.Character["Sundial Totem"]:Activate()
                        LocalPlayer.Character["Sundial Totem"].Parent = LocalPlayer.Backpack
                        task.wait(1)
                        if _G.setToFalse then
                            variables.Caster:Set(true)
                            _G.setToFalse = false
                        end
                    end
                    
                else
                    -- Default behavior
                    if ReplicatedStorage.world.event.Value == genv.SelectedEvent then
                        print("Event matched: ", genv.SelectedEvent)
                    else
                        print(ReplicatedStorage.world.event.Value)
                        -- if variables.AutoCast then
                        --     _G.setToFalse = true
                        --     variables.Caster:Set(false)
                        --     task.wait(3)
                        -- end
                        -- variables.Caster:Set(false)
                        genv.UsingTotem = true
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                        LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack["Sundial Totem"])
                        LocalPlayer.Character["Sundial Totem"]:Activate()
                        LocalPlayer.Character["Sundial Totem"].Parent = LocalPlayer.Backpack
                        -- LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                        -- task.wait(3)
                        genv.UsingTotem = false
                        -- variables.Caster:Set(true)
                        -- task.wait(3)
                        -- if _G.setToFalse then
                        --     variables.Caster:Set(true)
                        --     _G.setToFalse = false
                        -- end
                    end
                end

                -- Update the LastCycle tracker
                genv.LastCycle = currentCycle
            end

            task.wait(1)
        end
    end,
})


sections.Item3:AddToggle("AutoMeteorToggle", {
    Title = "Auto Meteor",
    Default = false,
    Description = "Automatically collects item from meteor.",
    Callback = function(isEnabled)
        genv.AutoMeteor = isEnabled
        if genv.AutoMeteor then
            AutoMeteorConnection = workspace:WaitForChild("MeteorItems").ChildAdded:Connect(function(child)
                local oldPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
                LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.MeteorItems[child.Name].WorldPivot
            
                local meteorPrompt = nil
            
                for _, child in ipairs(workspace:WaitForChild("MeteorItems"):GetDescendants()) do
                    if child:IsA("ProximityPrompt") then
                        meteorPrompt = child
                        print("here")
                        break
                    end
                end
                task.wait(3)
                print('here2')
                if meteorPrompt then
                    print('here3')
                    fireproximityprompt(meteorPrompt)
                    task.wait(1)
                    LocalPlayer.Character.HumanoidRootPart.CFrame = oldPosition
                end
            end)
        else
            if AutoMeteorConnection ~= nil then
                AutoMeteorConnection:Disconnect()
                AutoMeteorConnection = nil
            end
        end
    end,
})

sections.Item3:AddToggle("AutoMeteorToggle", {
    Title = "Auto Purchase Sundial",
    Default = false,
    Description = "Automatically purchases more Sundial Totem(s) if you don't have any.",
    Callback = function(isEnabled)
        genv.AutoPurchaseSundial = isEnabled
        while genv.AutoPurchaseSundial do
            local heldTool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if heldTool ~= "Sundial Totem" then
                --not holding.
                if not LocalPlayer.Backpack["Sundial Totem"] then
                    -- not in backpack either, gotta purchase..
                    game:GetService('ReplicatedStorage').events.purchase:FireServer("Sundial Totem", "Item", nil, 1)
                else 
                    -- LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack["Sundial Totem"])
                end
            else
                -- still got sundial, and in hand.
            end
            task.wait(1)
        end
    end,
})


-- sections.Item4:AddParagraph({Title = '<font color="#ea00ff">T</font><font color="#d700ff">r</font><font color="#c500ff">e</font><font color="#b200ff">a</font><font color="#a000ff">s</font><font color="#8e00ff">u</font><font color="#7b00ff">r</font><font color="#6900ff">e</font><font color="#5700ff">s</font>', Description = ""})
-- sections.Item4:AddParagraph({Title = gradient("Dupe Info"), Description = "<b>The items selected below will be duped.</b>\nFor example: If you have 20 treasure maps and use 3 and got the selected item, the remaining 17 maps will be used and you'll be left with 17 of that item."})

-- local treasureNames = {}
-- if type(data.Treasure) == "table" then
--     for treasureName, treasureData in pairs(data.Treasure) do
--         table.insert(treasureNames, treasureName)
--     end
-- end

-- sections.Item4:AddDropdown("TreasureItems", {
--     Title = "Select Item(s)",
--     Description = "",
--     PlaceHolder = "Select Item - Treasure",
--     Options = treasureNames,
--     Default = "",
--     Multiple = true,
--     Callback = function(SelectedTreasureItems)
--         genv.SelectedTreasureItems = SelectedTreasureItems

--         for _, item in ipairs(genv.SelectedTreasureItems) do
--             print(item)
--         end
--     end,
-- })

local function interactWithChest(chest)
    if chest and chest:FindFirstChild("ProximityPrompt") then
        local prompt = chest.ProximityPrompt
        prompt.HoldDuration = 0
        prompt.MaxActivationDistance = math.huge
        
        local player = services.Players.LocalPlayer
        local char = player.Character
        
        -- Temporarily parent the ProximityPrompt to the character
        prompt.Parent = char
        task.wait()
        for _, obj in ipairs(char:GetChildren()) do
            if obj:IsA("ProximityPrompt") then
                obj:InputHoldBegin()
                task.wait(0.01)
                obj:InputHoldEnd()
                obj:Destroy() -- Remove the prompt
                chest:Destroy() -- Destroy the chest after interaction
            end
        end
    else
        warn("Chest or ProximityPrompt not found!")
    end
end



local function fixAllMaps()
    LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
        if v.Name == "Treasure Map" then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            print("equipped, remote..")
            workspace.world.npcs["Jack Marrow"].treasure.repairmap:InvokeServer()
            print("remote success")
        end
    end
end

local function collectAllChests()
    for i, v in pairs(workspace.world.chests:GetDescendants()) do
        if v:IsA("Part") and v:FindFirstChild("ChestSetup") then 
            for _, v in pairs(workspace.world.chests:GetDescendants()) do
                if v.Name == "ProximityPrompt" then
                    if fireproximityprompt then
                        fireproximityprompt(v)
                    else
                        interactWithChest(v)
                    end
                end
            end
        end 
    end
end


sections.Item4:AddToggle("RepairMapCollectTreasureToggle", {
    Title = "Auto Repair & Collect Treasure(s)",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        variables.MapToggle = isEnabled
        while variables.MapToggle do
            if genv.TreasureDupeAllowed then
                -- Dupe Mode
                print("wait mode")
                local mapCount = 0

                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == "Treasure Map" then
                        mapCount = mapCount + 1
                    end
                end
                print(mapCount)
                print(genv.MinMapAmount)
                if mapCount >= genv.MinMapAmount then
                    print('above')
                    print(mapCount)
                    print(genv.MinMapAmount)
                    fixAllMaps()

                    
                    local announcements = LocalPlayer.PlayerGui.hud.safezone.announcements

                    DUPEMODECONNECTION = announcements.ChildAdded:Connect(function(child)
                        if child.Name == "Template" then
                            local main = child:FindFirstChild("Main")
                            if main and main:IsA("TextLabel") then
                                for _, item in ipairs(genv.SelectedTreasureItems or {}) do
                                    if main.Text:find(item) then
                                        if item:find("Sunken") then
                                            -- Check if "Rod" is also present in the text
                                            if not main.Text:find("Rod") then
                                                print("Found Sunken but not Rod:", item)
                                                genv.treasureDupeMode = true
                                                collectAllChests()
                                                DUPEMODECONNECTION:Disconnect()
                                                genv.treasureDupeMode = false
                                                break
                                            else
                                                print("Ignored because it contains Rod:", item)
                                            end
                                        else
                                            print("found:", item)
                                            genv.treasureDupeMode = true
                                            collectAllChests()
                                            DUPEMODECONNECTION:Disconnect()
                                            genv.treasureDupeMode = false
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    

                    -- Collect Treasure
                    for i, v in pairs(workspace.world.chests:GetDescendants()) do
                        if v:IsA("Part") and v:FindFirstChild("ChestSetup") then 
                            for _, v in pairs(workspace.world.chests:GetDescendants()) do
                                if v.Name == "ProximityPrompt" then
                                    if not variables.MapToggle or genv.treasureDupeMode then
                                        break
                                    end
                                    
                                    if fireproximityprompt then
                                        fireproximityprompt(v)
                                    else
                                        interactWithChest(v.Parent.Name)
                                    end
                                    task.wait(1)
                                end
                            end
                        end 
                    end
                end
            else
                -- Normal, Auto Mode
                print("do.")
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                    if v.Name == "Treasure Map" then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        print("equipped, remote..")
                        workspace.world.npcs["Jack Marrow"].treasure.repairmap:InvokeServer()
                        print("remote success")
                    end
                end

                -- Collect Treasure
                for i, v in pairs(workspace.world.chests:GetDescendants()) do
                    if v:IsA("Part") and v:FindFirstChild("ChestSetup") then 
                        for _, v in pairs(workspace.world.chests:GetDescendants()) do
                            if v.Name == "ProximityPrompt" then
                                if not variables.MapToggle then
                                    break
                                end       
                                
                                if fireproximityprompt then
                                    fireproximityprompt(v)
                                else
                                    interactWithChest(v.Parent.Name)
                                end
                                task.wait(1)
                            end
                        end
                    end 
                end
            end
            DestroyGhostItems()
            task.wait(1)
        end
    end,
})


local treasureGroupButton = sections.Item4:AddGroupButton()

treasureGroupButton:AddButton({
    Title = "Repair Held Map",
    Variant = "Outline",
    Callback = function()
        -- should add a check to see if they're holding or not lol
        workspace.world.npcs["Jack Marrow"].treasure.repairmap:InvokeServer()
    end,
})

treasureGroupButton:AddButton({
    Title = "Use Held Map",
    Variant = "Outline",
    Callback = function()
        local treasureCoordinates = tostring(LocalPlayer.PlayerGui["Treasure Map"].Main.CoordinatesLabel.Text)

        -- Extract the coordinates from the text
        local x, y, z = treasureCoordinates:match("X ([%d%.%-]+), Y ([%d%.%-]+), Z ([%d%.%-]+)")
        
        if x and y and z then
            local formattedString = string.format("TreasureChest_%s_%s_%s", x, y, z)
            print(formattedString)
            
            local chest = workspace.world.chests:FindFirstChild(formattedString)
            if chest then
                if fireproximityprompt then
                    fireproximityprompt(chest.ProximityPrompt)
                else       
                    interactWithChest(chest)
                end
            else
                lib:Notification("Use Held Map", "Treasure chest not found!", 5)
            end
            
            task.wait()
        else
            lib:Notification("Use Held Map", "An error has occurred, make sure you're holding the map.", 5)
        end
    end,
})

-- treasureGroupButton:AddButton({
--     Title = "Repair All Maps",
--     Variant = "Primary",
--     Callback = function()
--         for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
--             if v.Name == "Treasure Map" then
--                 game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
--                 print("equipped, remote..")
--                 workspace.world.npcs["Jack Marrow"].treasure.repairmap:InvokeServer()
--                 print("remote success")
--             end
--         end
--     end,
-- })

-- treasureGroupButton:AddButton({
--     Title = "Collect All Treasures",
--     Variant = "Primary",
--     Callback = function()
--         for i, v in pairs(workspace.world.chests:GetDescendants()) do
--             if v:IsA("Part") and v:FindFirstChild("ChestSetup") then 
--                 for _, v in pairs(workspace.world.chests:GetDescendants()) do
--                     if v.Name == "ProximityPrompt" then
--                         task.wait(1)
--                         fireproximityprompt(v)
--                     end
--                 end
--                 task.wait(1)
--             end 
--         end
--     end,
-- })


treasureGroupButton:AddButton({
    Title = "Use All Fillionaires",
    Variant = "Primary",
    Callback = function()
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
        local Fillionaire = LocalPlayer.Backpack:FindFirstChild("Fillionaire")
        local FillionaireLink = tostring(Fillionaire.link.Value)
        local FillionaireAmount = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[FillionaireLink].Stack.Value
        
        if Fillionaire then
            for _ = 1, FillionaireAmount do
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):EquipTool(Fillionaire)
            end
        end
        task.wait(1)
        local mainGui = LocalPlayer.PlayerGui.Fillionaire.Main

        for _, child in ipairs(mainGui:GetChildren()) do
            if child.Name == "Template" and child.Visible then
                local playerNumbers = child:FindFirstChild("PlayerNumbers")
                if playerNumbers then
                    for i = 1, 4 do
                        local numberButton = playerNumbers:FindFirstChild(tostring(i))
                        if numberButton and numberButton:IsA("GuiButton") then
                            if getconnections then
                                for _, v in pairs(getconnections(numberButton.MouseButton1Click)) do
                                    v.Function()
                                end
                            else
                                firesignal(numberButton.MouseButton1Click)
                            end
                            -- print("Triggered MouseButton1Click for:", numberButton.Name) -- Debug
                        end
                    end
                end
                task.wait()
                child:Destroy()
            end
        end
    end,
})

sections.Item4:AddParagraph({Title = gradient("Dupe Info"), Description = "<b>The items selected below will be duped.</b>\nFor example: If you have 20 treasure maps and use 3 and got the selected item, the remaining 17 maps will be used and you'll be left with 17 of that item."})

-- local treasureNames = {}
-- if type(data.Treasure) == "table" then
--     for treasureName, treasureData in pairs(data.Treasure) do
--         table.insert(treasureNames, treasureName)
--     end
-- end




sections.Item4:AddDropdown("TreasureItems", {
    Title = "Select Item(s)",
    Description = "",
    PlaceHolder = "Select Item - Treasure",
    Options = {"Aurora Totem", "Meteor Totem", "Tempest Totem", "Fillionaire", "Magic Thread", "Ancient Thread", "Lunar Thread", "Weird Algae", "Truffle Worm", "Quality Bait Crate", "XP (Untested)", "[Sunken] Fish"},
    Default = "",
    Multiple = true,
    Callback = function(SelectedTreasureItems)
        -- Modify the selected items
        genv.SelectedTreasureItems = {}

        for _, item in ipairs(SelectedTreasureItems) do
            if item == "XP (Untested)" then
                table.insert(genv.SelectedTreasureItems, "XP")
            elseif item == "[Sunken] Fish" then
                table.insert(genv.SelectedTreasureItems, "Sunken")
            else
                table.insert(genv.SelectedTreasureItems, item)
            end
        end

        -- Debug: Print the modified list
        print("Selected Treasure Items:", table.concat(genv.SelectedTreasureItems, ", "))
    end,
})



sections.Item4:AddToggle("EnableTreasureDupe", {
    Title = "Enable Treasure Dupe",
    Default = false,
    Description = "Auto Repair & Collect Treasures still needs to be on.",
    Callback = function(isEnabled)
        genv.TreasureDupeAllowed = isEnabled
        print()
    end,
})

sections.Item4:AddSlider("MinMapAmount", {
    Title = "Minimum Map Amount",
    Description = "20 is recommended for more effective duping.",
    Default = 20,
    Min = 0,
    Max = 20,
    Increment = 1,
    Callback = function(value)
        genv.MinMapAmount = value
    end,
})


variables.TeleLocationParagraph = sections.Tele:AddParagraph({Title = gradient("Location Info"), Description = "X,Y,Z | Location"})

task.spawn(function()
    while wait(1) do
        local position = LocalPlayer.Character.HumanoidRootPart.Position
        local zone = workspace[LocalPlayer.Name].zone.Value
        formattedPosition = string.format("%.1f, %.1f, %.1f", position.X, position.Y, position.Z)
        formattedPositionWithZone = string.format("%.1f, %.1f, %.1f | %s", position.X, position.Y, position.Z, tostring(zone))
        variables.TeleLocationParagraph:SetDesc(formattedPositionWithZone)
    end
end)

 

local function loadSavedLocations()
    pcall(function()
        local savedLocations = {}
        local savedPositions = {}
        local data = readfile("Lunor/Fisch/saved_teleports.json")

        
        for teleportSaveName, formattedPosition in data:gmatch('"(.-)" = "(.-)"') do
            table.insert(savedLocations, teleportSaveName)
            savedPositions[teleportSaveName] = formattedPosition
        end

        return savedLocations, savedPositions
    end)
end

savedLocations, savedPositions = loadSavedLocations()

genv.SavedLocationsDropDown = sections.Tele:AddDropdown("SavedLocations", {
    Title = "Saved Locations Teleport",
    Description = "",
    Options = savedLocations,
    PlaceHolder = "Select Location",
    Default = "",
    Multiple = false,
    Callback = function(selectedLocation)
        local position = savedPositions[selectedLocation]
        genv.SelectedSavedLocations = savedPositions[selectedLocation]
        if position then
            local x, y, z = position:match("([^,]+),([^,]+),([^,]+)")
            x, y, z = tonumber(x), tonumber(y), tonumber(z)
            ChangePlayerCFrame(x, y, z)
        end
    end,
})

sections.Tele:AddTextbox({
    Title = "Save: Name",
    Default = "",
    Description = "",
    PlaceHolder = "Input",
    TextDisappear = false,
    Callback = function(teleportSaveName)
        variables.teleportSaveName = teleportSaveName
    end
})

local teleportGroupButton = sections.Tele:AddGroupButton()

teleportGroupButton:AddButton({
    Title = "Save Location",
    Callback = function()
        if formattedPosition then
            local teleportData = string.format('"%s" = "%s"\n', variables.teleportSaveName, formattedPosition)
            appendfile("Lunor/Fisch/saved_teleports.json", teleportData)
            lib:Notification("Save Location", "Successfully saved location " .. formattedPosition .. " as " .. variables.teleportSaveName, 5)
            savedLocations, savedPositions = loadSavedLocations()
            genv.SavedLocationsDropDown:Refresh(savedLocations, true)
        else
            lib:Notification("Error", "Formatted position is nil. Cannot save location.", 5)
        end
    end,
})


teleportGroupButton:AddButton({
    Title = "Delete Location",
    Callback = function()
        local selectedLocation = genv.SavedLocationsDropDown.Value
        if selectedLocation and selectedLocation ~= "" then
            -- Read current file content
            local data = readfile("Lunor/Fisch/saved_teleports.json")
            
            -- Create new content excluding the selected location
            local newContent = ""
            for teleportSaveName, formattedPosition in data:gmatch('"(.-)" = "(.-)"') do
                if teleportSaveName ~= selectedLocation then
                    newContent = newContent .. string.format('"%s" = "%s"\n', teleportSaveName, formattedPosition)
                end
            end
            
            -- Write the new content back to file
            writefile("Lunor/Fisch/saved_teleports.json", newContent)
            
            -- Update the saved locations and refresh dropdown
            savedLocations, savedPositions = loadSavedLocations()
            genv.SavedLocationsDropDown:Refresh(savedLocations, true)
            genv.SavedLocationsDropDown:Set()
            
            -- Show success notification
            lib:Notification("Delete Location", "Successfully deleted location: " .. selectedLocation, 5)
        else
            lib:Notification("Error", "Please select a location to delete", 5)
        end
    end,
})

sections.Tele1:AddDropdown("TeleportMethod", {
    Title = "Teleportation Method",
    Description = "Choose CFrame for instant teleportation or Tween for a smooth flight to the destination.",
    Options = {"Tween", "CFrame"},
    Default = "CFrame",
    Multiple = false,
    Callback = function(selectedOptions)
        if selectedOptions == "CFrame" then
            variables.TeleportMethod = true
            variables.TweenMethod = false
        elseif selectedOptions == "Tween" then
            variables.TweenMethod = true
            variables.TeleportMethod = false
        end
    end,
})

local Players = Players
local Workspace = game:GetService("Workspace")

local persistentPlayers = {}

Workspace.ChildAdded:Connect(function(child)
    if child:IsA("Model") and Players:FindFirstChild(child.Name) then
        if child:FindFirstChild("Humanoid") then
            child.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
            if not table.find(persistentPlayers, child.Name) then
                table.insert(persistentPlayers, child.Name)
                -- print("Updated Persistent List:", table.concat(persistentPlayers, ", "))
                pcall(function()
                    genv.PlayerDropDown:Refresh(persistentPlayers, true)
                    genv.PlayerDropDown:Set(persistentPlayers)
                end)
            end
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if character:FindFirstChild("Humanoid") then
            character.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
            if not table.find(persistentPlayers, player.Name) then
                table.insert(persistentPlayers, player.Name)
                -- print("Updated Persistent List:", table.concat(persistentPlayers, ", "))
                pcall(function()
                    genv.PlayerDropDown:Refresh(persistentPlayers, true)
                    genv.PlayerDropDown:Set(persistentPlayers)
                end)
            end
        end
    end)
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
        if not table.find(persistentPlayers, player.Name) then
            table.insert(persistentPlayers, player.Name)
        end
    end
    player.CharacterAdded:Connect(function(character)
        if character:FindFirstChild("Humanoid") then
            character.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
            if not table.find(persistentPlayers, player.Name) then
                table.insert(persistentPlayers, player.Name)
                -- print("Updated Persistent List:", table.concat(persistentPlayers, ", "))
                pcall(function()
                    genv.PlayerDropDown:Refresh(persistentPlayers, true)
                    genv.PlayerDropDown:Set(persistentPlayers)
                end)
            end
        end
    end)
end

genv.PlayerDropDown = sections.Tele1:AddDropdown("PlayerTeleport", {
    Title = "Players",
    Description = "",
    Options = persistentPlayers,
    Default = "",
    PlaceHolder = "Select Player",
    Multiple = false,
    Callback = function(selectedPlayer)
        genv.selectedPlayer = selectedPlayer
        LocalPlayer.Character.HumanoidRootPart.CFrame = workspace[selectedPlayer].HumanoidRootPart.CFrame
    end,
})


sections.Tele1:AddDropdown("FishZones", {
    Title = "Fishing Zones",
    Description = "",
    Options = zoneNames,
    Default = "",
    PlaceHolder = "Select Zone",
    Multiple = false,
    Callback = function(selectedZone)
        genv.selectedZone = selectedZone
        local part = workspace.zones.fishing:FindFirstChild(selectedZone)
        if part then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame
        end
    end,
})

local eventNames = {}  -- Create an empty table to store zone names
local nameCount = {}   -- Create a table to track the count of each name
local zoneMapping = {} -- Create a table to map display names to actual part names

-- Iterate through all children in the fishing zones
for _, child in pairs(workspace.zones.fishing:GetChildren()) do
    -- Check for zones that have a "beacon" and a "POIHeader" with a "title"
    if child:FindFirstChild("beacon") then
        local poiHeader = child:FindFirstChild("POIHeader")
        if poiHeader and poiHeader:FindFirstChild("title") and poiHeader.title:IsA("TextLabel") then
            local zoneName = poiHeader.title.Text
            -- Track the count of each name and modify the name if it's repeated
            if not nameCount[zoneName] then
                nameCount[zoneName] = 1
            else
                nameCount[zoneName] = nameCount[zoneName] + 1
            end

            -- If there are duplicates, append the count to the name
            if nameCount[zoneName] > 1 then
                zoneName = zoneName .. " (" .. nameCount[zoneName] .. ")"
            end

            -- Map the display name to the actual part name
            zoneMapping[zoneName] = child.Name

            -- Add the modified zone name to the list
            table.insert(eventNames, zoneName)
        end
    end

    -- Check for zones with "Abundance", "Chance", and "Mutation"
    local abundance = child:FindFirstChild("Abundance")
    if abundance and abundance:FindFirstChild("Chance") and abundance:FindFirstChild("Mutation") then
        local zoneName = child.Name
        -- Track the count of each name and modify the name if it's repeated
        if not nameCount[zoneName] then
            nameCount[zoneName] = 1
        else
            nameCount[zoneName] = nameCount[zoneName] + 1
        end

        -- If there are duplicates, append the count to the name
        if nameCount[zoneName] > 1 then
            zoneName = zoneName .. " (" .. nameCount[zoneName] .. ")"
        end

        -- Map the display name to the actual part name
        zoneMapping[zoneName] = child.Name

        -- Add the modified zone name to the list
        table.insert(eventNames, zoneName)
    end
end


-- ill finish it tmr
sections.Tele1:AddDropdown("FishZones", {
    Title = "Events",
    Description = "",
    Options = eventNames,
    Default = "",
    PlaceHolder = "Select Event",
    Multiple = true,
    Callback = function(selectedEvents)
        genv.selectedEventOverrides = selectedEvents
        -- Find the selected part by name and teleport the player
        for _, event in ipairs(selectedEvents) do
            print("Selected event:", event)

            -- Get the actual part name from the zoneMapping table
            local actualZoneName = zoneMapping[event]

            if actualZoneName then
                local part = workspace.zones.fishing:FindFirstChild(actualZoneName)
                if part then
                    print("Teleporting to part:", part)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame
                end
            end
        end
    end,
})


local areaTeleportNames = {}
genv.TpSpotsName = {}

for _, folder in pairs(workspace.world.spawns:GetChildren()) do
    if folder.Name ~= "TpSpots" and folder.Name ~= "loading" and folder.Name ~= "TeleportDelay" then
        table.insert(areaTeleportNames, folder.Name)
    end
end

for _,Place in pairs(workspace.world.spawns.TpSpots:GetChildren()) do
    table.insert(genv.TpSpotsName, Place.Name)
end

sections.Tele1:AddDropdown("AreaTeleports", {
    Title = "Areas",
    Description = "",
    Options = areaTeleportNames,
    PlaceHolder = "Select Area",
    Default = "",
    Multiple = false,
    Callback = function(selectedArea)
        local areaTeleportFolder = workspace.world.spawns:FindFirstChild(selectedArea)
        if areaTeleportFolder then
            local firstChild = areaTeleportFolder:GetChildren()[1]
            if firstChild and firstChild:IsA("BasePart") then
                ChangePlayerCFrame(firstChild.Position.X, firstChild.Position.Y, firstChild.Position.Z)
            end
        end
    end
})

sections.Tele1:AddDropdown("AreaTeleports2", {
    Title = "TP Spots",
    Description = "",
    Options = genv.TpSpotsName,
    Default = "",
    PlaceHolder = "Select Spot",
    Multiple = false,
    Callback = function(selectedArea)
        _G.TPSpots = workspace.world.spawns.TpSpots:FindFirstChild(selectedArea)
        
        if _G.TPSpots then
            ChangePlayerCFrame(_G.TPSpots.Position.X, _G.TPSpots.Position.Y + 5, _G.TPSpots.Position.Z)
        else
            warn("Selected area '" .. selectedArea .. "' does not exist.")
        end
    end
})


local NPC = {
    ["Inn Keeper Forsaken Shores"] = "-2476.73779296875, 133.00003051757812, 1573.2672119140625",
    ["Summit Inn Keeper 1"] = "19664.458984375, 132.45314025878906, 5245.27783203125",
    ["Rhea"] = "-1038.4249267578125, 203.33749389648438, -1115.580078125",
    ["Kenith"] = "-1143.18017578125, 134.6342315673828, -1077.2073974609375",
    ["Skin Seller"] = "302.2337646484375, 132.14491271972656, 205.36087036132812",
    ["Forsaken Skin Merchant"] = "-2564.42578125, 148.63946533203125, 1645.054443359375",
    ["Terrapin Shipwright"] = "5869.421875, 143.49795532226562, 7.101318359375",
    ["Pierre"] = "391.3885498046875, 135.348388671875, 196.71238708496094",
    ["Alfredrickus"] = "-1520.84228515625, 141.5052947998047, 764.6096801757812",
    ["Inn Keeper Snowcap"] = "2660.8125, 155.0608367919922, 2395.78857421875",
    ["Snowcap Skin Merchant"] = "2652.446044921875, 141.2260284423828, 2537.990966796875",
    ["Mushgrove Elf"] = "2409.3662109375, 135.85812377929688, -732.3370361328125",
    ["Daisy"] = "581.550048828125, 165.49075317382812, 213.49996948242188",
    ["Idle Fishing NPC Moosewood2"] = "365.4126892089844, 132.44651794433594, 182.0972137451172",
    ["Mushgrove Skin Merchant"] = "2642.84814453125, 129.79051208496094, -708.4285278320312",
    ["Runaway Elf"] = "-7.39788818359375, 322.27178955078125, -9295.1376953125",
    ["Jack Marrow"] = "-2830.748046875, 215.2417449951172, 1518.34814453125",
    ["Terrapin Elf"] = "-160.50210571289062, 139.4464874267578, 1896.0755615234375",
    ["Claudia"] = "-7.519559383392334, 157.2010040283203, -1065.5740966796875",
    ["Idle Fishing NPC Moosewood"] = "423.3988037109375, 136.25140380859375, 333.18975830078125",
    ["Roslit Skin Merchant"] = "-1626.4571533203125, 133.33004760742188, 616.2025756835938",
    ["Terrapin Angler"] = "-1706.8802490234375, 148.00003051757812, 754.8173217773438",
    ["Summit Inn Keeper 4"] = "19889.65234375, 1154.7476806640625, 5510.896484375",
    ["Inn Keeper DesolateDeep"] = "-1651.9581298828125, -214.17938232421875, -2833.086669921875",
    ["Maverick Merchant"] = "-982.96435546875, -245.1102294921875, -2692.517333984375",
    ["Phineas"] = "469.91229248046875, 150.69342041015625, 277.9549865722656",
    ["Hiker #7"] = "19669.998046875, 140.966064453125, 5301.51953125",
    ["Mel Merchant"] = "-1658.4344482421875, -214.2913360595703, -2819.47314453125",
    ["Max Merchant"] = "-929.8687133789062, 131.07882690429688, -1104.6328125",
    ["Wilson"] = "2940.719482421875, 280.7838134765625, 2569.629638671875",
    ["Roddy"] = "-1004.0133056640625, -244.91015625, -2737.48291015625",
    ["Hiker #5"] = "19790.9453125, 415.4871826171875, 5418.53173828125",
    ["Hiker #11"] = "20062.3515625, 1136.42822265625, 5521.576171875",
    ["Forsaken Elf"] = "-2488.8203125, 134.00784301757812, 1474.3687744140625",
    ["Hiker #12"] = "19922.19921875, 1138.01318359375, 5357.24169921875",
    ["Latern Keeper"] = "658.4459838867188, 163.5, 260.2139892578125",
    ["???"] = "-85.54763793945312, -515.29931640625, 1135.826171875",
    ["Forsaken3"] = "-2706.95458984375, 165.62498474121094, 1755.236328125",
    ["Idle Fishing NPC 2.5"] = "-1778.79052734375, 148.22744750976562, 653.3268432617188",
    ["Moosewood Elf"] = "401.2041931152344, 136.28366088867188, 305.82623291015625",
    ["Miller Merchant"] = "19574.537109375, 132.71607971191406, 5312.08056640625",
    ["Hiker #2"] = "19526.990234375, 132.71607971191406, 5326.3896484375",
    ["Summit Inn Keeper 2"] = "19750.71875, 416.0520935058594, 5382.96484375",
    ["Hiker #3"] = "19824.34375, 130.375, 5216.85693359375",
    ["Roslit Shipwright"] = "-1452.0543212890625, 133.0000457763672, 745.169189453125",
    ["Hiker #1"] = "19603.392578125, 169.7622528076172, 5351.04443359375",
    ["Snowcap Shipwright"] = "2622.93994140625, 136.28387451171875, 2401.30517578125",
    ["Hiker #9"] = "19802.94921875, 424.77880859375, 5356.3935546875",
    ["Hiker #10"] = "19944.62109375, 1142.7388916015625, 5541.900390625",
    ["Desolate Skin Merchant"] = "-1573.1217041015625, -289.9115295410156, -2965.453125",
    ["Hiker #6"] = "20131.880859375, 208.6810760498047, 5453.31298828125",
    ["Statue Shipwright"] = "23.2196044921875, 135.03036499023438, -1007.029052734375",
    ["Quiet Synph"] = "566.2632446289062, 152.00003051757812, 353.8721008300781",
    ["Appraiser"] = "453.182373046875, 150.50003051757812, 206.90878295898438",
    ["Clarence"] = "-1625.3936767578125, -231.07135009765625, -2903.8525390625",
    ["Custos"] = "21.590187072753906, -707.9070434570312, 1253.7547607421875",
    ["Meteoriticist"] = "5921.576171875, 261.98199462890625, 596.27197265625",
    ["Tenebris"] = "1061.18408203125, -631.1304321289062, 1310.313232421875",
    ["Lucas"] = "449.3396301269531, 181.99989318847656, 180.68907165527344",
    ["Abyssus"] = "1399.0474853515625, -1016.0322875976562, 966.2442016601562",
    ["Marc Merchant"] = "466.1600341796875, 151.00205993652344, 224.49708557128906",
    ["Forsaken2"] = "-2586.603271484375, 149.00967407226562, 1682.072265625",
    ["Man Working On Rowboat"] = "-1446.365478515625, 134.98231506347656, 702.0789794921875",
    ["The Depths Angler"] = "981.8839111328125, -702.6148681640625, 1232.17529296875",
    ["Hiker #4"] = "19595.90234375, 132.71607971191406, 5271.5751953125",
    ["Perditus"] = "770.0521240234375, -730.6285400390625, 1383.4951171875",
    ["Inn Keeper Roslit"] = "-1512.37890625, 133.00003051757812, 631.2435302734375",
    ["Aspicientis"] = "1214.53125, -708.64404296875, 1320.8018798828125",
    ["Tom Elf"] = "404.63018798828125, 136.81517028808594, 317.099609375",
    ["Idle Fishing NPC 1"] = "-1428.9964599609375, 133.00003051757812, 686.034423828125",
    ["Forsaken1"] = "-2593.36572265625, 149.00970458984375, 1676.066162109375",
    ["Ancient Elf"] = "5813.37841796875, 147.48866271972656, 267.740234375",
    ["Merlin"] = "-928.0328369140625, 223.7000274658203, -998.7449951171875",
    ["Travelling Merchant"] = "-1059.0887451171875, 130.74203491210938, -1170.650390625",
    ["Gatherer Archaeologist"] = "6028.23388671875, 194.9801483154297, 298.5621337890625",
    ["Submersus"] = "1211.426513671875, -1015.798095703125, 1315.8280029296875",
    ["Roslit Elf"] = "-1919.3199462890625, 499.4999694824219, 162.685546875",
    ["Idle Fishing NPC 2"] = "-1778.5130615234375, 148.42538452148438, 648.0894775390625",
    ["Occultus"] = "1022.309326171875, -705.2661743164062, 1564.7314453125",
    ["Milo Merchant"] = "957.1780395507812, -711.5802001953125, 1263.293212890625",
    ["Mike Merchant"] = "2717.568359375, 157.17335510253906, 2374.478759765625",
    ["Analyst Archaeologist"] = "6086.53662109375, 194.98025512695312, 277.4117431640625",
    ["Henry"] = "483.539306640625, 152.383056640625, 236.296142578125",
    ["Marina"] = "68.12350463867188, 159.0147705078125, -1040.607177734375",
    ["Mann Merchant"] = "6080.77685546875, 194.97999572753906, 308.7760009765625",
    ["The Depths Skin Merchant"] = "1036.80517578125, -807.3424072265625, 1443.938232421875",
    ["Apprentice Archaeologist"] = "6087.63671875, 194.980224609375, 280.2427978515625",
    ["Chiseler"] = "6087.37841796875, 194.9801788330078, 294.5010986328125",
    ["AncientIsle Angler"] = "5738.27880859375, 176.99285888671875, -51.95977783203125",
    ["Ancient Skin Merchant"] = "6029.15380859375, 194.8448028564453, 266.4958190917969",
    ["Inn Keeper AncientIsle"] = "6047.9111328125, 198.47718811035156, 335.5181884765625",
    ["Explorer Archaeologist"] = "5971.81591796875, 258.9874572753906, 236.7926025390625",
    ["Jack"] = "-180.81967163085938, 145.87623596191406, 1954.0701904296875",
    ["Sleeper"] = "-1498.0291748046875, -234.701416015625, -2852.48828125",
    ["Statue Elf"] = "43.9637451171875, 144.2205810546875, -1029.9287109375",
    ["Sunstone Shipwright"] = "-945.2999267578125, 131.07882690429688, -1116.234619140625",
    ["Forsaken Shipwright"] = "-2476.388427734375, 133.1121368408203, 1540.5460205078125",
    ["Marytn Merchant"] = "-2509.317138671875, 135.78355407714844, 1583.0770263671875",
    ["Inn Keeper"] = "487.4584655761719, 150.80003356933594, 231.49893188476562",
    ["Summit Shipwright"] = "19609.19140625, 131.42013549804688, 5186.5927734375",
    ["Orc"] = "-1848.1353759765625, 165.7111358642578, 165.60140991210938",
    ["Sunstone Angler"] = "-886.2785034179688, 133.9722137451172, -1118.807373046875",
    ["Moosewood Skin Merchant"] = "416.0176086425781, 134.859619140625, 189.09486389160156",
    ["Synph"] = "-138.2506561279297, -512.3742065429688, 1131.9312744140625",
    ["Mushgrove Guard"] = "2520.591064453125, 160.1083984375, -890.6786499023438",
    ["Arnold"] = "320.1063232421875, 133.97727966308594, 264.3226013183594",
    ["Agaric"] = "2601.31982421875, 132.3877410888672, -729.6150512695312",
    ["Inn Keeper Sunstone"] = "-904.1670532226562, 131.57933044433594, -1104.810546875",
    ["Paul"] = "381.74188232421875, 136.50003051757812, 341.8910217285156",
    ["mirror Area"] = "HumanoidRootPart not found",
    ["Matt Merchant"] = "-1454.2396240234375, 133.00003051757812, 675.738037109375",
    ["Summit Inn Keeper 3"] = "20298.84765625, 706.5057373046875, 5748.56591796875",
    ["Mods Latern Keeper"] = "-39.045677185058594, -246.5999755859375, 195.6443634033203",
    ["Moosewood Angler"] = "480.10247802734375, 150.5010528564453, 302.2268981933594",
    ["Snowcap Elf"] = "2638.445556640625, 141.78384399414062, 2425.3388671875",
    ["Santa Claus"] = "-159.24945068359375, 364.6510009765625, -9497.666015625",
    ["Sunstone Elf"] = "-894.0286865234375, 133.57225036621094, -1112.41064453125",
    ["Idle Fishing NPC Terrapin"] = "-71.04296875, 133.08493041992188, 2036.72509765625",
    ["Drew"] = "-35.971435546875, 140.4624481201172, -1104.604248046875",
    ["Leeri"] = "-142.27484130859375, -548.29931640625, 1426.4293212890625",
    ["Cole"] = "-20.985851287841797, 136.49261474609375, -1135.5667724609375",
    ["Ashe"] = "-1709.9970703125, 150.34718322753906, 729.2640380859375",
    ["Mushgrove Shipwright"] = "2453.97265625, 130.52963256835938, -661.6033325195312",
    ["Moosewood Shipwright"] = "357.97259521484375, 133.615966796875, 258.154541015625",
    ["Perdido"] = "-98.76107788085938, -566.29931640625, 1549.70361328125",
}

local Interactable = {
    ["Windset Totem"] = "2851.57421875, 178.1171112060547, 2703.02294921875",
    ["Long Rod"] = "485.6950378417969, 171.6563262939453, 145.74610900878906",
    ["Tidebreaker"] = "-1637.361328125, -213.62155151367188, -2848.759033203125",
    ["Flimsy Rod"] = "471.1076965332031, 148.36170959472656, 229.64244079589844",
    ["Tempest Totem"] = "36.4246826171875, 133.02679443359375, 1946.0823974609375",
    ["Refill Station"] = "20063.865234375, 1134.41455078125, 5524 .5302734375",
    ["Fortune Rod"] = "-1520.879638671875, 141.2832794189453, 771.94677734375",
    ["Fast Rod"] = "447.1835632324219, 148.22573852539062, 220.1874542236328",
    ["Flippers"] = "-1636.26708984375, -214.4133758544922, -2850.9501953125",
    ["Red Energy Crystal"] = "19922.52734375, 1139.0325927734375, 5351.244140625",
    ["Lost Rod"] = "2879.876953125, 135.7919158935547, 2727.4814453125",
    ["Aurora Totem"] = "-1812.632568359375, -139.7498779296875, -3279.98779296875",
    ["Basic Diving Gear"] = "369.1747741699219, 132.5088348388672, 248.7053680419922",
    ["Beginner Oxygen Tank"] = "19782.734375, 413.361572265625, 5384.38720703125",
    ["Summit Rod"] = "20207.75390625, 736.0582885742188, 5711.3515625",
    ["Enchant Altar"] = "1310.5465087890625, -799.4696044921875, -82.7303466796875",
    ["Steady Rod"] = "-1511.2352294921875, 139.67950439453125, 759.4171142578125",
    ["Kings Rod"] = "1375.576416015625, -810.2017211914062, -303.5092468261719",
    ["Carbon Rod"] = "454.0836181640625, 150.59007263183594, 225.32882690429688",
    ["Lucky Rod"] = "446.08599853515625, 148.2530059814453, 222.16000366210938",
    ["Glider"] = "-1713.796142578125, 145.90367126464844, 740.8370361328125",
    ["Smokescreen Totem"] = "2791.712158203125, 137.3506622314453, -629.4522705078125",
    ["Training Rod"] = "457.69384765625, 148.35752868652344, 230.414306640625",
    ["Phoenix Rod"] = "5971.03125, 270.37750244140625, 852.37255859375",
    ["Magnet Rod"] = "-194.99887084960938, 130.14808654785156, 1930.9710693359375",
    ["Quality Bait Crate"] = "-177.6083526611328, 141.68313598632812, 1932.85693359375",
    ["Basic Oxygen Tank"] = "19523.20703125, 130.6274871826172, 5328.50634765625",
    ["Intermediate Oxygen Tank"] = "20214.212890625, 734.760498046875, 5715.3271484375",
    ["Crab Cage"] = "474.8035888671875, 149.66456604003906, 229.49468994140625",
    ["Bait Crate"] = "384.57513427734375, 135.3519287109375, 337.53399658203125",
    ["Coral Geode"] = "-1641.544921875, -214.0647735595703, -2845.41796875",
    ["Blizzard Totem"] = "20148.748046875, 740.1343994140625, 5803.6611328125",
    ["Rod Of The Depths"] = "1704.840087890625, -903.5467529296875, 1447.786865234375",
    ["Winter Cloak"] = "19950.82421875, 1143.836181640625, 5581.42529296875",
    ["Avalanche Rod"] = "19770.181640625, 415.68096923828125, 5419.19677734375",
    ["Arctic Rod"] = "19578.236328125, 132.33837890625, 5307.3828125",
    ["Advanced Oxygen Tank"] = "19948.294921875, 1140.8302001953125, 5540.115234375",
    ["Pickaxe"] = "19783.19140625, 415.7436218261719, 5391.92041015625",
    ["Rapid Rod"] = "-1509.24462890625, 139.7259063720703, 759.628173828125",
    ["GPS"] = "517.896728515625, 149.21763610839844, 284.8568420410156",
    ["Meteor Totem"] = "-1945.8262939453125, 272.4389953613281, 231.54412841796875",
    ["Nocturnal Rod"] = "-141.87423706054688, -515.3135375976562, 1139.0452880859375",
    ["Sundial Totem"] = "-1149.452880859375, 134.5681915283203, -1077.2763671875",
    ["Plastic Rod"] = "454.4253845214844, 148.16973876953125, 229.17242431640625",
    ["Advanced Glider"] = "19939.048828125, 1140.6904296875, 5542.84912109375",
    ["Fish Radar"] = "365.75177001953125, 134.50498962402344, 274.1058044433594",
    ["Eclipse Totem"] = "5967.28271484375, 272.2904968261719, 836.9033813476562",
    ["Scurvy Rod"] = "-2828.218505859375, 213.4571990966797, 1512.2095947265625",
    ["Conception Conch"] = "-104.02766418457031, -735.5084838867188, 1211.6905517578125",
    ["Heaven's Rod"] = "20025.7578125, -468.9183654785156, 7146.93310546875",
}


local OptionnsInteractable = {}
local OptionsNpc = {}

for name, _ in pairs(NPC) do
    table.insert(OptionsNpc, name)
end

for name, _ in pairs(Interactable) do
    table.insert(OptionnsInteractable, name)
end

function parseCoordinates(coordString)
    local coords = {}
    for num in string.gmatch(coordString, "[-%d%.]+") do
        table.insert(coords, tonumber(num))
    end
    return unpack(coords)
end

for _, folder in pairs(workspace.world.spawns:GetChildren()) do
    if folder.Name ~= "TpSpots" and folder.Name ~= "loading" and folder.Name ~= "TeleportDelay" then
        table.insert(areaTeleportNames, folder.Name)
    end
end

sections.Tele1:AddDropdown("AreaTeleports3", {
    Title = "Interactables",
    Description = "",
    Options = OptionnsInteractable,
    Default = "",
    PlaceHolder = "Select Spot",
    Multiple = false,
    Callback = function(selectedArea)
        local coordString = Interactable[selectedArea]
        if coordString then
            ChangePlayerCFrame(parseCoordinates(coordString))
        end
    end
})

sections.Tele1:AddDropdown("AreaTeleports4", {
    Title = "NPCs",
    Description = "",
    Options = OptionsNpc,
    Default = "",
    PlaceHolder = "Select",
    Multiple = false,
    Callback = function(selectedNpc)
        local coordString = NPC[selectedNpc]
        if coordString then
            ChangePlayerCFrame(parseCoordinates(coordString))
        end
    end
})


sections.Tele2:AddTextbox({
    Title = "TP To Coordinates",
    PlaceHolder = "Enter Coords | Example: 1234,128,1239",
    Default = "",
    Description = "",   
    TextDisappear = true,
    Callback = function(TPCoord)
        local Coords = tostring(TPCoord)
        -- Split the string into x, y, z components
        local x, y, z = Coords:match("([^,]+),([^,]+),([^,]+)")
        
        -- Convert the string values to numbers
        local targetPosition = Vector3.new(tonumber(x), tonumber(y), tonumber(z))
        
        -- Set the player's position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
        
    end
})

sections.Tele2:AddButton({
    Title = "Discover All Locations",
    Variant = "Primary",
    Callback = function()
        for key, value in pairs(data.Locations) do
            services.ReplicatedStorage:WaitForChild("events"):WaitForChild("discoverlocation"):FireServer(key)
        end
    end,
})

sections.Tele2:AddParagraph({Title = "Something cool is coming..", Description = "Soon."})

-- genv.ROTDParagraph = sections.Tele2:AddParagraph({Title = "<font color=\"rgb(240, 50, 50)\">Rod Of The Depths</font>",
--                              Description = "Requirements:\n- Vertigo Bestiary Completed\n- Opened The Depths Door\n- Abyssal Enchant Relic\n- Hexed Enchant Relic\n- 750,000 C$\n<font color=\"rgb(255, 255, 255)\">Do not touch anything while it completes it.</font>"})

-- local ROTDGroupButton = sections.Tele2:AddGroupButton()

-- function ROTDCheck()
--     local Players = services.Players
--     local ReplicatedStorage = services.ReplicatedStorage
--     local LocalPlayer = Players.LocalPlayer
--     local Bestiary = ReplicatedStorage.playerstats[LocalPlayer.Name]:FindFirstChild("Bestiary")
--     local Cache = ReplicatedStorage.playerstats[LocalPlayer.Name]:FindFirstChild("Cache")
--     local Coins = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value
--     local inventory = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory
    
--     local requiredChildren = {
--         "Night Shrimp",
--         "Spiderfish",
--         "Twilight Eel",
--         "Fangborn Gar",
--         "Abyssacuda",
--         "Voidfin Mahi",
--         "Rubber Ducky",
--         "Isonade",
--         "The Depths Key",
--     }
    
--     local allFound = true
--     for _, childName in ipairs(requiredChildren) do
--         if not Bestiary or not Bestiary:FindFirstChild(childName) then
--             allFound = false
--             break
--         end
--     end
    
--     local bestiaryStatus = allFound and "<font color=\"rgb(0, 255, 0)\">Vertigo Bestiary Completed</font>" 
--                           or "<font color=\"rgb(255, 0, 0)\">Vertigo Bestiary Completed</font>"
    
--     local doorStatus = Cache and Cache:FindFirstChild("Door.TheDepthsGate") and 
--                        "<font color=\"rgb(0, 255, 0)\">Opened The Depths Door</font>" 
--                        or "<font color=\"rgb(255, 0, 0)\">Opened The Depths Door</font>"
    
--     local coinsStatus = Coins > 750000 and "<font color=\"rgb(0, 255, 0)\">750,000 C$</font>" 
--                             or "<font color=\"rgb(255, 0, 0)\">750,000 C$</font>"
    
--     local hexedStatus = false
--     local abyssalStatus = false
--     for _, item in pairs(inventory:GetChildren()) do
--         if item.Name:find("Enchant Relic") then
--             if item:FindFirstChild("Mutation") then
--                 if item.Mutation.Value == "Hexed" then
--                     hexedStatus = true
--                 end
--                 if item.Mutation.Value == "Abyssal" then
--                     abyssalStatus = true
--                 end
--             end
--         end
--     end
    
--     local hexedStatusText = hexedStatus and "<font color=\"rgb(0, 255, 0)\">Hexed Enchant Relic</font>" 
--                                         or "<font color=\"rgb(255, 0, 0)\">Hexed Enchant Relic</font>"
    
--     local abyssalStatusText = abyssalStatus and "<font color=\"rgb(0, 255, 0)\">Abyssal Enchant Relic</font>" 
--                                           or "<font color=\"rgb(255, 0, 0)\">Abyssal Enchant Relic</font>"
    
--     genv.ROTDParagraph:SetDesc(
--         "Requirements:\n" .. 
--         "- " .. bestiaryStatus .. "\n" ..
--         "- " .. doorStatus .. "\n" ..
--         "- " .. abyssalStatusText .. "\n" ..
--         "- " .. hexedStatusText .. "\n" ..
--         "- " .. coinsStatus .. "\n" ..
--         "<font color=\"rgb(255, 255, 255)\">Do not touch anything while it completes it.</font>"
--     )
-- end



-- ROTDGroupButton:AddButton({
--     Title = "Check Requirements",
--     Variant = "Outline",
--     Callback = function()
--         ROTDCheck()
--     end,
-- })


-- ROTDGroupButton:AddButton({
--     Title = "Complete & Buy ROTD",
--     Variant = "Primary",
--     Callback = function()
--         print("zz")
--     end,
-- })

-- genv.HeavenParagraph = sections.Tele2:AddParagraph({Title = "<font color=\"rgb(255, 255, 0)\">Heaven's Rod</font>",
--                              Description = "Requirements:\n- 1,750,000 C$\n<font color=\"rgb(255, 255, 255)\">Do not touch anything while it completes it.</font>"})

-- local HeavenGroupButton = sections.Tele2:AddGroupButton()

-- function HeavenCheck()
--     local Players = services.Players
--     local ReplicatedStorage = services.ReplicatedStorage
--     local LocalPlayer = Players.LocalPlayer
--     local Coins = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value
    
--     local coinsStatus = Coins > 1750000 and "<font color=\"rgb(0, 255, 0)\">1,750,000 C$</font>" 
--                             or "<font color=\"rgb(255, 0, 0)\">1,750,000 C$</font>"
    
--     genv.HeavenParagraph:SetDesc(
--         "Requirements:\n" ..
--         "- " .. coinsStatus .. "\n" ..
--         "<font color=\"rgb(255, 255, 255)\">Do not touch anything while it completes it.</font>"
--     )
-- end


-- HeavenGroupButton:AddButton({
--     Title = "Check Requirements",
--     Variant = "Outline",
--     Callback = function()
--         HeavenCheck()
--     end,
-- })
-- function HeavenRodGrabber()
--     local Players = services.Players
--     local Workspace = game:GetService("Workspace")
--     local ReplicatedStorage = services.ReplicatedStorage
--     local LocalPlayer = Players.LocalPlayer
--     LocalPlayer:RequestStreamAroundAsync(Vector3.new(20125.1328125, 210.0240020751953, 5449.103515625))
--     local BlueShardPath = nil
--     for _, v in pairs(Workspace.world.map["Northern Summit"]:GetDescendants()) do
--         if v:IsA("MeshPart") and v.Name == "Meshes/Shard1" and v.BrickColor == BrickColor.new("Electric blue") then
--             BlueShardPath = v.Parent.Parent
--             print(BlueShardPath)
--             break
--         end
--     end
--     LocalPlayer:RequestStreamAroundAsync(Vector3.new(19500.53515625, 332.25433349609375, 5548.9072265625))
--     local YellowShardPath = nil
--     for _, child in ipairs(workspace.world.map["Northern Summit"]:GetChildren()) do
--         if child.ClassName == "Model" and child:GetAttribute("ItemName") == "Yellow Energy Crystal" then
--             print(child.Name)
--             child.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
--             YellowShardPath = child
--         end
--     end

--     while genv.ProccessingRod do
--         local Backpack = LocalPlayer.Backpack
--         local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
--         if not Backpack:FindFirstChild("Pickaxe") then
--             services.ReplicatedStorage.events.purchase:FireServer("Pickaxe", "Item", nil, 1)
--         end
--         if not Backpack:FindFirstChild("Blue Energy Crystal") then
--             Character.HumanoidRootPart.CFrame = CFrame.new(20125.296875, 212.6418914794922, 5449.6962890625)
--             local Pickaxe = Backpack:FindFirstChild("Pickaxe") or Character:FindFirstChild("Pickaxe")
--             if Pickaxe then
--                 if Pickaxe.Parent == Backpack then
--                     Pickaxe.Parent = Character
--                 end
--                 repeat task.wait()
--                     Character.HumanoidRootPart.CFrame = CFrame.new(20125.296875, 212.6418914794922, 5449.6962890625)
--                     Character:FindFirstChild("Pickaxe"):Activate()
--                 until BlueShardPath:FindFirstChild("Root"):FindFirstChild("Prompt").Enabled
--                 fireproximityprompt(BlueShardPath.Root.Prompt)
--             end
--         end

--         if not Backpack:FindFirstChild("Green Energy Crystal") then
--         services.ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/NorthEvent/PlayerClaimItem"):InvokeServer()
--         end

--         if not Backpack:FindFirstChild("Red Energy Crystal") then
--             services.ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/NorthExp/PurchaseShard"):InvokeServer()
--         end
--         if not Backpack:FindFirstChild("Avalanche Totem") then
--             services.ReplicatedStorage.events.purchase:FireServer("Avalanche Totem", "Item", nil, 1)
--         end
--         repeat task.wait() until not services.ReplicatedStorage.world.totemInUse.value
--         game.Players.LocalPlayer.Character.Humanoid:EquipTool(services.Players.LocalPlayer.Backpack["Avalanche Totem"])
--         Character:WaitForChild("Avalanche Totem"):Activate()
--         repeat task.wait() until YellowShardPath.Root.Prompt.Enabled
--         LocalPlayer.Character.HumanoidRootPart.Position = YellowShardPath.Root.Position
--         YellowShardPath.Root.Prompt.Parent = LocalPlayer.Character
--         local char = LocalPlayer.Character
--         for _, obj in ipairs(char:GetChildren()) do
--             if obj:IsA("ProximityPrompt") then
--                 obj.HoldDuration = 0
--                 obj.MaxActivationDistance = math.huge
--                 obj:InputHoldBegin()
--                 task.wait(0.01)
--                 obj:InputHoldEnd()
--                 print("shoulda gotten it..")
--                 obj.Parent = YellowShardPath.Root
--             end
--         end
--         LocalPlayer:RequestStreamAroundAsync(Vector3.new(19964.609375, 1135.482666015625, 5348.857421875))
--         LocalPlayer.Character.HumanoidRootPart.Position  = workspace.world.map["Northern Summit"].ColoredGlassFloor.Hitbox.Position
--         local Crystals = {"Blue", "Green", "Red", "Yellow"}
--         local remote = services.ReplicatedStorage.packages.Net["RE/NorthFinalPuzzleService/Place"]

--         for _, crystal in ipairs(Crystals) do
--             remote:FireServer(crystal)
--         end

--         task.wait()
--     end
-- end

-- HeavenGroupButton:AddButton({
--     Title = "Complete & Buy Heaven's Rod",
--     Variant = "Primary",
--     Callback = function()
--         genv.ProccessingRod = true
--         HeavenRodGrabber()
--     end,
-- })



-- for _, spawnFolder in ipairs(workspace.world.spawns:GetChildren()) do
--     if spawnFolder:IsA("Folder") then
--         local newSection = tabs.Teleporation:AddSection({Title = spawnFolder.Name})
--         table.insert(sections, newSection)

--         newSection:AddParagraph({
--             Title = spawnFolder.Name,
--             Description = "Teleport Section for " .. spawnFolder.Name
--         })

--         TeleportationButton[spawnFolder.Name] = {
--             Section = newSection,
--             T1 = newSection:AddGroupButton()
--         }

--         for _, spawnPoint in ipairs(spawnFolder:GetChildren()) do
--             if spawnPoint:IsA("BasePart") then
--                 local spawnPosition = spawnPoint.Position

--                 local baseName = spawnPoint.Name
--                 local uniqueName = baseName

--                 if nameCounts[baseName] then
--                     nameCounts[baseName] = nameCounts[baseName] + 1
--                     uniqueName = baseName .. " (" .. nameCounts[baseName] .. ")"
--                 else
--                     nameCounts[baseName] = 1
--                 end

--                 TeleportationButton[spawnFolder.Name].T1:AddButton({
--                     Title = uniqueName,
--                     Variant = "Outline",
--                     Callback = function()
--                         ChangePlayerCFrame(spawnPosition.X, spawnPosition.Y, spawnPosition.Z)
--                     end,
--                 })
--             end
--         end
--     end
-- end

sections.Misc:AddParagraph({
    Title = gradient("Oxygen"),
})

local oxygenConnection
local oxygenPeaksConnection
local temperatureConnection

sections.Misc:AddToggle("AntiDrown", {
    Title = "Disable Oxygen - Normal",
    Default = true,
    Description = "",
    Callback = function(isEnabled)
        local oxygen = LocalPlayer.Character:FindFirstChild("client") and LocalPlayer.Character.client:FindFirstChild("oxygen")
        -- print("Oxygen Object:", oxygen)
        if isEnabled then
            if oxygen then
                -- print("Connecting to Oxygen Normal")
                oxygen.Disabled = true
                oxygenConnection = oxygen.Changed:Connect(function()
                    -- print("Oxygen Changed - Disabled:", oxygen.Disabled)
                    oxygen.Disabled = true
                end)
            end
        else
            if oxygenConnection then
                -- print("Disconnecting Oxygen Normal connection")
                oxygenConnection:Disconnect()
                oxygen.Enabled = true
            end
        end
    end,
})

sections.Misc:AddToggle("AntiDrown", {
    Title = "Disable Oxygen - Peaks",
    Default = true,
    Description = "",
    Callback = function(isEnabled)
        local oxygenPeaks = LocalPlayer.Character:FindFirstChild("client") and LocalPlayer.Character.client:FindFirstChild("oxygen(peaks)")
        -- print("Oxygen Peaks Object:", oxygenPeaks)
        if isEnabled then
            if oxygenPeaks then
                -- print("Connecting to Oxygen Peaks")
                oxygenPeaks.Disabled = true
                oxygenPeaksConnection = oxygenPeaks.Changed:Connect(function()
                    -- print("Oxygen Peaks Changed - Disabled:", oxygenPeaks.Disabled)
                    oxygenPeaks.Disabled = true
                end)
            end
        else
            if oxygenPeaksConnection then
                -- print("Disconnecting Oxygen Peaks connection")
                oxygenPeaksConnection:Disconnect()
                oxygenPeaks.Enabled = true
            end
        end
    end,
})

sections.Misc:AddToggle("AntiDrown", {
    Title = "Disable Temperature",
    Default = true,
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




sections.Misc:AddParagraph({
    Title = gradient("Others"),
})
genv.PlatformColor = Color3.new(1.000000, 1.000000, 1.000000)
genv.PlatFormsize = 15
genv.Platform = nil
sections.Misc3:AddColorpicker("PlatformColor", {
    Title = "PlatForm Color",
    Default = Color3.new(1.000000, 1.000000, 1.000000),
    Callback = function(selectedColor)
            if genv.Platform ~= nil then
            genv.Platform.Color = selectedColor
        else
            genv.PlatformColor = selectedColor
        end
    end,
})

sections.Misc3:AddSlider("PlatFormSize", {
    Title = "Platform Size",
    Description = "",
    Default = 15,
    Min = 0,
    Max = 255,
    Increment = 1,
    Callback = function(value)
        if genv.Platform ~= nil then
            genv.Platform.Size = Vector3.new(value, 1, value)
        else
            genv.PlatFormsize = value
        end
    end,
})

sections.Misc3:AddToggle("JesusMode", {
    Title = "Portable Platform",
    Default = false,
    Description = "Recommended",
    Callback = function(isEnabled)
        genv.PortablePlatform = isEnabled
    if genv.PortablePlatform  then
    genv.Platform = Instance.new("Part")
    genv.Platform.Name = LocalPlayer.Name .. " PortablePlatform"
    genv.Platform.Size = Vector3.new(genv.PlatFormsize, 1, genv.PlatFormsize)
    genv.Platform.Anchored = true
    genv.Platform.CanCollide = true
    genv.Platform.Material = Enum.Material.Neon
    genv.Platform.Shape = Enum.PartType.Ball
    genv.Platform.CFrame = CFrame.new(0,0,0)
    genv.Platform.Parent = LocalPlayer.Character
    elseif genv.PortablePlatform == false then
        if genv.Platform ~= nil then
        genv.Platform:Destroy()
        genv.Platform = nil
        end
    end

    while genv.PortablePlatform do

                -- Get the character's HumanoidRootPart
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

                -- Find the nearest terrain position that is water
                local nearestWaterPosition = nil
                local closestDistance = math.huge
                local desiredOffset = 1 -- Distance offset from the player

                -- Iterate over a smaller, more efficient grid
                for x = -50, 50, 5 do
                    for z = -50, 50, 5 do
                        local checkPosition = humanoidRootPart.Position + Vector3.new(x, 0, z)
                        local rayOrigin = Vector3.new(checkPosition.X, humanoidRootPart.Position.Y + 50, checkPosition.Z)
                        local rayDirection = Vector3.new(0, -100, 0)

                        -- Perform raycasting
                        local raycastParams = RaycastParams.new()
                        raycastParams.FilterDescendantsInstances = {workspace.Terrain}
                        raycastParams.FilterType = Enum.RaycastFilterType.Whitelist

                        local rayResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
                        if rayResult then
                            local hitPosition = rayResult.Position
                            local hitMaterial = rayResult.Material

                            -- Check if the material is water and ensure minimum offset
                            if hitMaterial == Enum.Material.Water then
                                local distance = (humanoidRootPart.Position - hitPosition).Magnitude
                                if distance < closestDistance and distance > desiredOffset then
                                    closestDistance = distance
                                    nearestWaterPosition = hitPosition
                                end
                            end
                        end
                    end
                end

                -- Teleport the bobber to the nearest water position
                if nearestWaterPosition then
                    local offsetDirection = (nearestWaterPosition - humanoidRootPart.Position).Unit
                    local finalPosition = nearestWaterPosition + offsetDirection * desiredOffset

                    genv.Platform.CFrame = CFrame.new(finalPosition)
                end

                task.wait() -- Adjust the wait time if necessary
            end

    end,
})


sections.Misc3:AddToggle("JesusMode", {
    Title = "Walk on water",
    Default = false,
    Description = "Old method",
    Callback = function(isEnabled)
        if isEnabled then
            for _, Ocean in pairs(game:GetService("Workspace").zones.fishing:GetDescendants()) do
                if Ocean:IsA("Part") and Ocean.Name == "Ocean" then 
                    Ocean.CanCollide = true
                end
                end
            for _, Ocean in pairs(game:GetService("Workspace").zones.fishing:GetDescendants()) do
                if Ocean:IsA("Part") and Ocean.Name == "Deep Ocean" then 
                    Ocean.CanCollide = true
                end
                end
        else
            for _, Ocean in pairs(game:GetService("Workspace").zones.fishing:GetDescendants()) do
                if Ocean:IsA("Part") and Ocean.Name == "Ocean" then 
                    Ocean.CanCollide = false
                end
                end
            for _, Ocean in pairs(game:GetService("Workspace").zones.fishing:GetDescendants()) do
                if Ocean:IsA("Part") and Ocean.Name == "Deep Ocean" then 
                    Ocean.CanCollide = false
                end
                end
        end
    end,
})


local PromptButtonHoldBegan = nil
genv.InstantPPToggle = sections.Misc:AddToggle("InstantProximityPrompt", {
    Title = "Instant Interact",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        if isEnabled then
            if fireproximityprompt then
                PromptButtonHoldBegan = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
                    fireproximityprompt(prompt)
                end)
            else
                lib:Notification('Incompatible Exploit', 'Your exploit does not support this feature (missing fireproximityprompt)')
                genv.InstantPPToggle:Set(false)
            end
        else
            if PromptButtonHoldBegan ~= nil then
                PromptButtonHoldBegan:Disconnect()
                PromptButtonHoldBegan = nil
            end
        end
    end,
})

sections.Misc:AddToggle("TitleLoop", {
    Title = "Loop Through Titles",
    Default = false,
    Description = "Others can see this, this is just for fun.",
    Callback = function(isEnabled)
        genv.TitleLoop = isEnabled
        local titleStats = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.title
        
        if titleStats then
            while genv.TitleLoop do
                for _, child in ipairs(titleStats:GetChildren()) do
                    services.ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Titles/Equip"):FireServer(child.Name)
                    -- print("Fired server with argument:", child.Name)
                    task.wait(0.05)
                    if not genv.TitleLoop then break end
                end
            end
        end
    end,
})


sections.Misc:AddToggle("RodLoop", {
    Title = "Loop Through Rods",
    Default = false,
    Description = "Others can see this, this is just for fun.",
    Callback = function(isEnabled)
        genv.RodLoop = isEnabled
        local rods = ReplicatedStorage:WaitForChild("playerstats"):WaitForChild(LocalPlayer.Name).Rods

        if rods then
            while genv.RodLoop do
                for _, child in ipairs(rods:GetChildren()) do
                    services.ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Rod/Equip"):FireServer(child.Name)

                    -- print("Fired equiprod event with argument:", child.Name)
                    task.wait(0.05)
                    if not genv.RodLoop then break end
                end
            end
        end
    end,
})

local Emotes = {}

for _,v in pairs(services.ReplicatedStorage.resources.animations.emotes:GetChildren()) do
    if v:IsA("Animation") then
        table.insert(Emotes, v.name)
    end
end

local OldAnimation
    function playEmote(name)
    if OldAnimation then OldAnimation:Stop() end
    OldAnimation = services.Players.LocalPlayer.Character.Humanoid:LoadAnimation(services.ReplicatedStorage.resources.animations.emotes[name])
    OldAnimation:Play()
    end

sections.Misc:AddDropdown("", {
    Title = "Emotes",
    Description = "Your able to play the animations (FE)",
    Options = Emotes,
    Default = "",
    Multiple = false,
    Callback = function(SelectedEmote)
        playEmote(SelectedEmote)
    end
})

sections.Misc:AddButton({
    Title = "Stop Emoting",
    Variant = "Primary",
    Callback = function()
       if OldAnimation then OldAnimation:Stop() end
    end,
})

sections.Misc:AddSlider("TiderBreaker", {
    Title = "Tidebreaker Speed",
    Description = "",
    Default = 6500,
    Min = 0,
    Max = 50000,
    Increment = 1,
    Callback = function(value)
        if character:FindFirstChild("Tidebreaker") then
            character:FindFirstChild("Tidebreaker"):WaitForChild("Core"):WaitForChild("VectorForce").Force = Vector3.new(value,0,0)
        elseif services.Players.LocalPlayer.Backpack:FindFirstChild("Tidebreaker") then
            services.Players.LocalPlayer.Backpack:FindFirstChild("Tidebreaker"):WaitForChild("Core"):WaitForChild("VectorForce").Force = Vector3.new(value,0,0)
        else
        lib:Notification("Error", "it seems like you don't own a tidebreaker", 5)
        end
    end,
})
genv.UHHHHHHWTF = false
sections.Misc:AddToggle("TideBreaker2", {
    Title = "Make TideBreaker Easier to Control",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
    genv.UHHHHHHWTF = isEnabled
    if genv.UHHHHHHWTF then
        if character:FindFirstChild("Tidebreaker") then
            character:FindFirstChild("Tidebreaker"):WaitForChild("Core"):WaitForChild("VectorForce").ApplyAtCenterOfMass = genv.UHHHHHHWTF
        elseif services.Players.LocalPlayer.Backpack:FindFirstChild("Tidebreaker") then
            services.Players.LocalPlayer.Backpack:FindFirstChild("Tidebreaker"):WaitForChild("Core"):WaitForChild("VectorForce").ApplyAtCenterOfMass = genv.UHHHHHHWTF
        else
        lib:Notification("Error", "it seems like you don't own a tidebreaker", 5)
        end
    end
    end,
})

local randomMiscButton = sections.Misc:AddGroupButton()

-- randomMiscButton:AddButton({
--     Title = "Refresh Dropdown",
--     Variant = "Outline",
--     Callback = function()
--         UpdatePlayerList()
--     end,
-- })


randomMiscButton:AddButton({
    Title = "Remove AFK Permanently",
    Variant = "Primary",
    Callback = function()
       ReplicatedStorage.events.afk:Destroy()
    end,
})


randomMiscButton:AddButton({
    Title = "Redeem All Codes",
    Variant = "Primary",
    Callback = function()
        if type(data.Codes) == "table" then
            for codeName in pairs(data.Codes) do
                ReplicatedStorage:WaitForChild("events"):WaitForChild("runcode"):FireServer(codeName)      
            end
        end
    end,
})

randomMiscButton:AddButton({
    Title = "Die",
    Variant = "Primary",
    Callback = function()
        ReplicatedStorage:WaitForChild("events"):WaitForChild("drown"):FireServer(0)     
    end,
})

groupId = 7381705

-- Function to fetch roles in the group
local function fetchGroupRoles(groupId)
    local response = request({
        Url = string.format("https://groups.roblox.com/v1/groups/%d/roles", groupId),
        Method = "GET",
        Headers = { ["Content-Type"] = "application/json" }
    })

    if response and response.Success then
        return HttpService:JSONDecode(response.Body)
    else
        warn("Failed to fetch group roles:", response.StatusCode, response.StatusMessage)
        return nil
    end
end

local rolesList = {}

local rolesData = fetchGroupRoles(groupId)
if rolesData and rolesData.roles then
    for _, role in ipairs(rolesData.roles) do
        table.insert(rolesList, role.name)
    end
end

genv.AntiStaffDropDown = sections.Misc1:AddDropdown("AntiStaffList", {
    Title = "Select Roles",
    Description = "",
    Options = rolesList,
    Default = "",
    Multiple = true,
    Callback = function(selectedRoles)
        genv.SelectedRoles = selectedRoles
        -- print("Selected Roles:")
        for _, role in ipairs(genv.SelectedRoles) do
            -- print(role)
        end
    end
})

-- role ~= "Fischer" and
-- ^ add this too but removed for now for testing purposes
genv.FinishedChecked = false
if genv.FinishedChecked == false then
genv.AntiStaffDropDown:Refresh(rolesList,true)
for _, role in ipairs(rolesList) do
    if role ~= "Guest" and role ~= "Fischer" then
        genv.AntiStaffDropDown:Set(role)
    end
end
genv.FinishedChecked = true
end

local RolewatchConnection

genv.AntiStaffToggle = sections.Misc1:AddToggle("AntiStaff", {
    Title = "Anti Staff",
    Default = true,
    Description = "Leaves the game automatically if a staff joins",
    Callback = function(isEnabled)
        if isEnabled then
            RolewatchConnection = Players.PlayerAdded:Connect(function(player)
                if player:IsInGroup(groupId) then
                    local playerRole = tostring(player:GetRoleInGroup(groupId)):lower()

                    -- Ensure SelectedRoles is valid before iterating
                    if type(genv.SelectedRoles) == "table" then
                        for _, selectedRole in ipairs(genv.SelectedRoles) do
                            if playerRole == selectedRole:lower() then
                                LocalPlayer:Kick(".")
                                _G.UIStroke = Instance.new("UIStroke", game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt"))
                                _G.UIStroke.Color = Color3.new(0.231373, 0.231373, 0.231373)
                                _G.UIStroke.Transparency = 0.6
                                _G.UICorner = Instance.new("UICorner", game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt"))
                                _G.UICorner.CornerRadius = UDim.new(0, 5)
                                game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt").BackgroundColor3 = Color3.new(0.078431, 0.078431, 0.078431)
                                game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt").Size = UDim2.new(0, 400, 0, 330)
                                game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt").MessageArea.ErrorFrame.ErrorMessage.RichText = true
                                game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt").TitleFrame.ErrorTitle.RichText = true
                                game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt").TitleFrame.ErrorTitle.Text = [[<font color="#5359bf">L</font><font color="#4c4eb9">u</font><font color="#4644b3">n</font><font color="#403aad">o</font><font color="#3a30a8">r</font>]]
                                game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt").MessageArea.ErrorFrame.ErrorMessage.Text = [[
<b><font color="#5359bf">L</font><font color="#4c4eb9">u</font><font color="#4644b3">n</font><font color="#403aad">o</font><font color="#3a30a8">r</font></b> has detected a Staff and has Initiated Self-Kick on your profile.

Username: <font color="rgb(255,255,255)">]] .. player.Name .. [[</font>  
Role: <font color="rgb(255,255,255)">]] .. selectedRole .. [[</font>.
Action Was Taken at : <font color="rgb(255,255,255)">]] .. os.date("%I:%M %p") .. [[</font>

<font color="rgb(255,255,0)">⚠️ Please be careful, actions like this may result in further consequences.</font>
]]
                                break
                            end
                        end
                    else
                        warn("SelectedRoles is not a table or is nil.")
                    end
                end
            end)
            lib:Notification("Anti Staff", "Anti Staff has automatically been enabled.", 5)
        else
            if RolewatchConnection then
                RolewatchConnection:Disconnect()
                RolewatchConnection = nil
            end
        end
    end
})



genv.InventoryValueGift = sections.Misc2:AddParagraph({
    Title = gradient("Inventory Information"),
    Description = "Inventory Info: <font color=\"rgb(255,0,0)\">Offline</font>\nInventory Value: <font color=\"rgb(255,0,0)\">Offline</font>\nHeld Item Value: <font color=\"rgb(255,0,0)\">Offline</font>"
})

function UpdatePlayerList()
    variables.PlayerList = {}
    for _, v in pairs(Players:GetPlayers()) do
        table.insert(variables.PlayerList, v.DisplayName .. " (@"..v.Name..") ")
    end
    genv.UserDropDown:Refresh(variables.PlayerList, true)
    genv.UserDropDown:Set(variables.CopyuserSelect)
end


genv.UserDropDown = sections.Misc2:AddDropdown("AllUsers", {
    Title = "Select User",
    Description = "",
    PlaceHolder = "Search Player",
    Options = variables.PlayerList,
    Default = "",
    Multiple = false,
    Callback = function(selectedPlayer)
        local realName = selectedPlayer:match("%(@(.-)%)")
        genv.SelectedPlayer = realName
        print(genv.SelectedPlayer)
    end
})

UpdatePlayerList()

local giftGroupButton = sections.Misc2:AddGroupButton()

giftGroupButton:AddButton({
    Title = "Refresh Dropdown",
    Variant = "Outline",
    Callback = function()
        UpdatePlayerList()
    end,
})

giftGroupButton:AddButton({
    Title = "Gift Hand",
    Variant = "Primary",
    Callback = function()
        local check = validToolCheck()
        if check then
            local fish = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            
            gift(genv.SelectedPlayer, fish.Name)        
        else
            lib:Notification("Gift Hand", "You don't seem to have a valid fish equipped3..", 5)
        end
    end,
})

giftGroupButton:AddButton({
    Title = "Gift All",
    Variant = "Primary",
    Callback = function()
        giftAll()
    end,
})

sections.Misc2:AddToggle("ExcludeFav", {
    Title = "Exclude Favourites",
    Default = true,
    Description = "",
    Callback = function(isEnabled)
        genv.ExcludeFavourite = isEnabled
    end,
})


genv.GiftHandToggle = sections.Misc2:AddToggle("LoopGiftHand", {
    Title = "Loop Gift Hand",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.GiftHand = isEnabled
        while genv.GiftHand do

            local check = validToolCheck()
            if check then
                local fish = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                gift(genv.SelectedPlayer, fish.Name)
            else
                lib:Notification("Gift Hand", "You don't seem to have a valid fish equipped2..", 5)
                genv.GiftHandToggle:Set(false)
            end
            task.wait()
        end
    end,
})

sections.Misc2:AddToggle("LoopAccept", {
    Title = "Loop Accept",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.Accept = isEnabled
        local function processOffers()
            for _, frame in pairs(LocalPlayer.PlayerGui.hud.safezone.bodyannouncements:GetChildren()) do
                if frame:IsA("Frame") and frame.Name == "offer" then
                    local confirmButton = frame:FindFirstChild("confirm")
                    if confirmButton and confirmButton:IsA("TextButton") then 
                        if getconnections then
                            for i, v in pairs(getconnections(confirmButton.MouseButton1Click)) do
                                v.Function()
                            end
                        else
                            firesignal(confirmButton.MouseButton1Click)
                        end
                    end                    
                end
            end
        end
        
        while genv.Accept do
            if #LocalPlayer.PlayerGui.hud.safezone.bodyannouncements:GetChildren() > 0 then
                processOffers()
            end
            task.wait(0.1)
        end
        
    end,
})

sections.Misc2:AddToggle("LoopGiftInv", {
    Title = "Loop Gift Inventory",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.GiftInventory = isEnabled
        if genv.GiftInventory then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
        end
        while genv.GiftInventory do
            giftAll()
            wait(1)
            if not genv.GiftInventory then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                break
            end
        end
    end,
})


genv.GiftInformationParagraph = sections.Misc2:AddParagraph({
    Title = gradient("Information"),
    Description = '<b>Once the amount is reached, the toggle will automatically turn off and stopped.</b>\nGift Amount: <font color="#FF0000">Offline</font>\nGift Value (Inv): <font color="#FF0000">Offline</font>\nGift Value (Hand): <font color="#FF0000">Offline</font>'})

    

sections.Misc2:AddTextbox({
    Title = "Gift: Amount",
    Default = "",
    Description = "Amount of your held item that'll be give..",
    PlaceHolder = "Ex: 5",
    TextDisappear = false,
    Callback = function(giftAmount)
        genv.giftAmount = tonumber(giftAmount)
    end
})

-- genv.LoopGiftAmountToggle = sections.Misc2:AddToggle("LoopGiftAmount", {
--     Title = "Loop Gift Amount",
--     Default = false,
--     Description = "",
--     Callback = function(isEnabled)
--         genv.LoopGiftAmount = isEnabled
--         local check = validToolCheck()
--         if check then
--             local fish = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--             local link = tostring(fish.link.Value)
--             print(link)
--             local amount = tonumber(ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[link].Stack.Value)
--             print(amount)
--             print(genv.giftAmount)
--             if amount < tonumber(genv.giftAmount) then
--                 lib:Notification("Loop Gift Amount", "You have less of this fish than your desired gifting amount..", 5)
--                 genv.LoopGiftAmountToggle:Set(false)
--             else
--                 local targetAmount = amount - genv.giftAmount
                
--                 while genv.LoopGiftAmount do
--                     amount = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[link].Stack
            
--                     if amount > tonumber(targetAmount) then
--                         gift(genv.selectedPlayer, fish.Name)
--                         task.wait(0.1)
--                     else
--                         lib:Notification("Loop Gift Amount", "Completed.", 5)
--                         genv.LoopGiftAmountToggle:Set(false)
--                         genv.GiftInformationParagraph:SetDesc('<b>Once the amount is reached, the toggle will automatically turn off and stopped.</b>\nGift Amount: <font color="#00FF00">Completed</font>\nGift Value (Inv): <font color="#FF0000">Offline</font>\nGift Value (Hand): <font color="#00FF00">Completed</font>')
--                         break
--                     end
--                 end
--             end
--         else
--             lib:Notification("Gift Hand", "You don't seem to have a valid fish equipped..", 5)
--         end
--     end,
-- })


genv.LoopGiftAmountToggle = sections.Misc2:AddToggle("LoopGiftAmount", {
    Title = "Loop Gift Amount",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.LoopGiftAmount = isEnabled

        if not isEnabled then
            return
        end

        local check = validToolCheck()
        if check then
            local fish = tostring(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").link.Value)
            local stack = tonumber(ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[fish].Stack.Value)
            if ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[fish] then
                print(stack)
                print(tonumber(genv.giftAmount))
                if tonumber(ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[fish].Stack.Value) < tonumber(genv.giftAmount) then
                    print(stack, genv.giftAmount, "lol")
                    genv.LoopGiftAmountToggle:Set(false)
                    lib:Notification("Loop Gift Amount", "You have less of this fish than your desired gifting amount..", 5)
                    return
                else
                    local realFish = tostring(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"))
                    local startingValue = tonumber(stack) -- 10
                    print(startingValue)
                    local amountToGift = startingValue - genv.giftAmount -- (gA = 4) = 6
                    print(startingValue, genv.giftAmount ..  " = " .. amountToGift)
                    while genv.LoopGiftAmount do
                        local stack = tonumber(ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[fish].Stack.Value)
                        print(tonumber(stack) .. " " .. amountToGift)
                        if tonumber(stack) > amountToGift then
                            print("supposed to gift..")
                            local targetItem = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[fish]
                            local previousValue = targetItem.Stack.Value
                            gift(genv.SelectedPlayer, realFish)
                            while targetItem.Stack.Value == previousValue do
                                task.wait()
                            end
                            local fishValue = tonumber(stack) or 0
                            local giftValue = tonumber(amountToGift) or 0

                            local formattedFishValue = formatNumber(fishValue)
                            local formattedGiftValue = formatNumber(giftValue)

                            local updatedDesc = string.format(
                                '<b>Once the amount is reached, the toggle will automatically turn off and stopped.</b>\nGift Amount: <font color="#FFFF00">%s -> %s</font>\nGift Value (Inv): <font color="#FF0000">Offline</font>\nGift Value (Hand): <font color="#FF0000">Offline</font>',
                                formattedFishValue,
                                formattedGiftValue
                            )

                            genv.GiftInformationParagraph:SetDesc(updatedDesc)
                        else
                            genv.LoopGiftAmountToggle:Set(false)
                            lib:Notification("Loop Gift Amount", "Completed.", 5)
                            genv.GiftInformationParagraph:SetDesc('<b>Once the amount is reached, the toggle will automatically turn off and stopped.</b>\nGift Amount: <font color="#00FF00">Completed</font>\nGift Value (Inv): <font color="#FF0000">Offline</font>\nGift Value (Hand): <font color="#FF0000">Offline</font>')
                            return
                        end
                        task.wait(3)
                    end
                end
            end
        end
    end,
})




sections.Misc2:AddTextbox({
    Title = "Gift: Value",
    Default = "",
    Description = "",
    PlaceHolder = "Ex: 1000000",
    TextDisappear = false,
    Callback = function(giftValue)
        genv.giftValue = giftValue
    end
})

genv.ToggleGiftInvValue = sections.Misc2:AddToggle("ToggleGiftInv", {
    Title = "Gift Value: Inventory [ procrastinating on this.. ]",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.AutoGiftInvValue = isEnabled
        -- if _G.totalValue < genv.giftValue then
        --     lib:Notification("Gift Value: Inventory", "You don't have enough value to gift..", 5)
        --     genv.ToggleGiftInv:Set(false)
        -- else
        --     print("hi")
        -- end
    end,
})


genv.ToggleGiftHandValue = sections.Misc2:AddToggle("LoopGiftHand", {
    Title = "Gift Value: Hand",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.AutoGiftHandValue = isEnabled

        if not isEnabled then
            return
        end

        local check = validToolCheck()
        if check then
            local fish = tostring(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").link.Value)
            if ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[fish] then                
                if tonumber(GetBackPackItemValue(fish)) < tonumber(genv.giftValue) then
                    print(GetBackPackItemValue(fish), genv.giftValue, "lol")
                    genv.ToggleGiftHandValue:Set(false)
                    lib:Notification("Gift Value: Hand", "You don't have enough value to gift..", 5)
                    return
                else
                    local realFish = tostring(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"))
                    local startingValue = tonumber(GetBackPackItemValue(fish)) -- 10m
                    print(startingValue)
                    local valueToGift = startingValue - genv.giftValue -- 6m

                    while genv.AutoGiftHandValue do
                        print("here")
                        if tonumber(GetBackPackItemValue(fish)) > valueToGift then
                            print('here1')
                            local targetItem = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[fish]
                            local previousValue = targetItem.Stack.Value
                            print('here??')
                            print(fish)
                            print(genv.SelectedPlayer)
                            gift(genv.SelectedPlayer, realFish)
                            while targetItem.Stack.Value == previousValue do
                                task.wait()
                            end
                            local fishValue = tonumber(GetBackPackItemValue(fish)) or 0
                            local giftValue = tonumber(valueToGift) or 0

                            local formattedFishValue = formatNumber(fishValue)
                            local formattedGiftValue = formatNumber(giftValue)

                            local updatedDesc = string.format(
                                '<b>Once the amount is reached, the toggle will automatically turn off and stopped.</b>\nGift Amount: <font color="#FF0000">Offline</font>\nGift Value (Inv): <font color="#FF0000">Offline</font>\nGift Value (Hand): <font color="#FFFF00">%s -> %s</font>',
                                formattedFishValue,
                                formattedGiftValue
                            )

                            genv.GiftInformationParagraph:SetDesc(updatedDesc)
                        else
                            genv.ToggleGiftHandValue:Set(false)
                            lib:Notification("Gift Value: Hand", "Completed.", 5)
                            genv.GiftInformationParagraph:SetDesc('<b>Once the amount is reached, the toggle will automatically turn off and stopped.</b>\nGift Amount: <font color="#FF0000">Offline</font>\nGift Value (Inv): <font color="#FF0000">Offline</font>\nGift Value (Hand): <font color="#00FF00">Completed</font>')
                            return
                        end
                        task.wait(3)
                    end
                end
            end
        end
    end,
})



-- genv.GiftHand = isEnabled
-- while genv.GiftHand do

--     local check = validToolCheck()
--     if check then
--         local fish = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--         gift(genv.SelectedPlayer, fish.Name)
--     else
--         lib:Notification("Gift Hand", "You don't seem to have a valid fish equipped2..", 5)
--         genv.GiftHandToggle:Set(false)
--     end
--     task.wait()
-- end

sections.Visuals:AddToggle("AutoRadarMode", {
    Title = "Enable Fish Radar",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        variables.AutoToggleRadar = true
        if isEnabled then
                for _, descendant in ipairs(workspace.zones.fishing:GetDescendants()) do
                    if descendant.Name == "radar1" or descendant.Name == "radar2" then
                        descendant.Enabled = true
                        descendant.MaxDistance = math.huge
                    end
                end
        else
            variables.AutoToggleRadar = false
            for _, descendant in ipairs(workspace.zones.fishing:GetDescendants()) do
                if descendant.Name == "radar1" or descendant.Name == "radar2" then
                    descendant.Enabled = false
                    descendant.MaxDistance = 250
                end
            end
        end
    end,
})


sections.Visuals:AddToggle("Inventory Value", {
    Title = "Calculate Each Item Value",
    Default = false,
    Description = "Displays a text showing the value of items",
    Callback = function(isEnabled)
        genv.AutoPriceCheck = isEnabled
        
        if isEnabled then
            for _, v in pairs(LocalPlayer.PlayerGui.hud.safezone.backpack:GetDescendants()) do
                if v:IsA("ValueBase") and v.Name == "item" then
                    local itemValue = GetBackPackItemValue(v.Value)
                    if itemValue then
                        CreatePrice(v.Parent, itemValue)
                    end
                end
            end


            task.spawn(function()
                while genv.AutoPriceCheck do
                    if not _G.running then
                        _G.running = true
                        monitorBackpack()
                    end
                    
                    task.wait(1)
                end

                if not genv.AutoPriceCheck and _G.running then
                    _G.running = false

                    if _G.connections then
                        for _, connection in ipairs(_G.connections) do
                            if connection.Connected then
                                connection:Disconnect()
                            end
                        end
                        _G.connections = {}
                    end

                    clearPriceLabels()
                end
            end)
        else

            genv.AutoPriceCheck = false
        end
    end,
})


sections.Visuals:AddToggle("AutoFullBright", {
    Title = "Enable FullBright",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.FullBright = isEnabled
        if genv.FullBright then
            brightLoop = RunService.RenderStepped:Connect(brightFunc)
        elseif not genv.FullBright then
            if brightLoop then
                brightLoop:Disconnect()
            end
        end
    end,
})



local createdVisual = false
local LureVisualUI = {}
local updateConnection

sections.Visuals:AddToggle("LureVisual", {
    Title = "Lure Visual",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.LureVisual = isEnabled

        local function createLureVisual()
            createdVisual = true

            LureVisualUI["1"] = Instance.new("ScreenGui", gethui())
            LureVisualUI["1"]["Name"] = [[LureVisual]]

            LureVisualUI["2"] = Instance.new("Frame", LureVisualUI["1"])
            LureVisualUI["2"]["BorderSizePixel"] = 0
            LureVisualUI["2"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21)
            LureVisualUI["2"]["Size"] = UDim2.new(0, 0, 0, 0) -- Start small for animation
            LureVisualUI["2"]["Position"] = UDim2.new(0.457, 0, 0.87, 0)
            LureVisualUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            LureVisualUI["2"]["Name"] = [[CoolMonke]]
            LureVisualUI["2"]["BackgroundTransparency"] = 1 -- Fully transparent at start

            -- Add UICorner for rounded edges
            LureVisualUI["3"] = Instance.new("UICorner", LureVisualUI["2"])

            -- Add UIStroke for border
            LureVisualUI["4"] = Instance.new("UIStroke", LureVisualUI["2"])
            LureVisualUI["4"]["Thickness"] = 0.6
            LureVisualUI["4"]["Color"] = Color3.fromRGB(255, 255, 255)

            -- Add TextLabel for Lure percentage
            LureVisualUI["5"] = Instance.new("TextLabel", LureVisualUI["2"])
            LureVisualUI["5"]["BorderSizePixel"] = 0
            LureVisualUI["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            LureVisualUI["5"]["TextSize"] = 24
            LureVisualUI["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            LureVisualUI["5"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
            LureVisualUI["5"]["BackgroundTransparency"] = 1
            LureVisualUI["5"]["RichText"] = true
            LureVisualUI["5"]["Size"] = UDim2.new(1, 0, 1, 0)
            LureVisualUI["5"]["Text"] = [[Lure: 0%]]

            -- Add progress bar at the bottom
            LureVisualUI["7"] = Instance.new("Frame", LureVisualUI["2"])
            LureVisualUI["7"]["BorderSizePixel"] = 0
            LureVisualUI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            LureVisualUI["7"]["Size"] = UDim2.new(0, 170, 0, 7)
            LureVisualUI["7"]["Position"] = UDim2.new(-0.00595, 0, 0.87, 0)
            LureVisualUI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)

            LureVisualUI["8"] = Instance.new("UICorner", LureVisualUI["7"])
            LureVisualUI["8"]["CornerRadius"] = UDim.new(0, 8000)

            -- Tween Animation for Pop-Up
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            local goal = {Size = UDim2.new(0, 168, 0, 46), BackgroundTransparency = 0.3}
            local tween = game:GetService("TweenService"):Create(LureVisualUI["2"], tweenInfo, goal)
            tween:Play()
        end

        local function cleanupUI()
            if createdVisual and LureVisualUI["1"] then
                -- Smooth fade-out
                local fadeOutTween = game:GetService("TweenService"):Create(LureVisualUI["2"], TweenInfo.new(0.5), {BackgroundTransparency = 1, Size = UDim2.new(0, 0, 0, 0)})
                fadeOutTween:Play()
                fadeOutTween.Completed:Connect(function()
                    LureVisualUI["1"]:Destroy()
                    createdVisual = false
                end)
            end
        end

        if isEnabled then
            updateConnection = game:GetService("RunService").Heartbeat:Connect(function()
                local player = LocalPlayer

                if player.PlayerGui:FindFirstChild("reel") then
                    cleanupUI()
                    return
                end

                local rod = player.Character and player.Character:FindFirstChild(getEquippedRod())
                if rod then
                    local values = rod:FindFirstChild("values")
                    if values then
                        local casted = values:FindFirstChild("casted")
                        if casted and casted.Value == false then
                            cleanupUI()
                        elseif casted and casted.Value == true and not createdVisual then
                            createLureVisual()
                        end

                        if createdVisual then
                            local lure = values:FindFirstChild("lure")
                            local bite = values:FindFirstChild("bite")
                            if lure and bite and bite.Value == false and lure.Value < 100 then
                                local lureValue = math.floor(lure.Value + 0.5) -- Round to nearest whole number
                                LureVisualUI["5"].Text = "Lure: " .. tostring(lureValue) .. "%"
                            elseif bite and bite.Value then
                                LureVisualUI["5"].Text = "Caught!"
                                task.delay(0.5, cleanupUI)
                            end
                        end
                    end
                else
                    cleanupUI()
                end
            end)
        else
            if updateConnection then
                updateConnection:Disconnect()
                updateConnection = nil
            end
            cleanupUI()
        end
    end,
})



sections.Visuals:AddToggle("AutoPredictor", {
    Title = "Auto Predictor",
    Default = false,
    Description = "Predict what fish your about to get before catching it",
    Callback = function(isEnabled)
        local currentModel = nil
        while isEnabled do 
            if character then
                local rod = character:FindFirstChild(PlayerStats.rod.Value)
                if rod then
                    local bobber = rod:FindFirstChild("bobber")
                    if bobber then
                        for _, child in ipairs(bobber:GetChildren()) do
                            if child:IsA("Model") and child.Name ~= PlayerStats.bait.Value and child.Name ~= PlayerStats.bobber.Value then
                                if currentModel ~= child.Name then
                                    lib:Notification("Auto Predictor","Predicted: "..child.Name, 3)
                                    currentModel = child.Name
                                end
                            end
                        end
                        if currentModel and not bobber:FindFirstChild(currentModel) then
                            currentModel = nil
                        end
                    end
                end
            end
            task.wait()
        end
    end,
})

sections.Visuals:AddColorpicker("WaterColor", {
    Title = "Water Color",
    Default = Color3.fromRGB(60, 66, 85),
    Callback = function(selectedColor)
    game:GetService("Workspace").Terrain.WaterColor = selectedColor
    end,
})

sections.Visuals:AddSlider("WaterSpeed", {
    Title = "Waves Speed",
    Description = "",
    Default = 10,
    Min = 0,
    Max = 255,
    Increment = 1,
    Callback = function(value)
        game:GetService("Workspace").Terrain.WaterWaveSpeed = value
    end,
})

local hideUIConnection
sections.Visuals1:AddToggle("HideUI", {
    Title = "Hide UI",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        local hud = LocalPlayer.PlayerGui:FindFirstChild("hud")
        if hud and hud:IsA("ScreenGui") then
            if isEnabled then
                hud.Enabled = false
                if not hideUIConnection then
                    hideUIConnection = hud:GetPropertyChangedSignal("Enabled"):Connect(function()
                        hud.Enabled = false
                    end)
                end
            else
                if hideUIConnection then
                    hideUIConnection:Disconnect()
                    hideUIConnection = nil
                end
                hud.Enabled = true
            end
        end
    end,
})


sections.Visuals1:AddColorpicker("RenderScreenColor", {
    Title = "Change Render Screen Color",
    Default = Color3.fromRGB(0, 0, 0),
    Callback = function(selectedColor)
        local playerGui = LocalPlayer:WaitForChild("PlayerGui")
        playerGui:FindFirstChild("guh").Frame.BackgroundColor3 = selectedColor
    end,
})

sections.Visuals1:AddToggle("Blackscreen", {
    Title = "Low Rendering Screen",
    Default = false,
    Description = "Disables Rendering",
    Callback = function(isEnabled)
        genv.whiteScreenToggle = isEnabled
        local playerGui = LocalPlayer:WaitForChild("PlayerGui")
        local blackScreenGui = playerGui:FindFirstChild("guh")
        
        if isEnabled then
            if not blackScreenGui then
                blackScreenGui = Instance.new("ScreenGui")
                blackScreenGui.Name = "guh"
                blackScreenGui.DisplayOrder = 999
                blackScreenGui.ResetOnSpawn = false
                blackScreenGui.Parent = playerGui
                
            if not isfile('Lunor_Trans.png') then
                writefile("Lunor_Trans.png", game:HttpGet('https://you.whimper.xyz/sources/lunor/Backup/Lunor_Trans.png'))
            end
            genv.Blacke02 = Instance.new("Frame", blackScreenGui)
            genv.Blacke02.Position = UDim2.new(0,0,0,-60)
            genv.Blacke02.Size = UDim2.new(1,0,2,0)
            genv.Blacke02.BackgroundColor3 = Color3.new(0,0,0)
            genv.Blacke03 = Instance.new("TextLabel", genv.Blacke02)
            genv.Blacke03.Position = UDim2.new(0.43,0,0,450)
            genv.Blacke03.AutomaticSize = "XY"
            genv.Blacke03.Text = "Lunor"
            genv.Blacke03.TextColor3 = Color3.new(255,255,255)
            genv.Blacke03.RichText = true
            genv.Blacke03.TextSize = 100
            genv.Blacke03.Font = Enum.Font.SourceSansBold
            genv.Blacke03.BackgroundTransparency = 1
            genv.Blacke04 = Instance.new("ImageLabel",genv.Blacke02)
            genv.Blacke04.Position = UDim2.new(0.52,0,0,370)
            genv.Blacke04.Size = UDim2.new(0,256,0,256)
            genv.Blacke04.BackgroundTransparency = 1
            genv.Blacke04.Image = getLunorIcon()
            end
            blackScreenGui.Enabled = true
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            if blackScreenGui then
                blackScreenGui.Enabled = false
            end
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end,
})


local rainConnection

sections.Visuals1:AddToggle("Rain", {
    Title = "Disable Rain",
    Default = true,
    Description = "Hides Raining",
    Callback = function(isEnabled)
        genv.hideRainToggle = isEnabled

        -- Disconnect existing connection if it exists
        if rainConnection then
            rainConnection:Disconnect()
            rainConnection = nil
        end

        if isEnabled then
            -- Continuously monitor and disable rain
            rainConnection = game:GetService("RunService").RenderStepped:Connect(function()
                -- Safely handle potential errors
                pcall(function()
                    -- Disable rain emitters in the Camera
                    local rainEmitter = workspace.Camera:FindFirstChild("__RainEmitter")
                    if rainEmitter then
                        if rainEmitter:FindFirstChild("RainStraight") then
                            rainEmitter.RainStraight.Lifetime = NumberRange.new(0, 0)
                        end
                        if rainEmitter:FindFirstChild("RainTopDown") then
                            rainEmitter.RainTopDown.Lifetime = NumberRange.new(0, 0)
                        end
                    end
                end)

                -- Disable attachments related to rain in the Terrain
                pcall(function()
                    for _, descendant in ipairs(workspace.Terrain:GetDescendants()) do
                        if descendant:IsA("Attachment") and (descendant.Name == "__RainOccludedAttachment" or descendant.Name == "__RainSplashAttachment") then
                            if descendant:FindFirstChild("RainStraight") then
                                descendant.RainStraight.Lifetime = NumberRange.new(0, 0)
                            end
                            if descendant:FindFirstChild("RainTopDown") then
                                descendant.RainTopDown.Lifetime = NumberRange.new(0, 0)
                            end
                            if descendant:FindFirstChild("RainSplash") then
                                descendant.RainSplash.Lifetime = NumberRange.new(0, 0)
                            end
                        end
                    end
                end)
            end)
        else
            -- Re-enable rain emitters when toggled off
            pcall(function()
                local rainEmitter = workspace.Camera:FindFirstChild("__RainEmitter")
                if rainEmitter then
                    if rainEmitter:FindFirstChild("RainStraight") then
                        rainEmitter.RainStraight.Lifetime = NumberRange.new(0.8, 0.8)
                    end
                    if rainEmitter:FindFirstChild("RainTopDown") then
                        rainEmitter.RainTopDown.Lifetime = NumberRange.new(0.8, 0.8)
                    end
                end
            end)
        end
    end,
})



local underwaterConnections = {}

sections.Visuals1:AddToggle("Rain", {
    Title = "Disable Underwater Screen",
    Default = true,
    Description = "Hides Raining",
    Callback = function(isEnabled)
        for _, conn in pairs(underwaterConnections) do
            if conn.Connected then conn:Disconnect() end
        end
        underwaterConnections = {}

        if isEnabled then
            local lighting = game:GetService("Lighting")
            for _, effectName in pairs({"underwaterbl", "underwatercc"}) do
                local effect = lighting:FindFirstChild(effectName)
                if effect then
                    table.insert(underwaterConnections, effect:GetPropertyChangedSignal("Enabled"):Connect(function()
                        if effect.Enabled then effect.Enabled = false end
                    end))
                end
            end
        end
    end,
})


-- Clear All Terrain [Improve FPS]
local terrainClearConnection
sections.Visuals1:AddToggle("ClearTerrain", {
    Title = "Clear All Terrain [Improve FPS]",
    Default = false,
    Description = "Clears all terrain to improve performance.",
    Callback = function(isEnabled)
        genv.clearTerrainToggle = isEnabled

        -- Disconnect any existing connection
        if terrainClearConnection then
            terrainClearConnection:Disconnect()
            terrainClearConnection = nil
        end

        if genv.clearTerrainToggle then
            -- Continuously clear terrain children
            terrainClearConnection = game:GetService("RunService").RenderStepped:Connect(function()
                workspace.Terrain:ClearAllChildren()
            end)
        end
    end,
})

-- Disable Waves [Improve FPS]
local wavesConnection
sections.Visuals1:AddToggle("DisableWaves", {
    Title = "Disable Waves [Improve FPS]",
    Default = true,
    Description = "Disables waves to improve performance.",
    Callback = function(isEnabled)
        genv.disableWavesToggle = isEnabled
        if genv.disableWavesToggle == true then
        local waves =  workspace.active.constant.Waves.Waves:FindFirstChild("waves")
        if waves then
        waves.Enabled = false 
        end
        elseif genv.disableWavesToggle == false then
        local waves =  workspace.active.constant.Waves.Waves:FindFirstChild("waves")
        if waves then
        waves.Enabled = true 
        end
        end
    end,
})

-- Disable Aurora Borealis Sky [Improve FPS]
local auroraConnection
sections.Visuals1:AddToggle("DisableAurora", {
    Title = "Disable Aurora Borealis Sky [Improve FPS]",
    Default = true,
    Description = "Disables aurora borealis beams for better performance.",
    Callback = function(isEnabled)
        genv.disableAuroraToggle = isEnabled

        -- Disconnect any existing connection
        if auroraConnection then
            auroraConnection:Disconnect()
            auroraConnection = nil
        end

        if genv.disableAuroraToggle then
            -- Continuously disable beams in Aurora Borealis
            auroraConnection = game:GetService("RunService").RenderStepped:Connect(function()
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
            end)
        end
    end,
})


genv.ToggledTest = false
genv.ColoredREEEL = Color3.new(0.435294, 0, 1)

sections.Visuals2:AddColorpicker("LocalPlayerColor", {
    Title = "Character Color",
    Default = Color3.fromRGB(60, 66, 85),
    Callback = function(selectedColor)
    genv.ColoredREEEL = selectedColor
    for _,v in pairs(LocalPlayer.Character:GetDescendants()) do
        if genv.ToggledTest == true then
        if v:IsA("BasePart") then
                v.Color = genv.ColoredREEEL
        end
    end
    end
    end
})
genv.ToggledTest = false
genv.ColoredREEEL = Color3.new(0.435294, 0, 1)
genv.lockConnections2 = {}
sections.Visuals2:AddToggle("LocalPlayerIdentity", {
    Title = "Hide LocalPlayer Identity",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        if isEnabled then
        genv.ToggledTest = true
        function createRainbowGradient(parent)
    _G.gradient = Instance.new("UIGradient", parent)
    _G.gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.000, Color3.fromRGB(242, 138, 54)),
        ColorSequenceKeypoint.new(0.250, Color3.fromRGB(242, 54, 107)),
        ColorSequenceKeypoint.new(0.500, Color3.fromRGB(134, 54, 242)),
        ColorSequenceKeypoint.new(0.750, Color3.fromRGB(54, 187, 242)),
        ColorSequenceKeypoint.new(1.000, Color3.fromRGB(54, 242, 173))
    }
    return _G.gradient
end

function setupCharacter(character)
    _G.humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    _G.user = _G.humanoidRootPart:WaitForChild("user")

    -- Cleanup previous character meshes and appearance
    for _, v in ipairs(character:GetDescendants()) do
        if v:IsA("CharacterMesh") or v:IsA("Accessory") or v:IsA("SpecialMesh") or (v:IsA("Decal") and v.Name == "face") then
            v:Destroy()
        elseif v:IsA("BasePart") then
            v.Material = Enum.Material.Neon
            v.Color = genv.ColoredREEEL
        end
    end

    if character:FindFirstChild("Shirt") then character.Shirt:Destroy() end
    if character:FindFirstChild("Pants") then character.Pants:Destroy() end

    -- Apply rainbow gradients
    _G.Rainbow = createRainbowGradient(_G.user.user)
    _G.Rainbow2 = createRainbowGradient(_G.user.level)
    _G.Rainbow3 = createRainbowGradient(_G.user.streak)
    _G.Rainbow4 = createRainbowGradient(_G.user.title)
    _G.Rainbow5 = createRainbowGradient(LocalPlayer.PlayerGui.hud.safezone.coins)
    _G.Rainbow6 = createRainbowGradient(LocalPlayer.PlayerGui.hud.safezone.lvl)

genv.lockConnections = {}

function lockText(property, target, value)
    target[property] = value

    -- Create a connection to monitor property changes
    genv.connection = target:GetPropertyChangedSignal(property):Connect(function()
        if target[property] ~= value then
            target[property] = value
        end
    end)

    -- Store the connection in the lockConnections table
    table.insert(genv.lockConnections, genv.connection)
end

    lockText("Text", _G.user.user, "Hidden")
    lockText("Text", _G.user.level, "Level: ∞")
    lockText("Text", _G.user.streak, "∞")
    lockText("Text", _G.user.title, "❤")
    lockText("Text", LocalPlayer.PlayerGui.hud.safezone.coins, "~~~~~~★ C$")
    lockText("Text", LocalPlayer.PlayerGui.hud.safezone.lvl, "Level: ∞")
    genv.MoneyLog = nil
    genv.MoneyLog = LocalPlayer.PlayerGui.hud.safezone.StatChangeList.ChildAdded:Connect(function(v)
        if v:IsA("TextLabel") then
            v.Text = "math.huge 👍"
        end
    end)

function lockTextSafe(path, text)
 _G.success, _G.err = pcall(function()
        lockText("Text", path, text)
    end)
    if not _G.success then
        warn("Failed to set lockText: " .. _G.err)
    end
end
_G.players = Players
_G.localPlayer = _G.players.LocalPlayer
_G.userId = "p_" .. _G.localPlayer.UserId

_G.roactProvider = game:GetService("CoreGui"):FindFirstChild("RoactAppExperimentProvider")
if not _G.roactProvider then
    warn("Please wait till your game is fully loaded")
    return
end

_G.offsetFrame = _G.roactProvider:FindFirstChild("Children")
    and _G.roactProvider.Children:FindFirstChild("OffsetFrame")
if _G.offsetFrame then
    _G.undoFrame = _G.offsetFrame:FindFirstChild("PlayerScrollList")
        and _G.offsetFrame.PlayerScrollList:FindFirstChild("SizeOffsetFrame")
        and _G.offsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer
        and _G.offsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame
        and _G.offsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame
        and _G.offsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame

    if _G.undoFrame and _G.undoFrame[_G.userId] then
        _G.userFrame = _G.undoFrame[_G.userId]:WaitForChild("ChildrenFrame")

        lockTextSafe(_G.userFrame:WaitForChild("NameFrame"):WaitForChild("BGFrame"):WaitForChild("OverlayFrame"):WaitForChild("PlayerName"):WaitForChild("PlayerName"), "⭐ You Found Me!")
        lockTextSafe(_G.userFrame:WaitForChild("GameStat_C$"):WaitForChild("OverlayFrame"):WaitForChild("StatText"), "★★★★★")
        lockTextSafe(_G.userFrame:WaitForChild("GameStat_Level"):WaitForChild("OverlayFrame"):WaitForChild("StatText"), "∞")
    end
end

    function animateRainbow()
        _G.multi = 0.7
        _G.val = 0
        
        game:GetService("RunService").RenderStepped:Connect(function(r)
            _G.val += r*_G.multi
            
            if _G.val > 0.5 then
                _G.multi = _G.multi*-1
            elseif _G.val < -0.5 then
                _G.multi = _G.multi*-1
            end

            _G.Rainbow.Offset = Vector2.new(_G.val, 0)
            _G.Rainbow2.Offset = Vector2.new(_G.val, 0)
            _G.Rainbow3.Offset = Vector2.new(_G.val, 0)
            _G.Rainbow4.Offset = Vector2.new(_G.val, 0)
            _G.Rainbow5.Offset = Vector2.new(_G.val, 0)
            _G.Rainbow6.Offset = Vector2.new(_G.val, 0)
        end)
    end

    task.spawn(animateRainbow)
end


genv.Cow = nil
genv.Cow = LocalPlayer.CharacterAdded:Connect(setupCharacter)
if LocalPlayer.Character then
    setupCharacter(LocalPlayer.Character)
end

genv.Cow2 = nil
genv.Cow2 = game:GetService("CoreGui").ExperienceChat.appLayout.chatWindow.scrollingView.bottomLockedScrollView
    .RCTScrollView.RCTScrollContentView.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("TextLabel") then
            descendant.Text = string.gsub(descendant.Text, LocalPlayer.Name, "[Hidden]")
            descendant.Text = string.gsub(descendant.Text, LocalPlayer.DisplayName, "[Hidden]")
        end
    end)
genv.Cow3 = nil
genv.Cow3 = LocalPlayer.PlayerGui.hud.safezone.topannouncements.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("TextLabel") then
            descendant.Text = string.gsub(descendant.Text, LocalPlayer.Name, "[Hidden]")
            descendant.Text = string.gsub(descendant.Text, LocalPlayer.DisplayName, "[Hidden]")
        end
    end)
for _, descendant in pairs(game:GetService("CoreGui").ExperienceChat.appLayout.chatWindow.scrollingView.bottomLockedScrollView.RCTScrollView.RCTScrollContentView:GetDescendants()) do
    if descendant:IsA("TextLabel") then
        descendant.Text = string.gsub(descendant.Text, LocalPlayer.Name, "[Hidden]")
        descendant.Text = string.gsub(descendant.Text, LocalPlayer.DisplayName, "[Hidden]")
    end
end
    repeat task.wait()
        if genv.ToggledTest == false then
    genv.Cow3:Disconnect()
    genv.Cow3 = nil
    genv.Cow2:Disconnect()
    genv.Cow2 = nil
    genv.Cow:Disconnect()
    genv.Cow = nil
    genv.MoneyLog:Disconnect()
    genv.MoneyLog = nil

    for _, connection in ipairs(genv.lockConnections) do
    connection:Disconnect() 
    end
    genv.lockConnections = {}
    print("Disabled Testing")
    end
    until genv.ToggledTest == false
    else
    if genv.ToggledTest == true then
        genv.ToggledTest = false
        lib:Notification("Hide LocalPlayer Identity", "All actions stopped. To fully disable, die using the 'Die' button in Misc > Character.", 10)
    end
        end
    end,
})

sections.Visuals2:AddToggle("HideAllIdentities", {
    Title = "Hide All Player Identities",
    Default = false,
    Description = "Extra Protection if you want to protect your self",
    Callback = function(isEnabled)
        genv.HideAllIdentitiesEnabled = isEnabled

        local function safeCall(func)
            local success, result = pcall(func)
            if not success then
                warn("Error occurred: ", result)
            end
        end

        local function hideIdentityForCharacter(character)
            for _, descendant in ipairs(character:GetDescendants()) do
                safeCall(function()
                    -- Check for and modify or remove name tags and other elements related to user information
                    if descendant:IsA("BillboardGui") then
                        local user = descendant:FindFirstChild("user")
                        if user then
                            -- Hide user-related information
                            if user:FindFirstChild("user") then
                                user.user.Text = "[Hidden]"
                            end
                            if user:FindFirstChild("level") then
                                user.level.Text = "[Hidden]"
                            end
                            if user:FindFirstChild("streak") then
                                user.streak.Text = "[Hidden]"
                            end
                            if user:FindFirstChild("title") then
                                user.title.Text = "[Hidden]"
                            end
                        end
                    end

                    if character:FindFirstChild("Shirt") then character.Shirt:Destroy() end
                    if character:FindFirstChild("Pants") then character.Pants:Destroy() end

                    if descendant:IsA("Accessory") or descendant:IsA("CharacterMesh") or (descendant:IsA("Decal") and descendant.Name == "face") then
                        descendant:Destroy()
                    end

                    -- Remove tags or other UI elements
                    if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
                        if descendant.Text then
                            descendant.Text = "[Hidden]"
                        end
                    end
                    
                    -- Remove character meshes, accessories, and face decals
                    if descendant:IsA("CharacterMesh") or descendant:IsA("Accessory") or descendant:IsA("SpecialMesh") or (descendant:IsA("Decal") and descendant.Name == "face") then
                        descendant:Destroy()
                    elseif descendant:IsA("BasePart") then
                        descendant.Material = Enum.Material.Rubber
                    end
                end)
            end
        end

        function lockText(property, target, value)
            target[property] = value
            local connection = target:GetPropertyChangedSignal(property):Connect(function()
                if target[property] ~= value then
                    target[property] = value
                end
            end)
            table.insert(genv.lockConnections2, connection)
        end

        function lockTextSafe(path, text)
            local success, err = pcall(function()
                lockText("Text", path, text)
            end)
            if not success then
                warn("Failed to set lockText: " .. err)
            end
        end

        local function hideAllPlayers()
            local players = Players
            local roactProvider = game:GetService("CoreGui"):FindFirstChild("RoactAppExperimentProvider")
            if not roactProvider then
                warn("Please wait till your game is fully loaded")
                return
            end

            _G.offsetFrame = roactProvider.Children:FindFirstChild("OffsetFrame")
            if _G.offsetFrame then
                local undoFrame = game:GetService("CoreGui").RoactAppExperimentProvider.Children.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame

                if undoFrame then
                    for _, player in ipairs(players:GetPlayers()) do
                        local playerFrame = undoFrame:FindFirstChild("p_"..player.UserId)
                        if playerFrame then
                            local userFrame = playerFrame:WaitForChild("ChildrenFrame")
                            local playerNameLabel = userFrame:WaitForChild("NameFrame"):WaitForChild("BGFrame"):WaitForChild("OverlayFrame"):WaitForChild("PlayerName"):WaitForChild("PlayerName")
                            lockTextSafe(playerNameLabel, "[Hidden]")
                            
                            local gameStatCLabel = userFrame:WaitForChild("GameStat_C$"):WaitForChild("OverlayFrame"):WaitForChild("StatText")
                            lockTextSafe(gameStatCLabel, "★★★★★")

                            local gameStatLevelLabel = userFrame:WaitForChild("GameStat_Level"):WaitForChild("OverlayFrame"):WaitForChild("StatText")
                            lockTextSafe(gameStatLevelLabel, "∞")
                        end
                    end
                end
            end
        end

        local function hideChatMessages()
            safeCall(function()
                local chat = game:GetService("CoreGui"):FindFirstChild("ExperienceChat")
                if chat then
                    local players = Players
                    local playerNames = {}

                    -- Collect all player names and display names
                    for _, player in ipairs(players:GetPlayers()) do
                        table.insert(playerNames, player.Name)
                        table.insert(playerNames, player.DisplayName)
                    end

                    -- Iterate through all descendants of the chat
                    for _, descendant in ipairs(chat:GetDescendants()) do
                        if descendant:IsA("TextLabel") and descendant.Text then
                            -- Replace each player's name and display name with "[Hidden]"
                            for _, name in ipairs(playerNames) do
                                descendant.Text = descendant.Text:gsub(name, "[Hidden]")
                            end
                        end
                    end
                end
            end)
        end

        local function hideAllIdentities()
            local players = Players
            
            while genv.HideAllIdentitiesEnabled do
                -- Hide identities in the workspace
                for _, player in ipairs(players:GetPlayers()) do
                    if player.Character and player.Character:FindFirstChild("Humanoid") then
                        hideIdentityForCharacter(player.Character)
                    end
                end
                hideAllPlayers()
                hideChatMessages()

                task.wait() -- Adding a small wait to reduce strain
            end
        end

        if isEnabled then
            task.spawn(hideAllIdentities)
        elseif genv.HideAllIdentitiesEnabled == false then
            for _, connection in ipairs(genv.lockConnections2) do
                connection:Disconnect() 
            end
            genv.lockConnections2 = {}
            -- lib:Notification("Hide All Player Identities", "Stopped hiding all player identities.", 5)
        end
    end
})



-- genv.ColorBox = Color3.fromRGB(255, 255, 255)
-- sections.Visuals3:AddColorpicker("ESPColor", {
--     Title = "ESP Color",
--     Default = Color3.fromRGB(255, 255, 255),
--     Callback = function(selectedColor)
--     genv.ColorBox = selectedColor
--     end,
-- })
-- local selectedESPEventFish = {}
-- sections.Visuals3:AddDropdown("EventESP", {
--     Title = "Event Visual",
--     Description = "",
--     Options = {"The Depths - Serpent", "Megalodon", "Great Hammerhead Shark", "Great White Shark", "Whale Shark", "Isonade", "Chinook Salmon Abundance", "Arapaima Abundance", "Mackerel Abundance"},
--     Default = {"The Depths - Serpent", "Megalodon", "Great Hammerhead Shark", "Great White Shark", "Whale Shark", "Isonade", "Chinook Salmon Abundance", "Arapaima Abundance", "Mackerel Abundance"},
--     PlaceHolder = "Select a Certain Event",
--     Multiple = true,
--     Callback = function(selectedEvents)
--         selectedESPEventFish = selectedEvents
--     end,
-- })
-- local allESPEvent = {}
-- local toggedESPEVENT = false

-- sections.Visuals3:AddToggle("ToggleEVENTESP", {
--     Title = "ESP Event",
--     Default = true,
--     Description = "Gives a Cool ESP Event",
--     Callback = function(isEnabled)
--         toggedESPEVENT = isEnabled

--         if toggedESPEVENT then
--             while toggedESPEVENT do
--                 for _, child in pairs(workspace.zones.fishing:GetChildren()) do
--                     if child:FindFirstChild("beacon") then
--                         local poiHeader = child:FindFirstChild("POIHeader")
--                         if poiHeader and poiHeader:FindFirstChild("title") and poiHeader.title:IsA("TextLabel") then
--                             print("Event title:", poiHeader.title.Text)
                            
--                             -- Check if the event title matches any from `allESPEvent`
--                             for _, event in pairs(allESPEvent) do
--                                 if poiHeader.title.Text:find(event) then
--                                     local object = Sense.AddInstance(child, {
--                                         text = "{name} | {distance} | {position}", -- Placeholders
--                                         textColor = { Color3.new(1, 1, 1), 1 },
--                                         textOutline = true,
--                                         textOutlineColor = Color3.new(),
--                                         textSize = 13,
--                                         textFont = 2,
--                                         limitDistance = false,
--                                         maxDistance = 150
--                                     })
--                                     object.options.enabled = true
--                                     table.insert(allESPEvent, object) -- Add the ESP instance to the table
--                                 end
--                             end
--                         end
--                     end
--                 end
--                 wait(0.1) -- Prevent script from freezing
--             end
--         else
--             -- Disable all toggles in the table
--             for _, object in pairs(allESPEvent) do
--                 if object.options then
--                     object.options.enabled = false
--                 end
--             end
--             allESPEvent = {} -- Clear the table
--         end
--     end,
-- })

sections.Visuals4:AddParagraph({Title = "Information", Description = "This feature is new and was rushed, it doesn't work with some rods and looks very scuffed. It will be improved later on."})


local function ApplySkin(rodName, skinName)
    if game.Players.LocalPlayer.Character:FindFirstChild("Skin") then
        game.Players.LocalPlayer.Character:FindFirstChild("Skin"):Destroy()
    end

    local rod = services.ReplicatedStorage.resources.models.RodSkins[rodName]
    if not rod then
        warn("Rod not found:", rodName)
        return
    end

    local skinModel = rod[skinName]
    if not skinModel then
        warn("Skin not found:", skinName)
        return
    end

    local skin = skinModel.Skin:Clone()
    skin.Parent = game.Players.LocalPlayer.Character

    local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    local handle = tool.handle
    local details = tool.Details

    local weldToArm = handle:FindFirstChild("WeldToArm")
    local C0 = weldToArm and weldToArm.C0 or CFrame.new()
    local C1 = weldToArm and weldToArm.C1 or CFrame.new()
    local CurrentAngle = weldToArm and weldToArm.CurrentAngle or 0

    skin:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character["Right Arm"].CFrame)
    details:ClearAllChildren()

    for _, v in pairs(skin:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Anchored = false
        end
    end

    local clone1 = skin.Details:Clone()
    local clone2 = skin.handle:Clone()
    clone1.Parent = tool
    clone2.Parent = tool

    clone2.CFrame = handle.CFrame
    clone1.WorldPivot = details.WorldPivot

    handle.Transparency = 1
    for _, v in pairs(details:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Transparency = 1
        end
    end

    if not clone2:FindFirstChild("Motor6D") then
        local newMotor = Instance.new("Motor6D")
        newMotor.Part0 = game.Players.LocalPlayer.Character["Right Arm"]
        newMotor.Part1 = clone2
        newMotor.C0 = C0
        newMotor.C1 = C1
        newMotor.CurrentAngle = CurrentAngle
        newMotor.Parent = clone2
    end
end
    

local RodSkins = services.ReplicatedStorage.resources.models.RodSkins
local rodSkinList = {}

for _, rod in ipairs(RodSkins:GetChildren()) do
    for _, child in ipairs(rod:GetChildren()) do
        table.insert(rodSkinList, rod.Name .. " - " .. child.Name)
    end
end

local selectedRodName, selectedSkinName

sections.Visuals4:AddDropdown("RodSkin", {
    Title = "Rod Skins",
    Description = "",
    Options = rodSkinList,
    Default = "",
    PlaceHolder = "Select Skin",
    Multiple = false,
    Callback = function(selectedSkin)
        local rodName, skinName = selectedSkin:match("^(.-) %- (.+)$")
        if rodName and skinName then
            selectedRodName = rodName
            selectedSkinName = skinName
            print("Selected Rod:", rodName, "Skin:", skinName)
        else
            print("Invalid selection format")
        end
    end,
})

local skinGroupButton = sections.Visuals4:AddGroupButton()

skinGroupButton:AddButton({
    Title = "Apply Skin",
    Variant = "Primary",
    Callback = function()
        if selectedRodName and selectedSkinName then
            ApplySkin(selectedRodName, selectedSkinName)
        else
            warn("No skin selected!")
        end
    end,
})


skinGroupButton:AddButton({
    Title = "Remove Skin",
    Variant = "Primary",
    Callback = function()
        lib:Notification("Remove Skin", "This doesn't do anything yet, to remove it just equip a different rod then re-equip the rod.", 8)
    end
})

--[[3itx Code]]--
genv.selectedBoatLocation = nil
genv.SelectedBoatSpawn = nil

local BoatsDataSheet = {
    ["Moosewood"] = {
        ["Coords"] = {357.9726, 133.616, 258.1545},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Moosewood Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Moosewood Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["Sunstone"] = {
        ["Coords"] = {-945.2999, 131.0788, -1116.2346},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Sunstone Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Sunstone Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["Statue"] = {
        ["Coords"] = {23.2196, 135.0304, -1007.0291},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Statue Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Statue Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["Snowcap"] = {
        ["Coords"] = {2622.9399, 136.2839, 2401.3052},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Snowcap Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Snowcap Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["Ancient"] = {
        ["Coords"] = {5869.421875, 143.49795532226562, 7.101318359375},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Ancient Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Ancient Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["Terrapin"] = {
        ["Coords"] = {-186.7543, 132.5000, 1922.5327},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Terrapin Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Terrapin Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["North"] = {
        ["Coords"] = {19609.19140625, 131.42013549804688, 5186.5927734375},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Summit Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Summit Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["Roslit"] = {
        ["Coords"] = {-1452.0543, 133.0000, 745.1692},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Roslit Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Roslit Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["Mushgrove"] = {
        ["Coords"] = {2453.9727, 130.5296, -661.6033},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Mushgrove Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Mushgrove Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
        ["Forsaken"] = {
        ["Coords"] = {-2476.388427734375, 130.1121368408203, 1540.5460205078125},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Forsaken Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Forsaken Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    }
}

genv.BoatLocations = {}
genv.Boats = {}

for _, v in pairs(services.ReplicatedStorage:WaitForChild("playerstats"):WaitForChild(services.Players.LocalPlayer.Name):WaitForChild("Boats"):GetChildren()) do
    table.insert(genv.Boats, v.Name)
end
for Sex, _ in pairs(BoatsDataSheet) do
    table.insert(genv.BoatLocations, Sex)
end

sections.Misc4:AddDropdown("",{
    Title = "Spawn Location",
    Description = "",
    Options = genv.BoatLocations,
    Default = "",
    PlaceHolder = "Select a Spawn Location",
    Multiple = false,
    Callback = function(BoatLocation)
    genv.selectedBoatLocation = BoatLocation
    end,
})
local BoatsDropdown
BoatsDropdown = sections.Misc4:AddDropdown("",{
    Title = "Select Boat",
    Description = "",
    Options = genv.Boats,
    Default = "",
    PlaceHolder = "Select a Boat",
    Multiple = false,
    Callback = function(Boat)
    genv.SelectedBoatSpawn = Boat
    end,
})
local BoatOptions = sections.Misc4:AddGroupButton()
BoatOptions:AddButton({
    Title = "Refresh Boat List",
    Variant = "Primary",
    Callback = function()
    table.clear(genv.Boats)
    for _, v in pairs(services.ReplicatedStorage:WaitForChild("playerstats"):WaitForChild(services.Players.LocalPlayer.Name):WaitForChild("Boats"):GetChildren()) do
    table.insert(genv.Boats, v.Name)
    end
    BoatsDropdown:Refresh(genv.Boats,true)
    BoatsDropdown:Set(genv.SelectedBoatSpawn)
    end,
})

BoatOptions:AddButton({
    Title = "Spawn Boat",
    Variant = "Primary",
    Callback = function()
        local selectedBoatName = genv.SelectedBoatSpawn
        local selectedBoatLocation = genv.selectedBoatLocation
        
        if selectedBoatName and selectedBoatLocation then
            local boatData = BoatsDataSheet[selectedBoatLocation]
            
            if boatData then
                if boatData.Loaded then
                    boatData.remote()
                    task.wait()
                    services.Players.LocalPlayer.PlayerGui.hud.safezone.backpack.Visible = true
                    services.Players.LocalPlayer.PlayerGui.hud.safezone.shipwright.Visible = false
                    services.ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/Boats/Spawn"):InvokeServer(selectedBoatName)
                else
                    local coords = boatData.Coords
                    local player = game.Players.LocalPlayer
                    local position = Vector3.new(unpack(coords))
                    player:RequestStreamAroundAsync(position)
                    local path = loadstring("return " .. boatData.Path)()
                    path.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
                    prompt(path)
                    task.wait()
                    boatData.remote()
                    task.wait()
                    services.Players.LocalPlayer.PlayerGui.hud.safezone.backpack.Visible = true
                    services.Players.LocalPlayer.PlayerGui.hud.safezone.shipwright.Visible = false
                    services.ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/Boats/Spawn"):InvokeServer(selectedBoatName)
                    boatData.Loaded = true
                end
            else
                lib:Notification("Boat Error", "Invalid boat selected.", 3)
            end
        else
            lib:Notification("Boat Error", "Please select a boat and location to work.", 3)
        end
    end,
})



BoatOptions:AddButton({
    Title = "Despawn Boat",
    Variant = "Primary",
    Callback = function()
        local player = services.Players.LocalPlayer
        local activeBoat = workspace.active.boats:FindFirstChild(player.Name)

        if activeBoat then
            services.ReplicatedStorage.packages.Net["RE/Boats/Despawn"]:FireServer()
        else
            lib:Notification("Boat Error", "No Active Boat Found!", 3)
        end
    end,
})

BoatOptions:AddButton({
    Title = "Spawn Boat Near you",
    Variant = "Primary",
    Callback = function()
        local selectedBoatName = genv.SelectedBoatSpawn
        local selectedBoatLocation = "Moosewood"

        if selectedBoatName and selectedBoatLocation then
            local boatData = BoatsDataSheet[selectedBoatLocation]

            if boatData then
                if boatData.Loaded then
                    boatData.remote()
                    task.wait()
                    services.Players.LocalPlayer.PlayerGui.hud.safezone.backpack.Visible = true
                    services.Players.LocalPlayer.PlayerGui.hud.safezone.shipwright.Visible = false
                    services.ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/Boats/Spawn"):InvokeServer(selectedBoatName)
                else
                    local coords = boatData.Coords
                    local player = game.Players.LocalPlayer
                    local position = Vector3.new(unpack(coords))
                    player:RequestStreamAroundAsync(position)
                    local path = loadstring("return " .. boatData.Path)()
                    path.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
                    prompt(path)
                    task.wait()
                    boatData.remote()
                    task.wait()
                    services.Players.LocalPlayer.PlayerGui.hud.safezone.backpack.Visible = true
                    services.Players.LocalPlayer.PlayerGui.hud.safezone.shipwright.Visible = false
                    services.ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/Boats/Spawn"):InvokeServer(selectedBoatName)
                    boatData.Loaded = true
                end
                local playerBoat = game:GetService("Workspace"):WaitForChild("active"):WaitForChild("boats"):WaitForChild(services.Players.LocalPlayer.Name):FindFirstChildOfClass("Model")
                if playerBoat and playerBoat:FindFirstChild("Base") then
                    local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    local direction = Vector3.new(0, -1, 0) -- Downward ray to find ground
                    local distance = 20 -- Raycast distance
                    local ignoreList = {playerBoat, game.Players.LocalPlayer.Character} -- Ignore the boat and player
                    local rayOrigin = playerPosition + Vector3.new(0, 5, -10) -- Adjust initial position to be above and behind the player

                    -- Find the nearest safe position
                    local hit, hitPosition = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(rayOrigin, direction * distance), ignoreList)

                    if hit then
                        -- Adjust position slightly above the ground to avoid embedding
                        local safePosition = hitPosition + Vector3.new(0, playerBoat.Base.Size.Y / 2, 0)
                        playerBoat.Base.CFrame = CFrame.new(safePosition)
                    else
                        lib:Notification("Boat Error", "Could not find a safe place to spawn the boat.", 3)
                    end
                end
            else
                lib:Notification("Boat Error", "Invalid boat selected.", 3)
            end
        else
            lib:Notification("Boat Error", "Please select a boat and location to work.", 3)
        end
    end,
})


sections.Misc4:AddTextbox({
    Title = "Custom Coords Boat TP",
    Default = "",
    Description = "",
    PlaceHolder = "Enter Coords | Example: 1234,128,1239",
    TextDisappear = true,
    Callback = function(Vector)
        local function stringToVector3(inputString)
            inputString = inputString:gsub("%s+", "")
            local xStr, yStr, zStr = inputString:match("([^,]+),([^,]+),([^,]+)")
            local x = tonumber(xStr)
            local y = tonumber(yStr)
            local z = tonumber(zStr)
            if x and y and z then
                return Vector3.new(x, y, z)
            else
                error("Invalid input: Please enter values in the format 'X, Y, Z'")
            end
        end

        local playerBoat = game:GetService('Workspace'):WaitForChild("active"):WaitForChild("boats"):WaitForChild(services.Players.LocalPlayer.Name):FindFirstChildOfClass("Model")
        if playerBoat then
            local owner = playerBoat:FindFirstChild("owner")
            if owner then
                local sitPrompt = owner:FindFirstChild("sitprompt")
                if sitPrompt and sitPrompt.Enabled then
                    fireproximityprompt(sitPrompt)
                    task.wait()
                    local planePart = playerBoat:FindFirstChild("PlanePart")
                    if planePart then
                        local planeConstraint = planePart:FindFirstChild("PlaneConstraint")
                        if planeConstraint then
                            planeConstraint.Enabled = false
                        end
                    end
                    playerBoat.Base.CFrame = CFrame.new(stringToVector3(Vector))
                elseif sitPrompt and sitPrompt.Enabled == false then 
                    local planePart = playerBoat:FindFirstChild("PlanePart")
                    if planePart then
                        local planeConstraint = planePart:FindFirstChild("PlaneConstraint")
                        if planeConstraint then
                            planeConstraint.Enabled = false
                        end
                    end
                    playerBoat.Base.CFrame = CFrame.new(stringToVector3(Vector))
                end
            end
        end
    end
})

sections.Misc4:AddDropdown("", {
    Title = "Perfered Boat TP Spots",
    Description = "",
    Options = genv.TpSpotsName,
    Default = "",
    PlaceHolder = "Select Spot",
    Multiple = false,
    Callback = function(selectedArea)
        _G.TPSpots = workspace.world.spawns.TpSpots:FindFirstChild(selectedArea)
        
        if _G.TPSpots then
            local playerBoat = game:GetService('Workspace'):WaitForChild("active"):WaitForChild("boats"):WaitForChild(services.Players.LocalPlayer.Name):FindFirstChildOfClass("Model")
        if playerBoat then
            local owner = playerBoat:FindFirstChild("owner")
            if owner then
                local sitPrompt = owner:FindFirstChild("sitprompt")
                if sitPrompt and sitPrompt.Enabled then
                    fireproximityprompt(sitPrompt)
                    task.wait()
                    local planePart = playerBoat:FindFirstChild("PlanePart")
                    if planePart then
                        local planeConstraint = planePart:FindFirstChild("PlaneConstraint")
                        if planeConstraint then
                            planeConstraint.Enabled = false
                        end
                    end
                    playerBoat.Base.CFrame = CFrame.new(_G.TPSpots.Position.X,_G.TPSpots.Position.Y,_G.TPSpots.Position.Z)
                elseif sitPrompt and sitPrompt.Enabled == false then 
                    local planePart = playerBoat:FindFirstChild("PlanePart")
                    if planePart then
                        local planeConstraint = planePart:FindFirstChild("PlaneConstraint")
                        if planeConstraint then
                            planeConstraint.Enabled = false
                        end
                    end
                    playerBoat.Base.CFrame = CFrame.new(_G.TPSpots.Position.X,_G.TPSpots.Position.Y,_G.TPSpots.Position.Z)
                end
            end
        end
        end
    end
})

local BoatSettings = {
    ["Max Speed"] = 0,
    ["Turning Speed"] = 0,
    ["Acceleration"] = 0,
}

if require then 
    sections.Misc4:AddSlider("BoatMaxSpeed", {
        Title = "Boat Max Speed",
        Description = "Change Boat Speed",
        Default = 1,
        Min = 0,
        Max = 1000,
        Increment = 1,
        Callback = function(value)
            BoatSettings["Max Speed"] = value
        end,
    })
    genv.UseMaxSpeed = false
    sections.Misc4:AddToggle('', {
        Title = 'Use Max Speed', 
        Description = "Use Custom Max Speed",
        Default = false,
        Callback = function(Value)
            genv.UseMaxSpeed = Value
            local vesselsModule = require(services.ReplicatedStorage.modules.vessels)
            if genv.UseMaxSpeed then
                for boat, Properties in next, vesselsModule.library do
                    Properties.MaxSpeed = BoatSettings["Max Speed"]
                end
            else
                for boat, Properties in next, vesselsModule.library do
                    if data.Boats[boat] then
                        Properties.MaxSpeed = tonumber(data.Boats[boat].MaxSpeed)
                    end
                end
            end
        end,
    })

    sections.Misc4:AddSlider("TurningSpeed", {
    Title = "Boat Turning Speed",
    Description = "Change Turning Speed",
    Default = 1,
    Min = 0,
    Max = 100,
    Increment = 1,
    Callback = function(value)
        BoatSettings["Turning Speed"] = value
    end,
    })

    genv.UseTurningSpeed = false
    sections.Misc4:AddToggle('', {
        Title = 'Use Turning Speed', 
        Description = "Use Custom Turning Speed",
        Default = false,
        Callback = function(Value)
            genv.UseTurningSpeed = Value
            local vesselsModule = require(services.ReplicatedStorage.modules.vessels)
            if genv.UseTurningSpeed then
                for boat, Properties in next, vesselsModule.library do
                    Properties.TurningSpeed  = BoatSettings["Turning Speed"]
                end
            else
                for boat, Properties in next, vesselsModule.library do
                    if data.Boats[boat] then
                        Properties.TurningSpeed  = tonumber(data.Boats[boat].TurningSpeed)
                    end
                end
            end
        end,
    })

    sections.Misc4:AddSlider("BoatAcceleration ", {
    Title = "Boat Acceleration",
    Description = "Change Actual Boat Speed",
    Default = 1,
    Min = 0,
    Max = 500,
    Increment = 1,
    Callback = function(value)
        BoatSettings["Acceleration"] = value
    end,
    })

    genv.UseAcceleration = false
    sections.Misc4:AddToggle('', {
        Title = 'Use Acceleration', 
        Description = "Use Custom Acceleration",
        Default = false,
        Callback = function(Value)
            genv.UseAcceleration = Value
            local vesselsModule = require(services.ReplicatedStorage.modules.vessels)
            if genv.UseAcceleration then
                for boat, Properties in next, vesselsModule.library do
                    Properties.Accel  = BoatSettings["Acceleration"]
                end
            else
                for boat, Properties in next, vesselsModule.library do
                    if data.Boats[boat] then
                        Properties.Accel  = tonumber(data.Boats[boat].Acceleration)
                    end
                end
            end
        end,
    })
end


-- local dupe = { Connections = {} }
-- sections.Misc5:AddToggle('Toggle', {
--     Title = 'Fish Dupe', 
--     Description = "The more you have, the quicker it'll be. The dupe is very unstable, experiment on your own, try different servers, fishes, etc.",
--     Default = false,
--     Callback = function(Value)
--         if Value then

--             local fish = services.Players.LocalPlayer.Character:FindFirstChildOfClass('Tool')
--             if not fish:FindFirstChild('link') or not fish.link.Value or not fish.link.Value:IsDescendantOf(game) or not fish:FindFirstChild('fishscript') then
--                 lib:Notification("Fish Dupe","You are not holding a valid item.",1.5)
--                 return
--             end
--             local fishname = fish.Name

--             lib:Notification("Fish Dupe",'Targetting ' .. fishname .. '.',1.5)

--             if ReplicatedStorage.events:FindFirstChild('anno_thought') then
--                 ReplicatedStorage.events.anno_thought:Destroy()
--                 Instance.new("RemoteEvent", ReplicatedStorage.events).Name = "anno_thought"
--             end

--             dupe.Connections.DupeConnection2 = RunService.RenderStepped:Connect((function()

--                 task.spawn(function()
--                     pcall(function()
--                         workspace.world.npcs.Appraiser.appraiser.appraise:InvokeServer()
--                     end)
--                 end)

--                 --local fish = LocalPlayer.Backpack:FindFirstChild(fishname) or Character:FindFirstChild(fishname)
--                 local fish; do
--                     --fish = LocalPlayer.Backpack:FindFirstChild(fishname) or Character:FindFirstChild(fishname)

--                     if not fish then
--                         for i,v in LocalPlayer.Backpack:GetChildren() do
--                             if not v or v.Name ~= fishname or not v:FindFirstChild('link') or not v.link.Value or not v.link.Value:IsDescendantOf(game) or not v:FindFirstChild('fishscript') then
--                                 continue
--                             end

--                             fish = v
--                             break
--                         end
--                     end
--                 end

--                 if fish then
--                     print('Dupe', fish.Name)
--                     fish.Parent = services.Players.LocalPlayer.character
--                 else
--                     print('No fish found')
--                     services.Players.LocalPlayer.character.Humanoid:UnequipTools()
--                     for i,v in services.Players.LocalPlayer.character:GetChildren() do
--                         if v:IsA('Tool') then
--                             v.Parent = LocalPlayer.Backpack
--                         end
--                     end
--                 end

--             end))


--         else

--             if dupe.Connections.DupeConnection2 then
--                 dupe.Connections.DupeConnection2:Disconnect()
--                 dupe.Connections.DupeConnection2 = nil
--             end

--             if dupe.Connections.DupeConnection3 then
--                 dupe.Connections.DupeConnection3:Disconnect()
--                 dupe.Connections.DupeConnection3 = nil
--             end

--             for i,v in services.Players.LocalPlayer.character:GetChildren() do
--                 if v:IsA('Tool') then
--                     v.Parent = LocalPlayer.Backpack
--                 end
--             end

--         end
--     end
-- })

-- local DupeFishGroupButton = sections.Misc5:AddGroupButton()

-- function DestroyGhostDupe()
--     local Players = services.Players
--     local ReplicatedStorage = services.ReplicatedStorage

--     local LocalPlayer = Players.LocalPlayer
--     local PlayerGui = LocalPlayer.PlayerGui
--     local hud = PlayerGui:FindFirstChild("hud")
--     local safezone = hud and hud:FindFirstChild("safezone")
--     local backpack = safezone and safezone:FindFirstChild("backpack")
--     local inventory = backpack and backpack:FindFirstChild("inventory")
--     local scroll = inventory and inventory:FindFirstChild("scroll")
--     local playerInventory = ReplicatedStorage:WaitForChild("playerstats")[LocalPlayer.Name]:WaitForChild("Inventory")

--     if scroll then
--         for _, child in pairs(scroll:GetChildren()) do
--             if child:FindFirstChild("item") then
--                 local itemValue = tostring(child.item.Value)
--                 if not playerInventory:FindFirstChild(itemValue) then
--                     child:Destroy()
--                 end
--             end
--         end
--     end
-- end

-- DupeFishGroupButton:AddButton({
--     Title = "Delete Ghost Items",
--     Variant = "Primary",
--     Callback = function()
--         DestroyGhostDupe()
--     end,
-- })

-- DupeFishGroupButton:AddButton({
--     Title = "Create Safe Zone",
--     Variant = "Primary",
--     Callback = function()
--         local SafeZone = Instance.new("Part")
--         SafeZone.Size = Vector3.new(15, 1, 15)
--         SafeZone.Position = Vector3.new(math.random(-2000,2000), math.random(50000,90000), math.random(-2000,2000))
--         SafeZone.Anchored = true
--         SafeZone.BrickColor = BrickColor.new("Royal purple")
--         SafeZone.Material = Enum.Material.ForceField
--         SafeZone.Parent = game.Workspace
--         LocalPlayer.Character.HumanoidRootPart.CFrame = SafeZone.CFrame + Vector3.new(0, 5, 0)
--         lib:Notification("Safezone", "You need to use teleports to go back.", 7)
--     end,
-- })

-- DupeFishGroupButton:AddButton({
--     Title = "Copy Tutorial Video Link",
--     Variant = "Outline",
--     Callback = function()
--         setclipboard("https://youtu.be/Axq0W7sOAFc")
--         lib:Notification("Tutorial","Copied link to clipboard, just paste it.", 5)
--     end,
-- })

--[[3itx Made this]]--

-- Function to grab and format the playtime
local function grabPlayTime()
    local seconds = PlayerStats.tracker_timeplayed.Value or 0  -- Grab the playtime (in seconds)

    -- Convert seconds to days, hours, minutes, seconds
    local days = math.floor(seconds / 86400)  -- 1 day = 86400 seconds
    local hours = math.floor((seconds % 86400) / 3600)  -- 1 hour = 3600 seconds
    local minutes = math.floor((seconds % 3600) / 60)  -- 1 minute = 60 seconds
    local remainingSeconds = math.floor(seconds % 60)  -- Remaining seconds

    -- Construct the formatted string
    local timeString = ""
    if days > 0 then
        timeString = timeString .. days .. "d "
    end
    if hours > 0 then
        timeString = timeString .. hours .. "h "
    end
    if minutes > 0 then
        timeString = timeString .. minutes .. "m "
    end
    if remainingSeconds > 0 or (days == 0 and hours == 0 and minutes == 0) then
        timeString = timeString .. remainingSeconds .. "s"
    end

    return timeString
end


genv.WebhookURL = nil
local UseProxy = false
local EmbedColor = nil
local EditDelay = 60
function color3ToHex(color)
    local r = math.floor(color.R * 255)
    local g = math.floor(color.G * 255)
    local b = math.floor(color.B * 255)
    return string.format("#%02X%02X%02X", r, g, b)
end

function processFishingZones()
    local names = {}
    
    for _, child in pairs(workspace.zones.fishing:GetChildren()) do
        if child:FindFirstChild("beacon") then
            local poiHeader = child:FindFirstChild("POIHeader")
            if poiHeader and poiHeader:FindFirstChild("title") and poiHeader.title:IsA("TextLabel") then
                local titleText = poiHeader.title.Text
                table.insert(names, titleText)
            end
        end
        
        local abundance = child:FindFirstChild("Abundance")
        if abundance and abundance:FindFirstChild("Chance") and abundance:FindFirstChild("Mutation") then
            table.insert(names, child.Name)
        end
    end

    if #names == 0 then
        return "none"
    end

    local nameCount = {}
    for _, name in ipairs(names) do
        nameCount[name] = (nameCount[name] or 0) + 1
    end

    local result = {}
    for name, count in pairs(nameCount) do
        if count > 1 then
            table.insert(result, name .. " (x" .. count..")")
        else
            table.insert(result, name)
        end
    end

    return table.concat(result, ", ")
end
function getServerUptime()
    local uptimeText = LocalPlayer.PlayerGui.serverInfo.serverInfo.uptime.Text
    local uptime = uptimeText:gsub("Server Uptime: ", "")
    local hours, minutes, seconds = uptime:match("(%d+):(%d+):(%d+)")
    local formattedUptime = ""
    if hours and tonumber(hours) > 0 then
        formattedUptime = formattedUptime .. hours .. "h "
    end
    if minutes and tonumber(minutes) > 0 then
        formattedUptime = formattedUptime .. minutes .. "m "
    end
    if seconds and tonumber(seconds) > 0 then
        formattedUptime = formattedUptime .. seconds .. "s"
    end
    return formattedUptime:match("^%s*(.-)%s*$") 
end

local HiddenMode = false
function StatusEmbed()
    function NoDiddy()
        if HiddenMode then
        return "Lunor User <3"
        else
        return "@"..LocalPlayer.DisplayName.."("..LocalPlayer.Name..")"
        end
    end
    return {
    ["title"] = tostring(NoDiddy()).." - Lunor // Fisch",
    ["description"] = "◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤\n"
    .. "**« Account Info »**\n"
    .. "🕹️ <:1036413570302345277:1320298554178273283>lvl » " .. tostring(LocalPlayer.leaderstats.Level.Value or "Error") .. "\n"
    .. "💰 <:1032398237283385364:1320297984302514206>C$ » " .. tostring(LocalPlayer.leaderstats["C$"].Value or "Error") .. "\n"
    .. "🔥 <:1032398237283385364:1320297984302514206>Streak » " .. (function()
        local streak = PlayerStats.tracker_streak.Value
        if tonumber(streak) then
            return formatNumber(tonumber(streak))
        else
            return "Error"
        end
    end)() .. "\n"    
    .. "🎣 <:1032398237283385364:1320297984302514206>Equipped Rod » " .. tostring(PlayerStats.rod.Value or "Error") .. "\n"
    .. "🌏 <:1032398237283385364:1320297984302514206>Location » " .. tostring(character.zone.Value or "Error") .. "\n"
    -- .. "✨ <:1032398237283385364:1320297984302514206>XP » " .. tostring(PlayerStats.xp.Value or "Error") .. "\n" -- it just looks bad no offense
    .. "📦 <:1032398237283385364:1320297984302514206>Bait » " .. (function()
        local sum = 0
        local baitStats = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.bait
        for _, v in ipairs(baitStats:GetChildren()) do
            sum += tonumber(v.Value) or 0
        end
        return formatNumber(sum) or "Error"
    end)() .. "\n"    
    .. "🐟 <:1032398237283385364:1320297984302514206>Total Caught » " .. (function()
        local fishCaught = PlayerStats.tracker_fishcaught.Value
        if tonumber(fishCaught) then
            return formatNumber(tonumber(fishCaught))
        else
            return "Error"
        end
    end)() .. "\n"    
    .. "🎒 <:1032398237283385364:1320297984302514206>Inventory Value » " .. tostring(calculateInventoryValue() or "Error") .. "\n"
    .. "⌛ <:10364135703023452772:1320300405632270356>Time Played » " .. grabPlayTime() .. "\n\n"
    .. "**« Server Info »**\n"
    .. "🌧️ <:1036413570302345277:1320298554178273283>Weather » " .. tostring(ReplicatedStorage.world.weather.Value or "Error") .. "\n"
    .. "🌥️ <:1032398237283385364:1320297984302514206>Time » " .. tostring(ReplicatedStorage.world.cycle.Value or "Error") .. "\n"
    .. "🌿 <:1032398237283385364:1320297984302514206>Season » " .. tostring(ReplicatedStorage.world.season.Value or "Error") .. "\n"
    .. "🌆 <:1032398237283385364:1320297984302514206>Event » " .. tostring(ReplicatedStorage.world.event.Value or "Error") .. "\n"
    .. "🦈 <:1032398237283385364:1320297984302514206>Event Fish » " .. tostring(processFishingZones() or "Error") .. "\n"
    .. "🕓 <:1032398237283385364:1320297984302514206>Server Uptime » " .. tostring(getServerUptime() or "Error") .. "\n"
    .. "📍 <:1032398237283385364:1320297984302514206>Server Location » " 
        .. tostring(ReplicatedStorage:WaitForChild("world"):WaitForChild("region_country").Value or "Error") .. ", "
        .. tostring(ReplicatedStorage:WaitForChild("world"):WaitForChild("region_region").Value or "Error") .. ", "
        .. tostring(ReplicatedStorage:WaitForChild("world"):WaitForChild("region_city").Value or "Error") .. "\n"
    .. "🍚 <:1032398237283385364:1320297984302514206>Version » " .. tostring(ReplicatedStorage:WaitForChild("world"):WaitForChild("version").Value or "Error") .. "\n"
    .. "👥 <:10364135703023452772:1320300405632270356>Players » " .. tostring(#Players:GetPlayers() or "Error") .. "\n"
    .. "◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤\n"
    .. "-# Updating in <t:" .. tostring((os.time() + (EditDelay or 0)) or "Error") .. ":R>",
    ["color"] = discordColor,
    ["thumbnail"] = {["url"] = "https://you.whimper.xyz/sources/lunor/e-z/nfamu2z5i9b88fitmk.png"}
    }
end
function StoppedEmbed()
    return {
        ["title"] = "Webhook Has Been Stopped :skull:",
        ["description"] = "```ansi\n" ..
                          "[2;43m[2;37m[1;37mThanks for using Lunor Webhook's[0m[2;37m[2;43m[0m[2;43m[0m\n" ..
                          "```",
        ["color"] = 16711680, -- This color is for the embed border
        ["thumbnail"] = {
            ["url"] = "https://you.whimper.xyz/sources/lunor/e-z/nfamu2z5i9b88fitmk.png"
        }
    }
end

local function checkWebhook(url)
    local success, response = pcall(function()
        return request({
            Url = url,
            Method = "GET"
        })
    end)

    if not success then
        print("An error occurred: " .. tostring(response))
        return false
    else
        if response.StatusCode == 200 then
            return true 
        elseif response.StatusCode == 401 then
            return false
        else
            lib:Notification("Webhook Settings","Error has been Caught" ..response.StatusCode , 5)
            return false
        end
    end
end

function replaceWebhookURL(webhookLink)
    webhookLink = webhookLink:gsub("https://canary%.?", "https://"):gsub("https://ptb%.?", "https://") or webhookLink
    webhookLink = webhookLink:gsub("https://discord%.com/api/webhooks/", "https://webhook.lewisakura.moe/api/webhooks/"):gsub("https://discordapp%.com/api/webhooks/","https://webhook.lewisakura.moe/api/webhooks/")
    return webhookLink
end

genv.StatusWebhook = false
sections.Webhook1:AddTextbox({
    Title = "Webhook URL",
    PlaceHolder = "Insert Webhook URL",
    Default = "",
    Description = "",
    TextDisappear = true,
    Callback = function(Webhook)
        local isAlive = checkWebhook(Webhook)
        if isAlive then
            if UseProxy then
                genv.WebhookURL = replaceWebhookURL(Webhook)
            else
                genv.WebhookURL = Webhook
            end
        else
            lib:Notification("Webhook Settings","Webhook is not a valid Link please Provide a Valid Webhook link", 5)
        end
    end
})
sections.Webhook1:AddToggle("UseProxy", {
    Title = "Use Proxy",
    Default = true,
    Description = "",
    Callback = function(isEnabled)
    UseProxy = isEnabled
    end
})

sections.Webhook2:AddColorpicker("EmbedColor", {
    Title = "Embed Color",
    Default = Color3.fromRGB(208, 157, 255),
    Callback = function(selectedColor)
        -- Extract and scale RGB values from Color3
        local red = math.floor(selectedColor.R * 255)
        local green = math.floor(selectedColor.G * 255)
        local blue = math.floor(selectedColor.B * 255)
        
        -- Convert to Discord embed color format
        discordColor = red * 65536 + green * 256 + blue
        
        -- Print the formatted color
        -- print("Discord Embed Color:", discordColor)
    end,
})


sections.Webhook2:AddTextbox({
    Title = "Edit Embed Delay (s)",
    Default = "",
    Description = "",
    PlaceHolder = "Insert a Delay",
    TextDisappear = false,
    Callback = function(Delay)
        EditDelay = Delay
    end
})

sections.Webhook2:AddToggle("HiddenToggle", {
    Title = "Hide from the Feds",
    Default = false,
    Description = "Won't show your name in the webhook message.",
    Callback = function(isEnabled)
    HiddenMode = isEnabled
    end
})

local function sendWebhook()
    local data = {
        ["content"] = "",
        ["embeds"] = {StatusEmbed()}
    }

    local jsonData = HttpService:JSONEncode(data)

    local headers = {
        ["content-type"] = "application/json"
    }

    local response = request({
        Url = genv.WebhookURL .. "?wait=true",
        Method = "POST",
        Headers = headers,
        Body = jsonData
    })

    if response.StatusCode == 200 then
        local responseBody = HttpService:JSONDecode(response.Body)
        local messageId = responseBody.id
        print("Message ID:", messageId)

        return messageId
    else
        print("Error sending webhook message:", response.StatusCode, response.StatusMessage)
        return nil
    end
end

local function sendStoppedEmbed(messageId)
    local stoppedData = {
        ["embeds"] = {StoppedEmbed()}
    }
    local stoppedJsonData = HttpService:JSONEncode(stoppedData)

    local headers = {
        ["content-type"] = "application/json"
    }

    local stoppedResponse = request({
        Url = genv.WebhookURL .. "/messages/" .. messageId,
        Method = "PATCH",
        Headers = headers,
        Body = stoppedJsonData
    })

    if stoppedResponse.StatusCode == 200 then
        print("Webhook stopped message sent successfully!")
    else
        print("Error sending stopped message:", stoppedResponse.StatusCode, stoppedResponse.StatusMessage)
    end
end

local function editWebhook(messageId)
    while genv.StatusWebhook do
        task.wait(EditDelay)

        local data = {
            ["embeds"] = {StatusEmbed()}
        }

        local jsonData = HttpService:JSONEncode(data)

        local headers = {
            ["content-type"] = "application/json"
        }

        local editResponse = request({
            Url = genv.WebhookURL .. "/messages/" .. messageId,
            Method = "PATCH",
            Headers = headers,
            Body = jsonData
        })

        if editResponse.StatusCode == 200 then
            print("Message edited successfully!")
        else
            print("Error editing message:", editResponse.StatusCode, editResponse.StatusMessage)
        end
    end
    sendStoppedEmbed(messageId)
end

sections.Webhook3:AddToggle("StartStatusWebhook", {
    Title = "Start Status",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        genv.StatusWebhook = isEnabled
        if isEnabled then
            local messageId = sendWebhook()
            if messageId then
                editWebhook(messageId)
            end
        else
            genv.StatusWebhook = false
        end
    end
})

local playerName = LocalPlayer.Name
local playerStats = ReplicatedStorage:WaitForChild("playerstats"):WaitForChild(playerName)
local inventory = playerStats:WaitForChild("Inventory")
local data1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Catto-YFCN/GoofyData/refs/heads/main/DataFishOnly"))()
local data2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Catto-YFCN/GoofyData/refs/heads/main/FishImages"))()

genv.lol = false
local connections = {} -- To store connections for cleanup

local function createWebhookEmbed(title, description, imageURL, thumbnailURL)
    return {
        ["title"] = title,
        ["description"] = description,
        ["color"] = 0,
        ["image"] = { ["url"] = imageURL },
        ["thumbnail"] = { ["url"] = thumbnailURL }
    }
end


local function sendWebhook2(embed)
    local data = {
        ["content"] = "",
        ["embeds"] = { embed }
    }
    local jsonData = HttpService:JSONEncode(data)
    local headers = { ["content-type"] = "application/json" }

    local response = request({
        Url = genv.WebhookURL,
        Method = "POST",
        Headers = headers,
        Body = jsonData
    })

    print("Webhook sent with status:", response.StatusCode)
end


local function onValueChanged(value)
    if not value or not value:IsA("ValueBase") then
        print("Error: Invalid value detected:", tostring(value))
        return
    end

    local parent = value.Parent
    if not parent then
        print("Error: Parent not found for value:", value.Name)
        return
    end
    task.wait()
    local description = "<:1036413570302345277:1320298554178273283> **Fish Name:** " .. parent.Name:gsub("%d", "") .. "\n"
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("ValueBase") or child:IsA("BoolValue") then
            description = description .. "<:1032398237283385364:1320297984302514206> **" .. child.Name .. ":** " .. tostring(child.Value) .. "\n"
        end
    end
    description = description .. "<:1032398237283385364:1320297984302514206> ** Rarity ** : " .. tostring(data1.Fish[tostring(parent.Name:gsub("%d", ""))].Rarity or "Unknown") .. "\n" .. "<:10364135703023452772:1320300405632270356> **Total Price** : " .. tostring(GetBackPackItemValue(parent.Name)) .. "\n**Showcase Image:**"

    local embed = createWebhookEmbed(
        "Lunor Auto Catcher Notifier",
        description,
        tostring(data2.ImageLinks[tostring(parent.Name:gsub("%d", ""))].Link) or "https://stablepoint.com/assets/uploads/images/blog/503-image1.jpg?v=1636710553",
        "https://you.whimper.xyz/sources/lunor/e-z/nfamu2z5i9b88fitmk.png"
    )
    sendWebhook2(embed)
end

local function monitorItem(item)
    if not genv.lol then return end
    
    -- Monitor the item itself if it's a ValueBase
    if item:IsA("ValueBase") then
        local connection = item.Changed:Connect(function()
            if not genv.lol then
                connection:Disconnect()
                return
            end
            onValueChanged(item)
        end)
        table.insert(connections, connection)
    end
    
    -- Monitor all children
    for _, child in ipairs(item:GetChildren()) do
        monitorItem(child)
    end
    
    -- Monitor for new children being added
    local childAddedConnection = item.ChildAdded:Connect(function(newChild)
        if not genv.lol then
            childAddedConnection:Disconnect()
            return
        end
        monitorItem(newChild)
    end)
    table.insert(connections, childAddedConnection)
end


local function onInventoryItemAdded(newItem)
    if not genv.lol then return end
    task.wait()
    local description = "<:1036413570302345277:1320298554178273283> **Fish Name:** " .. newItem.Name:gsub("%d", "") .. "\n"
    for _, child in ipairs(newItem:GetChildren()) do
        if child:IsA("ValueBase") or child:IsA("BoolValue") then
            description = description .. "<:1032398237283385364:1320297984302514206> **" .. child.Name .. ":** " .. tostring(child.Value) .. "\n"
        end
    end
    description = description .. "<:1032398237283385364:1320297984302514206> ** Rarity ** : " .. tostring(data1.Fish[tostring(newItem.Name:gsub("%d", ""))].Rarity or "Not Found") .. "\n" .. "<:10364135703023452772:1320300405632270356> **Total Price** : " .. tostring(GetBackPackItemValue(newItem.Name) or "Not Found") .. "\n**Showcase Image:**"

    task.wait()
    local embed = createWebhookEmbed(
        "Lunor Auto Catcher Notifier",
        description,
        tostring(data2.ImageLinks[tostring(newItem.Name:gsub("%d", ""))].Link),
        "https://you.whimper.xyz/sources/lunor/e-z/nfamu2z5i9b88fitmk.png"
    )
    sendWebhook2(embed)
    task.wait()
    for _, child in ipairs(newItem:GetChildren()) do
        if child:IsA("ValueBase") or child:IsA("BoolValue") then
            child.Changed:Connect(onValueChanged)
        end
    end
end

local function toggleMonitoring(isEnabled)
    genv.lol = isEnabled

    for _, connection in ipairs(connections) do
        if typeof(connection) == "RBXScriptConnection" then
            connection:Disconnect()
        end
    end
    table.clear(connections)
    
    if isEnabled then
        local inventoryConnection = inventory.ChildAdded:Connect(function(newItem)
            if not genv.lol then return end
            onInventoryItemAdded(newItem)
            monitorItem(newItem)
        end)
        table.insert(connections, inventoryConnection)
        
        for _, item in ipairs(inventory:GetChildren()) do
            monitorItem(item)
        end
    end
end

sections.Webhook3:AddToggle("", {
    Title = "Start Logging Catches",
    Default = false,
    Description = "",
    Callback = toggleMonitoring
})


coroutine.wrap(function()
    while true do
        pcall(function()
            updateAppraiseDescription()
        end)
        task.wait(1)
    end
end)()


FlagsManager:SetLibrary(lib)
FlagsManager:SetIgnoreIndexes({})
FlagsManager:SetFolder("Lunor/Fisch")
FlagsManager:InitSaveSystem(tabs.Config)

local themes =  tabs.Config:AddSection({Title = "Themes", Description = "if you want to create your own theme u can submit it to the offical discord server", Defualt = true , Locked = true})
local CustomThemes = {}
local StoredThemes = loadstring(game:HttpGet("https://you.whimper.xyz/sources/lunor/themes.lua"))()

for v,_ in pairs(StoredThemes) do
table.insert(CustomThemes, v)
end

themes:AddDropdown("Themes", {
    Title = "Choose Theme",
    Description = "",
    Options = CustomThemes,
    Default = "default",
    PlaceHolder = "Select Theme",
    Multiple = false,
    Callback = function(Theme)
        lib:SetTheme(Theme)
    end,
})

function colorToHex(color)
    local r = math.floor(color.R * 255)
    local g = math.floor(color.G * 255)
    local b = math.floor(color.B * 255)
    return string.format("%02X%02X%02X", r, g, b)
end

sections.Gradient:AddColorpicker("GradientStart", {
    Title = "Gradient Starting Color",
    Default = Color3.new(1.000000, 1.000000, 1.000000),
    Callback = function(selectedColor)
        startingGradient = colorToHex(selectedColor)
        print("Selected Color in Hex: " .. startingGradient)
    end,
})

sections.Gradient:AddColorpicker("GradientEnd", {
    Title = "Gradient Ending Color",
    Default = Color3.new(1.000000, 1.000000, 1.000000),
    Callback = function(selectedColor)
        endingGradient = colorToHex(selectedColor)
        print("Selected Color in Hex: " .. endingGradient)
    end,
})

sections.Gradient:AddButton({
    Title = "Copy Gradient Config",
    Variant = "Outline",
    Callback = function()
        setclipboard('getgenv().GradientColor = {\n    startingColor = "' .. startingGradient .. '",\n    endingColor = "' .. endingGradient .. '"\n}\nscript_key="Insert Lunor Key Here";\nloadstring(game:HttpGet("https://you.whimper.xyz/sources/lunor/main.lua"))()')
        lib:Notification("Gradient", "Successfully copied gradient config to clipboard.", 5)
    end,
})
