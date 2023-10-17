#!/bin/bash

# In case of emergencies: https://www.youtube.com/watch?v=tH0yrJdovWM
# I use arch btw: https://www.youtube.com/watch?v=tH0yrJdovWM
# Download this first: https://drive.google.com/u/0/uc?id=11rYcVLmZw8aF_F0-3uealuScGoO1tWMo&export=download&dl 
# Go to that folder

tar -xf ns-allinone-2.35_gcc5.tar.gz
sudo apt install build-essential autoconf automake libxmu-dev gcc-4.8 g++-4.8
cd ns-allinone-2.35/
export CC=gcc-4.8 CXX=g++-4.8 && ./install 
cd nam-1.15/
make
cd ../ns-2.35/
make