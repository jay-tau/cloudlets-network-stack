#!/bin/bash

# NODES=20
# XY=250
# MAXCONNS=1000000
NODES=29
XY=100
MAXCONNS=$NODES*2
PKTSIZE=1024

rm setdest-op
# echo "UPDATED"
setdest -v 1 -n $NODES -p 200 -M 10.10 -t 200 -x $XY -y $XY > setdest-op

rm cbr-op
ns cbrgen.tcl $PKTSIZE -type cbr -nn $NODES -seed 1.0 -mc $MAXCONNS -rate 4.0 > cbr-op

rm wireless.tr
ns tdma-test.tcl $NODES $XY $XY

# rm tmp
# perl column.pl 0 18 < wireless.tr > tmp
# perl del_ratio.pl < tmp

# rm cohr_tmp
# perl column.pl 0 34 < wireless.tr > cohr_tmp
# perl cohr.pl < cohr_tmp

# Loops for EPOCHS
# Extract other params
# CSV File for storing logs