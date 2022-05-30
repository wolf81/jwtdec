local PATH = (...):gsub('%.jwtdec$', '')

local sha256 = require(PATH .. ".sha256.sha256")
local base64 = require(PATH .. ".base64.base64")
local json = require(PATH .. ".json.json")

local function split(str, sep)
    local parts = {}
    local regex = ("([^%s]+)"):format(sep)
    for each in str:gmatch(regex) do
        table.insert(parts, each)
    end
    return parts
end

local function jwtdec(token)
    local parts = split(token, ".")
    local header, payload, signature = unpack(parts)

    header = base64.decode(header)
    payload = base64.decode(payload)
    signature = base64.decode(signature)

    return json.decode(header), json.decode(payload), signature
end

return jwtdec