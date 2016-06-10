#!/bin/bash

# thighs to consider:
# - where to store manually downnloaded pacage files? Where to install them? checkinstall
# if not Ubuntu: find list of base Ubuntu packages and subtract

### vim
cd
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


### DOTFILES

sudo apt-get install git
sudo apt-get install python-pip
pip install dotfiles
git clone https://github.com/AleksTheAraneus/dotfiles
mv dotfiles ~/Dotfiles
dotfiles -s

### PACKAGES

## BACKUP LIST OF PACKAGES (crontab)

## REINSTALL PACKAGES

sudo apt-key add ~/.backups/dpkg_repo_keys
sudo cp -R ~/.backups/sources.list* /etc/apt/
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install dselect
sudo dpkg --set-selections < ~./backups/dpkg_package_list
sudo dselect

# add repositories manually if didn't work
#sudo add-apt-repository ppa:flozz/flozz
#wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"
#
#sudo add-apt-repository "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/"
## sudo add-apt-repository "deb http://cran.rstudio.com/trusty-backports main restricted universe"
#gpg --keyserver pgpkeys.mit.edu --recv-key 51716619E084DAB9
#gpg -a --export 51716619E084DAB9 | sudo apt-key add -
#
#sudo apt-get update

## MISC

#wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#gpg --keyserver pgpkeys.mit.edu --recv-key 51716619E084DAB9
#gpg -a --export 51716619E084DAB9 | sudo apt-key add -


## REINSTALL PYTHON AND R PACKAGES

# may not work right away untested script
R_packages_list.R -r -d "~/.backups/"

sudo apt-get install python3-pip
pip3 install (~/.backups/pip3_package_list_old)
pip install (~/.backups/pip2_package_list_old)

## github: MANUAL INSTALLATIONS?

## wrenlab
cd # perhaps there's a better location for it than ~ ...
git clone https://bitbucket.org/wrenlab/acfsa.git
cd acfsa
#pip3 install --user cython==0.23
python3 setup.py install --user
cd ..
git clone https://bitbucket.org/wrenlab/wrenlab.git
cd wrenlab
pip3 install --user -r requirements.txt
python3 setup.py install --user

# biotk
# gseconvert


### SYSTEM, DATA, ...

## BACKUP (crontab)

## RESTORE

rsync -a /media/perza/UUI/backup_Osiris_rsync/perza /home/perza
rsync -a /media/perza/UUI/backup_Osiris_rsync/bin /usr/local/bin
rsync -a /media/perza/UUI/backup_Osiris_rsync/opt /opt
rsync -a /media/perza/UUI/backup_Osiris_rsync/gamma_postM /dat1/gamma_postM

