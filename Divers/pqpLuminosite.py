import machine, time
import bh1750  
i2c = machine.I2C(scl = machine.Pin(5), sda = machine.Pin(4), freq=400000)
capteur_lumiere = bh1750.BH1750(i2c) 
mesure_lux = capteur_lumiere.lecture_lumiere(bh1750.MODE_CONTINU_HAUTE_RESOLUTION)
print(mesure_lux)



