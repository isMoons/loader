-- open source come take this <3 [[Naaellx]]
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/refs/heads/main/dist/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Ancestral 〢 Announcement",
    Icon = "rbxassetid://73407780444753",
    Author = "by Naaellx - "..os.date('%A, %B %dth, %Y.'),
    Folder = "Ancestral",
    Size = UDim2.fromOffset(520, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    --Background = "rbxassetid://13511292247", -- rbxassetid only
    HasOutline = false,
    -- remove it below if you don't want to use the key system in your script.
    -- KeySystem = { 
    --     Key = { "1234", "5678" },
    --     Note = "The Key is '1234' or '5678",
    --     -- Thumbnail = {
    --     --     Image = "rbxassetid://18220445082", -- rbxassetid only
    --     --     Title = "Thumbnail"
    --     -- },
    --     URL = "https://github.com/Footagesus/WindUI", -- remove this if the key is not obtained from the link.
    --     SaveKey = true, -- optional
    -- },
})
local Tabs = {
    GeneralTab = Window:Tab({ Title = "Information", Icon = "rbxassetid://10723415903", Desc = "" }),
    Theme = Window:Tab({ Title = "Custom Theme", Icon = "rbxassetid://10734883598", Desc = "" }),
    WindowTab = Window:Tab({ Title = "Config", Icon = "rbxassetid://121667411319639", Desc = "" }),
}
Window:SelectTab(1)

Tabs.GeneralTab:Paragraph({
    Title = "All my project Changed to ThanHub my project will continue after 6 months later.",
})
Tabs.GeneralTab:Section({ Title = "Ancestral" })
Tabs.GeneralTab:Button({
    Title = "Copy Discord link Ancestral",
    Desc = "Join our main Discord for the latest updates!",
    Callback = function()
        setclipboard("https://discord.gg/eTVvgvRq4s")
        WindUI:Notify({
            Title = "Ancestral",
            Content = "Link copied to clipboard!",
            Icon = "droplet-off",
            Duration = 15,
        }) 
    end
})
Tabs.GeneralTab:Section({ Title = "ThanHUB" })
Tabs.GeneralTab:Button({
    Title = "Arise Crossover Thanhub",
    Desc = "Join Discord to get ThanHUB",
    Callback = function()
        setclipboard("https://discord.gg/eTVvgvRq4s")
        WindUI:Notify({
            Title = "Ancestral",
            Content = "Link copied to clipboard!",
            Icon = "droplet-off",
            Duration = 15,
        }) 
    end
})
-- Configuration

local HttpService = game:GetService("HttpService")

local folderPath = "WindUI"
makefolder(folderPath)

local function SaveFile(fileName, data)
    local filePath = folderPath .. "/" .. fileName .. ".json"
    local jsonData = HttpService:JSONEncode(data)
    writefile(filePath, jsonData)
end

local function LoadFile(fileName)
    local filePath = folderPath .. "/" .. fileName .. ".json"
    if isfile(filePath) then
        local jsonData = readfile(filePath)
        return HttpService:JSONDecode(jsonData)
    end
end

local function ListFiles()
    local files = {}
    for _, file in ipairs(listfiles(folderPath)) do
        local fileName = file:match("([^/]+)%.json$")
        if fileName then
            table.insert(files, fileName)
        end
    end
    return files
end

Tabs.WindowTab:Section({ Title = "Window" })

local themeValues = {}
for name, _ in pairs(WindUI:GetThemes()) do
    table.insert(themeValues, name)
end

local themeDropdown = Tabs.WindowTab:Dropdown({
    Title = "Select Theme",
    Multi = false,
    AllowNone = false,
    Value = nil,
    Values = themeValues,
    Callback = function(theme)
        WindUI:SetTheme(theme)
    end
})
themeDropdown:Select(WindUI:GetCurrentTheme())

local ToggleTransparency = Tabs.WindowTab:Toggle({
    Title = "Toggle Window Transparency",
    Callback = function(e)
        Window:ToggleTransparency(e)
    end,
    Value = WindUI:GetTransparency()
})

Tabs.WindowTab:Section({ Title = "Save" })

local fileNameInput = ""
Tabs.WindowTab:Input({
    Title = "Write File Name",
    PlaceholderText = "Enter file name",
    Callback = function(text)
        fileNameInput = text
    end
})

Tabs.WindowTab:Button({
    Title = "Save File",
    Callback = function()
        if fileNameInput ~= "" then
            SaveFile(fileNameInput, { Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
        end
    end
})

Tabs.WindowTab:Section({ Title = "Load" })

local filesDropdown
local files = ListFiles()

filesDropdown = Tabs.WindowTab:Dropdown({
    Title = "Select File",
    Multi = false,
    AllowNone = true,
    Values = files,
    Callback = function(selectedFile)
        fileNameInput = selectedFile
    end
})

Tabs.WindowTab:Button({
    Title = "Load File",
    Callback = function()
        if fileNameInput ~= "" then
            local data = LoadFile(fileNameInput)
            if data then
                WindUI:Notify({
                    Title = "File Loaded",
                    Content = "Loaded data: " .. HttpService:JSONEncode(data),
                    Duration = 5,
                })
                if data.Transparent then 
                    Window:ToggleTransparency(data.Transparent)
                    ToggleTransparency:SetValue(data.Transparent)
                end
                if data.Theme then WindUI:SetTheme(data.Theme) end
            end
        end
    end
})

Tabs.WindowTab:Button({
    Title = "Overwrite File",
    Callback = function()
        if fileNameInput ~= "" then
            SaveFile(fileNameInput, { Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
        end
    end
})

Tabs.WindowTab:Button({
    Title = "Refresh List",
    Callback = function()
        filesDropdown:Refresh(ListFiles())
    end
})

local currentThemeName = WindUI:GetCurrentTheme()
local themes = WindUI:GetThemes()

local ThemeAccent = themes[currentThemeName].Accent
local ThemeOutline = themes[currentThemeName].Outline
local ThemeText = themes[currentThemeName].Text
local ThemePlaceholderText = themes[currentThemeName].PlaceholderText

function updateTheme()
    WindUI:AddTheme({
        Name = currentThemeName,
        Accent = ThemeAccent,
        Outline = ThemeOutline,
        Text = ThemeText,
        PlaceholderText = ThemePlaceholderText
    })
    WindUI:SetTheme(currentThemeName)
end

local CreateInput = Tabs.Theme:Input({
    Title = "Theme Name",
    Value = currentThemeName,
    Callback = function(name)
        currentThemeName = name
    end
})

Tabs.Theme:Colorpicker({
    Title = "Background Color",
    Default = Color3.fromHex(ThemeAccent),
    Callback = function(color)
        ThemeAccent = color:ToHex()
    end
})

Tabs.Theme:Colorpicker({
    Title = "Outline Color",
    Default = Color3.fromHex(ThemeOutline),
    Callback = function(color)
        ThemeOutline = color:ToHex()
    end
})

Tabs.Theme:Colorpicker({
    Title = "Text Color",
    Default = Color3.fromHex(ThemeText),
    Callback = function(color)
        ThemeText = color:ToHex()
    end
})

Tabs.Theme:Colorpicker({
    Title = "Placeholder Text Color",
    Default = Color3.fromHex(ThemePlaceholderText),
    Callback = function(color)
        ThemePlaceholderText = color:ToHex()
    end
})

Tabs.Theme:Button({
    Title = "Update Theme",
    Callback = function()
        updateTheme()
    end
})
