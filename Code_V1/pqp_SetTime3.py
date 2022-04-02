
import machine
from ds3231_port import DS3231
import utime

i2c=machine.I2C(scl=machine.Pin(5), sda=machine.Pin(4)) # Pin5--> d1 Pin4--> 2
ds3231=DS3231(i2c)
rtc=machine.RTC()

def hr():
	
	choix = input('voulez vous (c)onsulter,(m)odifier les reglages ou (s)ortir ?')
	
	if (choix=='c') :
		consulter()
		return
		
	if (choix=='m') :
		modifier()
		return
		
	if (choix=='s'):
		print('fin de procedure')

	else :
		print('fin de procedure')
		
	
def consulter():
	global i2c
	i2c.scan()		# (87,95,104)
	global ds3231
	print (ds3231.get_time())
	hr()	
	
	
def modifier ():
	
	global i2c
	global ds3231
	global rtc	
	i2c.scan()		# (87,95,104)

	YY = int(input ('entrer l annee : '))
	MM = int(input('entrer le mois : '))
	JJ = int(input('entrer le jour :'))
	NN = int(input('entrer le N° de jour dans la semaine :' ))
	HH = int(input('entrer l heure :'))
	MN = int(input('entrer les minutes :'))
	SS =10
	X = 0
	rtc.datetime((YY,MM,JJ,NN,HH,MN,SS,X))
	ds3231.save_time()
	print (ds3231.get_time())
	print ('vous avez enregistré : ',JJ,'/',MM,'/',YY,'   ',HH,'heures',MN,'minutes')  
	hr()	 
	
	
	#Commandes a utiliser:
	
	#ds3231.get_time()	# (1900, 1,6,5, 23,39,54) :date/heure actuelle dans le rtc
	#utime.localtime()	# (2000, 4,14,10,12,45)
	#rtc.datetime((2018,11,11,00,01,0,0,0)) :entre une nouvelle date/heure
											# au format (Y,M,D,N°jour semaine,H,mn,s,0)
	#rtc.datetime() 		# (2018,11,11,11,00,01,0,0,0) renvoie la date/heure rentree
	#ds3231.save_time()	# <-- (2018,11,11,11,00,01,0,0,0) ssauvegarde date/heure
