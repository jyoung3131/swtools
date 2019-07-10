#Some useful commands to add to your .bashrc file


######Coloring################

#di = directory
#fi = file
#ln = symbolic link
#pi = fifo file
#so = socket file
#bd = block (buffered) special file
#cd = character (unbuffered) special file
#or = symbolic link pointing to a non-existent file (orphan)
#mi = non-existent file pointed to by a symbolic link (visible when you type ls -l)
#ex = file which is executable (ie. has 'x' set in permissions).
#*.rpm = files with the ending .rpm

LS_COLORS=$LS_COLORS:'di=0;35:ex=4;34' 
export $LS_COLORS
