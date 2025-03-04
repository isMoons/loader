--[[
 ______  __    __  ________  ________  _______   __    __  ______  __    __  __       __ 
|      \|  \  |  \|        \|        \|       \ |  \  |  \|      \|  \  |  \|  \     /  \
 \$$$$$$| $$\ | $$| $$$$$$$$| $$$$$$$$| $$$$$$$\| $$\ | $$ \$$$$$$| $$  | $$| $$\   /  $$
  | $$  | $$$\| $$| $$__    | $$__    | $$__| $$| $$$\| $$  | $$  | $$  | $$| $$$\ /  $$$
  | $$  | $$$$\ $$| $$  \   | $$  \   | $$    $$| $$$$\ $$  | $$  | $$  | $$| $$$$\  $$$$
  | $$  | $$\$$ $$| $$$$$   | $$$$$   | $$$$$$$\| $$\$$ $$  | $$  | $$  | $$| $$\$$ $$ $$
 _| $$_ | $$ \$$$$| $$      | $$_____ | $$  | $$| $$ \$$$$ _| $$_ | $$__/ $$| $$ \$$$| $$
|   $$ \| $$  \$$$| $$      | $$     \| $$  | $$| $$  \$$$|   $$ \ \$$    $$| $$  \$ | $$
 \$$$$$$ \$$   \$$ \$$       \$$$$$$$$ \$$   \$$ \$$   \$$ \$$$$$$  \$$$$$$  \$$      \$$
                                                                                                                                            
]]


print("--------------------------------------------------------------------------------")


local CoreGui = game:GetService("CoreGui");
local loadTime = os.clock()
local ts = game:GetService("TweenService")
local uis = game:GetService("UserInputService")

local InfLoadGui = {}
-- StarterGui.Infernium
InfLoadGui["1"] = Instance.new("ScreenGui", CoreGui or game:GetService("Players").LocalPlayer.PlayerGui);
InfLoadGui["1"]["Name"] = [[InferniumLoad]];
InfLoadGui["1"]["IgnoreGuiInset"] = true;
InfLoadGui["1"]["ResetOnSpawn"] = false;

