# #CREPP2019 ppr
try:
  import usocket as socket
except:
  import socket

from machine import Pin

led = Pin(2, Pin.OUT)


def web_page():
  if led.value() == 1:
    gpio_state="ON"
  else:
    gpio_state="OFF"
  
  html = """
  <html>
    <head> 
    <title>CREPP PQP</title>
  
    </head>
    <body>
      <h1>CREPP PQP</h1> 
      <p>GPIO state: <strong>""" + gpio_state + """</strong></p>
      <p><a href="/?led=on"><button class="button">led ON - OFF</button></a></p>
   
    </body>
  </html>"""
  return html

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(('', 80))
s.listen(5)

while True:
  conn, addr = s.accept()
  print('donnees emises depuis %s' % str(addr))
  request = conn.recv(1024)
  request = str(request)
  print('Contenu = %s' % request)
  led_on = request.find('/?led=on')
  if led_on == 6:
    print('LED ON  OFF')
    led.value( not led.value())
  response = web_page()
  conn.send(response)
  conn.close()






