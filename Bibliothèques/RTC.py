#Author : Nicolas LE GUERROUE
import machine
from RTC_LIB import DS3231

class RTC(object):
	"""docstring for RTC"""
	def __init__(self):

		self.i2c = machine.I2C(scl=machine.Pin(5), sda=machine.Pin(4))
		self.ds = DS3231(self.i2c)

	def getTime(self):

		return self.ds.get_time()

	def getYear(self):

		date=self.ds.get_time()
		return date[0]

	def getMonth(self):

		date=self.ds.get_time()
		return date[1]

	def getDay(self):

		date=self.ds.get_time()
		return date[2]

	def getDayStr(self):

		date=self.ds.get_time()
		if date[6]==0:
			return "Lundi"
		elif date[6]==1:
			return "Mardi"
		elif date[6]==2:
			return "Mercredi"
		elif date[6]==3:
			return "Jeudi"
		elif date[6]==4:
			return "vendredi"	
		elif date[6]==5:
			return "Samedi"
		elif date[6]==6:
			return "Dimanche"	
		
		else:
			return 0

	def getHour(self):

		date=self.ds.get_time()
		return date[3]		
	def getMinute(self):

		date=self.ds.get_time()
		return date[4]	

	def getSeconde(self):

		date=self.ds.get_time()
		return date[5]	

	def setTime(self, year, month, day, day_str, hour, minute, seconde):  #day_str est de type int entre 0 et 6 
		
		rtc = machine.RTC()
		rtc.datetime((year, month, day, day_str, hour, minute, seconde, 0)) # 6:dimanche
		self.ds.save_time()	# ecriture et sauvegarde de l'heure

	def debug(self):

		date=self.ds.get_time()
		_date = self.getDayStr()+" "+str(self.getDay())+"/"+str(self.getMonth())+"/"+str(self.getYear())+" "+str(self.getHour())+":"+str(self.getMinute())+":"+str(self.getSeconde())
		return _date	