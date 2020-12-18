#!/bin/sh
#install ionosonde
#N4XWE 12-18-2020
#Visit http://www.tangerinesdr.com


#Update the apt cache and upgrade the system packages to their latest versions
sudo apt update && sudo apt upgrade -y

#Add all of the dependencies
sudo apt install -y git libopenblas-dev python3-matplotlib python3-psutil python3-h5py \
swig cmake doxygen build-essential python3-setuptools \
libboost-all-dev libtool libusb-1.0-0 libusb-1.0-0-dev libudev-dev libncurses5-dev \
libfftw3-bin libfftw3-dev libfftw3-doc libcppunit-1.14-0 libcppunit-dev libcppunit-doc \
ncurses-bin cpufrequtils python-numpy python-numpy-doc python-numpy-dbg python-scipy \
python-docutils qt4-bin-dbg qt4-default qt4-doc libqt4-dev libqt4-dev-bin python-qt4 \
python-qt4-dbg python-qt4-dev python-qt4-doc python-qt4-doc libqwt6abi1 libfftw3-bin \
libfftw3-dev libfftw3-doc ncurses-bin libncurses5 libncurses5-dev libncurses5-dbg \
libfontconfig1-dev libxrender-dev libpulse-dev swig g++ automake autoconf libtool \
python-dev libfftw3-dev libcppunit-dev libboost-all-dev libusb-dev libusb-1.0-0-dev \
fort77 libsdl1.2-dev python-wxgtk3.0 git libqt4-dev python-numpy ccache python-opengl \
libgsl-dev python-cheetah python-mako python-lxml doxygen qt4-default qt4-dev-tools \
libusb-1.0-0-dev libqwtplot3d-qt5-dev pyqt4-dev-tools python-qwt5-qt4 cmake git wget \
libxi-dev gtk2-engines-pixbuf r-base-dev python-tk liborc-0.4-0 liborc-0.4-dev \
libasound2-dev python-gtk2 libzmq3-dev libzmq5 python-requests python-sphinx libcomedi-dev \
python-zmq libqwt-dev libqwt6abi1 python-six libgps-dev libgps23 gpsd gpsd-clients \
python-gps python-setuptools ||
	{ echo 'Dependency installation failed'; exit 1; }

#Create a unique directory for the IONOSONDE compile and make it the current directory
mkdir -p ~/src/IONOSONDE && cd ~/src/IONOSONDE

#Clone the most recent version of the UHD source code from github
wget -N https://github.com/EttusResearch/uhd/archive/v3.15.0.0.tar.gz ||
  { echo 'Unable to download the UHD source code file'; exit 1; }
 
#Extract the UHD source code files
tar xvfz v3.15.0.0.tar.gz

#Make the directory containing the host directory of the UHD source code the current directory
 cd ~/src/IONOSONDE/uhd-3.15.0.0/host

#Create a directory for an indirect build of the host UHD source code and make it the current directory
mkdir -p ~/src/IONOSONDE/uhd-3.15.0.0/host/build && cd ~/src/IONOSONDE/uhd-3.15.0.0/host/build
	
#Configure the Makefile for the host UHD source code compile
cmake -DENABLE_PYTHON_API=ON ../

#Compile and install the host UHD source code files
make && sudo make install ||
  { echo 'Unable to install the UHD libraries'; exit 1; }
  
  
  
  



