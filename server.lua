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

    data,msg_or_ip,port_or_nil = udp:receivefrom()

    if data then
        entity,cmd,parms = data:match("^(%S*) (%S*) (.*)$")

		if cmd == "move" or cmd == "moveC" then
			--trying extract numbers from string and convert them to number
			local x,y = parms:match("^(%-?[%d.e]*) (%-?[%d.e]*)$")
			assert(x and y,"Number in move are wrong for some reason")

			x, y = tonumber(x),tonumber(y)
			--.............................................................

			--basically making a table with the values we need
			local ent = world[entity] or {x=0,y=0}
			--................................................

			--inserting value into the table
			world[entity] = {x=x, y=y}
			--..............................
			if(cmd=="move")then
				print("Entity: "..entity.." was moved ".." in position: "..x..","..y)
			end

		elseif cmd == "at" then
			--tryingpackage.searcherspackage.searchers to extract numbers from string and convert them to numbers
			local x, y = parms:match("^(%-?[%d.e]*) (%-?[%d.e]*)$")
			assert(x and y,"Numbers in at are wrong for some reason")

			x, y = tonumber(x), tonumber(y)
			--.................................................................

			--creating the values we need to insert into the table and inserting them
			world[entity] = {x=x, y=y}
			--....................................................

			print("New entity inserted: "..entity.." in position: "..x..","..y)
		elseif cmd == "show" then
			for key,value in pairs(world) do
					print("Entity "..key.." with x: "..value.x.." and y: "..value.y)
			end
		elseif cmd == "update" then
			for k, v in pairs(world) do
				udp:sendto(string.format("%s %s %d %d", k, 'at', v.x, v.y), msg_or_ip,  port_or_nil)
			end
		else
			print("Unrecognised command:",cmd)
		end
	elseif msg_or_ip ~= 'timeout' then
		error("Uknown network error: "..tostring(msg))
	end

	socket.sleep(0.01)

end






