#Author : Nicolas LE GUERROUE
import machine
from ADC_LIB import ADS1115

class ADC(object):

	def __init__(self):

		print("Importation : OK")
		print("Auteur : Nicolas LE GUERROUE")
		self.A0=0
		self.A1=1
		self.A2=2
		self.A3=3
		self.i2c = machine.I2C(scl=machine.Pin(5), sda=machine.Pin(4))
		self.adc = ADS1115(i2c=self.i2c, address=72, gain=0)

	def read(self, channel=0):
		return self.adc.read(rate=0, channel1=channel)

	def getBattery(self, channel):

		pts = self.read(channel)
		if pts > 0:
			vts = round(((pts * 6.144)/32767)*1.93) # en Volt
			return vts
		else:
			return 0