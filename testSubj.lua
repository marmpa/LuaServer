local socket = require "socket.core"

local address,port = "localhost"

local updateRate = 0.1
--creating server and setting things 
udp = socket.udp()

udp:settimeout(0)

udp:setpeername(address,port)
--...................

math.randomseed(os.time())
--setting entity 
entity = tostring(math.random(99999))

--sending packet


local dg = string.format("%s %s %d %d",entity, "at",320,240)
udp:send(dg)

t=0
--..............


