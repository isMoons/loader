-- UI Toggle Setup
local UI = {
    Toggles = getgenv().Toggles or {},
    Options = getgenv().Options or {},
}

-- Function to get toggle values
local function GetToggleValue(Name)
    return UI.Toggles[Name] and UI.Toggles[Name].Value
end

-- Fluent UI Setup
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = game:GetService("MarketplaceService"):GetProductInfo(16732694052).Name .."  | Ancestral v1.0",
    SubTitle = "discord.gg/ancestral",
    TabWidth = 160,
    Size = UDim2.fromOffset(520, 400),
    Acrylic = false,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Tabs Setup
local Tabs = { -- https://lucide.dev/icons/
    Profile = Window:AddTab({ Title = "Profile", Icon = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)}), 
    Information = Window:AddTab({ Title = "Information", Icon = "book" }), 
    Main = Window:AddTab({ Title = "Fishing", Icon = "anchor" }),
    Items = Window:AddTab({ Title = "Forge", Icon = "hammer" }), 
    CharacterTab = Window:AddTab({ Title = "Character", Icon = "user" }),
    Teleports = Window:AddTab({ Title = "Teleports", Icon = "compass" }), 
    Exclusives = Window:AddTab({ Title = "Exclusives", Icon = "star" }), 
    Misc = Window:AddTab({ Title = "Misc", Icon = "package" }),
}

-- Toggle Setup in UI
local autoCastToggle = Tabs.Main:AddToggle("AutoCast", { Title = "Auto Cast", Default = false })
autoCastToggle:OnChanged(function()
    autoCastEnabled = UI.Options.AutoCast.Value
    if autoCastEnabled then
        task.spawn(AutoCast)
    end
end)

local autoReelToggle = Tabs.Main:AddToggle("AutoReel", { Title = "Auto Reel Legit", Default = false })
autoReelToggle:OnChanged(function()
    autoReelEnabled = UI.Options.AutoReel.Value
    if autoReelEnabled then
        task.spawn(AutoReel)
    end
end)

local instantReelToggle = Tabs.Main:AddToggle("InstantReel", { Title = "Instant Reel Blatant", Default = false })
instantReelToggle:OnChanged(function()
    instantReelEnabled = UI.Options.InstantReel.Value
    if instantReelEnabled then
        task.spawn(AutoReel)
    end
end)

local perfectReelToggle = Tabs.Main:AddToggle("PerfectReel", { Title = "Always Perfect Reel", Default = false })
perfectReelToggle:OnChanged(function()
    perfectReelEnabled = UI.Options.PerfectReel.Value
end)

local instantBobToggle = Tabs.Main:AddToggle("InstantBob", { Title = "Instant Bobber", Default = false })
instantBobToggle:OnChanged(function()
    instantBobEnabled = UI.Options.InstantBob.Value
end)

local autoShakeToggle = Tabs.Main:AddToggle("AutoShake", { Title = "Auto Shake", Default = false })
autoShakeToggle:OnChanged(function()
    autoShakeEnabled = UI.Options.AutoShake.Value
end)

-- Auto Cast
function AutoCast()
    while true do
        if GetToggleValue("AutoCast") then
            pcall(function()
                if not CurrentTool then return end
                local Values = CurrentTool:FindFirstChild("values")
                local Events = CurrentTool:FindFirstChild("events")
                if Values and Events and not Values.casted.Value then
                    Events.cast:FireServer(100, 1)
                end
            end)
        end
        task.wait(0.3)
    end
end
Collect(coroutine.create(AutoCast))

-- Auto Reel
function AutoReel()
    while true do
        RunService.RenderStepped:Wait()
        local ReelUI = LocalPlayer.PlayerGui:FindFirstChild("reel")
        if ReelUI then
            if GetToggleValue("InstantReel") then
                Remotes.ReelFinished:FireServer(100, GetToggleValue("PerfectReel"))
            elseif GetToggleValue("AutoReel") then
                local Bar = ReelUI:FindFirstChild("bar")
                if Bar then
                    local PlayerBar = Bar:FindFirstChild("playerbar")
                    local TargetBar = Bar:FindFirstChild("fish")
                    while ReelUI:IsDescendantOf(LocalPlayer.PlayerGui) do
                        RunService.RenderStepped:Wait()
                        PlayerBar.Position = UDim2.fromScale(
                            math.clamp(PlayerBar.Position.X.Scale, 0.15, 0.85),
                            PlayerBar.Position.Y.Scale
                        )
                    end
                end
            end
        end
    end
end
Collect(coroutine.create(AutoReel))
