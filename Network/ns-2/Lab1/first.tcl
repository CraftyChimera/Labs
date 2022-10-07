set ns [new Simulator]

set nf [open first.nam w]
$ns namtrace-all $nf

set ng [open first.tr w]
$ns trace-all $ng

proc finish {} {
	global ns
	$ns flush-trace
	exec nam first.nam &
	exit 0
}

set n0 [$ns node]
set n1 [$ns node]

$ns duplex-link $n0 $n1 1Mb 10ms DropTail

set udp [new Agent/UDP]
$ns attach-agent $n0 $udp

set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$cbr set packet_size_ 500
$cbr set interval_ 0.005


set null [new Agent/Null]
$ns attach-agent $n1 $null
$ns connect $udp $null

$ns at 0.1 "$cbr start"
$ns at 4.5 "$cbr stop"
$ns at 5.0 "finish"
 
 $ns run
