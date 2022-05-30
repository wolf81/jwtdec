local PATH = (...):gsub('%.jwtdec$', '')

local sha256 = require(PATH .. ".sha256.sha256")
local base64 = require(PATH .. ".base64.base64")
local json = require(PATH .. ".json.json")

--[[
{   
    "token":
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoiYW5vbnltb3VzIiwiaWQiOiJkZG4wNW0wcGt2dCIsIm5hbWUiOiJyZXNwZWN0aXZlLWFtYmVyLW1hcmxpbiIsImlhdCI6MTY1MzgwOTYyMH0.Pysr_pwPCZyUTvJk-B4xAcu8JOsXItGqOyDGxHXMTrc"
}%

eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9
eyJ0eXBlIjoiYW5vbnltb3VzIiwiaWQiOiI0cDNub2FuZ2I3MiIsIm5hbWUiOiJsaXRlcmFyeS1wZWFjaC1lY2hpZG5hIiwiaWF0IjoxNjUzODgyNDcwfQ
CvXrlmsa0MkKyaOjhbIQRDOK4wIFAUchHxjJjqYiQXo

TODO: implement signature check:
https://dev.to/kimmaida/signing-and-validating-json-web-tokens-jwt-for-everyone-25fb
]]

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
    print(header, payload, signature)

    header = base64.decode(header)
    payload = base64.decode(payload)
    signature = base64.decode(signature)
print(header, payload)
    return json.decode(header), payload, signature
end

return jwtdec