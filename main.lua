io.stdout:setvbuf('no') -- show debug output live in SublimeText console

local jwtdec = require "jwtdec"

function love.load(args)
    local token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoiYW5vbnltb3VzIiwiaWQiOiI0cDNub2FuZ2I3MiIsIm5hbWUiOiJsaXRlcmFyeS1wZWFjaC1lY2hpZG5hIiwiaWF0IjoxNjUzODgyNDcwfQ.CvXrlmsa0MkKyaOjhbIQRDOK4wIFAUchHxjJjqYiQXo"
    local header, payload, _ = jwtdec(token)
    print(header, payload, _)
end