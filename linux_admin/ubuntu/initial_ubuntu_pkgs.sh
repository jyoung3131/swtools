#!/bin/bash
#Run to install an initial development environment on Ubuntu
#Mainly this is useful to keep track of pacakges you need to
#get started with work.

#Run as sudo or root

#Source some common utility functions. Make sure
#to source them so they don't execute in a sub-shell!
. utility_funcs.shinc

# Make sure only root can run our script
run_as_sudo

PKGS="openssh-server tmux screen vim-gnome"
echo "Installing packages: $PKGS"
apt-get -y install $PKGS

#Packages to install Intel's OpenCL SDK and for Hands On OpenCL repo
OCL_PKGS="dkms lsb-core default-jdk mono-complete mesa-common-dev"
#Also need to do some symbolic linking for the Intel OpenCL SDK on 16.04
#sudo ln -s /usr/lib/x86_64-linux-gnu/libicui18n.so.55 /usr/lib/x86_64-linux-gnu/libicui18n.so.52
