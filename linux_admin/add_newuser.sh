#!/bin/bash
#Create and modify a user
#Run as sudo or root

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root (or sudo)" 1>&2
   exit 1
fi

#Check to make sure a username was passed
if [ -z "$1" ] ; then 
   echo "Please pass a new username as the first argument"
   exit 1
fi

USERNAME=$1
DATE=`date +%m%d%y`
PASSWD="$DATE"
#sudo or admin group, if desired
#Otherwise just add them to the project group
GRPVAL='sudo,hpcusers'
#Add a new user with Linux useradd
#Make sure to create home dir (-m) and set the password
echo "useradd -m -p $PASSWD -G ${GRPVAL} $USERNAME -s /bin/bash"
useradd -m -p $PASSWD -G ${GRPVAL} $USERNAME -s /bin/bash
#Force their password to expire on next login
#passwd -e $USERNAME
