#!/bin/bash

NODES=$1
XY=250
MAXCONNS=$1*2
PKTSIZE=$2
IFQLENGTH=$3

rm setdest-op
setdest -v 1 -n $NODES -p 1000 -M 10.10 -t 1000 -x $XY -y $XY > setdest-op

rm cbr-op
ns cbrgen.tcl $PKTSIZE -type cbr -nn $NODES -seed 1.0 -mc $MAXCONNS -rate 4.0 > cbr-op

rm wireless.tr
ns simple-wireless.tcl $NODES $XY $XY $IFQLENGTH

rm tmp
perl column.pl 0 18 < wireless.tr > tmp
perl del_ratio.pl < tmps

# rm cohr_tmp
# perl column.pl 0 34 < wireless.tr > cohr_tmp
# perl cohr.pl < cohr_tmp

# Loops for EPOCHS
# Extract other params
# CSV File for storing logs