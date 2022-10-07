from socket import *

host=gethostname()
ip=gethostbyname(host)

port=9841

s=socket()
s.connect((ip,port))

while True:
	path = input("Enter")
	print(path)
	with open(path,"r") as f:
		while True:
			data=f.read(1024)
			if data is None:
				f.close()
				break
			s.send(data.encode())
	print("done")
