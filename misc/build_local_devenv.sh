#!/bin/bash
 
# Script for installing a minimal, yet up-to-date development environment
# It's assumed that wget and a C/C++ compiler are installed.

# MGL Notes
# tmux:
# need if "/usr/bin/ld: cannot find -lc" -> need to install glibc-static
# git: 
# needs zlib-devel, openssl-devel, libcurl-devel, expat-devel, gettext-devel
# needs asciidoc, makeinfo for documentation
 
#Specify comment macros
[ -z $BASH ] || shopt -s expand_aliases
alias BEGINCOMMENT="if [ ]; then"
alias ENDCOMMENT="fi"
####

# exit on error
set -e
 
# create our directories
mkdir -p $HOME/local/src
cd $HOME/local/src
 
#######################
####### Now tmux ######
#######################

build_tmux() {

#Specify the versions of files so this script can be updated for newer versions
TMUXV=2.7
LIBEVENTV=2.1.8-stable
NCURSESV=6.1

## download source files for tmux, libevent, and ncurses
wget https://github.com/tmux/tmux/releases/download/${TMUXV}/tmux-${TMUXV}.tar.gz --no-check-certificate
wget https://github.com/libevent/libevent/releases/download/release-${LIBEVENTV}/libevent-${LIBEVENTV}.tar.gz --no-check-certificate
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-${NCURSESV}.tar.gz
# 
## extract files, configure, and compile
# 
## libevent #
tar xvzf libevent-${LIBEVENTV}.tar.gz
cd libevent-${LIBEVENTV}
./configure --prefix=$HOME/local --disable-shared
make -j4
make install
cd ..
rm -rf libevent-${LIBEVENTV}
rm libevent-${LIBEVENTV}.tar.gz
# 
## ncurses #
tar xvzf ncurses-${NCURSESV}.tar.gz
cd ncurses-${NCURSESV}
./configure --prefix=$HOME/local
make -j4
make install
cd ..
rm ncurses-${NCURSESV}.tar.gz
rm -rf ncurses-${NCURSESV}

# tmux #
tar xvzf tmux-${TMUXV}.tar.gz
cd tmux-${TMUXV}
./configure --enable-static CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -static-libgcc -L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include -levent"
CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -static-libgcc -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib -levent" make -j4
cp tmux $HOME/local/bin
cd ..
rm tmux-${TMUXV}.tar.gz
rm -rf tmux-${TMUXV}
 
echo "$HOME/local/bin/tmux is now available. You can optionally add $HOME/local/bin to your PATH." 

}

#Select which packages to install
build_tmux

BEGINCOMMENT

#######################
###### Now vim74 ######
#######################

cd $HOME/local/src

wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar xvjf vim-7.4.tar.bz2
cd vim74
LDFLAGS="-L$HOME/local/lib -L$HOME/local/lib64" ./configure --prefix=$HOME/local --enable-cscope --without-x --enable-gui=no --with-tlib=ncurses --enable-pythoninterp --with-python-config-dir=/usr/lib64/python2.6/config --with-features=huge
make 
make install
cd ..
rm vim-7.4.tar.bz2
rm -rf vim74


########################
######## Now zsh #######
########################
cd $HOME/local/src
wget http://downloads.sourceforge.net/project/zsh/zsh/5.1/zsh-5.1.tar.gz
tar xvzf zsh-5.1.tar.gz
cd zsh-5.1
./configure --prefix=$HOME/local
make
make install
cd ..
rm zsh-5.1.tar.gz
rm -rf zsh-5.1

###########################
###### Now autotools ######
###########################
wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
wget http://ftp.gnu.org/gnu/automake/automake-1.15.tar.gz
wget http://ftpmirror.gnu.org/libtool/libtool-2.4.6.tar.gz
wget http://pkgconfig.freedesktop.org/releases/pkg-config-0.28.tar.gz

# autoconf

cd $HOME/local/src
tar xvzf autoconf-2.69.tar.gz
cd autoconf-2.69
./configure --prefix=$HOME/local
make 
make install
cd ..
rm autoconf-2.69.tar.gz
rm -rf autoconf-2.69

# automake

cd $HOME/local/src
tar xvzf automake-1.15.tar.gz
cd automake-1.15
./configure --prefix=$HOME/local
make 
make install
cd ..
rm automake-1.15.tar.gz
rm -rf automake-1.15

# libtool

cd $HOME/local/src
tar xvzf libtool-2.4.6.tar.gz
cd libtool-2.4.6
./configure --prefix=$HOME/local
make 
make install
cd ..
rm libtool-2.4.6.tar.gz
rm -rf libtool-2.4.6


# pkg-config

cd $HOME/local/src
tar xvzf pkg-config-0.28.tar.gz
cd pkg-config-0.28
./configure --prefix=$HOME/local
#./configure --prefix=$HOME/local --with-internal-glib
make 
make install
cd ..
rm pkg-config-0.28.tar.gz
rm -rf pkg-config-0.28

#######################
####### Now git #######
#######################
cd $HOME/local/src
git clone http://github.com/git/git
cd git
make prefix=$HOME/local all 
make prefix=$HOME/local install 
cd ..
rm -rf git

ENDCOMMENT
