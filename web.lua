local module = {}

function module.start()
    wifi.setmode(wifi.STATION)
    wifi.sta.config(config.SSID,config.WIFIPASS)
--    wifi.sta.connect()
    tmr.delay(2000000)   -- wait 1,000,000 us = 1 second

    print(wifi.sta.status())
    print(wifi.sta.getip())

    srv=net.createServer(net.TCP) 
    srv:listen(80,function(conn) 
        conn:on("receive",function(conn,payload) 
            tgtfile = string.sub(payload,string.find(payload,"GET /")
               +5,string.find(payload,"HTTP/")-2)

            responseText = ""
            

            if(tgtfile == config.WEATHER_ENDPOINT) then
                temp, hum = DHT.getTempHum()
                
                responseText = "HTTP/1.0 200 OK\r\nContent-Type: application/json\r\nCache-Control: private, no-store\r\n\r\n{\"temperature\": " .. temp .. ", \"humidity\":" .. hum .. "}"
            end


            if(responseText == "") then
                responseText = "Not found 404"
            end
            
            conn:send(responseText)
            conn:close()

            collectgarbage();
            responseText = nil
            tgtfile = nil
        end) 
    end)
end

return module
