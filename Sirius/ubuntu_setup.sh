#!/bin/bash

### google-chrome-stable
sudo add-apt-repository ppa:flozz/flozz
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"

sudo add-apt-repository "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/"
# sudo add-apt-repository "deb http://cran.rstudio.com/trusty-backports main restricted universe"
gpg --keyserver pgpkeys.mit.edu --recv-key 51716619E084DAB9
gpg -a --export 51716619E084DAB9 | sudo apt-key add -

sudo apt-get update

sudo apt-get -f install r-base r-base-dev unity-tweak-tool nautilus-open-terminal gksu default-jre pavucontrol indicator-multiload qpdfview nautilus-terminal nautilus-actions google-chrome-stable
sudo apt-get -f

### compile vim with options
# or try install vim-gnome
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    ruby-dev git


git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=big \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-perlinterp \
	    --enable-python3interp \
            --with-x=yes

make
sudo make install

#

