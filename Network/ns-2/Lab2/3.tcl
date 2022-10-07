set ns [new Simulator]

$ns color 1 Blue
$ns color 2 Red
Queue set limit_ 5

set nf [open 3.nam w]
$ns namtrace-all $nf

set tracefile [open 3.tr w]
$ns trace-all $tracefile


proc finish {} {
        global ns nf tracefile
        $ns flush-trace
        close $nf
	close $tracefile
        exec nam 3.nam &
        exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

set s "$n0 $n1 $n2 $n3 $n4 $n5"
set lan [$ns newLan "$s" 10Mb 500ms LL Queue/DropTail MAC/Csma Channel]

set udp [new Agent/UDP]
$ns attach-agent $n2 $udp
set null [new Agent/Null]
$ns attach-agent $n3 $null
$ns connect $udp $null
$udp set fid_ 2

set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$cbr set type_ CBR
$cbr set packetSize_ 1000
$cbr set rate_ 10Mb
$cbr set random_ false

$ns at 0.1 "$cbr start"
$ns at 5.0 "$cbr stop"

$ns at 5.0 "finish"

$ns run
