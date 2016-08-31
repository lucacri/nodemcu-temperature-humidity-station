# NodeMCU Weather station

Expose your temperature and humidity levels on a web endpoint!

The NodeMCU needs a DH11/DH22 sensor in order to work. Once configured, browse to `http://ip-of-node-mcu/weather` to receive a json file like this:

```json
{
    "temperature": 27.3,
    "humidity": 74.6
}
```

Using this with my other project (http://github.com/lucacri/homebridge-http-temperature-humidity)[homebridge-http-temperature-humidity] to use it with HomeBridge
