# Simulator Instance Creation
set ns [new Simulator]

#Fixing the co-ordinate of simutaion area
set val(x) 500
set val(y) 500
# Define options
set val(chan) Channel/WirelessChannel ;# channel type
set val(prop) Propagation/TwoRayGround ;# radio-propagation model

set val(netif) Phy/WirelessPhy ;# network interface type
set val(mac) Mac/802_11 ;# MAC type
set val(ifq) Queue/DropTail/PriQueue ;# interface queue type
set val(ll) LL ;# link layer type
set val(ant) Antenna/OmniAntenna ;# antenna model
set val(ifqlen) 200 ;# max packet in ifq
set val(nn) 25 ;# number of mobilenodes
set val(rp) AODV ;# routing protocol
set val(x) 500 ;# X dimension of topography
set val(y) 400 ;# Y dimension of topography
set val(stop) 10.0 ;# time of simulation end

# set up topography object
set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)

#Nam File Creation nam – network animator
set namfile [open sample1.nam w]

#Tracing all the events and cofiguration
$ns namtrace-all-wireless $namfile $val(x) $val(y)

#Trace File creation
set tracefile [open sample1.tr w]

#Tracing all the events and cofiguration
$ns trace-all $tracefile

# general operational descriptor- storing the hop details in the network
create-god $val(nn)

# configure the nodes
$ns node-config -adhocRouting $val(rp) \
-llType $val(ll) \
-macType $val(mac) \
-ifqType $val(ifq) \
-ifqLen $val(ifqlen) \
-antType $val(ant) \
-propType $val(prop) \
-phyType $val(netif) \
-channelType $val(chan) \
-topoInstance $topo \
-agentTrace ON \
-routerTrace ON \
-macTrace OFF \
-movementTrace ON


set PI 3.1415922653
set cx 100
set cy 100
set r 200
set s [ lindex 25 ]
for { set i 0 } { $i < $s } { incr i } {
    set n($i) [$ns node]
    set angle [ expr ((2 * $PI * $i)/$val(nn)) ]
    set x [ expr $cx + ($r*cos($angle))]
    set y [ expr $cy + ($r*sin($angle))]
    $n($i) set X_ $x
    $n($i) set Y_ $y
    $n($i) set Z_ 0 
    $n($i) color black
}

set nf [$ns node]
$nf set X_ $cx
$nf set Y_ $cy
$nf set Z_ 0
$nf color black

for { set i 0 } { $i < $s } { incr i } {
    $ns initial_node_pos $n($i) 30
}

$ns initial_node_pos $nf 30

for { set i 0 } { $i < $s } { incr i } {
    set udp($i) [new Agent/UDP]
    $ns attach-agent $n($i) $udp($i)
    set cbr($i) [new Application/Traffic/CBR]
    $cbr($i) attach-agent $udp($i)
}

set null0 [new Agent/Null]
$ns attach-agent $nf $null0

for { set i 0 } { $i < $s } { incr i } {
    $ns connect $udp($i) $null0
}

for { set i 0 } { $i < $s } { incr i } {
    $ns at [ expr 1+ 2*rand() ] "$cbr($i) start"
    $ns at [ expr 7+ 2*rand() ] "$cbr($i) stop"
}

# ending nam and the simulation
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "stop"

#Stopping the scheduler
$ns at 10.01 "puts \"end simulation\" ; $ns halt"
$ns at 10.01 "$ns halt"

proc stop {} {
global namfile tracefile ns
$ns flush-trace
close $namfile
close $tracefile
#executing nam file
exec nam sample1.nam &
}

#Starting scheduler
$ns run