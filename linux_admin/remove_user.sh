#!/bin/bash
#Remove a user but don't remove their home directory by default
#Run as sudo or root

USERNAME=$1
userdel $USERNAME
