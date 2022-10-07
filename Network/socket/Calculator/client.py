from socket import *

host=gethostname()
ip=gethostbyname(host)

port=9842

s=socket()
s.connect((ip,port))

while True:
	msg=input("Enter Expression to Evaluate")
	s.send(msg.encode())
	rec_msg=s.recv(1024).decode()
	print(f"Result is {rec_msg}")
