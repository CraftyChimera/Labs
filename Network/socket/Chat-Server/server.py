from socket import *

host=gethostname()
ip=gethostbyname(host)

port=9840

s=socket()

s.bind((ip,port))

print("Welcome to Chat room")
print("Initialising")
print(f"IP:{ip}")
print(f"port:{port}")

s.listen()

s_name=input("Enter server name")

conn,port=s.accept()

conn.send(s_name.encode())

c_name=conn.recv(1024).decode()
print(f"{c_name} has entered the chat")

while True:

    msg=input(f"{s_name}:")
    conn.send(msg.encode())
    rec_msg=conn.recv(1024).decode()
    print(f"{c_name}: {rec_msg}")
    
