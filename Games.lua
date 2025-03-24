if not game:IsLoaded() then
    game.Loaded:Wait()
end

local creator = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Creator.CreatorTargetId

local games = {
    [16732694052] = 'https://raw.githubusercontent.com/isMoons/loader/refs/heads/main/ancestral.lua', -- Fisch
    [87039211657390] = 'https://raw.githubusercontent.com/isMoons/loader/main/Arise.lua', -- Arise-Crossover
}

if games[creator] then
    loadstring(game:HttpGet(games[creator]))()
else
    warn("Unsupported game")
end