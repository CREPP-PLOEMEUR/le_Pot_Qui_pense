import dht
import machine

d = dht.DHT22(machine.Pin(12))
d.measure()
d.temperature() 
d.humidity()   


