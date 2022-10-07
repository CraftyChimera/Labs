set ns [new Simulator]

$ns color 1 Green
$ns color 2 Pink
$ns color 3 Red

set nf [open 1.nam w]
$ns namtrace-all $nf

set tracefile [open 1.tr w]
$ns trace-all $tracefile

proc finish {} {
    global ns nf tracefile
    $ns flush-trace
    close $nf
    close $tracefile
    exec nam 1.nam &
    exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$ns duplex-link $n0 $n3 2Mb 10ms DropTail
$ns duplex-link $n1 $n3 2Mb 10ms DropTail
$ns duplex-link $n2 $n3 1.7Mb 20ms DropTail

$ns duplex-link-op $n3 $n0 orient left
$ns duplex-link-op $n3 $n1 orient left-up
$ns duplex-link-op $n3 $n2 orient left-down

set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0

set tcp1 [new Agent/TCP]
$ns attach-agent $n1 $tcp1

set tcp2 [new Agent/TCP]
$ns attach-agent $n2 $tcp2

set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ftp0 set type_ FTP

set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
$ftp1 set type_ FTP

set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2
$ftp2 set type_ FTP

set sink0 [new Agent/TCPSink]
$ns attach-agent $n3 $sink0

set sink1 [new Agent/TCPSink]
$ns attach-agent $n3 $sink1

set sink2 [new Agent/TCPSink]
$ns attach-agent $n3 $sink2

$ns connect $tcp0 $sink0
$ns connect $tcp1 $sink1
$ns connect $tcp2 $sink2

$tcp0 set fid_ 1
$tcp1 set fid_ 2
$tcp2 set fid_ 3

$ns at 0.1 "$ftp0 start"
$ns at 0.3 "$ftp1 start"
$ns at 0.5 "$ftp2 start"
$ns at 2.0 "finish"

$ns run
