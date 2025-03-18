-- Ambil referensi ke folder zona memancing
local FishingZonesFolder = game:GetService("Workspace").zones.fishing
local FishingSpots = {}
local SeenZones = {}  -- Tabel untuk melacak zona yang sudah dimasukkan

-- Daftar zona yang bisa digunakan
local zoneList = {
    ["Megalodon Default"] = true,
    ["Megalodon Ancient"] = true,
    ["Great White Shark"] = false,
    ["Great Hammerhead Shark"] = false,
    ["Whale Shark"] = false,
    ["The Kraken Pool"] = false,
    ["Ancient Kraken Pool"] = true,
    ["Orcas Pool"] = true,
    ["Ancient Orcas Pool"] = true,
    ["Forsaken Veil - Scylla"] = true,
    ["Whales Pool"] = false,
    ["Moby"] = true,
    ["Rowdy McCharm"] = true,
    ["O'Mango Goldgrin"] = true,
    ["Sunny O'Coin"] = true,
    ["Blarney McBreeze"] = true,
    ["Plumrick O'Luck"] = true,
}

for zoneName, isEnabled in pairs(zoneList) do
    if isEnabled and not SeenZones[zoneName] then
        table.insert(FishingSpots, zoneName)
        SeenZones[zoneName] = true
    end
end

-- Urutkan zona memancing secara alfabetis
table.sort(FishingSpots, function(a, b)
    return a:lower() < b:lower()
end)

-- Inisialisasi dropdown
local FishingTPDropdownUI = Tabs.Teleports:AddDropdown("FishingTPDropdownUI", {
    Title = "Fishing Zones",
    Values = FishingSpots,
    Multi = false,
    Default = nil,
})

-- Fungsi teleport ke zona terpilih
local function teleportToSelection(zoneName)
    if zoneName then
        local targetZone = FishingZonesFolder:FindFirstChild(zoneName)
        if targetZone and targetZone:IsA("BasePart") then
            local player = game:GetService("Players").LocalPlayer
            local character = player.Character
            if character and character.PrimaryPart then
                character:SetPrimaryPartCFrame(targetZone.CFrame)
            end
        end
    end
end

-- Menambahkan event ketika dropdown berubah
FishingTPDropdownUI:OnChanged(teleportToSelection)

-- Tombol teleport jika touchscreen diaktifkan
if game:GetService("UserInputService").TouchEnabled then
    Tabs.Teleports:AddButton({
        Title = "Teleport To Selection",
        Callback = function()
            teleportToSelection(FishingTPDropdownUI.Value)
        end
    })
end

-- Input untuk mencari lokasi teleportasi
Tabs.Teleports:AddInput("SearchBox", {
    Title = "Search Fishing Zone",
    Default = "",
    Placeholder = "Type to search...",
    Numeric = false,
    Callback = function(value)
        local filteredSpots = {}
        for _, spot in ipairs(FishingSpots) do
            if spot:lower():find(value:lower()) then
                table.insert(filteredSpots, spot)
            end
        end
        FishingTPDropdownUI:SetValues(filteredSpots)
    end
})
