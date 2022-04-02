from machine import Pin, I2C
from ds3231_port import DS3231
import utime
import machine
i2c=machine.I2C(scl=machine.Pin(5), sda=machine.Pin(4)) # Pin5--> d1 Pin4--> 2
i2c.scan() # (87,95,104)
ds3231=DS3231(i2c)
ds3231.get_time() # (1900, 1,6,5, 23,39,54)
utime.localtiem() # (2000, 4,14,10,12,45)
rtc=machine.RTC()
rtc.datetime((2018,11,11,11,00,01,0,0,0))
rtc.datetime() # (2018,11,11,11,00,01,0,0,0)
ds3231.save_time() # <-- (2018,11,11,11,00,01,0,0,0)

