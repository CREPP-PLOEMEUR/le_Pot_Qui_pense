from machine import I2C, Pin
import ssd1306
import machine, sys


class OLED(object):
  """docstring for OLED
  import OLED
  screen = OLED.OLED(SMALL)
  screen.write("HELLO")
  Documentation du module OLED Python pour OLED
  Ce module permet d'afficher des données
  Version 1.0
  Nicolas LE GUERROUE
  """
  def __init__(self, type=32):

    self.i2c= I2C(scl=Pin(5), sda=Pin(4))
    self.SIZE=type
    self.ADRESS=0x3C

    print("Importation : OK")
    print("Auteur : Nicolas LE GUERROUE")
    print("Scan des peripheriques I2C...")
    print(self.i2c.scan())
    print("Adresse de l'ecran : "+ str(self.ADRESS))
    self.oled=ssd1306.SSD1306_I2C(128,self.SIZE, self.i2c, self.ADRESS)

  def write(self,str):
    self.oled.fill(0)
    self.oled.text(str, 0, 0) #Une ligne fait 10 de hauteur
    self.oled.show()
  
  def writeTo(self, str,x,y):
    self.oled.fill(0)	
    self.oled.text(str, int(x), int(y))
    self.oled.show()
  
  def overWrite(self, str):
    self.oled.text(str,0,0)
    self.oled.show()

  def overWriteTo(self, str,x,y):
    self.oled.text(str, int(x), int(y))
    self.oled.show()
  
  def clear(self):
    self.oled.fill(0)
    self.oled.show()
  
  def reverse(self, p): #blanc=1 / fond noir=0 
    self.oled.invert(p)
  
  def debug(self):
    self.oled.fill(0)
    self.oled.text("Bonjour", 0, 0)
    self.oled.text("il fait beau", 0, 20)
    self.oled.show()
 
  def machine(self):  

    self.clear()
    self.oled.text('version ' + sys.version, 0,10)
    self.oled.text('CPU: ' + str(machine.freq()/1000000) + 'MHz', 0,20)
    self.oled.show() 
    self.oled.invert(1) 
    self.oled.fill(0) 
    self.oled.show() 



 





