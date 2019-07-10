#A simple script to change usernames in cygwin

#Create a password file
mkpasswd > /etc/passwd
#Where the initial name is $1
cd /home
mv $1 $2
ln -s $2 $1
sed -e 's/^$1/$2/' -e 's/\/home\/$1/\/home\/$2/' -i /etc/passwd
