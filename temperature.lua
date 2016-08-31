local module = {}

function module.getTempHum()  
  status,temp,humi,temp_decimial,humi_decimial = dht.readxx(config.DHCPIN)
  print("DHC Pin: " .. config.DHCPIN)

  print("DHT Temperature:"..temp..";".."Humidity:"..humi)

  return temp, humi
end

return module
