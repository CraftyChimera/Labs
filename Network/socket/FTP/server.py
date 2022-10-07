from socket import *

host=gethostname()
ip=gethostbyname(host)

port=9841

s=socket()
s.bind((ip,port))
s.listen()

conn,port=s.accept()
path=input("Enter Destination")
while True:
	with open(path,"a") as f:
		rec_msg=conn.recv(1024).decode()
		f.write(rec_msg)
	print("done")
