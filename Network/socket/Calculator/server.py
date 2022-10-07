from socket import *
host=gethostname()
ip=gethostbyname(host)

port=9842

s=socket()
s.bind((ip,port))
s.listen()

conn,port=s.accept()

op=['+','-','*','/']

while True:
	data=[]
	rec_msg=conn.recv(1024).decode()
	print("received expression")
	data=rec_msg.split()
	
	for x in data:
		if x in op:
			a=data.pop()
			b=data.pop()
			if x=='+':
				data_to_push=a+b
			if x=='-':
				data_to_push=a-b
			if x=='*':
				data_to_push=a*b
			if x=='/':
				data_to_push=a/b

			data.append(data_to_push)
    	    
	print(f"Result:{data[0]}")  
	msg_to_send=data[0]
	conn.send(msg_to_send.encode())
    
