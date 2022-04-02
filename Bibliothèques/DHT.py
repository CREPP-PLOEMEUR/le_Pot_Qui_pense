import dht
import machine

class DHT():
	"""
  	import DHT
  	dht = DHT.DHT(SMALL)
  	dht.write("HELLO")

	Documentation du module DHT Python pour ESP8266
	Ce module permet de récuperer la temperature et l'humidité
	Version 1.0
	Nicolas LE GUERROUE
	"""
	def __init__(self, num=12):

		self.PIN = num
		self.BUILT_IN = 12 #D06
		print("DHT par defaut : D6 [GPIO-12]"+ str(self.BUILT_IN))
		print("DHT selection : "+str(self.PIN))
		self.d = dht.DHT22(machine.Pin(num))    
		
	def getTemperature(self):
		self.d.measure()
		return self.d.temperature()

	def getHumidity(self):
		self.d.measure()
		return self.d.humidity()
		
	
	
