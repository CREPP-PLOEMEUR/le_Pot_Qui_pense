
import usocket as socket


def web_page():
	html = """
	<html>
	  <head> 
		<title>CREPP PQP</title>
	  </head>
	  <body>
	    HAHAHA
	  </body>
	</html>"""
	return html


s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(('', 80))
s.listen(5)

while True:
	conn, addr = s.accept()
	print('Got a connection from %s' % str(addr))
	request = conn.recv(1024)
	request = str(request)
	print('Content = %s' % request)
	response = web_page()
	conn.send(response)
	conn.close()
	
