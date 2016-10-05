#!/bin/bash
#Run to install an initial development environment on Ubuntu
#Run as sudo or root

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root (or sudo)" 1>&2
   exit 1
fi

PKGS="openssh-server tmux screen vim-gnome"
echo "Installing packages: $PKGS"
#Add a new user with Linux useradd
#Make sure to create home dir (-m) and set the password
apt-get install $PKGS
