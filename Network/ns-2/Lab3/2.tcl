set ns [new Simulator]

set nf [open 2.nam w]
$ns namtrace-all $nf

set nt [open 2.tr w]
$ns trace-all $nt

proc finish {} {
        global ns nf nt
        $ns flush-trace
        close $nf
        close $nt
        exec nam 2.nam &
        exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$n0 color blue
$n1 color red
$n2 color green
$n3 color orange

$ns color 0 Blue
$ns color 1 Red
$ns color 2 Green
$ns color 3 Orange

$ns duplex-link $n0 $n1 1Mb 10ms DropTail
$ns duplex-link $n1 $n2 1Mb 10ms DropTail
$ns duplex-link $n2 $n3 1Mb 10ms DropTail
$ns duplex-link $n3 $n0 1Mb 10ms DropTail

$ns duplex-link-op $n0 $n1 orient right
$ns duplex-link-op $n1 $n2 orient down
$ns duplex-link-op $n2 $n3 orient left

$ns at 0.0 "$n0 label node0"
$ns at 0.0 "$n1 label node1"
$ns at 0.0 "$n2 label node2"
$ns at 0.0 "$n3 label node3"


set udp0 [new Agent/UDP]
$udp0 set fid_ 0
$ns attach-agent $n0 $udp0

set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 500
$cbr0 set interval_ 0.005
$cbr0 attach-agent $udp0

set tcp0 [new Agent/TCP]
$tcp0 set fid_ 0
$ns attach-agent $n0 $tcp0

set ftp0 [new Application/FTP]
$ftp0 set packetSize_ 500
$ftp0 set interval_ 0.005
$ftp0 attach-agent $tcp0

set udp_sink0 [new Agent/Null]
$ns attach-agent $n0 $udp_sink0

set tcp_sink0 [new Agent/TCPSink]
$ns attach-agent $n0 $tcp_sink0


set udp1 [new Agent/UDP]
$udp1 set fid_ 1
$ns attach-agent $n1 $udp1

set cbr1 [new Application/Traffic/CBR]
$cbr1 set packetSize_ 500
$cbr1 set interval_ 0.005
$cbr1 attach-agent $udp1

set tcp1 [new Agent/TCP]
$tcp1 set fid_ 1
$ns attach-agent $n1 $tcp1

set ftp1 [new Application/FTP]
$ftp1 set packetSize_ 500
$ftp1 set interval_ 0.005
$ftp1 attach-agent $tcp1

set udp_sink1 [new Agent/Null]
$ns attach-agent $n1 $udp_sink1

set tcp_sink1 [new Agent/TCPSink]
$ns attach-agent $n1 $tcp_sink1


set udp2 [new Agent/UDP]
$udp2 set fid_ 2
$ns attach-agent $n2 $udp2

set cbr2 [new Application/Traffic/CBR]
$cbr2 set packetSize_ 500
$cbr2 set interval_ 0.005
$cbr2 attach-agent $udp2

set tcp2 [new Agent/TCP]
$tcp2 set fid_ 2
$ns attach-agent $n2 $tcp2

set ftp2 [new Application/FTP]
$ftp2 set packetSize_ 500
$ftp2 set interval_ 0.005
$ftp2 attach-agent $tcp2

set udp_sink2 [new Agent/Null]
$ns attach-agent $n2 $udp_sink2

set tcp_sink2 [new Agent/TCPSink]
$ns attach-agent $n2 $tcp_sink2

set udp3 [new Agent/UDP]
$udp3 set fid_ 3
$ns attach-agent $n3 $udp3

set cbr3 [new Application/Traffic/CBR]
$cbr3 set packetSize_ 500
$cbr3 set interval_ 0.005
$cbr3 attach-agent $udp3

set tcp3 [new Agent/TCP]
$tcp3 set fid_ 3
$ns attach-agent $n3 $tcp3

set ftp3 [new Application/FTP]
$ftp3 set packetSize_ 500
$ftp3 set interval_ 0.005
$ftp3 attach-agent $tcp3

set udp_sink3 [new Agent/Null]
$ns attach-agent $n3 $udp_sink3
set tcp_sink3 [new Agent/TCPSink]
$ns attach-agent $n3 $tcp_sink3


$ns connect $tcp0 $tcp_sink1
$ns connect $udp0 $udp_sink2

$ns connect $tcp1 $tcp_sink2
$ns connect $udp1 $udp_sink3

$ns connect $tcp2 $tcp_sink3
$ns connect $udp2 $udp_sink0

$ns connect $tcp3 $tcp_sink0
$ns connect $udp3 $udp_sink1

$ns at 0.5 "$ftp0 start"
$ns at 0.5 "$cbr0 start"
$ns at 0.5 "$ftp1 start"
$ns at 0.5 "$cbr1 start"
$ns at 0.5 "$ftp2 start"
$ns at 0.5 "$cbr2 start"
$ns at 0.5 "$ftp3 start"
$ns at 0.5 "$cbr3 start"

$ns at 4.5 "$ftp0 stop"
$ns at 4.5 "$cbr0 stop"
$ns at 4.5 "$ftp1 stop"
$ns at 4.5 "$cbr1 stop"
$ns at 4.5 "$ftp2 stop"
$ns at 4.5 "$cbr2 stop"
$ns at 4.5 "$ftp3 stop"
$ns at 4.5 "$cbr3 stop"

$ns at 5.0 "finish"

$ns run