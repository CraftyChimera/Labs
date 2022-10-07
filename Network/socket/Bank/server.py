from socket import *

host=gethostname()
ip=gethostbyname(host)

port=9841

s=socket()
s.bind((ip,port))
s.listen()

conn,port=s.accept()

while True:
    rec_msg=conn.recv(1024).decode()
    print(f"received:{rec_msg}")
    data=rec_msg.split()
    int_data=[]
    for x in data:
    	int_data.append(int(x))
    int_data.sort()
    msg_to_send = ""
    for x in int_data:
    	msg_to_send += f"{str(x)} "
    
    print(f"Sorted:{msg_to_send}")  
    conn.send(msg_to_send.encode())
    
