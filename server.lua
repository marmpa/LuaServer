local socket = require "socket"

local udp = socket.udp()

udp:settimeout(0)

udp:setsockname("*",12345)

local world = {}

local data,msg_or_ip,port_or_nil

local entity,cmd,parms

local running = true

print "Beginning server"


while running do

    data,msg_or_ip,port_or_nil = udp:recievefrom()

    if data then
        entity,cmd,parms = data:match("^(%S*) (%S*) (.*)$")
        
    end
end        