-------------------------------------------------
-- StarterGui.Infernium.PhoneButton
InfLoadGui["2"] = Instance.new("Frame", InfLoadGui["1"]);
InfLoadGui["2"]["Visible"] = false;
InfLoadGui["2"]["BorderSizePixel"] = 0;
InfLoadGui["2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
InfLoadGui["2"]["Size"] = UDim2.new(0.03773, 0, 0.07624, 0);
InfLoadGui["2"]["Position"] = UDim2.new(0.45881, 0, 0.41418, 0);
InfLoadGui["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
InfLoadGui["2"]["Name"] = [[PhoneButton]];
InfLoadGui["2"]["BackgroundTransparency"] = 0.34;


-- StarterGui.Infernium.PhoneButton.UIGradient
InfLoadGui["3"] = Instance.new("UIGradient", InfLoadGui["2"]);
InfLoadGui["3"]["Rotation"] = 45;
InfLoadGui["3"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.249, Color3.fromRGB(229, 218, 255)),ColorSequenceKeypoint.new(0.505, Color3.fromRGB(199, 176, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(188, 161, 255))};


-- StarterGui.Infernium.PhoneButton.UICorner
InfLoadGui["4"] = Instance.new("UICorner", InfLoadGui["2"]);
InfLoadGui["4"]["CornerRadius"] = UDim.new(0.26, 0);


-- StarterGui.Infernium.PhoneButton.UIStroke
InfLoadGui["5"] = Instance.new("UIStroke", InfLoadGui["2"]);
InfLoadGui["5"]["Thickness"] = 4;
InfLoadGui["5"]["Color"] = Color3.fromRGB(79, 0, 98);


-- StarterGui.Infernium.PhoneButton.Icon
InfLoadGui["6"] = Instance.new("ImageLabel", InfLoadGui["2"]);
InfLoadGui["6"]["BorderSizePixel"] = 0;
InfLoadGui["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
InfLoadGui["6"]["Image"] = [[http://www.roblox.com/asset/?id=80049658671101]];
InfLoadGui["6"]["Size"] = UDim2.new(0.84244, 0, 0.76453, 0);
InfLoadGui["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
InfLoadGui["6"]["BackgroundTransparency"] = 1;
InfLoadGui["6"]["Name"] = [[Icon]];
InfLoadGui["6"]["Position"] = UDim2.new(0.07641, 0, 0.11024, 0);


-- StarterGui.Infernium.PhoneButton.UIAspectRatioConstraint
InfLoadGui["7"] = Instance.new("UIAspectRatioConstraint", InfLoadGui["2"]);
InfLoadGui["7"]["AspectRatio"] = 1.00454;


-- StarterGui.Infernium.PhoneButton.ImageButton
InfLoadGui["8"] = Instance.new("ImageButton", InfLoadGui["2"]);
InfLoadGui["8"]["BorderSizePixel"] = 0;
InfLoadGui["8"]["AutoButtonColor"] = false;
InfLoadGui["8"]["ImageTransparency"] = 1;
InfLoadGui["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
InfLoadGui["8"]["Image"] = [[rbxassetid://4841508676]];
InfLoadGui["8"]["Size"] = UDim2.new(1, 0, 1, 0);
InfLoadGui["8"]["BackgroundTransparency"] = 1;
InfLoadGui["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

--------------------------------------
-- StarterGui.Infernium.LoadingScreen
InfLoadGui["9"] = Instance.new("Frame", InfLoadGui["1"]);
InfLoadGui["9"]["BorderSizePixel"] = 0;
InfLoadGui["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
InfLoadGui["9"]["Size"] = UDim2.new(0.05988, 0, 0.12438, 0);
InfLoadGui["9"]["Position"] = UDim2.new(0.47006, 0, 0.43781, 0);
InfLoadGui["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
InfLoadGui["9"]["Name"] = [[LoadingScreen]];
InfLoadGui["9"]["BackgroundTransparency"] = 1;
InfLoadGui["9"]["Visible"] = true;


-- StarterGui.Infernium.LoadingScreen.Icon
InfLoadGui["a"] = Instance.new("ImageLabel", InfLoadGui["9"]);
InfLoadGui["a"]["BorderSizePixel"] = 0;
InfLoadGui["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
InfLoadGui["a"]["Image"] = [[http://www.roblox.com/asset/?id=80049658671101]];
InfLoadGui["a"]["Size"] = UDim2.new(1.20497, 0, 1.09353, 0);
InfLoadGui["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
InfLoadGui["a"]["BackgroundTransparency"] = 1;
InfLoadGui["a"]["ImageTransparency"] = 1;
InfLoadGui["a"]["Name"] = [[Icon]];
InfLoadGui["a"]["Position"] = UDim2.new(-0.098, 0, -0.329, 0);


-- StarterGui.Infernium.LoadingScreen.LoadLabel
InfLoadGui["b"] = Instance.new("TextLabel", InfLoadGui["9"]);
InfLoadGui["b"]["TextWrapped"] = true;
InfLoadGui["b"]["BorderSizePixel"] = 0;
InfLoadGui["b"]["TextSize"] = 14;
InfLoadGui["b"]["TextScaled"] = true;
InfLoadGui["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
InfLoadGui["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Montserrat.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
InfLoadGui["b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
InfLoadGui["b"]["BackgroundTransparency"] = 1;
InfLoadGui["b"]["Size"] = UDim2.new(9.21092, 0, 0.20244, 0);
InfLoadGui["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
InfLoadGui["b"]["Text"] = [[Loading module..]];
InfLoadGui["b"]["Name"] = [[LoadLabel]];
InfLoadGui["b"]["Position"] = UDim2.new(-4.08, 0, 0.75977, 0);


-- StarterGui.Infernium.LoadingScreen.LoadLabel.UIStroke
InfLoadGui["c"] = Instance.new("UIStroke", InfLoadGui["b"]);
InfLoadGui["c"]["Thickness"] = 0.8;
InfLoadGui["c"]["Color"] = Color3.fromRGB(32, 9, 59);


-- StarterGui.Infernium.LoadingScreen.UIAspectRatioConstraint
InfLoadGui["d"] = Instance.new("UIAspectRatioConstraint", InfLoadGui["9"]);

_G.Passed = true
local _loaded = false
local _canShow = false
local _LoadingText = {
    "Checking Modules",
    "Initializing Assets",
    "Loading Core Components",
    "Verifying Files",
    "Preparing System",
    "Syncing Resources",
    "Configuring Settings",
    "Loading Data",
    "Establishing Connection",
    "Starting Engine",
    "Optimizing Performance",
    "Checking Dependencies",
    "Finalizing Setup",
    "Compiling Resources",
    "Launching Interface",
    "Encrypting Files",
    "Loading Framework",
    "Validating Modules",
    "Setting Up Network",
    "Checking Integrity",
    "Creating Database",
    "Starting Services",
    "Preloading Scripts",
    "Loading Libraries",
    "Activating Security",
    "Optimizing Code",
    "Initializing System",
    "Decrypting Files",
    "Verifying Connections",
    "Establishing Protocols",
    "Synchronizing Data",
    "Loading Features",
    "Configuring Engine",
    "Loading Assets",
    "Updating Files",
    "Checking Resources",
    "Preparing Data",
    "Activating Modules",
    "System Check Complete",
    "Setting Up UI",
    "Verifying Authentication",
    "Running Security Check",
    "Activating Functions",
    "Preloading Resources"
}

local random = Random.new()
task.spawn(function()
    while _canShow == false do
        for i = 1, 3 do
            InfLoadGui["b"]["Text"] = string.gsub(InfLoadGui["b"]["Text"], "%.+", "")
            InfLoadGui["b"]["Text"] = InfLoadGui["b"]["Text"] .. string.rep(".", i)
            task.wait(0.5)
        end
    end
end)

local upTime = 1.8
local downTime = 0.7
task.spawn(function()
    ts:Create(InfLoadGui["a"], TweenInfo.new(upTime, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {ImageTransparency = 0}):Play()
    ts:Create(InfLoadGui["b"], TweenInfo.new(upTime, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {TextTransparency = 0}):Play()

    while _loaded == false do
        if _G.Passed == false then
            InfLoadGui["b"]["Text"] = "Verifying"
            while _G.Passed == false do
                task.wait(0.5)
            end
        end

        local randomText = _LoadingText[math.random(1, #_LoadingText)]
        InfLoadGui["b"]["Text"] = randomText
        task.wait(random:NextNumber(1.3, 3.5))
    end

    ts:Create(InfLoadGui["a"], TweenInfo.new(downTime, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {ImageTransparency = 1}):Play()
    ts:Create(InfLoadGui["b"], TweenInfo.new(downTime, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
    task.wait(downTime)
    InfLoadGui["1"]:Destroy()
    _canShow = true
end)























------------------ HWID CHECK
-------- HWID CHECK
------------------ HWID CHECK
function toClipboard(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
	else
		print('Clipboard:',"Your exploit doesn't have the ability to use the clipboard")
	end
end

print("Executed Premium!")











------------------------------ hwid okuyucu

-- main
local Players = game:GetService("Players")
local runS = game:GetService("RunService")
local InsertService = game:GetService("InsertService")
local ws = game:GetService("Workspace")
local lighting = game:GetService("Lighting")
local rs = game:GetService("ReplicatedStorage")
local vim = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:FindFirstChild("HumanoidRootPart")
local hum = char:FindFirstChildWhichIsA("Humanoid")
local cam = ws.CurrentCamera
local mouseLocation = uis.GetMouseLocation
local mouse = Players.LocalPlayer:GetMouse()

-- other
local fakeChars = ws:FindFirstChild("FakeCharacters")
local charsFolder = ws:WaitForChild("PlayerCharacters", 20)

ws.Gravity = 196.199969482422
--

-- vars
local function checkDevice()
    if uis.TouchEnabled then
        return "Phone" 
    elseif uis.KeyboardEnabled and uis.MouseEnabled then 
        return "PC" 
    elseif uis.GamepadEnabled then 
        return "Gamepad"
    else
        print("Unknown Device")
        return "PC"
    end
end
local userDevice = checkDevice()
print(userDevice)
local vars = {
    Device = userDevice,
    WalkSpeed = 40,
    JumpPowerEnabled = false,
    JumpPower = 120,
    FlySpeed = 50,
    Fov = 70,
    NoFallDamage = false,

    FirstLaunch = true,
    AntiCheatBypassed = false,
    SawGarbage = false,
    SawRemotes = false,

    ParryKey = Enum.KeyCode.F,
    ParryEnabled = false,
    ParryEquip = false,
    ParryDebug = false,

    HitboxEnabled = false,
    HitboxSize = 2.5,
    HitboxT = 0.8,
    HitboxColor = Color3.fromRGB(139,0,255),
}
local parrySettings = {
    Range = 13,
    Prediction = 4,
    Chance = 100,
}
local conns = {
    ["BackTool"] = nil,
    ["WalkSpeed"] = nil,
	["Respawn"] = nil,
    ["Leave"] = nil,
    ["ParryCheck"] = nil,
    ["HealthChanged"] = nil,
    ["CharactersAdded"] = nil,
    ["CharactersRemoved"] = nil,
    ["Fly"] = nil,
    ["Fov"] = nil,
    ["AimBot"] = nil,

    ["Esp"] = {
        ["EspAdd"] = nil
    },
    ["PhoneGui"] = {},
    ["Noclip"] = nil,
}
local editedWeapons = {}
local wSettings = {
    Color = Color3.fromRGB(100, 100, 100),
    Material = Enum.Material.Neon
}
local catalog = {}
local parryTargets = {}

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
    ["Hell"] = 17893731831
}





-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs
-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs
-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs
-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs
-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs
-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs
local function sendNotify(Duration, Title, Content, SubContent)
    Fluent:Notify(
        {
            Title = Title,
            Content = Content or "",
            SubContent = SubContent or "",
            Duration = Duration or 5
        }
    )
end
local function ChangeToolColor(tool, color, material)
    for _, part in pairs(tool:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Color = color
            part.Material = material
        end
    end
end
local function ChangeBackColor(tool, color, material, changeBackTool)
    local char = player.Character or player.CharacterAdded:Wait()

    local backToolFolder = char:FindFirstChild("ItemsAttached")
    if not backToolFolder then
        return
    end

    local backTool = backToolFolder:FindFirstChildWhichIsA("Model")

    if not backTool then
        editedWeapons[tool.Name].Back = true
        if conns["BackTool"] then
            conns["BackTool"]:Disconnect()
        end
        conns["BackTool"] =
            backToolFolder.ChildAdded:Connect(
            function(child)
                ChangeToolColor(child, color, material)
            end
        )
    elseif backTool ~= nil and changeBackTool == true then
        ChangeToolColor(backTool, color, material, true)
    end
end

local function ChangeSpeed()
    local function isMoving()
        local moveDirection = Vector3.new(0, 0, 0)

        if uis:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + hrp.CFrame.LookVector -- up
        end
        if uis:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - hrp.CFrame.LookVector -- back
        end
        if uis:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - hrp.CFrame.RightVector -- left
        end
        if uis:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + hrp.CFrame.RightVector -- right
        end

        return moveDirection
    end

    if conns["WalkSpeed"] then
        conns["WalkSpeed"]:Disconnect()
        conns["WalkSpeed"] = nil
    end
    conns["WalkSpeed"] =
        runS.RenderStepped:Connect(
        function(dt)
            local moveDirection = isMoving()

            if moveDirection.Magnitude > 0 then
                moveDirection = moveDirection.Unit
                hrp.CFrame = hrp.CFrame + moveDirection * vars.WalkSpeed * dt
            end
        end
    )
end

local currGravity = ws.Gravity
local function ChangeFly()
    local cam = workspace.CurrentCamera
    ws.Gravity = 0

    local function calculateFlyDirection()
        local moveDirection = Vector3.zero
        local cameraLookVector = cam.CFrame.LookVector
        local cameraRightVector = cam.CFrame.RightVector

        if uis:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + cameraLookVector -- forward
        end
        if uis:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - cameraLookVector -- backward
        end
        if uis:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - cameraRightVector -- left
        end
        if uis:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + cameraRightVector -- right
        end
        if uis:IsKeyDown(Enum.KeyCode.Space) then
            moveDirection = moveDirection + Vector3.new(0, 1, 0) -- ascend
        end
        if uis:IsKeyDown(Enum.KeyCode.C) then
            moveDirection = moveDirection - Vector3.new(0, 1, 0) -- descend
        end

        return moveDirection
    end

    if conns["Fly"] then
        conns["Fly"]:Disconnect()
        conns["Fly"] = nil
    end
    conns["Fly"] =
        runS.Heartbeat:Connect(
        function(dt)
            local flyDirection = calculateFlyDirection()

            if flyDirection.Magnitude > 0 then
                hrp.AssemblyLinearVelocity = flyDirection.Unit * vars.FlySpeed
            else
                hrp.AssemblyLinearVelocity = Vector3.zero
            end
        end
    )
end

local function createAsset(assetId)
    local function AddAccessory(Accessory)
        char = player.Character or player.CharacterAdded:Wait()

        local handle = Accessory:WaitForChild("Handle", 5)
        local Attachment = handle:FindFirstChildOfClass("Attachment")
        local Weld = Instance.new("Weld")
        Weld.Name = "AccessoryWeld"
        Weld.Part0 = handle
        if Attachment then
            local other = char:FindFirstChild(tostring(Attachment.Name), true)
            Weld.C0 = Attachment.CFrame
            Weld.C1 = other.CFrame
            Weld.Part1 = other.Parent
        else
            Weld.C1 = CFrame.new(0, char.Head.Size.Y / 2, 0) * Accessory.AttachmentPoint:inverse()
            Weld.Part1 = char.Head
        end
        handle.CFrame = Weld.Part1.CFrame * Weld.C1 * Weld.C0:inverse()
        Accessory.Parent = char
        Weld.Parent = handle
    end

    local asset = game:GetObjects("rbxassetid://" .. tostring(assetId))[1]
    if not asset then
        Fluent:Notify(
            {
                Title = "Error",
                Content = "Problem Error: 00x1b. Probably you wrote incorrect id.",
                SubContent = "If the problem continues, please write about it in our discord channel 'bug-reports'.",
                Duration = 5
            }
        )

        return
    end

    asset.Name = "__" .. asset.Name
    catalog[asset.Name] = assetId

    if asset:IsA("Accessory") then
        AddAccessory(asset)
    elseif asset:IsA("Pants") or asset:IsA("Shirt") or asset:IsA("ShirtGraphic") then
        asset.Parent = char
    end
end
local function deleteAllAccessories()
    for _, asset in pairs(char:GetDescendants()) do
        if catalog[asset.Name] then
            asset:Destroy()
            catalog[asset.Name] = nil
        end
    end
end
local function keyPress(key)
    vim:SendKeyEvent(true, key, false, game)
    task.wait()
    vim:SendKeyEvent(false, key, false, game)
end

local lastAttachChanced = true
local triedToParry
local distPlayersParrys
local lastHealth = hum.Health
local parryDebugStr = "Player: %s \n Range: %s \n Distance: %s \n Difference: %s"
local function humanoidHealthChanged()
    if conns["HealthChanged"] then
        conns["HealthChanged"]:Disconnect()
        conns["HealthChanged"] = nil
    end
    conns["HealthChanged"] = hum.HealthChanged:Connect(function(newHealth)
            if lastHealth - newHealth > 0 then -- damaged
                if vars.ParryEnabled and vars.ParryDebug then
                    if not distPlayersParrys then
                        return
                    end
                    if not triedToParry then
                        return
                    end
                    local difference = distPlayersParrys - tonumber(parrySettings.Range)

                    local message = string.format(parryDebugStr, triedToParry, parrySettings.Range, distPlayersParrys, difference)
                    local subMessage = ""
                    if difference < 0 then
                        message = "Parry-Cooldown"
                    end
                    if lastAttachChanced == false then
                        message = "Just Unluck"
                        subMessage = "You can increase the chance of parrying in the settings"
                    end

                    sendNotify(5, "Parry Debug", message, subMessage)
                end
            end

            lastHealth = newHealth
        end
    )
end


local function ResizeHitbox(oChar, size, transparency)
    local head = oChar:FindFirstChild("Head")
    if not head then return end  
    head.Size = size
    head.Transparency = 1
    head.CanCollide = false
    head.Massless = true

    local showHitboxPart = head:FindFirstChild("__ShowHitboxPart")
    if not showHitboxPart then
        local showHitboxPart = Instance.new("Part")
        showHitboxPart.Size = size
        showHitboxPart.Transparency = transparency
        showHitboxPart.Color = vars.HitboxColor
        showHitboxPart.CanCollide = false
        showHitboxPart.Massless = true
        showHitboxPart.Material = Enum.Material.Neon

        showHitboxPart.Name = "__ShowHitboxPart"

        showHitboxPart.CFrame = head.CFrame
        showHitboxPart.Parent = head

        local weld = Instance.new("Weld")
        weld.Part0 = head
        weld.Part1 = showHitboxPart
        weld.Name = "__HitboxPartWeld"
        weld.Parent = head
    else
        if vars.HitboxEnabled then
            showHitboxPart.Size = size
            showHitboxPart.Transparency = transparency
            showHitboxPart.Color = vars.HitboxColor
        else
            showHitboxPart.Transparency = 1
        end
    end
end
conns["CharactersAdded"] = charsFolder.ChildAdded:Connect(function(oChar)
    if oChar.Name ~= char.Name then
        if vars.HitboxEnabled then
            ResizeHitbox(oChar, Vector3.new(vars.HitboxSize,vars.HitboxSize,vars.HitboxSize), vars.HitboxT)
        end
    end
end)




--------------------------- getgc
local gameGc = {
    OldRagdoll = nil,
    RagdollTable = nil,

    OldJumpCooldown = nil,
    JumpTable = nil,

    OldDashCooldown = nil,
    DashTable = nil,

    StaminaTable = nil,
}

local function seeGarbage()
    vars.SawGarbage = true
    for _, v in ipairs(getgc(true)) do
        if typeof(v) == "table" then
            if rawget(v, "toggleRagdoll") then
                gameGc.OldRagdoll = v.toggleRagdoll
                gameGc.RagdollTable = v 
            elseif rawget(v, "getCanJump") then
                gameGc.OldJumpCooldown = v.getCanJump
                gameGc.JumpTable = v
            elseif rawget(v, "DASH_COOLDOWN") then
                gameGc.OldDashCooldown = v.DASH_COOLDOWN
                gameGc.DashTable = v
            elseif rawget(v, "_setStamina") then
                gameGc.StaminaTable = v
            end
        end
    end
end
--- remotes and hookmetamethod

local function seeRemotes()
    vars.SawRemotes = true
    local remotes = {}
    if (getgenv().remotesFound == nil) then
        for i, v in pairs(getgc(true)) do
            if type(v) == "table" and rawget(v,"Remote") then
                remotes[v.Name] = v.Remote
            end
        end
        getgenv().remotesFound = true
        getgenv().remotes = remotes
    else
        remotes = getgenv().remotes
    end


    local hook
    hook = hookmetamethod(game, "__namecall", function(self, ...)
        if not checkcaller() and getnamecallmethod() == "FireServer" and vars.NoFallDamage and self.Name == remotes["TakeFallDamage"].Name then
            return
        end
        return hook(self, ...)
    end)
end


--- bypass anti cheat
function bypassAnticheat()
    vars.AntiCheatBypassed = true
    local success, fail = pcall(function()
        local fw = require(rs.Framework.Nevermore);
        hookfunction(fw("AntiCheatHandler").punish, function()
            return;
        end)
    end)

    if success then
        print("BAC")
    else
        print("Error While BAC")
        print(fail)
    end
end
-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs
-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs
-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs
-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs
-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs
-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs-- funcs












------------------ Loading Screen
-------- Loading Screen
------------------ Loading Screen
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/Main.lua"))()
_loaded = true

repeat task.wait(1) until _canShow == true


local Window = Fluent:CreateWindow(
    {
        Title = "Infernium ",
        SubTitle = "Combat Warriors 1.3",
        TabWidth = 136,
        Size = UDim2.fromOffset(550, 425),
        Acrylic = true,
        Theme = "Amethyst",
        MinimizeKey = Enum.KeyCode.RightShift
    }
)
------------------ Phone Button
-------- Phone Button
------------------ Phone Button
local InfPhoneGui = {}
local Hovered = false
local Holding = false
local MoveCon = nil
local InitialX, InitialY, UIInitialPos
if userDevice == "Phone" then
    local otherGui = CoreGui:FindFirstChild("InferniumPhone") or player.PlayerGui:FindFirstChild("InferniumPhone")
    if otherGui then otherGui:Destroy() end

    -- StarterGui.Infernium
    InfPhoneGui["1"] = Instance.new("ScreenGui", CoreGui or game:GetService("Players").LocalPlayer.PlayerGui);
    InfPhoneGui["1"]["Name"] = [[InferniumPhone]];
    InfPhoneGui["1"]["IgnoreGuiInset"] = true;
    InfPhoneGui["1"]["ResetOnSpawn"] = false;

    -------------------------------------------------
    -- StarterGui.Infernium.PhoneButton
    InfPhoneGui["2"] = Instance.new("Frame", InfPhoneGui["1"]);
    InfPhoneGui["2"]["Visible"] = true;
    InfPhoneGui["2"]["BorderSizePixel"] = 0;
    InfPhoneGui["2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
    InfPhoneGui["2"]["Size"] = UDim2.new(0.03773, 0, 0.07624, 0);
    InfPhoneGui["2"]["Position"] = UDim2.new(0.57, 0, 0.03, 0);
    InfPhoneGui["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    InfPhoneGui["2"]["Name"] = [[PhoneButton]];
    InfPhoneGui["2"]["BackgroundTransparency"] = 0.34;

    local function Drag()
        if Holding == false then MoveCon:Disconnect(); return end
        local distanceMovedX = InitialX - mouse.X
        local distanceMovedY = InitialY - mouse.Y
    
        InfPhoneGui["2"].Position = UIInitialPos - UDim2.new(0, distanceMovedX, 0, distanceMovedY)
    end
    for i,v in pairs(conns["PhoneGui"]) do
        if v then
            v:Disconnect()
            v = nil
        end
    end
    conns["PhoneGui"]["Enter"] = InfPhoneGui["2"].MouseEnter:Connect(function()
        Hovered = true
    end)
    
    conns["PhoneGui"]["Leave"] = InfPhoneGui["2"].MouseLeave:Connect(function()
        Hovered = false
    end)

    conns["PhoneGui"]["Holding1"] = uis.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Holding = Hovered
            if Holding then
                InitialX, InitialY = mouse.X, mouse.Y
                UIInitialPos = InfPhoneGui["2"].Position

                MoveCon = mouse.Move:Connect(Drag)
            end
        end
    end)
    
    conns["PhoneGui"]["Holding2"] = uis.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Holding = false
        end
    end)


    -- StarterGui.Infernium.PhoneButton.UIGradient
    InfPhoneGui["3"] = Instance.new("UIGradient", InfPhoneGui["2"]);
    InfPhoneGui["3"]["Rotation"] = 45;
    InfPhoneGui["3"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.249, Color3.fromRGB(229, 218, 255)),ColorSequenceKeypoint.new(0.505, Color3.fromRGB(199, 176, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(188, 161, 255))};


    -- StarterGui.Infernium.PhoneButton.UICorner
    InfPhoneGui["4"] = Instance.new("UICorner", InfPhoneGui["2"]);
    InfPhoneGui["4"]["CornerRadius"] = UDim.new(0.26, 0);


    -- StarterGui.Infernium.PhoneButton.UIStroke
    InfPhoneGui["5"] = Instance.new("UIStroke", InfPhoneGui["2"]);
    InfPhoneGui["5"]["Thickness"] = 4;
    InfPhoneGui["5"]["Color"] = Color3.fromRGB(79, 0, 98);


    -- StarterGui.Infernium.PhoneButton.Icon
    InfPhoneGui["6"] = Instance.new("ImageLabel", InfPhoneGui["2"]);
    InfPhoneGui["6"]["BorderSizePixel"] = 0;
    InfPhoneGui["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    InfPhoneGui["6"]["Image"] = [[http://www.roblox.com/asset/?id=80049658671101]];
    InfPhoneGui["6"]["Size"] = UDim2.new(0.84244, 0, 0.76453, 0);
    InfPhoneGui["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    InfPhoneGui["6"]["BackgroundTransparency"] = 1;
    InfPhoneGui["6"]["Name"] = [[Icon]];
    InfPhoneGui["6"]["Position"] = UDim2.new(0.07641, 0, 0.11024, 0);


    -- StarterGui.Infernium.PhoneButton.UIAspectRatioConstraint
    InfPhoneGui["7"] = Instance.new("UIAspectRatioConstraint", InfPhoneGui["2"]);
    InfPhoneGui["7"]["AspectRatio"] = 1.00454;


    -- StarterGui.Infernium.PhoneButton.ImageButton
    InfPhoneGui["8"] = Instance.new("ImageButton", InfPhoneGui["2"]);
    InfPhoneGui["8"]["BorderSizePixel"] = 0;
    InfPhoneGui["8"]["AutoButtonColor"] = false;
    InfPhoneGui["8"]["ImageTransparency"] = 1;
    InfPhoneGui["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    InfPhoneGui["8"]["Image"] = [[rbxassetid://4841508676]];
    InfPhoneGui["8"]["Size"] = UDim2.new(1, 0, 1, 0);
    InfPhoneGui["8"]["BackgroundTransparency"] = 1;
    InfPhoneGui["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

    conns["PhoneGui"]["Press"] = InfPhoneGui["8"].TouchTap:Connect(function()
        Window:Minimize()
    end)
end
local Tab = {
    Credits = Window:AddTab({Title = "Credits", Icon = "paperclip"}),
    Player = Window:AddTab({Title = "Player", Icon = "user"}),
    Legit = Window:AddTab({Title = "Legit", Icon = "bone"}),
    Rage = Window:AddTab({Title = "Rage", Icon = "swords"}),
    Parry = Window:AddTab({Title = "Parry", Icon = "shield"}),
    Esp = Window:AddTab({Title = "Esp", Icon = "eye"}),
    Sounds = Window:AddTab({Title = "Sounds", Icon = "volume-2"}),
    Changer = Window:AddTab({Title = "Changer", Icon = "droplets"}),
    World = Window:AddTab({Title = "World", Icon = "globe"}),
    Misc = Window:AddTab({Title = "Misc", Icon = "dices"}),
}

local function copyEffects(source, target)
    for _, child in pairs(source:GetChildren()) do
        if child:IsA("ParticleEmitter") or child:IsA("Attachment") then
            child:Clone().Parent = target
        elseif child:IsA("BasePart") or child:IsA("Folder") or child:IsA("Model") then
            local targetChild = target:FindFirstChild(child.Name)
            if not targetChild then
                targetChild = Instance.new(child.ClassName)
                targetChild.Name = child.Name
                targetChild.Parent = target
            end
            copyEffects(child, targetChild)
        else
            child:Clone().Parent = target
        end
    end
end

local function getMatchingPart(character, partName)
    local part = character:FindFirstChild(partName)
    if not part then
        local altName = partName:gsub(" ", "")
        part = character:FindFirstChild(altName)
    end
    return part
end




Window:SelectTab(1)
Fluent:Notify(
    {
        Title = "Infernium",
        Content = "Thank u for using our script!",
        SubContent = "voltrivax",
        Duration = 8
    }
)
Tab.Credits:AddParagraph(
    {
        Title = "Infernium Credits",
        Content = "voltrivax"
    }
)

Tab.Credits:AddButton(
    {
        Title = "Discord",
        Description = "Click to copy",
        Callback = function()
            setclipboard("https://discord.gg/inferniumhub")
            toclipboard("https://discord.gg/inferniumhub")

            sendNotify(5, "Notification", "Discord Link Was Copied To Your Clipboard: https://discord.gg/inferniumhub")
        end
    }
)







--[[

    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------
                                        Player Tab
    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------

]]

------------------ Teleport
-------- Teleport
------------------ Teleport
Tab.Player:AddButton(
    {
        Title = "Teleport",
        Description = "If you press the e button, your character will teleport to where he is looking.",
        Callback = function()
            local Players = game:GetService("Players")
            local UserInputService = game:GetService("UserInputService")
            local player = Players.LocalPlayer

            local mouse = player:GetMouse()
            local character = player.Character or player.CharacterAdded:Wait()

            -- E tuşuna basıldığında ışınlama işlemi
            local function onInputBegan(input, gameProcessedEvent)
                if not gameProcessedEvent then
                    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.E then
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            -- Mouse'un dünyadaki pozisyonu
                            local targetPosition = mouse.Hit.Position

                            -- Karakteri mouse'un hedef noktası olan yere ışınlama
                            character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
                        end
                    end
                end
            end

            -- Olayları dinleme
            UserInputService.InputBegan:Connect(onInputBegan)
        end
    }
)

------------------ Infinite Stamina
-------- Infinite Stamina
------------------ Infinite Stamina
Tab.Player:AddButton(
    {
        Title = "Infinite Stamina",
        Description = "",
        Callback = function()
            if vars.FirstLaunch then return end
            if not vars.SawGarbage then seeGarbage() end

            gameGc.StaminaTable._setStamina = function(among, us)
                among._stamina = math.huge
                among._staminaChangedSignal:Fire(150)
            end
        end
    }
)

------------------ No Fall Damage
-------- No Fall Damage
------------------ No Fall Damage
Tab.Player:AddToggle("MyToggle",
    {
        Title = "No Fall Damage",
        Description = "(It can break the game)",
        Default = false,
        Callback = function(state)
            if vars.FirstLaunch then return end
            if not vars.SawRemotes then seeRemotes() end

            vars.NoFallDamage = state
        end
    }
)

------------------ Noclip
-------- Noclip
------------------ Noclip
Tab.Player:AddButton(
    {
        Title = "Noclip [BETA]",
        Description = "Very Weird / Unstable",
        Callback = function()
            for i,v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                    if v.Name == "Torso" then
                        if conns["Noclip"] then conns["Noclip"]:Disconnect() conns["Noclip"] = nil end
                        conns["Noclip"] = runS.RenderStepped:Connect(function()
                            v.CanCollide = false
                        end)
                    end
                end
            end
        end
    }
)

------------------ Disable Utilities Damage
-------- Disable Utilities Damage
------------------ Disable Utilities Damage
Tab.Player:AddToggle("MyToggle",
    {
        Title = "Disable Utilities Damage",
        Description = "Disables damage from Molotov and BearTrap",
        Default = false,
        Callback = function(state)
            if state then
                if conns["UtilitiesDamage"] then conns["UtilitiesDamage"]:Disconnect() end
                conns["UtilitiesDamage"] = ws.EffectsJunk.ChildAdded:Connect(function(child)
                    if child.Name == "" then
                        child.CanTouch = false

                    elseif child.Name == "OpenBearTrap" then
                        child:WaitForChild("Hitbox", 2):Destroy()
                    end
                end)
            else
                if conns["UtilitiesDamage"] then conns["UtilitiesDamage"]:Disconnect() end
            end
        end
    }
)

------------------ Anti-Ragdoll
-------- Anti-Ragdoll
------------------ Anti-Ragdoll
Tab.Player:AddToggle(
    "MyToggle",
    {
        Title = "Anti-Ragdoll",
        Description = "",
        Default = false,
        Callback = function(state)
            if vars.FirstLaunch then return end
            if not vars.SawGarbage then seeGarbage() end
            
            gameGc.RagdollTable.toggleRagdoll = function(among, us, irl)
                if state then
                    return
                else
                    return gameGc.OldRagdoll(among, us, irl)
                end
            end
        end
    }
)

------------------ No Dash Cooldown
-------- No Dash Cooldown
------------------ No Dash Cooldown
Tab.Player:AddToggle(
    "MyToggle",
    {
        Title = "No Dash Cooldown",
        Description = "",
        Default = false,
        Callback = function(state)
            if vars.FirstLaunch then return end
            if not vars.SawGarbage then seeGarbage() end

            if state then
                gameGc.DashTable.DASH_COOLDOWN = 0
            else
                gameGc.DashTable.DASH_COOLDOWN = gameGc.OldDashCooldown
            end
        end
    }
)



------------------ Inf Jump
-------- Inf Jump
------------------ Inf Jump
Tab.Player:AddToggle(
    "MyToggle",
    {
        Title = "Inf Jump",
        Description = "",
        Default = false,
        Callback = function(state)
            if state then
                if vars.FirstLaunch then return end
                if not vars.AntiCheatBypassed then
                    bypassAnticheat()
                end 

                if conns["InfJump"] then conns["InfJump"]:Disconnect() conns["InfJump"] = nil end
                conns["InfJump"] = mouse.KeyDown:Connect(function(v)
                    if v == " " then
                        char:FindFirstChildOfClass('Humanoid'):ChangeState(3)
                    end
                end)
            else
                if conns["InfJump"] then conns["InfJump"]:Disconnect() conns["InfJump"] = nil end
            end
        end
    }
)

------------------ No Jump Cooldown
-------- No Jump Cooldown
------------------ No Jump Cooldown
Tab.Player:AddToggle(
    "MyToggle",
    {
        Title = "No Jump Cooldown",
        Description = "",
        Default = false,
        Callback = function(state)
            if vars.FirstLaunch then return end
            if not vars.AntiCheatBypassed then
                bypassAnticheat()
            end 
            if not vars.SawGarbage then seeGarbage() end

            gameGc.JumpTable.getCanJump = function(among, us, irl)
                if state then
                    return true
                else
                    return gameGc.OldJumpCooldown(among, us, irl)
                end
            end
        end
    }
)


------------------ JumpPower
-------- JumpPower
------------------ JumpPower
local Toggle = Tab.Player:AddToggle("MyToggle", {Title = "JumpPower", Default = false})
Toggle:OnChanged(
    function(value)
        if value then
            vars.JumpPowerEnabled = true
            hum.JumpPower = vars.JumpPower
        else
            vars.JumpPowerEnabled = false
            hum.JumpPower = 50
        end
    end
)

local Slider = Tab.Player:AddSlider(
    "Slider",
    {
        Title = "Jump Power",
        Description = "Increases your jumping power -by voltrivax",
        Default = vars.JumpPower,
        Min = 50,
        Max = 500,
        Rounding = 1,
        Callback = function(Value)
            if vars.JumpPowerEnabled then
                vars.JumpPower = Value
                hum.JumpPower = Value
            end
        end
    }
)

------------------ WalkSpeed
-------- WalkSpeed
------------------ WalkSpeed
local WsToggle = Tab.Player:AddToggle(
    "MyToggle",
    {
        Title = "Walk Speed",
        Description = "",
        Default = false,
        Callback = function(state)
            if state then
                ChangeSpeed()
            else
                if conns["WalkSpeed"] then
                    conns["WalkSpeed"]:Disconnect()
                    conns["WalkSpeed"] = nil
                end
            end
        end
    }
)

local WsSlider = Tab.Player:AddSlider(
    "Slider",
    {
        Title = "Walk Speed",
        Description = "Adjust walk speed",
        Default = vars.WalkSpeed,
        Min = 1,
        Max = 500,
        Rounding = 1,
        Callback = function(Value)
            vars.WalkSpeed = Value

            if WsToggle.State == true then
                ChangeSpeed()
            end
        end
    }
)


------------------ Fly
-------- Fly
------------------ Fly
local FlyToggle = Tab.Player:AddToggle(
    "MyToggle",
    {
        Title = "Fly Toggle",
        Description = "Toggle fly mode",
        Default = false,
        Callback = function(state)
            if state then
                ChangeFly()
            else
                ws.Gravity = currGravity
                if conns["Fly"] then
                    conns["Fly"]:Disconnect()
                    conns["Fly"] = nil
                end
            end
        end
    }
)
local FlySlider = Tab.Player:AddSlider(
    "Slider",
    {
        Title = "Fly Speed",
        Description = "Adjust fly speed",
        Default = 50,
        Min = 1,
        Max = 500,
        Rounding = 1,
        Callback = function(value)
            vars.FlySpeed = value
        end
    }
)

------------------ Fov Changer
-------- Fov Changer
------------------ Fov Changer
local FovToggle = Tab.Player:AddToggle("MyToggle", 
{
    Title = "Fov Toggle", 
    Description = "Toggle fov mode",
    Default = false,
    Callback = function(state)
        if state then
            cam.FieldOfView = vars.Fov
            conns["Fov"] = cam:GetPropertyChangedSignal("FieldOfView"):Connect(function()
                cam.FieldOfView = vars.Fov
            end)
        else
            cam.FieldOfView = 70
            if conns["Fov"] then
                conns["Fov"]:Disconnect()
                conns["Fov"] = nil
            end
        end
    end
})
local FovSlider = Tab.Player:AddSlider("Slider", 
{
    Title = "FOV",
    Description = "Adjust field of view",
    Default = vars.Fov,
    Min = 1,
    Max = 120,
    Rounding = 0,
    Callback = function(value)
        vars.Fov = value
        cam.FieldOfView = vars.Fov
    end
})

--[[

    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------
                                        Legit Tab
    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------

]]
local ABSettings = {
    Enabled = false,
    Smoothing = 5,
    WallCheck = false,
    AimBotPart = "Head",
    PredictionEnabled = false,
    PredictionValue = 0,
    StickyAim = true,
    ShowFov = true,
    FovRadius = 320,

    Target = nil,
    IsAimKeyDown = false,
    CameraTween = nil,
}

local FOVFFrame
local UIStroke
if not CoreGui:FindFirstChild("Fov") then
    local Fov = Instance.new("ScreenGui",(CoreGui or player.PlayerGui))Fov.Name = "Fov" Fov.ZIndexBehavior = Enum.ZIndexBehavior.Sibling Fov.ResetOnSpawn = false Fov.IgnoreGuiInset = true
    FOVFFrame = Instance.new("Frame")FOVFFrame.Parent = Fov FOVFFrame.Name = "FOVFFrame" FOVFFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) FOVFFrame.BorderColor3 = Color3.fromRGB(0, 0, 0) FOVFFrame.BorderSizePixel = 0 FOVFFrame.BackgroundTransparency = 1 FOVFFrame.AnchorPoint = Vector2.new(0.5, 0.5) FOVFFrame.Position = UDim2.new(0.5, 0,0.5, 0) FOVFFrame.Size = UDim2.new(0, ABSettings.FovRadius, 0, ABSettings.FovRadius) FOVFFrame.BackgroundTransparency = 1;
    local UICorner = Instance.new("UICorner")UICorner.CornerRadius = UDim.new(1, 0) UICorner.Parent = FOVFFrame;
    UIStroke = Instance.new("UIStroke")UIStroke.Color = Color3.fromRGB(100,0,100) UIStroke.Parent = FOVFFrame UIStroke.Thickness = 1 UIStroke.ApplyStrokeMode = "Border" UIStroke.Name = "FovUi"
    UIStroke.Enabled = false
else
    FOVFFrame = CoreGui:FindFirstChild("Fov"):FindFirstChild("FOVFFrame") or player.PlayerGui:FindFirstChild("Fov"):FindFirstChild("FOVFFrame")
    UIStroke =  CoreGui:FindFirstChild("Fov"):FindFirstChild("FOVFFrame"):FindFirstChild("FovUi") or player.PlayerGui:FindFirstChild("Fov"):FindFirstChild("FOVFFrame"):FindFirstChild("FovUi")
    UIStroke.Enabled = false
end

local function IsAlive(oChar)
    if oChar:FindFirstChild("Humanoid") and oChar:FindFirstChild("Humanoid").Health > 0 then
        return true
    end
    return false
end
local function isVisible(p, ...)

    if ABSettings.WallCheck == false then
        return true
    end

    return #cam:GetPartsObscuringTarget({p}, {cam, player.Character, ...}) == 0
end
local function SmoothCameraToTarget(target)
    if target and target:FindFirstChild(ABSettings.AimBotPart) then
        local targetPos = target[ABSettings.AimBotPart].Position
        local predictedPos = targetPos + (ABSettings.Prediction and target[ABSettings.AimBotPart].Velocity * (player:GetNetworkPing() * ABSettings.PredictionValue) or Vector3.new())
        
        ABSettings.CameraTween = ts:Create(cam, TweenInfo.new(ABSettings.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            CFrame = CFrame.new(cam.CFrame.Position, predictedPos)
        })
        ABSettings.CameraTween:Play()
    end
end

local function CameraGetClosestToMouse()
    local AimFov = ABSettings.FovRadius;
    local targetChar = nil

    for i,v in pairs(charsFolder:GetChildren()) do
        if v.Name ~= char.Name then
            if IsAlive(v) then
                local screen_pos, on_screen = cam:WorldToViewportPoint(v[ABSettings.AimBotPart].Position)
                local screen_pos_2D = Vector2.new(screen_pos.X, screen_pos.Y)
                local new_magnitude = (screen_pos_2D - uis:GetMouseLocation()).Magnitude

                if on_screen and new_magnitude < AimFov and isVisible(v[ABSettings.AimBotPart].Position, v, ws.Body) then
                    AimFov = new_magnitude
                    targetChar = v
                end
            end
        end
    end
    return targetChar;
end
local function EnableAimBot()
    conns["AimBotCheckDown"] = player:GetMouse().Button2Down:Connect(function(Key)
        ABSettings.Target = CameraGetClosestToMouse()
        ABSettings.IsAimKeyDown = true;
    end)
    conns["AimBotCheckUp"] = player:GetMouse().Button2Up:Connect(function(Key)
        ABSettings.Target = CameraGetClosestToMouse()
        ABSettings.IsAimKeyDown = false
        if ABSettings.CameraTween ~= nil then
            ABSettings.CameraTween:Cancel()
        end
    end)

    conns["AimBot"] = game:GetService("RunService").Heartbeat:Connect(function() 
		if ABSettings.ShowFov then
			UIStroke.Enabled = true;
			UIStroke.Color = Color3.fromRGB(139,0,255)

			local posd = uis:GetMouseLocation()
            FOVFFrame.Position = UDim2.new(0, posd.X, 0, posd.Y)
			FOVFFrame.Size = UDim2.fromOffset(ABSettings.FovRadius * 1.5, ABSettings.FovRadius * 1.5)
		else
			UIStroke.Enabled = false
		end

        if ABSettings.IsAimKeyDown then
            if ABSettings.StickyAim then
                if ABSettings.Target then
                    if not IsAlive(ABSettings.Target) then
                        ABSettings.Target = CameraGetClosestToMouse() -- Get a new target
                    end
                    SmoothCameraToTarget(ABSettings.Target)
                end
            else
                local target = CameraGetClosestToMouse()
                if target then
                    SmoothCameraToTarget(target)
                elseif ABSettings.CameraTween ~= nil then
                    ABSettings.CameraTween:Cancel()
                end
            end
        end
	end)
end
local ABToggle = Tab.Legit:AddToggle("MyToggle",
    {
        Title = "Aim-Bot",
        Description = "Automatic aiming on players. Use RightMouseButton.",
        Default = ABSettings.Enabled,
        Callback = function(state)
            if state then
                ABSettings.Enabled = true
                EnableAimBot()
            else
                ABSettings.Enabled = false
                UIStroke.Enabled = false
                if conns["AimBot"] then
                    conns["AimBot"]:Disconnect()
                    conns["AimBot"] = nil
                end
                if conns["AimBotCheckDown"] then
                    conns["AimBotCheckDown"]:Disconnect()
                    conns["AimBotCheckDown"] = nil
                end
                if conns["AimBotCheckUp"] then
                    conns["AimBotCheckUp"]:Disconnect()
                    conns["AimBotCheckUp"] = nil
                end
            end
        end
    }
)
local ABDropdown = Tab.Legit:AddDropdown("Dropdown",
    {
        Title = "Aim Part",
        Values = {"Head", "HumanoidRootPart"},
        Multi = false,
        Default = 1
    }
)
ABDropdown:OnChanged(
    function(Value)
        ABSettings.AimBotPart = Value
    end
)
local ABSmoothing = Tab.Legit:AddSlider("Slider", 
{
    Title = "Smoothing",
    Description = "",
    Default = ABSettings.Smoothing,
    Min = 5,
    Max = 50,
    Rounding = 0,
    Callback = function(value)
        ABSettings.Smoothing = value / 100
    end
})
local ABToggle = Tab.Legit:AddToggle("MyToggle",
    {
        Title = "WallCheck",
        Description = "Wait some time for it to load.",
        Default = ABSettings.WallCheck,
        Callback = function(state)
            if state then
                ABSettings.WallCheck = true
            else
                ABSettings.WallCheck = false
            end
        end
    }
)
local ABStickyAim = Tab.Legit:AddToggle("MyToggle",
    {
        Title = "Sticky Aim",
        Description = "Targeting only 1 player.",
        Default = ABSettings.StickyAim,
        Callback = function(state)
            if state then
                ABSettings.StickyAim = true
            else
                ABSettings.StickyAim = false
            end
        end
    }
)
local ABPrediction = Tab.Legit:AddToggle("MyToggle",
    {
        Title = "Prediction",
        Description = "",
        Default = ABSettings.Prediction,
        Callback = function(state)
            if state then
                ABSettings.Prediction = true
            else
                ABSettings.Prediction = false
            end
        end
    }
)
local ABPredictionSlider = Tab.Legit:AddSlider("Slider", 
{
    Title = "Prediction Value",
    Description = "",
    Default = ABSettings.PredictionValue,
    Min = 1,
    Max = 120,
    Rounding = 0,
    Callback = function(value)
        ABSettings.PredictionValue = value / 10
    end
})

local ABFovToggle = Tab.Legit:AddToggle("MyToggle",
    {
        Title = "ShowFov",
        Description = "",
        Default = ABSettings.ShowFov,
        Callback = function(state)
            if state then
                ABSettings.ShowFov = true
            else
                ABSettings.ShowFov = false
            end
        end
    }
)
local ABFovSlider = Tab.Legit:AddSlider("Slider", 
{
    Title = "Fov Circle Radius",
    Description = "",
    Default = ABSettings.FovRadius,
    Min = 1,
    Max = 1500,
    Rounding = 0,
    Callback = function(value)
        ABSettings.FovRadius = value
    end
})


--[[

    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------
                                        Rage Tab
    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------

]]

Tab.Rage:AddParagraph(
    {
        Title = "ATTENTION!",
        Content = "High probability of getting banned."
    }
)


local hitboxSection = Tab.Rage:AddSection("Hitbox Extender")
------------------ Hitbox Extender
-------- Hitbox Extender
------------------ Hitbox Extender
local function changeAllHitboxes(size, transparency)
    for _, oChar in pairs(charsFolder:GetChildren()) do
        if oChar.Name ~= char.Name then
            ResizeHitbox(oChar, size, transparency)
        end
    end
end
hitboxSection:AddToggle("MyToggle",
    {
        Title = "Hitbox Extender",
        Description = "Increases the hitbox of other players.",
        Default = false,
        Callback = function(state)
            if state then
                vars.HitboxEnabled = true
                changeAllHitboxes(Vector3.new(vars.HitboxSize,vars.HitboxSize,vars.HitboxSize), vars.HitboxT)
            else
                if vars.HitboxEnabled == true then
                    changeAllHitboxes(Vector3.new(2,1,1), 1)
                end
                vars.HitboxEnabled = false
            end
        end
    }
)

hitboxSection:AddSlider("Slider",
    {
        Title = "Hitbox Size",
        Description = "",
        Default = vars.HitboxSize,
        Min = 1,
        Max = 20,
        Rounding = 1,
        Callback = function(Value)
            vars.HitboxSize = Value

            if vars.HitboxEnabled == true then
                changeAllHitboxes(Vector3.new(Value,Value,Value), vars.HitboxT)
            end
        end
    }
)
local HitboxColorpicker = Tab.Rage:AddColorpicker(
    "Colorpicker",
    {
        Title = "Hitbox Color",
        Description = "",
        Default = vars.HitboxColor
    }
)
HitboxColorpicker:OnChanged(
    function()
        vars.HitboxColor = HitboxColorpicker.Value

        if vars.HitboxEnabled == true then
            changeAllHitboxes(Vector3.new(vars.HitboxSize,vars.HitboxSize,vars.HitboxSize), vars.HitboxT)
        end
    end
)
hitboxSection:AddSlider("Slider",
    {
        Title = "Hitbox Transparency",
        Description = "",
        Default = vars.HitboxT,
        Min = 0,
        Max = 1,
        Rounding = 1,
        Callback = function(Value)
            vars.HitboxT = Value

            if vars.HitboxEnabled == true then
                changeAllHitboxes(Vector3.new(vars.HitboxSize,vars.HitboxSize,vars.HitboxSize), Value)
            end
        end
    }
)

--[[

    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------
                                        Parry Tab
    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------

]]
------------------ Auto-Parry
-------- Auto-Parry
------------------ Auto-Parry
local function deleteParryFromTable(oChar)
    if parryTargets[oChar] == true or parryTargets[oChar] == false then
        parryTargets[oChar] = nil
    elseif parryTargets[oChar] then
        parryTargets[oChar]:Disconnect()
        parryTargets[oChar] = nil
    end
end
local function findOthersInRadius()
    for _, oChar in pairs(charsFolder:GetChildren()) do
        if oChar.Name ~= char.Name then
            local oHrp = oChar:FindFirstChild("HumanoidRootPart")

            local check = (oHrp.Position - hrp.Position).Magnitude <= 50
            local check2 = (oHrp.Position - hrp.Position).Magnitude > 0
            if not (parryTargets[oChar]) and check and check2 then
                parryTargets[oChar] = false
            elseif not (check) and parryTargets[oChar] then
                deleteParryFromTable(oChar)
            end
        end
    end
    return parryTargets
end
conns["CharactersRemoved"] = charsFolder.ChildRemoved:Connect(function(oChar)
    deleteParryFromTable(oChar)
end)

local function findTool(oChar)
    local charTool = oChar:FindFirstChildWhichIsA("Tool")
    if charTool and charTool:FindFirstChild("Hitboxes") then
        return charTool, true
    end

    local itemsA = oChar:FindFirstChild("ItemsAttached")
    if not itemsA then
        return
    end
    local model = itemsA:FindFirstChildWhichIsA("Model")
    if not model then
        return
    end
    return model:FindFirstChildWhichIsA("ObjectValue").Value, false
end

local crePart
local function CreateOffsetPart(oChar)
    local oHrp = oChar.HumanoidRootPart
    local humanoid = oChar:FindFirstChild("Humanoid")

    local moveDirection = humanoid.MoveDirection
    local offsetPosition

    if moveDirection.Magnitude == 0 then
        offsetPosition = oHrp.Position
    else
        moveDirection = Vector3.new(moveDirection.X, 0, moveDirection.Z).Unit
        offsetPosition = oHrp.Position + (moveDirection * parrySettings.Prediction)
    end

    if vars.ParryDebug then
        if not crePart then
            local part = Instance.new("Part")
            part.Anchored = true
            part.CanCollide = false
            part.Size = Vector3.new(1.5, 1.5, 1.5)
            part.Position = offsetPosition
            part.BrickColor = BrickColor.new("Bright red")
            part.Name = "__ParryDebugPart"
            part.Transparency = 0.7
            part.Parent = ws

            crePart = part
        else
            crePart.Position = offsetPosition
        end
    end

    return offsetPosition
end
local function checkChance(chance)
    return math.random(0, 100) <= chance
end
local function Parry(oChar, child)
    if string.match(oChar.Name, "Inf3r") and not string.match(char.Name, "Inf3r") then
        Fluent:Notify({
            Title = "-__-",
            Content = "An ordinary person cant parry one of the Creators of this script..",
            SubContent = "I am the voice of your subconscious mind",
            Duration = 5
        })
    return end
    if not checkChance(parrySettings.Chance) then
        lastAttachChanced = false
        return
    end
    lastAttachChanced = true
    local offset = CreateOffsetPart(oChar)

    -- local facingDirection = oChar.HumanoidRootPart.CFrame.LookVector
    -- local toPlayerDirection = (hrp.Position - oChar.HumanoidRootPart.Position).Unit
    -- local dotProduct = facingDirection:Dot(toPlayerDirection)

    local hitbox = child.Parent
    distPlayersParrys = (offset - hrp.Position).Magnitude

    if tonumber(parrySettings.Range) >= distPlayersParrys then
        if vars.ParryEquip then
            local myTool, equipped = findTool(char)
            if not equipped then
                hum:EquipTool(myTool)
            end
        end
        keyPress(vars.ParryKey)
    end
end


local ParryToggle = Tab.Parry:AddToggle(
    "MyToggle",
    {
        Title = "Auto-Parry",
        Description = "For better accuracy, it is recommended to stand still.",
        Default = false,
        Callback = function(state)
            if state then
                vars.ParryEnabled = true

                if conns["ParryCheck"] then
                    conns["ParryCheck"]:Disconnect()
                    conns["ParryCheck"] = nil
                end
                conns["ParryCheck"] = runS.RenderStepped:Connect(function(dt)
                        findOthersInRadius()

                        for oChar, state in pairs(parryTargets) do
                            if state == false then
                                parryTargets[oChar] = true

                                local oPlayer = Players:GetPlayerFromCharacter(oChar)
                                if oPlayer then
                                    local tool = findTool(oChar)
                                    if tool then
                                        parryTargets[oChar] =
                                            tool.DescendantAdded:Connect(
                                            function(child)
                                                triedToParry = oChar.Name
                                                Parry(oChar, child)
                                            end
                                        )
                                    else
                                        deleteParryFromTable(oChar)
                                    end
                                else
                                    deleteParryFromTable(oChar)
                                end
                            end
                        end
                    end
                )

                humanoidHealthChanged()
            else
                vars.ParryEnabled = false

                if conns["ParryCheck"] then
                    conns["ParryCheck"]:Disconnect()
                    conns["ParryCheck"] = nil
                end
            end
        end
    }
)
local ParryEquipToggle = Tab.Parry:AddToggle(
    "MyToggle",
    {
        Title = "Auto-Equip Weapon",
        Description = "",
        Default = false,
        Callback = function(state)
            if state then
                vars.ParryEquip = true
            else
                vars.ParryEquip = false
            end
        end
    }
)
-- only visuals
-- local ParryEquipToggle = Tab.Parry:AddToggle(
--     "MyToggle",
--     {
--         Title = "No Parry Cooldown",
--         Description = "",
--         Default = false,
--         Callback = function(state)
--             for i,v in pairs(getgc(true)) do
--                 if typeof(v) == "table" and rawget(v, "PARRY_COOLDOWN_IN_SECONDS") and rawget(v, "PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY") then
--                     print("Yea, found")
--                     if state then
--                         v.PARRY_COOLDOWN_IN_SECONDS = 0
--                         v.PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY = 0
--                     else
--                         v.PARRY_COOLDOWN_IN_SECONDS = 3
--                         v.PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY = 0.33
--                     end
--                     print(v.PARRY_COOLDOWN_IN_SECONDS)
--                 end
--             end
--         end
--     }
-- )
local PChanceSlider = Tab.Parry:AddSlider(
    "Slider",
    {
        Title = "Parry Chance",
        Description = "% Chance to use parry (small values are recommended for legit play)",
        Default = parrySettings.Chance,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Callback = function(Value)
            parrySettings.Chance = Value
        end
    }
)
local PRanngeSlider = Tab.Parry:AddSlider(
    "Slider",
    {
        Title = "Range",
        Description = "It is recommended to keep it closer to " .. parrySettings.Range,
        Default = parrySettings.Range,
        Min = 1,
        Max = 50,
        Rounding = 1,
        Callback = function(Value)
            parrySettings.Range = Value
        end
    }
)
local PRanngeSlider = Tab.Parry:AddSlider(
    "Slider",
    {
        Title = "Movement Prediction",
        Description = "",
        Default = parrySettings.Prediction,
        Min = 0,
        Max = 20,
        Rounding = 1,
        Callback = function(Value)
            parrySettings.Prediction = Value
        end
    }
)

local ParryDebugToggle = Tab.Parry:AddToggle(
    "MyToggle",
    {
        Title = "Debug",
        Description = "Debug is needed to see why you got hit.",
        Default = false,
        Callback = function(state)
            if state then
                vars.ParryDebug = true
            else
                vars.ParryDebug = false
            end
        end
    }
)

--[[

    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------
                                        Parry2
    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------

]]


-- ------------------ Free Auto-Parry
-- -------- Free Auto-Parry
-- ------------------ Free Auto-Parry
-- Tab.Parry2:AddParagraph(
--     {
--         Title = "ATTENTION!",
--         Content = "U can get ban of this rage script its detected if u want grind ur account just use legit"
--     }
-- )
-- Tab.Parry2:AddButton(
--     {
--         Title = "AutoParry Legit",
--         Description = "Panic key is K u need to execute autoparry from here",
--         Callback = function()
--             loadstring(game:HttpGet("https://pastebin.com/raw/Yfm98tyB"))()
--         end
--     }
-- )

--[[

    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------
                                        Esp Tab
    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------

]]
------------------ Esp
-------- Esp
------------------ Esp
local espS = {
    Enabled = false,
    Name = false,
    Box = false,
    Tracers = false,
    Health = false,
    HealthBar = false,
    Distance = false,
    Highlight = false,
    Outline = false,

    CharacterSize = Vector2.new(5,6),

    Color = Color3.fromRGB(255, 0, 161),
    MaxDistance = 4000,
    
    OutlineColor = Color3.fromRGB(0,0,0),

    HlMethod = "AlwaysOnTop",
    HlOutlineColor = Color3.fromRGB(0, 0, 0),
    HlOutlineTransparency = 0,
    HlFillColor = Color3.fromRGB(211, 233, 124),
    HlFillTransparency = 0,
}

local ESPHolder = player.PlayerGui:FindFirstChild("EspHolder")
if not ESPHolder then
    ESPHolder = Instance.new("Folder", (player.PlayerGui))
    ESPHolder.Name = "EspHolder"
end


local espCns = {}
local function esp()
    espCns = {}
    conns["Esp"]["EspRun"] = runS.RenderStepped:Connect(function()
        for _, oChar in pairs(charsFolder:GetChildren()) do
            if oChar.Name ~= char.Name then
                local oPlayer = Players:GetPlayerFromCharacter(oChar)
                if not oPlayer then espCns[oChar.Name] = nil end

                if not espCns[oChar.Name] then
                    espCns[oChar.Name] = {}

                    local PlayerESP = Instance.new("Folder", ESPHolder);
                    PlayerESP.Name = oChar.Name .. "_ESP";
                    espCns[oChar.Name]["PlayerESP"] = PlayerESP

                    local BoxHolder = Instance.new("ScreenGui", PlayerESP);
                    BoxHolder.Name = "Box";
                    BoxHolder.DisplayOrder = 2;
                    espCns[oChar.Name]["BoxHolder"] = BoxHolder

                    local TracerHolder = Instance.new("ScreenGui", PlayerESP);
                    TracerHolder.Name = "Tracer";
                    espCns[oChar.Name]["TracerHolder"] = TracerHolder

                    local HilightHolder = Instance.new("Folder", PlayerESP);
                    HilightHolder.Name = "Hilight"
                    espCns[oChar.Name]["HilightHolder"] = HilightHolder

                    local LeftOutline = Instance.new("Frame", BoxHolder);
                    LeftOutline.BackgroundColor3 = espS.OutlineColor;
                    LeftOutline.Visible = false;
                    LeftOutline.BorderSizePixel = 1;
                    espCns[oChar.Name]["LeftOutline"] = LeftOutline


                    local RightOutline = Instance.new("Frame", BoxHolder);
                    RightOutline.BackgroundColor3 = espS.OutlineColor;
                    RightOutline.Visible = false;
                    RightOutline.BorderSizePixel = 1;
                    espCns[oChar.Name]["RightOutline"] = RightOutline


                    local TopOutline = Instance.new("Frame", BoxHolder);
                    TopOutline.BackgroundColor3 = espS.OutlineColor;
                    TopOutline.Visible = false;
                    TopOutline.BorderSizePixel = 1;
                    espCns[oChar.Name]["TopOutline"] = TopOutline


                    local BottomOutline = Instance.new("Frame", BoxHolder);
                    BottomOutline.BackgroundColor3 = espS.OutlineColor;
                    BottomOutline.Visible = false;
                    BottomOutline.BorderSizePixel = 1;
                    espCns[oChar.Name]["BottomOutline"] = BottomOutline


                    local Left = Instance.new("Frame", BoxHolder);
                    Left.BackgroundColor3 = espS.Color;
                    Left.Visible = false;
                    Left.BorderSizePixel = 0;
                    espCns[oChar.Name]["Left"] = Left


                    local Right = Instance.new("Frame", BoxHolder);
                    Right.BackgroundColor3 = espS.Color;
                    Right.Visible = false;
                    Right.BorderSizePixel = 0;
                    espCns[oChar.Name]["Right"] = Right


                    local Top = Instance.new("Frame", BoxHolder);
                    Top.BackgroundColor3 = espS.Color;
                    Top.Visible = false;
                    Top.BorderSizePixel = 0;
                    espCns[oChar.Name]["Top"] = Top


                    local Bottom = Instance.new("Frame", BoxHolder);
                    Bottom.BackgroundColor3 = espS.Color;
                    Bottom.Visible = false;
                    Bottom.BorderSizePixel = 0;
                    espCns[oChar.Name]["Bottom"] = Bottom


                    local Name = Instance.new("TextLabel", BoxHolder);
                    Name.BackgroundTransparency = 1;
                    Name.Text = oChar.Name;
                    Name.Visible = false;
                    Name.AnchorPoint = Vector2.new(0.5, 0.5);
                    Name.TextSize = 12;
                    Name.Font = 2;
                    Name.TextColor3 = Color3.fromRGB(255, 255, 255);
                    Name.TextStrokeTransparency = 0;
                    espCns[oChar.Name]["Name"] = Name


                    local Distance = Instance.new("TextLabel", BoxHolder);
                    Distance.BackgroundTransparency = 1;
                    if IsAlive(oChar) then
                        Distance.Text = math.floor(0.5+(cam.CFrame.Position - oChar.HumanoidRootPart.Position).magnitude);
                    end
                    Distance.Visible = false;
                    Distance.AnchorPoint = Vector2.new(0.5, 0.5);
                    Distance.TextSize = 12;
                    Distance.Font = 2;
                    Distance.TextColor3 = Color3.fromRGB(255, 255, 255);
                    Distance.TextStrokeTransparency = 0;
                    espCns[oChar.Name]["Distance"] = Distance


                    local HealthBackground = Instance.new("Frame", BoxHolder);
                    HealthBackground.Visible = false;
                    HealthBackground.BorderSizePixel = 1;
                    HealthBackground.BorderColor3 = espS.OutlineColor;
                    espCns[oChar.Name]["HealthBackground"] = HealthBackground


                    local HealthBar = Instance.new("Frame", BoxHolder);
                    HealthBar.Visible = false;
                    HealthBar.BorderSizePixel = 0;
                    HealthBar.BackgroundColor3 = Color3.fromRGB(0, 255 ,0); 
                    espCns[oChar.Name]["HealthBar"] = HealthBar


                    local Health = Instance.new("TextLabel", BoxHolder);
                    Health.BackgroundTransparency = 1;
                    if IsAlive(oChar) then
                        Health.Text = oChar.Humanoid.Health;
                    end
                    Health.Visible = false;
                    Health.AnchorPoint = Vector2.new(0.5, 0.5);
                    Health.TextSize = 12;
                    Health.Font = 2;
                    Health.TextColor3 = Color3.fromRGB(255, 255, 255);
                    Health.TextStrokeTransparency = 0;
                    espCns[oChar.Name]["Health"] = Health


                    -- Tracer 
                    local TracerOutline = Instance.new("Frame", TracerHolder);
                    TracerOutline.BackgroundColor3 = espS.OutlineColor;
                    TracerOutline.Visible = false;
                    TracerOutline.BorderSizePixel = 1;
                    TracerOutline.AnchorPoint = Vector2.new(0.5, 0.5);
                    espCns[oChar.Name]["TracerOutline"] = TracerOutline

                    local Tracer = Instance.new("Frame", TracerHolder);
                    Tracer.BackgroundColor3 = espS.OutlineColor;
                    Tracer.Visible = false;
                    Tracer.BorderSizePixel = 0;
                    Tracer.AnchorPoint = Vector2.new(0.5, 0.5);
                    espCns[oChar.Name]["Tracer"] = Tracer


                    -- Hilight

                    local Hilight = Instance.new("Highlight", HilightHolder);
                    Hilight.Enabled = false;
                    espCns[oChar.Name]["Hilight"] = Hilight
                end
                

                local ch = espCns[oChar.Name]

                local function disableAll()
                    ch["LeftOutline"].Visible = false;
                    ch["RightOutline"].Visible =  false;
                    ch["TopOutline"].Visible =  false;
                    ch["BottomOutline"].Visible =  false;
                    ch["Left"].Visible = false;
                    ch["Right"].Visible =  false;
                    ch["Top"].Visible =  false;
                    ch["Bottom"].Visible =  false;
                    ch["TracerOutline"].Visible = false;
                    ch["Tracer"].Visible = false;
                    ch["Name"].Visible = false;
                    ch["Distance"].Visible = false;
                    ch["HealthBackground"].Visible = false;
                    ch["HealthBar"].Visible = false;
                    ch["Health"].Visible = false;	
                    ch["Hilight"].Enabled = false;
                    ch["Hilight"].Adornee = nil;
                end


                if IsAlive(oChar) then
                    local screen, onScreen = cam:WorldToScreenPoint(oChar.HumanoidRootPart.Position); 
                    local frustumHeight = math.tan(math.rad(cam.FieldOfView * 0.5)) * 2 * screen.Z ;
                    local size = cam.ViewportSize.Y / frustumHeight * espS.CharacterSize;
                    local position = Vector2.new(screen.X, screen.Y) - (size / 2 - Vector2.new(0, size.Y) / 20);

                    if onScreen then	
                        local DistanceNumb = math.floor(0.5+(cam.CFrame.Position - oChar.HumanoidRootPart.Position).magnitude)
                        if espS.MaxDistance > DistanceNumb then
                            -- Box

                            if espS.Box then

                                ch["LeftOutline"].Visible = espS.Box and espS.Outline;
                                ch["RightOutline"].Visible =  espS.Box and espS.Outline;
                                ch["TopOutline"].Visible =  espS.Box and espS.Outline;
                                ch["BottomOutline"].Visible =  espS.Box and espS.Outline;

                                ch["Left"].Position = UDim2.fromOffset(position.X, position.Y);
                                ch["Right"].Position = UDim2.fromOffset(position.X, position.Y + size.Y - 1);
                                ch["Top"].Position = UDim2.fromOffset(position.X, position.Y);
                                ch["Bottom"].Position = UDim2.fromOffset(position.X + size.X - 1, position.Y);

                                ch["LeftOutline"].Position = ch["Left"].Position;
                                ch["RightOutline"].Position =  ch["Right"].Position;
                                ch["TopOutline"].Position =  ch["Top"].Position;
                                ch["BottomOutline"].Position =  ch["Bottom"].Position;

                                ch["Left"].Visible = espS.Box;
                                ch["Right"].Visible =  espS.Box;
                                ch["Top"].Visible =  espS.Box;
                                ch["Bottom"].Visible =  espS.Box;

                                ch["Left"].Size = UDim2.fromOffset(size.X, 1);
                                ch["Right"].Size = UDim2.fromOffset(size.X, 1);
                                ch["Top"].Size = UDim2.fromOffset(1, size.Y);
                                ch["Bottom"].Size = UDim2.fromOffset(1, size.Y);

                                ch["LeftOutline"].Size = ch["Left"].Size;
                                ch["RightOutline"].Size = ch["Right"].Size;
                                ch["TopOutline"].Size = ch["Top"].Size;
                                ch["BottomOutline"].Size = ch["Bottom"].Size;

                                ch["LeftOutline"].BorderColor3 = espS.OutlineColor;
                                ch["RightOutline"].BorderColor3 =  espS.OutlineColor;
                                ch["TopOutline"].BorderColor3 =  espS.OutlineColor;
                                ch["BottomOutline"].BorderColor3 =  espS.OutlineColor;

                                ch["Left"].BackgroundColor3 = espS.Color;
                                ch["Right"].BackgroundColor3 = espS.Color;
                                ch["Top"].BackgroundColor3 = espS.Color;
                                ch["Bottom"].BackgroundColor3 = espS.Color;
                                ch["LeftOutline"].BackgroundColor3 = espS.Color;
                                ch["RightOutline"].BackgroundColor3 = espS.Color;
                                ch["TopOutline"].BackgroundColor3 = espS.Color;
                                ch["BottomOutline"].BackgroundColor3 = espS.Color;
                            else
                                ch["LeftOutline"].Visible = false;
                                ch["RightOutline"].Visible =  false;
                                ch["TopOutline"].Visible =  false;
                                ch["BottomOutline"].Visible =  false;
                                ch["Left"].Visible = false;
                                ch["Right"].Visible =  false;
                                ch["Top"].Visible =  false;
                                ch["Bottom"].Visible =  false;
                            end

                            if espS.HealthBar then

                                local health = oChar.Humanoid.Health
                                local healthScale = health / oChar.Humanoid.MaxHealth
                                local healthSizeY = size.Y * healthScale;

                                ch["HealthBackground"].Visible = espS.HealthBar;
                                ch["HealthBar"].Visible = espS.HealthBar;

                                ch["HealthBackground"].Size = UDim2.fromOffset(4, size.Y);
                                ch["HealthBar"].Size = UDim2.fromOffset(2, -healthSizeY);

                                ch["HealthBackground"].Position = UDim2.fromOffset(position.X - 8, position.Y); 
                                ch["HealthBar"].Position = UDim2.fromOffset(position.x - 7, position.y + size.Y);

                                ch["HealthBackground"].BackgroundColor3 = espS.OutlineColor;
                                ch["HealthBackground"].BorderColor3 = espS.OutlineColor;
                            else
                                ch["HealthBackground"].Visible = false;
                                ch["HealthBar"].Visible = false;
                            end

                            if espS.Health then

                                local health = oChar.Humanoid.Health
                                local healthScale = health / oChar.Humanoid.MaxHealth
                                local healthSizeY = size.Y * healthScale;

                                ch["Health"].Visible = espS.Health;

                                ch["Health"].Position = (espS.HealthBar and UDim2.fromOffset(position.X - 25, position.y + size.Y + -healthSizeY) or UDim2.fromOffset(position.X - 25, position.Y + size.Y));

                                ch["Health"].Text = math.floor(oChar.Humanoid.Health)
                            else
                                ch["Health"].Visible = false;
                            end

                            -- Distance

                            if espS.Distance or espS.Name then

                                ch["Name"].Visible = espS.Name;
                                ch["Distance"].Visible = espS.Distance and not espS.Name;

                                ch["Name"].Position = UDim2.fromOffset(screen.X, screen.Y - (size.Y + ch["Name"].TextBounds.Y + 14) / 2);
                                ch["Distance"].Position = UDim2.fromOffset(screen.X, screen.Y - (size.Y + ch["Name"].TextBounds.Y + 14) / 2);

                                ch["Distance"].Text = math.floor(0.5+(cam.CFrame.Position - oChar.HumanoidRootPart.Position).magnitude);
                                ch["Name"].Text = (espS.Name and espS.Distance and oChar.Name .. " [" .. math.floor(0.5+(cam.CFrame.Position - oChar.HumanoidRootPart.Position).magnitude / 3.5714285714) .. "]" or oChar.Name);

                            else
                                ch["Name"].Visible = false;
                                ch["Distance"].Visible = false;
                            end

                            -- Tracer

                            if espS.Tracers then
                                local ScreenVec2 = Vector2.new(screen.X, screen.Y + size.Y / 2 + size.Y / 20);
                                local Origin = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y - 1);
                                local TracerPosition = (Origin + ScreenVec2) / 2;

                                ch["TracerOutline"].Visible = espS.Outline and espS.Tracers;
                                ch["Tracer"].Visible = espS.Tracers;

                                ch["Tracer"].Rotation = math.deg(math.atan2(ScreenVec2.Y - Origin.Y, ScreenVec2.X - Origin.X));
                                ch["Tracer"].Position = UDim2.new(0, TracerPosition.X, 0, TracerPosition.Y);
                                ch["Tracer"].Size = UDim2.fromOffset((Origin - ScreenVec2).Magnitude, 1);

                                ch["TracerOutline"].Rotation = ch["Tracer"].Rotation;
                                ch["TracerOutline"].Position = ch["Tracer"].Position;
                                ch["TracerOutline"].Size = ch["Tracer"].Size;

                                ch["TracerOutline"].BorderColor3 = espS.OutlineColor;
                                ch["Tracer"].BackgroundColor3 = espS.Color;

                            else
                                ch["TracerOutline"].Visible = false;
                                ch["Tracer"].Visible = false;
                            end

                            -- Highlight 

                            if espS.Highlight then
                                ch["Hilight"].Enabled = espS.Highlight;

                                ch["Hilight"].Adornee = oChar;

                                ch["Hilight"].OutlineColor = espS.HlOutlineColor;
                                ch["Hilight"].FillColor = espS.HlFillColor;

                                ch["Hilight"].FillTransparency = espS.HlFillTransparency;
                                ch["Hilight"].OutlineTransparency = espS.HlOutlineTransparency;

                                ch["Hilight"].DepthMode = espS.HlMethod
                            else
                                ch["Hilight"].Enabled = false;
                                ch["Hilight"].Adornee = nil;
                            end

                        else
                            disableAll()
                        end
                    else
                        disableAll()
                    end

                else
                    disableAll()
                end
            end
        end
    end)
end

-- local function LoadESP(Player)
--     if Player.Name == player.Name then return end
--     local oChar = Player.Character or Player.CharacterAdded:Wait()
--     if not oChar then return end

--     local PlayerESP = Instance.new("Folder", ESPHolder);
--     PlayerESP.Name = oChar.Name .. "_ESP";

--     local BoxHolder = Instance.new("ScreenGui", PlayerESP);
--     BoxHolder.Name = "Box";
--     BoxHolder.DisplayOrder = 2;

--     local TracerHolder = Instance.new("ScreenGui", PlayerESP);
--     TracerHolder.Name = "Tracer";

--     local HilightHolder = Instance.new("Folder", PlayerESP);
--     HilightHolder.Name = "Hilight"

--     local LeftOutline = Instance.new("Frame", BoxHolder);
--     LeftOutline.BackgroundColor3 = espS.OutlineColor;
--     LeftOutline.Visible = false;
--     LeftOutline.BorderSizePixel = 1;

--     local RightOutline = Instance.new("Frame", BoxHolder);
--     RightOutline.BackgroundColor3 = espS.OutlineColor;
--     RightOutline.Visible = false;
--     RightOutline.BorderSizePixel = 1;

--     local TopOutline = Instance.new("Frame", BoxHolder);
--     TopOutline.BackgroundColor3 = espS.OutlineColor;
--     TopOutline.Visible = false;
--     TopOutline.BorderSizePixel = 1;

--     local BottomOutline = Instance.new("Frame", BoxHolder);
--     BottomOutline.BackgroundColor3 = espS.OutlineColor;
--     BottomOutline.Visible = false;
--     BottomOutline.BorderSizePixel = 1;

--     local Left = Instance.new("Frame", BoxHolder);
--     Left.BackgroundColor3 = espS.Color;
--     Left.Visible = false;
--     Left.BorderSizePixel = 0;

--     local Right = Instance.new("Frame", BoxHolder);
--     Right.BackgroundColor3 = espS.Color;
--     Right.Visible = false;
--     Right.BorderSizePixel = 0;

--     local Top = Instance.new("Frame", BoxHolder);
--     Top.BackgroundColor3 = espS.Color;
--     Top.Visible = false;
--     Top.BorderSizePixel = 0;

--     local Bottom = Instance.new("Frame", BoxHolder);
--     Bottom.BackgroundColor3 = espS.Color;
--     Bottom.Visible = false;
--     Bottom.BorderSizePixel = 0;

--     local Name = Instance.new("TextLabel", BoxHolder);
--     Name.BackgroundTransparency = 1;
--     Name.Text = Player.Name;
--     Name.Visible = false;
--     Name.AnchorPoint = Vector2.new(0.5, 0.5);
--     Name.TextSize = 12;
--     Name.Font = 2;
--     Name.TextColor3 = Color3.fromRGB(255, 255, 255);
--     Name.TextStrokeTransparency = 0;

--     local Distance = Instance.new("TextLabel", BoxHolder);
--     Distance.BackgroundTransparency = 1;
--     if IsAlive(oChar) then
--         Distance.Text = math.floor(0.5+(cam.CFrame.Position - oChar.HumanoidRootPart.Position).magnitude);
--     end
--     Distance.Visible = false;
--     Distance.AnchorPoint = Vector2.new(0.5, 0.5);
--     Distance.TextSize = 12;
--     Distance.Font = 2;
--     Distance.TextColor3 = Color3.fromRGB(255, 255, 255);
--     Distance.TextStrokeTransparency = 0;

--     local HealthBackground = Instance.new("Frame", BoxHolder);
--     HealthBackground.Visible = false;
--     HealthBackground.BorderSizePixel = 1;
--     HealthBackground.BorderColor3 = espS.OutlineColor;

--     local HealthBar = Instance.new("Frame", BoxHolder);
--     HealthBar.Visible = false;
--     HealthBar.BorderSizePixel = 0;
--     HealthBar.BackgroundColor3 = Color3.fromRGB(0, 255 ,0); 

--     local Health = Instance.new("TextLabel", BoxHolder);
--     Health.BackgroundTransparency = 1;
--     if IsAlive(oChar) then
--         Health.Text = oChar.Humanoid.Health;
--     end
--     Health.Visible = false;
--     Health.AnchorPoint = Vector2.new(0.5, 0.5);
--     Health.TextSize = 12;
--     Health.Font = 2;
--     Health.TextColor3 = Color3.fromRGB(255, 255, 255);
--     Health.TextStrokeTransparency = 0;

--     -- Tracer 

--     local TracerOutline = Instance.new("Frame", TracerHolder);
--     TracerOutline.BackgroundColor3 = espS.OutlineColor;
--     TracerOutline.Visible = false;
--     TracerOutline.BorderSizePixel = 1;
--     TracerOutline.AnchorPoint = Vector2.new(0.5, 0.5);

--     local Tracer = Instance.new("Frame", TracerHolder);
--     Tracer.BackgroundColor3 = espS.OutlineColor;
--     Tracer.Visible = false;
--     Tracer.BorderSizePixel = 0;
--     Tracer.AnchorPoint = Vector2.new(0.5, 0.5);

--     -- Hilight

--     local Hilight = Instance.new("Highlight", HilightHolder);
--     Hilight.Enabled = false;

--     local function disableAll()
--         LeftOutline.Visible = false;
--         RightOutline.Visible =  false;
--         TopOutline.Visible =  false;
--         BottomOutline.Visible =  false;
--         Left.Visible = false;
--         Right.Visible =  false;
--         Top.Visible =  false;
--         Bottom.Visible =  false;
--         TracerOutline.Visible = false;
--         Tracer.Visible = false;
--         Name.Visible = false;
--         Distance.Visible = false;
--         HealthBackground.Visible = false;
--         HealthBar.Visible = false;
--         Health.Visible = false;	
--         Hilight.Enabled = false;
--         Hilight.Adornee = nil;
--     end

--     local connName = "Esp_"..Player.Name
--     local co = coroutine.create(function()
--         conns["Esp"][connName] = runS.RenderStepped:Connect(function()
--             local oChar = Player.Character or Player.CharacterAdded:Wait()
--             if IsAlive(oChar) then
--                 local screen, onScreen = cam:WorldToScreenPoint(oChar.HumanoidRootPart.Position); 
--                 local frustumHeight = math.tan(math.rad(cam.FieldOfView * 0.5)) * 2 * screen.Z ;
--                 local size = cam.ViewportSize.Y / frustumHeight * espS.CharacterSize;
--                 local position = Vector2.new(screen.X, screen.Y) - (size / 2 - Vector2.new(0, size.Y) / 20);

--                 if onScreen then	
--                     local DistanceNumb = math.floor(0.5+(cam.CFrame.Position - oChar.HumanoidRootPart.Position).magnitude)
--                     if espS.MaxDistance > DistanceNumb then
--                         -- Box

--                         if espS.Box then

--                             LeftOutline.Visible = espS.Box and espS.Outline;
--                             RightOutline.Visible =  espS.Box and espS.Outline;
--                             TopOutline.Visible =  espS.Box and espS.Outline;
--                             BottomOutline.Visible =  espS.Box and espS.Outline;

--                             Left.Position = UDim2.fromOffset(position.X, position.Y);
--                             Right.Position = UDim2.fromOffset(position.X, position.Y + size.Y - 1);
--                             Top.Position = UDim2.fromOffset(position.X, position.Y);
--                             Bottom.Position = UDim2.fromOffset(position.X + size.X - 1, position.Y);

--                             LeftOutline.Position = Left.Position;
--                             RightOutline.Position =  Right.Position;
--                             TopOutline.Position =  Top.Position;
--                             BottomOutline.Position =  Bottom.Position;

--                             Left.Visible = espS.Box;
--                             Right.Visible =  espS.Box;
--                             Top.Visible =  espS.Box;
--                             Bottom.Visible =  espS.Box;

--                             Left.Size = UDim2.fromOffset(size.X, 1);
--                             Right.Size = UDim2.fromOffset(size.X, 1);
--                             Top.Size = UDim2.fromOffset(1, size.Y);
--                             Bottom.Size = UDim2.fromOffset(1, size.Y);

--                             LeftOutline.Size = Left.Size;
--                             RightOutline.Size = Right.Size;
--                             TopOutline.Size = Top.Size;
--                             BottomOutline.Size = Bottom.Size;

--                             LeftOutline.BorderColor3 = espS.OutlineColor;
--                             RightOutline.BorderColor3 =  espS.OutlineColor;
--                             TopOutline.BorderColor3 =  espS.OutlineColor;
--                             BottomOutline.BorderColor3 =  espS.OutlineColor;

--                             Left.BackgroundColor3 = espS.Color;
--                             Right.BackgroundColor3 = espS.Color;
--                             Top.BackgroundColor3 = espS.Color;
--                             Bottom.BackgroundColor3 = espS.Color;
--                             LeftOutline.BackgroundColor3 = espS.Color;
--                             RightOutline.BackgroundColor3 = espS.Color;
--                             TopOutline.BackgroundColor3 = espS.Color;
--                             BottomOutline.BackgroundColor3 = espS.Color;
--                         else
--                             LeftOutline.Visible = false;
--                             RightOutline.Visible =  false;
--                             TopOutline.Visible =  false;
--                             BottomOutline.Visible =  false;
--                             Left.Visible = false;
--                             Right.Visible =  false;
--                             Top.Visible =  false;
--                             Bottom.Visible =  false;
--                         end

--                         if espS.HealthBar then

--                             local health = oChar.Humanoid.Health
--                             local healthScale = health / oChar.Humanoid.MaxHealth
--                             local healthSizeY = size.Y * healthScale;

--                             HealthBackground.Visible = espS.HealthBar;
--                             HealthBar.Visible = espS.HealthBar;

--                             HealthBackground.Size = UDim2.fromOffset(4, size.Y);
--                             HealthBar.Size = UDim2.fromOffset(2, -healthSizeY);

--                             HealthBackground.Position = UDim2.fromOffset(position.X - 8, position.Y); 
--                             HealthBar.Position = UDim2.fromOffset(position.x - 7, position.y + size.Y);

--                             HealthBackground.BackgroundColor3 = espS.OutlineColor;
--                             HealthBackground.BorderColor3 = espS.OutlineColor;
--                         else
--                             HealthBackground.Visible = false;
--                             HealthBar.Visible = false;
--                         end

--                         if espS.Health then

--                             local health = oChar.Humanoid.Health
--                             local healthScale = health / oChar.Humanoid.MaxHealth
--                             local healthSizeY = size.Y * healthScale;

--                             Health.Visible = espS.Health;

--                             Health.Position = (espS.HealthBar and UDim2.fromOffset(position.X - 25, position.y + size.Y + -healthSizeY) or UDim2.fromOffset(position.X - 25, position.Y + size.Y));

--                             Health.Text = math.floor(oChar.Humanoid.Health)
--                         else
--                             Health.Visible = false;
--                         end

--                         -- Distance

--                         if espS.Distance or espS.Name then

--                             Name.Visible = espS.Name;
--                             Distance.Visible = espS.Distance and not espS.Name;

--                             Name.Position = UDim2.fromOffset(screen.X, screen.Y - (size.Y + Name.TextBounds.Y + 14) / 2);
--                             Distance.Position = UDim2.fromOffset(screen.X, screen.Y - (size.Y + Name.TextBounds.Y + 14) / 2);

--                             Distance.Text = math.floor(0.5+(cam.CFrame.Position - oChar.HumanoidRootPart.Position).magnitude);
--                             Name.Text = (espS.Name and espS.Distance and Player.Name .. " [" .. math.floor(0.5+(cam.CFrame.Position - oChar.HumanoidRootPart.Position).magnitude / 3.5714285714) .. "]" or Player.Name);

--                         else
--                             Name.Visible = false;
--                             Distance.Visible = false;
--                         end

--                         -- Tracer

--                         if espS.Tracers then
--                             local ScreenVec2 = Vector2.new(screen.X, screen.Y + size.Y / 2 + size.Y / 20);
--                             local Origin = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y - 1);
--                             local TracerPosition = (Origin + ScreenVec2) / 2;

--                             TracerOutline.Visible = espS.Outline and espS.Tracers;
--                             Tracer.Visible = espS.Tracers;

--                             Tracer.Rotation = math.deg(math.atan2(ScreenVec2.Y - Origin.Y, ScreenVec2.X - Origin.X));
--                             Tracer.Position = UDim2.new(0, TracerPosition.X, 0, TracerPosition.Y);
--                             Tracer.Size = UDim2.fromOffset((Origin - ScreenVec2).Magnitude, 1);

--                             TracerOutline.Rotation = Tracer.Rotation;
--                             TracerOutline.Position = Tracer.Position;
--                             TracerOutline.Size = Tracer.Size;

--                             TracerOutline.BorderColor3 = espS.OutlineColor;
--                             Tracer.BackgroundColor3 = espS.Color;

--                         else
--                             TracerOutline.Visible = false;
--                             Tracer.Visible = false;
--                         end

--                         -- Highlight 

--                         if espS.Highlight then
--                             Hilight.Enabled = espS.Highlight;

--                             if not IsArsenal then
--                                 Hilight.Adornee = oChar;
--                             end

--                             Hilight.OutlineColor = espS.HlOutlineColor;
--                             Hilight.FillColor = espS.HlFillColor;

--                             Hilight.FillTransparency = espS.HlFillTransparency;
--                             Hilight.OutlineTransparency = espS.HlOutlineTransparency;

--                             Hilight.DepthMode = espS.HlMethod
--                         else
--                             Hilight.Enabled = false;
--                             Hilight.Adornee = nil;
--                         end

--                     else
--                         disableAll()
--                     end
--                 else
--                     disableAll()
--                 end

--             else
--                 disableAll()
--             end
--         end)
--         if not Players:FindFirstChild(Player.Name) then
--             PlayerESP:Destroy()
--             coroutine.close()
--             conns["Esp"][connName]:Disconnect()
--             conns["Esp"][connName] = nil
--         end
--     end)
--     coroutine.resume(co)
-- end






Tab.Esp:AddToggle("MyToggle",
    {
        Title = "Esp",
        Description = "",
        Default = false,
        Callback = function(state)
            if state then
                espS.Enabled = true

                esp()



                -- for i,plr in pairs(Players:GetChildren()) do
                --     if plr ~= localPlayer then
                --         LoadESP(plr);
                --     end
                -- end
                
                -- conns["Esp"]["EspMain"] = Players.PlayerAdded:Connect(function(plr)
                --     if plr ~= localPlayer then
                --         LoadESP(plr);
                --     end
                -- end)
                
            else
                espS.Enabled = false

                for i,v in pairs(ESPHolder:GetChildren()) do
                    v:Destroy()
                end
                for i,v in pairs(conns["Esp"]) do
                    v:Disconnect()
                    v = nil
                end
            end
        end
    }
)
local EspColorpicker = Tab.Esp:AddColorpicker(
    "Colorpicker",
    {
        Title = "Esp Color",
        Description = "",
        Default = espS.Color
    }
)
EspColorpicker:OnChanged(
    function()
        espS.Color = EspColorpicker.Value
    end
)
Tab.Esp:AddSlider(
    "Slider",
    {
        Title = "Max Distance",
        Description = "",
        Default = espS.MaxDistance,
        Min = 1,
        Max = 4000,
        Rounding = 1,
        Callback = function(Value)
            espS.MaxDistance = tonumber(Value)
        end
    }
)
Tab.Esp:AddToggle("MyToggle",
    {
        Title = "Name",
        Description = "",
        Default = false,
        Callback = function(state)
            if state then
                espS.Name = true
            else
                espS.Name = false
            end
        end
    }
)
Tab.Esp:AddToggle("MyToggle",
    {
        Title = "Box",
        Description = "",
        Default = false,
        Callback = function(state)
            if state then
                espS.Box = true
            else
                espS.Box = false
            end
        end
    }
)
Tab.Esp:AddToggle("MyToggle",
    {
        Title = "Tracers",
        Description = "",
        Default = false,
        Callback = function(state)
            if state then
                espS.Tracers = true
            else
                espS.Tracers = false
            end
        end
    }
)
Tab.Esp:AddToggle("MyToggle",
    {
        Title = "Health",
        Description = "",
        Default = false,
        Callback = function(state)
            if state then
                espS.Health = true
            else
                espS.Health = false
            end
        end
    }
)
Tab.Esp:AddToggle("MyToggle",
    {
        Title = "Health Bar",
        Description = "",
        Default = false,
        Callback = function(state)
            if state then
                espS.HealthBar = true
            else
                espS.HealthBar = false
            end
        end
    }
)
Tab.Esp:AddToggle("MyToggle",
    {
        Title = "Distance",
        Description = "",
        Default = false,
        Callback = function(state)
            if state then
                espS.Distance = true
            else
                espS.Distance = false
            end
        end
    }
)
Tab.Esp:AddToggle("MyToggle",
    {
        Title = "Outline",
        Description = "",
        Default = false,
        Callback = function(state)
            if state then
                espS.Outline = true
            else
                espS.Outline = false
            end
        end
    }
)
local OutlineColorpicker = Tab.Esp:AddColorpicker(
    "Colorpicker",
    {
        Title = "Outline Color",
        Description = "",
        Default = espS.OutlineColor
    }
)
OutlineColorpicker:OnChanged(
    function()
        espS.OutlineColor = OutlineColorpicker.Value
    end
)
Tab.Esp:AddToggle("MyToggle",
    {
        Title = "Highlight",
        Description = "",
        Default = false,
        Callback = function(state)
            if state then
                espS.Highlight = true
            else
                espS.Highlight = false
            end
        end
    }
)
local hlEspDropdown = Tab.Esp:AddDropdown("Dropdown",
    {
        Title = "Highlight Method",
        Values = {"AlwaysOnTop", "Occluded"},
        Multi = false,
        Default = 1
    }
)
hlEspDropdown:OnChanged(
    function(Value)
        espS.HlMethod = Value
    end
)

local HlOutlineColorpicker = Tab.Esp:AddColorpicker(
    "Colorpicker",
    {
        Title = "Highlight Outline Color",
        Description = "",
        Default = espS.HlOutlineColor
    }
)
HlOutlineColorpicker:OnChanged(
    function()
        espS.HlOutlineColor = HlOutlineColorpicker.Value
    end
)
Tab.Esp:AddSlider(
    "Slider",
    {
        Title = "Highlight Outline Transparency",
        Description = "",
        Default = 0,
        Min = 0,
        Max = 100,
        Rounding = 1,
        Callback = function(Value)
            espS.HlOutlineTransparency = Value / 100
        end
    }
)
local HlFillColorpicker = Tab.Esp:AddColorpicker(
    "Colorpicker",
    {
        Title = "Highlight Fill Color",
        Description = "",
        Default = espS.HlFillColor
    }
)
HlFillColorpicker:OnChanged(
    function()
        espS.HlFillColor = HlFillColorpicker.Value
    end
)
Tab.Esp:AddSlider(
    "Slider",
    {
        Title = "Highlight Fill Transparency",
        Description = "",
        Default = 0,
        Min = 0,
        Max = 100,
        Rounding = 1,
        Callback = function(Value)
            espS.HlFillTransparency = Value / 100
        end
    }
)

--[[

    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------
                                        Sounds Tab
    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------

]]

------------------ Kill Sound
-------- Kill Sound
------------------ Kill Sound
Tab.Sounds:AddInput(
    "Input",
    {
        Title = "Kill Sound",
        Description = "",
        Default = "",
        Placeholder = "ID Here",
        Numeric = true,
        Finished = true,
        Callback = function(soundId)
            rs.Shared.Assets.Sounds.KillSound.SoundId = "rbxassetid://" .. soundId
            rs.Shared.Assets.Sounds.KillSound.PlaybackSpeed = 1
        end
    }
)
Tab.Sounds:AddSlider(
    "Slider",
    {
        Title = "Kill Sound Volume",
        Description = "",
        Default = 1,
        Min = 0,
        Max = 10,
        Rounding = 1,
        Callback = function(Value)
            rs.Shared.Assets.Sounds.KillSound.Volume = Value
        end
    }
)
Tab.Sounds:AddInput(
    "Input",
    {
        Title = "Parry Sound",
        Description = "Works for ALL parries",
        Default = "",
        Placeholder = "ID Here",
        Numeric = true,
        Finished = true,
        Callback = function(soundId)
            rs.Shared.Assets.Sounds.Parry.SoundId = "rbxassetid://" .. soundId
            rs.Shared.Assets.Sounds.Parry.PlaybackSpeed = 1
        end
    }
)
Tab.Sounds:AddSlider(
    "Slider",
    {
        Title = "Parry Sound Volume",
        Description = "",
        Default = 1,
        Min = 0,
        Max = 10,
        Rounding = 1,
        Callback = function(Value)
            rs.Shared.Assets.Sounds.Parry.Volume = Value
        end
    }
)
Tab.Sounds:AddInput(
    "Input",
    {
        Title = "Hit Sound",
        Description = "",
        Default = "",
        Placeholder = "ID Here",
        Numeric = true,
        Finished = true,
        Callback = function(soundId)
            rs.Shared.Assets.Sounds.HitmarkerSound.SoundId = "rbxassetid://" .. soundId
            rs.Shared.Assets.Sounds.HitmarkerSound.PlaybackSpeed = 1
        end
    }
)
Tab.Sounds:AddSlider(
    "Slider",
    {
        Title = "Hit Sound Volume",
        Description = "",
        Default = 1,
        Min = 0,
        Max = 10,
        Rounding = 1,
        Callback = function(Value)
            rs.Shared.Assets.Sounds.HitmarkerSound.Volume = Value
        end
    }
)







--[[

    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------
                                        Changer Tab
    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------

]]

------------------ WeaponColorize
-------- WeaponColorize
------------------ WeaponColorize
Tab.Changer:AddButton(
    {
        Title = "Change Color Of Weapon",
        Description = "",
        Callback = function()
            local char = player.Character or player.CharacterAdded:Wait()
            local tool = char:FindFirstChildWhichIsA("Tool")

            if tool then
                ChangeToolColor(tool, wSettings.Color, wSettings.Material)
                editedWeapons[tool.Name] = {
                    Color = wSettings.Color,
                    Material = wSettings.Material
                }

                ChangeBackColor(tool, wSettings.Color, wSettings.Material)
            else
                Fluent:Notify(
                    {
                        Title = "Error",
                        Content = "Equip the tool to change its color!",
                        Duration = 5
                    }
                )
            end
        end
    }
)
local Colorpicker = Tab.Changer:AddColorpicker(
    "Colorpicker",
    {
        Title = "Weapon Color",
        Description = "",
        Default = wSettings.Color
    }
)
Colorpicker:OnChanged(
    function()
        wSettings.Color = Colorpicker.Value
    end
)

local Dropdown = Tab.Changer:AddDropdown("Dropdown",
    {
        Title = "Weapon Material",
        Values = {
            "Plastic",
            "Neon",
            "Air",
            "Asphalt",
            "Basalt",
            "Brick",
            "Cardboard",
            "Carpet",
            "CeramicTiles",
            "ClayRoofTiles",
            "Cobblestone",
            "Concrete",
            "CorrodedMetal",
            "CrackedLava",
            "DiamondPlate",
            "Fabric",
            "Foil",
            "ForceField",
            "Metal",
            "Ice",
            "Rock",
            "Rubber",
            "SmoothPlastic",
            "Water",
            "Wood",
            "Glass"
        },
        Multi = false,
        Default = 2
    }
)
Dropdown:OnChanged(
    function(Value)
        if Enum.Material[Value] then
            wSettings.Material = Enum.Material[Value]
        end
    end
)


------------------ Clothes
-------- Clothes
------------------ Clothes
Tab.Changer:AddParagraph(
    {
        Title = "SkinChanger information",
        Content = "These clothes are designed to be visible only on you, there is no risk of ban. -Voltrivax"
    }
)
local ClInput = Tab.Changer:AddInput(
    "Input",
    {
        Title = "ID Input",
        Description = "",
        Default = "",
        Placeholder = "Placeholder",
        Numeric = false,
        Finished = true,
        Callback = function(assetId)
            createAsset(assetId)
        end
    }
)
local ClInput2 = Tab.Changer:AddInput(
    "Input",
    {
        Title = "ID Input 2",
        Description = "",
        Default = "",
        Placeholder = "Placeholder",
        Numeric = true,
        Finished = true,
        Callback = function(assetId)
            createAsset(assetId)
        end
    }
)
local ClInput3 = Tab.Changer:AddInput(
    "Input",
    {
        Title = "ID Input 3",
        Description = "",
        Default = "",
        Placeholder = "Placeholder",
        Numeric = true,
        Finished = true,
        Callback = function(assetId)
            createAsset(assetId)
        end
    }
)

Tab.Changer:AddButton(
    {
        Title = "Clear Accessories",
        Description = "",
        Callback = function()
            deleteAllAccessories()
        end
    }
)

--[[

    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------
                                        World Tab
    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------

]]

------------------ SkyChange
-------- SkyChange
------------------ SkyChange

local currentSky
local skyNames = {}
for name, id in pairs(skyTable) do
    table.insert(skyNames, name)
end

local SkyDropdown = Tab.World:AddDropdown(
    "Dropdown",
    {
        Title = "Sky",
        Values = skyNames,
        Multi = false,
        Default = 1
    }
)
SkyDropdown:OnChanged(
    function(SkyName)
        currentSky = SkyName
    end
)

Tab.World:AddButton(
    {
        Title = "Change Sky",
        Description = "You have to wait a while for the sky to fully load.",
        Callback = function()
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


------------------ FogRemoval
-------- FogRemoval
------------------ FogRemoval
Tab.World:AddButton(
    {
        Title = "Remove Fog",
        Description = "",
        Callback = function()
            local atmosphere = lighting:FindFirstChildWhichIsA("Atmosphere")
            if atmosphere then
                atmosphere.Density = 0
            else
                Fluent:Notify(
                    {
                        Title = "Error",
                        Content = "Problem Error: 00x1a",
                        SubContent = "If the problem continues, please write about it in our discord channel 'bug-reports'.",
                        Duration = 5
                    }
                )
            end
        end
    }
)

------------------ WalkOnWater
-------- WalkOnWater
------------------ WalkOnWater
Tab.World:AddToggle("MyToggle",
    {
        Title = "Walk On Water",
        Description = "",
        Default = false,
        Callback = function(state)
            for i,v in pairs(game.Workspace.Map:GetDescendants()) do
                if v.Name == "WaterArea" then
                    if state then
                        v.CanCollide = true
                    else
                        v.CanCollide = false
                    end
                end
            end
        end
    }
)


--[[

    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------
                                        Misc Tab
    -------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------

]]
Tab.Misc:AddButton(
    {
        Title = "Infinity Yield 6.1",
        Description = "",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end
    }
)
Tab.Misc:AddButton(
    {
        Title = "CombatSpy / RemoteSpy",
        Description = "",
        Callback = function()
            local combatspy = game:HttpGet("https://raw.githubusercontent.com/shibbylol/Combatspy/main/spy.lua")
            loadstring(combatspy)()
        end
    }
)
Tab.Misc:AddButton(
    {
        Title = "Dark Dex V3",
        Description = "",
        Callback = function()
            loadstring(
                game:HttpGet(
                    "https://raw.githubusercontent.com/Supker/Public-Use/refs/heads/main/Dark-Dex",
                    true
                )
            )()
        end
    }
)

--------------Name Changer

local NameInput = Tab.Misc:AddInput("Input",
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

-------------bune bilmiyorum
---------------------
task.spawn(
    function()
        while task.wait(5) do
            if Fluent.Unloaded then
                for i, v in pairs(conns) do
                    if typeof(v) ~= "table" then
                        v:Disconnect()
                    else
                        for a,b in pairs(v) do
                            b:Disconnect()
                        end
                    end
                end

                for i, v in pairs(parryTargets) do
                    deleteParryFromTable(i)
                end

                UIStroke.Enabled = false

                for i,v in pairs(ESPHolder:GetChildren()) do
                    v:Destroy()
                end

                if InfPhoneGui["1"] then InfPhoneGui["1"]:Destroy() end
            end
        end
    end
)




conns["Respawn"] = player.CharacterAdded:Connect(function(character)
    char = character
    hrp = char:WaitForChild("HumanoidRootPart")
    hum = char:FindFirstChildWhichIsA("Humanoid")

    if espS.Enabled == true then
        ESPHolder:Destroy()

        ESPHolder = Instance.new("Folder", (player.PlayerGui))
        ESPHolder.Name = "EspHolder"

        espCns = {}

        for i,v in pairs(conns["Esp"]) do
            v:Disconnect()
            v = nil
        end

        esp()
    end

    if vars.JumpPowerEnabled then
        hum.JumpPower = vars.JumpPower
        conns["JumpPowerRespawn"] = hum:GetPropertyChangedSignal("JumpPower"):Connect(function()
            hum.JumpPower = vars.JumpPower
        end)
    end

    -- colorize tools
    local backPack = player:FindFirstChild("Backpack")
    local anyTool = backPack:FindFirstChildWhichIsA("Tool")
    if not anyTool then
        while anyTool == nil do
            task.wait(0.3)
            anyTool = backPack:FindFirstChildWhichIsA("Tool")
        end
    end
    for _, tool in pairs(backPack:GetChildren()) do
        if editedWeapons[tool.Name] then
            ChangeToolColor(tool, editedWeapons[tool.Name].Color, editedWeapons[tool.Name].Material)

            if editedWeapons[tool.Name].Back == true then
                ChangeBackColor(tool, editedWeapons[tool.Name].Color, editedWeapons[tool.Name].Material, true)
            end
        end
    end

    -- add accessories
    local fChar = fakeChars:WaitForChild(char.Name, 0.5)
    if fChar then
        fChar:Destroy()
    end
    for name, assetId in pairs(catalog) do
        createAsset(assetId)
    end

    humanoidHealthChanged()
end)

vars.FirstLaunch = false

print("Loaded in:", os.clock() - loadTime)
