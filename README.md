# Odroid-N2-Scripts

BASH Scripts that Install Ham Radio Software on the Odroid N2

These BASH scripts install either LinHPSDR, GNU Radio or WSJT-X on an Odroid N2, running the Ubuntu Mate Operating System. Except for the GNU Radio 3.9 w/gr-grnet w/gr-digital_rf script, all of the scripts have been tested on a 4GB Odroid N2 running the 64-bit version of Ubuntu Mate 18.04. The GNU Radio 3.9 w/gr-grnet w/gr-digital_rf script was written for and was tested on the 64-bit version of Ubuntu Mate 20.04.  They may or may not work successfully on other Operating Systems or other hardware.

In order for an automated script to function correctly you must have a reasonable connection to the Internet. The suggested method of launching the scripts is to create a separate directory named src off of the $HOME directory (/home/odroid/src). Copy the script file to the src directory. Using the Command Line, change the file permissions of the script to allow its execution (chmod +x name-of-the script.sh is one method). From the command line preface the script name with a dot slash (./name-of-the-script.sh) and press the Enter key.

The script will update all of the packages on your Operating System to their latest versions. It will also locate, download and compile all of the requisite source code. In many instances there are statements in the scripts that place icons on the Desktop and provide essential system configuration of the software. In the case of GNU Radio the script installs two Python configuration statements but the OS must be rebooted to enable them.

By default the persistence of the sudo function is generally set to reset after five minutes. Since most scripts run for more than five minutes and may have multiple sudo statements, it may be necessary to manually enter the system password during the running of the script. This is not a desirable "feature" if you are running the script unattended. A work around is to modify the configuration of the Operating System per the instructions in the following link https://www.techrepublic.com/article/how-to-change-the-default-sudo-timeout/  Please keep in mind that the sudo time out is there because it provides enhanced system security. Increasing the sudo time out decreases the security of your system.

All of the scripts have detailed inline comments that explain the function of each line in the script. They are offered under GPL v3.0 and can be easily modified or used as a template for BASH script development. Approximate runtimes for the scripts are included in the script descriptions. The exact runtime depends on a number of factors including the state of the packages on your system and the speed of your Internet connection.

GNU Radio, originally developed by Eric Blossom, K7GNU, and Matt Ettus, N2MJI, is a powerful DSP toolkit. It has a graphical interface that allows allows almost any DSP function to be performed on RF derived signals. This script also installs partial functionality for RTL-SDR USB dongles and full functionality for HPSDR protocol capable radios. The script runtime on an Odroid N2 is approximately 3 hours and 30 minutes.

WSJT-X by Joe Taylor, K1JT, and currently supported by a group of very talented developers is weak signal software that includes, among other programs, FT8, FT4, JT8 and WSPR. The script also compiles the most recent version of the Hamlib library for integrated rig control, The script runtime on an Odroid N2 is approximately 35 minutes.

LinHPSDR, by John Melton, G0ORX, is an excellent standalone SDR Console that works with a variety of radios. It uses the WDSP library for signal processing. Script runtime time on an Odroid N2 is approximately 15 minutes.

FreeDV, by David Witten, KDØEAG, and David Rowe, VK5DGR, is a GUI client for the Digital Voice mode.  This script incorporates Codec2 and the LPCNet, neural network software, which supports the 2020 mode. Script runtime on an Odroid N2 is approximately 10 minutes.
