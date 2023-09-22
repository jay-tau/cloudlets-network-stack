#!/bin/bash

NODES=8
XY=100
MAXCONNS=4
rm setdest-op
setdest -v 1 -n $NODES -p 200 -M 10.0 -t 200 -x $XY -y $XY > setdest-op

rm cbr-op
ns cbrgen.tcl -type cbr -nn $NODES -seed 1.0 -mc $MAXCONNS -rate 4.0 > cbr-op

rm tmp
perl column.pl 0 18 < wireless.tr > tmp
perl del_ratio.pl < tmp
