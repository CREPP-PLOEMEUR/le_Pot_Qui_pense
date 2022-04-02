#Author : Nicolas LE GUERROUE
import machine
import LUX_LIB

class LUX(object):

	def __init__(self):

		self.i2c = machine.I2C(scl=machine.Pin(5), sda=machine.Pin(4))
		self.lum = LUX_LIB.BH1750(self.i2c)

	def read(self):

		return self.lum.lecture_lumiere(bh1750.MODE_CONTINU_HAUTE_RESOLUTION)
