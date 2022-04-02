import RTC
import OLED
import LED
import ADC
import DHT 
import machine
import time

rtc = RTC.RTC()
oled = OLED.OLED()
led = LED.LED()
adc = ADC.ADC()
dht = DHT.DHT()

wifitime_begin = 2*60*1000		#temps d'activité au démarrage de l'ESP
wifitime_deepsleep = 20*1000		#temps d'activité après le deepsleep reset
sleeptime = 30*1000				#temps de mise en veille


print("PQP - Nicolas Le Guerroue, CREPP")
print("Lancement du programme : main.py")
print("Lecture de la temperature et de la tension de la batterie")

led.blink(50,0,1)
oled.write(str(dht.getTemperature())+" C")

led.blink(50,0,1)
oled.overWriteTo(str(dht.getHumidity())+" %",0,8)

led.blink(50,0,1)
oled.overWriteTo(str(adc.getBattery(0))+" V", 0,16)

if machine.reset_cause() == machine.HARD_RESET:   #Bouton reset
	led.blink(50,950,5)
	wifitime = wifitime_begin 

elif machine.reset_cause() == machine.PWRON_RESET:  #extinction de l'alimentation : wifitime > 3 minutes
	led.blink(50,950,3)
	wifitime=wifitime_begin

elif machine.reset_cause() == machine.DEEPSLEEP_RESET:	#reset profond : wifitime > 30s
	led.on()
	wifitime = wifitime_deepsleep

else:
	led.blink(100,100,20)							#erreur
	wifitime = 180000

time.sleep(1)

timer = machine.Timer(-1) #création d'un timer virtuel
timer.init(period=wifitime, mode=machine.Timer.ONE_SHOT, callback=lambda t:shutdown())


#tache courante

# Relier le GPIO16 (l'alarme RTC) avec la broche Reset (RST) de l'ESP8266
def shutdown():
	led.off()
	print("Mise en veille de l'ESP8266...")
	led.blink(200,200,10)
	rtc = machine.RTC() 
	rtc.irq(trigger=rtc.ALARM0, wake=machine.DEEPSLEEP) # On configure RTC.ALARM0 pour re-démarrer
	rtc.alarm(rtc.ALARM0, sleeptime) #  Après sleeptime RTC.ALARM0 redémarrera la machine !
	machine.deepsleep() # Mise en sommeil profond

