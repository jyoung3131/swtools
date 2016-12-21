#!/bin/bash
#	Jeff Young	Last updated: 12/21/16
#Run to hold kernel updates in Ubuntu. This is useful especially
#for GPU systems or ones with multiple, custom kernel modules.
#While DKMS is supposed to rebuild kernel modules for newer
#kernels, this seems to not work in practice, especially with
#NVIDIA GPUs.

#Source some common utility functions. Make sure
#to source them so they don't execute in a sub-shell!
. utility_funcs.shinc

# Make sure only root can run our script
run_as_sudo

PKGS="linux-image-generic linux-headers-generic"
echo "Holding packages: $PKGS"
apt-mark hold $PKGS
#To remove the hold, uncomment this line
#apt-mark unhold $PKGS

#Note that -e specifies to parse escape chars
echo -e "\nHeld packages\n======="
apt-mark showhold
