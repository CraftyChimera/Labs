from socket import *

host=gethostname()
ip=gethostbyname(host)

port=9840

s=socket()

s.connect((ip,port))

c_name=input("Enter client name")

s_name=s.recv(1024).decode()
print(f'{s_name} has entered the chat')

s.send(c_name.encode())

while True:

    msg=input(f"{c_name}:")
    s.send(msg.encode())
    
    rec_msg=s.recv(1024).decode()
    print(f"{s_name}: {rec_msg}")
