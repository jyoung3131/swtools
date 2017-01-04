#!/bin/bash
#	Jeff Young	Last updated: 1/04/17
#Run to remove nouveau for good in Ubuntu. This
#script can be useful if you are having trouble
#installing and loading the driver modules for NVIDIA
#GPUs. 

#Source some common utility functions. Make sure
#to source them so they don't execute in a sub-shell!
. utility_funcs.shinc

# Make sure only root can run our script
run_as_sudo

#Stop the lightdm service so the driver can be replaced
service lightdm stop

#Specify the path to your CUDA runfile or driver package
CUDARUNFILE="cuda_8.0.44_linux-run"
echo "Build and install NVIDIA driver"
./$CUDARUNFILE -silent --driver

#Update initramfs to use NVIDIA rather than Nouveau
#Try this first before uninstaling other things! 
update-initramfs -u

PKGS="xserver-xorg-video-nouveau nouveau"
echo "Nuking nouveau packages: $PKGS"
apt-get purge $PKGS

#Reconfigure the xserver settings
nvidia-xconfig

#Restart the window manager
service lightdm restart
