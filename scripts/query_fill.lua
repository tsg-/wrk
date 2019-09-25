-- example script that adds a query string

local A1, A2 = 727595, 798405  -- 5^17=D20*A1+A2
local D20, D40 = 1048576, 1099511627776  -- 2^20, 2^40
local X1, X2 = 0, 1
function rand()
    local U = X2*A2
    local V = (X1*A2 + X2*A1) % D20
    V = (V*D20 + U) % D40
    X1 = math.floor(V/D20)
    X2 = V - X1*D20
    return V/D40
end

local threadcounter = 1
local threads = {}
local version = 0

function setup(thread)
 thread:set("id", threadcounter)
 table.insert(threads, thread)
 version = threadcounter
 threadcounter = threadcounter + 1
end

function init(args)
 -- math.randomseed(os.time()*id)
 -- math.randomseed(0xfeeddeaf * id)
 version = id - 1
end

function delay()
  return 2000
end

function fdelay()
 local r = math.random(0, 50)
 -- print ("fdelay = " .. r)
 return r
end

request = function()
 if version > 1398000 then
   version = id - 1
 end
 path = "/1MB.file?version=" .. version
 -- print (" time: " .. os.time() .. " -- thread" .. id .. ":" .. path)
 version = version + 56
 return wrk.format("GET", path)
end
