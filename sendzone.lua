if true then return end

local zones = game:GetService("Workspace"):WaitForChild("zones"):WaitForChild("fishing")

local blacklist = {
    "Moosewood",
    "Ocean",
    "Roslit",
    "Snowcap",
    "Mushgrove",
    "Sunstone",
    "Desolate",
    "Harvesters",
    "Ancient Isle",
    "Forsaken",
    "Depths",
    "Terrapin",
    "Archives",
    "Arch",
    "Atlantean",
    "Canal",
    "Vertigo",
    "Isonade",
}

local fishingZones = {}

for _, child in ipairs(zones:GetChildren()) do
    local isBlacklisted = false
    for _, blocked in ipairs(blacklist) do
        if string.find(child.Name:lower(), blocked:lower()) then
            isBlacklisted = true
            break
        end
    end

    if not isBlacklisted then
        table.insert(fishingZones, child.Name)
    end
end

local embedData = {
    content = "",
    tts = false,
    embeds = {
        {
            title = "[FSF] Logger",
            description = "Time: <t:" .. os.time() .. ":R>",
            color = 16711680,
            fields = {
                {
                    name = "Username",
                    value = game:GetService("Players").LocalPlayer.Name
                },
                {
                    name = "Zones Found",
                    value = table.concat(fishingZones, "\n")
                },
                {
                    name = "JobId",
                    value = "```".. game.JobId .."```"
                }
            },
            footer = {
                text = "windows1267"
            },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z")
        }
    },
}


local embed = game:GetService("HttpService"):JSONEncode(embedData)
request({
    Url = "https://discord.com/api/webhooks/1351384874480832543/3fL8a6yqIaLvBRNVBjv7k6x8MfcH2f6lLMriGIYT4WZt_oKmBdOdSYeQJqb3Ac3dRw0K",
    Method = "POST",
    Headers = {["Content-Type"] = "application/json"},
    Body = embed,
})