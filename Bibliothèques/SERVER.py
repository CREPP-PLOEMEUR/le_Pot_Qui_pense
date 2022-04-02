#Author : Nicolas LE GUERROUE
import usocket as socket
import RTC
import time

class SERVER(object):

	def __init__(self):

		self.DATE = RTC.RTC()
		self.PORT=80
		self.NB_CLIENTS=5
		self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		self.s.bind(('',self.PORT))
		self.s.listen(self.NB_CLIENTS)
		print("Importation : OK")
		print("Auteur : Nicolas LE GUERROUE")

	def update(self):



		self.TITLE = "PQP - Crepp"
		self.COLOR = "green"
		self.BACKGROUND_COLOR = "black"
		self.HEADER = """
		<html><head><title>"""+str(self.TITLE)+"""</title></head> <body style='color:"""+str(self.COLOR)+""";background-color:"""+str(self.BACKGROUND_COLOR)+""";'> 
		<p>DATE : """+str(self.DATE.debug())+"""</p></body></html>"""
		self.AUTHOR = "Nicolas LE GUERROUE"
		self.DATA = str(self.HEADER)

		conn, addr = self.s.accept()
		print('Connexion depuis %s' % str(addr))
		request = conn.recv(1024)
		request = str(request)
		print('Content = %s' % request)
		reponse = self.DATA
		conn.send(reponse)
		conn.close()


	def run(self):
		
		self.update()
		time.sleep(1)

		