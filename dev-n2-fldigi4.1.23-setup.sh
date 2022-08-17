
#!/bin/sh
#install fldigi(4.1.23) w/Hamlib(4.4) flrig(1.4.7) flwkey(1.2.3) 
#N4XWE 8-17-2022
#Compiled on Ubuntu Mate 20.04 64-bit


#Update the apt cache and upgrade the system packages to their latest versions
sudo apt update && sudo apt -y upgrade

#Add all of the dependencies
sudo apt -y install git cmake build-essential libusb-1.0-0-dev libltdl-dev libreadline-dev libsndfile1-dev \
g++ libboost-all-dev libgmp-dev swig python3-numpy python3-mako python3-sphinx python3-lxml doxygen libfftw3-dev \
libusb-1.0-0 libgd-dev libhamlib-utils libsamplerate0 libsamplerate0-dev libsigx-2.0-dev libsigc++-2.0-dev libpopt-dev \
tcl-dev libspeex-dev libasound2-dev libgd-dev alsa-utils libgcrypt20-dev libpopt-dev libfltk1.3-dev libpng++-dev \
libsdl1.2-dev libgsl-dev libqwt-qt5-dev libqt5opengl5-dev python3-pyqt5 liblog4cpp5-dev libzmq3-dev python3-yaml \
python3-click python3-click-plugins libportaudio2 libpulse-dev libportaudiocpp0 libblas-dev liblapack-dev ||
	{ echo 'Dependency installation failed'; exit 1;}
  
#Create a unique directory for the FLDIGI compile and make it the current directory
mkdir -p ~/src/FLDIGI && cd ~/src/FLDIGI

#Download the Hamlib 4.4 source code from Sourceforge
wget -N https://sourceforge.net/projects/hamlib/files/hamlib/4.4/hamlib-4.4.tar.gz ||
  { echo 'Unable to download the HamLib source code file'; exit 1; }
  
#Extract the Hamlib source code files
tar -xvzf hamlib-4.4.tar.gz

#Change the directory containing the uncompressed Hamlib source code to the current directory
cd ~/src/FLDIGI/hamlib-4.4

#Configure the Makefile for the Hamlib compile
./configure --prefix=/usr/local --enable-static

#Compile and install the Hamlib libraries
make -j 5 && sudo make install ||
  { echo 'Unable to install the HamLib Libraries'; exit 1; }

#Link the Hamlib library files
sudo ldconfig

#Install the portaudio19-dev dependency
sudo apt -y install portaudio19-dev ||
	{ echo 'Install portaudio19 failed'; exit 1;}

#Change the unique directory previously created for the compile to the current directory 
cd ~/src/FLDIGI

#Download the fldigi-4.1.23 source code from Sourceforge
wget -N https://sourceforge.net/projects/fldigi/files/fldigi/fldigi-4.1.23.tar.gz ||
  { echo 'Unable to download the fldigi source code file'; exit 1; }

#Extract the fldigi source code 
tar -xvzf fldigi-4.1.23.tar.gz ||
  { echo 'Unable to extract fldigi'; exit 1; }
  
#Change the directory containing the uncompressed fldigi source code to the current directory
cd ~/src/FLDIGI/fldigi-4.1.23

#Configure the Makefile for the fldigi compile
./configure

#Compile and install fldigi
make -j 5 && sudo make install ||
  { echo 'Unable to install fldigi'; exit 1; }

#Change the unique directory previously created for the compile to the current directory 
cd ~/src/FLDIGI

#Download the flrig 1.4.7 source code from Sourceforge
wget -N https://sourceforge.net/projects/fldigi/files/flrig/flrig-1.4.7.tar.gz ||
  { echo 'Unable to download the flrig source code file'; exit 1; }

#Extract the flrig source code files
tar -xvzf flrig-1.4.7.tar.gz ||
  { echo 'Unable to extract flrig'; exit 1; }
  
#Change the directory containing the uncompressed flrig source code to the current directory
cd ~/src/FLDIGI/flrig-1.4.7

#Configure the Makefile for the flrig compile
./configure

#Compile and install flrig
make -j 5 && sudo make install ||
  { echo 'Unable to install flrig'; exit 1; }
  
#Change the unique directory previously created for the compile to the current directory 
cd ~/src/FLDIGI

#Download the flwkey-1.2.3 source code from Sourceforge
wget -N https://sourceforge.net/projects/fldigi/files/flwkey/flwkey-1.2.3.tar.gz ||
  { echo 'Unable to download the flwkey source code file'; exit 1; }

#Extract the flwkey source code files
tar -xvzf flwkey-1.2.3.tar.gz ||
  { echo 'Unable to extract flwkey'; exit 1; }
  
#Change the directory containing the uncompressed flwkey source code to the current directory
cd ~/src/FLDIGI/flwkey-1.2.3

#Configure the Makefile for the flwkey compile
./configure

#Compile and install flwkey
make -j 5 && sudo make install ||
  { echo 'Unable to install flwkey'; exit 1; }

#Install an Fldigi icon on the n2 desktop
echo "[Desktop Entry]
Name=Fldigi
GenericName=Amateur Radio Digital Modem
Comment=Amateur Radio Sound Card Communications
Exec=/usr/local/bin/fldigi
Icon=/usr/local/share/pixmaps/fldigi.xpm
Terminal=false
Type=Application
Categories=Network;HamRadio;" > /home/odroid/Desktop/fldigi.desktop ||
   { echo 'Unable to setup the fldigi desktop icon'; exit 1;}



