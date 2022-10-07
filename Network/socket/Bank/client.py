from socket import *

host=gethostname()
ip=gethostbyname(host)

port=9841

s=socket()
s.connect((ip,port))

while True:
    msg=input(f"Enter data")
    s.send(msg.encode())
    rec_msg=s.recv(1024).decode()
    print(rec_msg)
