#!/bin/bash

# NODES=20
# XY=250
# MAXCONNS=1000000
NODES=$1
XY=250
MAXCONNS=$1
# PKTSIZE=$2

rm setdest-op
# echo "UPDATED"
setdest -v 1 -n $NODES -p 200 -M 10.0 -t 200 -x $XY -y $XY > setdest-op

rm cbr-op
ns cbrgen.tcl -type cbr -nn $NODES -seed 1.0 -mc $MAXCONNS -rate 4.0 > cbr-op

rm wireless.tr
ns simple-wireless.tcl $NODES $XY $XY

rm tmp
perl column.pl 0 18 < wireless.tr > tmp
perl del_ratio.pl < tmp

# Loops for EPOCHS
# Extract other params
# CSV File for storing logs