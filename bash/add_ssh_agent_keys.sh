#!/bin/bash
# Source this script to start a new SSH agent and add your key to it

KEYFILE=$1

_script_name="add_ssh_agent_keys.sh"

usage() {
  echo "  "
  echo "usage: source ${_script_name} <keyfilename>" 
  #'[--force] [--config=file] [--help] [...]'
  #echo "  --force        Force ${script_name} to re-run, doing so may overload environment."
  #echo "  --config=file  Customize env vars using a ${script_name} configuration file."
  #echo "  --help         Display this help message and exit."
  echo "  "
}


# Borrowing from Intel's OneAPI setvars script - check to see if this script is being sourced
#-------------------------------
_script_get_proc_name() {
  if [ -n "${ZSH_VERSION:-}" ] ; then
    script="$(ps -p "$$" -o comm=)"
  else
    script="$1"
    while [ -L "$script" ] ; do
      script="$(readlink "$script")"
    done
  fi
  basename -- "$script"
}

if [ "$_script_name" = "$(_script_get_proc_name "$0")" ] ; then
  echo ":: ERROR: Incorrect usage: this script must be sourced."
  usage
  # Restore original $@ array before return.
  eval set -- "$script_args" || true
  exit
fi

#------------------------------


#Borrowing this script from https://www.electricmonk.nl/log/2012/04/24/re-use-existing-ssh-agent-cygwin-et-al/
export SSH_AUTH_SOCK=~/.ssh-socket

# Check to see if ssh-agent is running locally
# If not, then create a new instance
ssh-add -l >/dev/null 2>&1
if [ $? = 2 ]; then
   # No ssh-agent running
   rm -rf $SSH_AUTH_SOCK
   # >| allows output redirection to over-write files if no clobber is set
   ssh-agent -a $SSH_AUTH_SOCK >| /tmp/.ssh-script
   source /tmp/.ssh-script
   echo $SSH_AGENT_PID >| ~/.ssh-agent-pid
   rm /tmp/.ssh-script
fi

eval `ssh-agent -s`

#Add the SSH key (if not added)
if [[ $(ssh-add -l | grep RSA) ]];
then
        echo "Identity already added"
        ssh-add -l
else
        ssh-add ~/.ssh/$KEYFILE
        echo "Identities added:"
        ssh-add -l
fi
