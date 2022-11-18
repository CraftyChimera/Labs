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
	print time,(sent*packet_size*8)/time;
}

END {
	;
}
