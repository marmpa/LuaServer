local socket = require "socket.core"

local address,port = "localhost",12345

local updateRate = 0.1
--creating server and setting things
udp = socket.udp()

udp:settimeout(0)

udp:setpeername(address,port)
--...................

math.randomseed(os.time())
--setting entity
entity = tostring(math.random(99999))
--..............

--sending packet


local dg = string.format("%s %s %d %d",entity, "at",320,240)
udp:send(dg)
	
t=0
--..............


function SendMessage()
		while(true) do
			--compiling message
			io.write("What's your number: ")
			local number = io.read()
			if((number)=="show") then
				
					local dg = string.format("%s %s %d %d",entity,"show",0,0)
					udp:send(dg)
			
			elseif(number=="change") then
				io.write("Give entity number: ")
				local ent1 = io.read()

				entity = ent1

			else
				
				local dg = string.format("%s %s %d %d",entity,"move",number,number)
				--.................

				--sending message
				udp:send(dg)
				--...............
			end
			
		end


end

SendMessage()

