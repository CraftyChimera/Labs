BEGIN{
	received = 0;
	sent = 0;
}

{
	event = $1
	time = $2
	source = $3
	destination = $4
	protocol = $5
	packet_size = $6
	
	if(	(event == "r")	&& (protocol != "ack") ) {
		received++;
	}
	
	if(	(event == "+")	&& (protocol != "ack") ) {
		sent++;
	}
	print time,received/sent,(sent-received)/sent;
}

END {
	;
}
