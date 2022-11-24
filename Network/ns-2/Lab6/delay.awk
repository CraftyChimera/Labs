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
	
	if(	(event == "r")	) {
		received++;
	}
	
	if(	(event == "s") ) {
		sent++;
	}
	a = received/(sent-received);
	print time,a,1-a;
}

END {
	;
}
