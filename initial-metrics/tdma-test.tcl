# Check if the number of command-line arguments is correct
if { $argc != 3 } {
    puts "Usage: tcl_script.tcl nn x y"
    exit 1
}

# Extract command-line arguments
set val(nn) [lindex $argv 0]
set val(x) [lindex $argv 1]
set val(y) [lindex $argv 2]

# Rest of the script remains unchanged

# ======================================================================
# Define options
# ======================================================================
set val(chan)           Channel/WirelessChannel    ;# channel type
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)          Phy/WirelessPhy            ;# network interface type
set val(mac)            Mac/Tdma                 ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)             LL                         ;# link layer type
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         50                         ;# max packet in ifq
#set val(rp)             AODV                       ;# routing protocol
set val(seed)		0.0
set val(cp)		cbr-op           	   ;# Traffic file generated using cbrgen.tcl
set val(sc)		setdest-op		   ;# Scenario file generated using setdest
set val(stop)		100.0			   ;# Simulation Time

# Rest of the script remains unchanged


# ======================================================================
# Main Program
# ======================================================================
#
# Initialize Global Variables
#
set ns_		[new Simulator]
set tracefd     [open wireless.tr w]
$ns_ use-newtrace
$ns_ trace-all $tracefd


# set up topography object
set topo       [new Topography]

$topo load_flatgrid $val(x) $val(y)

#
# Create God
#
set god_ [create-god $val(nn)]


#
#  Create the specified number of mobilenodes [$val(nn)] and "attach" them
#  to the channel. 
#  Here two nodes are created : node(0) and node(1)
# configure node
#
        $ns_ node-config -llType $val(ll) \
			 -macType $val(mac) \
			 -ifqType $val(ifq) \
			 -ifqLen $val(ifqlen) \
			 -antType $val(ant) \
			 -propType $val(prop) \
			 -phyType $val(netif) \
			 -channelType $val(chan) \
			 -topoInstance $topo \
			 -agentTrace ON \
			 -routerTrace OFF \
			 -macTrace OFF
		
			 
	for {set i 0} {$i < $val(nn) } {incr i} {
		set node_($i) [$ns_ node]	
		#$node_($i) random-motion 0		;# disable random motion
	}

puts  "Loading connection pattern"
source $val(cp)
puts "Loading scenario file"
source $val(sc)

#
# Tell nodes when the simulation ends
#
for {set i 0} {$i < $val(nn) } {incr i} {
    $ns_ at $val(stop).0 "$node_($i) reset";
}
$ns_ at $val(stop) "stop"
$ns_ at $val(stop)-1.0 "puts \"NS EXITING...\" ; $ns_ halt"
proc stop {} {
    global ns_ tracefd
    $ns_ flush-trace
    close $tracefd
}

puts "Starting Simulation..."
$ns_ run
