#Author : Nicolas LE GUERROUE
import time
import machine

class LED():
	"""
	Documentation du module Led Python pour ESP8266
	Ce module permet d'allumer une led sur l'ESP8266, de l'éteindre et de la faire clignoter
	Version 1.0
	Nicolas LE GUERROUE
	"""

	def __init__(self, num=2):

		self.BUILT_IN=2
		print("importation : OK")
		print("Led buit-in : "+str(self.BUILT_IN))
		print("Led selection : "+str(num))
		print("Auteur : Nicolas LE GUERROUE")
		self.led = machine.Pin(num, machine.Pin.OUT)
		self.led.on()
		
	def on(self):
		self.led.off()
		
	def off(self):
		self.led.on()
	
	def toggle(self):
		self.led.value(not led.value())
		
	def blink(self,high, low, number):
		for a in range(number):
			self.led.off()
			time.sleep_ms(int(high))
			self.led.on()
			time.sleep_ms(int(low))


	
