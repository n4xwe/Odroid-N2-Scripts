#!/bin/sh
#install LinHPSDR
#N4XWE 2-1-2021
#Compiled on Ubuntu Mate 18.04 64-bit
#Compiled on Ubuntu Mate 20.04 64-bit

#Update the apt cache and upgrade the system packages to their latest versions
sudo apt -y update && sudo apt -y upgrade

#Add all of the dependencies
sudo apt -y install git cmake build-essential libusb-1.0-0-dev libfftw3-dev \
libpulse-dev libasound2-dev libsoundio-dev libgtk-3-dev libsoapysdr-dev checkinstall \
libtool ||
  { echo 'Dependency installation failed'; exit 1; }

#Create a unique directory for the LinHPSDR compile and make it the current directory
mkdir -p ~/src/LINHPSDR && cd ~/src/LINHPSDR

#Download the wdsp source code from Github
git clone https://github.com/g0orx/wdsp.git  ||
  { echo 'Unable to download wdsp'; exit 1; }

#Change the directory containing the uncompressed wdsp source code to the current directory
cd ~/src/LINHPSDR/wdsp

#Compile and install the wdsp libraries
make -j 5 && sudo make install ||
   { echo 'Unable to install wdsp'; exit 1; }

#Link the wdsp library files
sudo ldconfig

#Change the unique directory previously created for the compile to the current directory
cd ~/src/LINHPSDR

#Download the unixcw source code from Github
git clone https://github.com/m5evt/unixcw-3.5.1.git

#Change the directory containing the unix source code to the current directory
cd ~/src/LINHPSDR/unixcw-3.5.1

#Update the Github souce code files
autoreconf -i

#Configure the Makefile for the unixcw compile
./configure

#Compile the unixcw libraries
make

#Install the unixcw libraries
sudo make install

#Link the unixcw library files
sudo ldconfig

#Change the unique directory previously created for the compile to the current directory
cd ~/src/LINHPSDR

#Download the LinHPSDR source code from Github
git clone https://github.com/g0orx/linhpsdr.git ||
  { echo 'Unable to download LinHPSDR'; exit 1; }

#Change the directory containing the uncompressed LinHPSDR source code to the current directory
cd ~/src/LINHPSDR/linhpsdr

#Compile and install LinHPSDR
make -j 5 && sudo make install ||
  { echo 'Unable to install LinHPSDR'; exit 1; }
  

