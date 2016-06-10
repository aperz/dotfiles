#!/bin/bash

## DOTFILES

sudo apt-get install git
sudo apt-get install python-pip
pip install dotfiles
git clone https://github.com/AleksTheAraneus/dotfiles
mv dotfiles ~/Dotfiles
dotfiles -s

## PACKAGES

# Backup list of  packages (crontab)

# Reinstall packages
# if not Ubuntu: find list of base Ubuntu packages and subtract

sudo apt-key add ~/.backups/dpkg_repo_keys
sudo cp -R ~/.backups/sources.list* /etc/apt/
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install dselect
sudo dpkg --set-selections < ~./backups/dpkg_package_list
sudo dselect

# Misc

#wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#gpg --keyserver pgpkeys.mit.edu --recv-key 51716619E084DAB9
#gpg -a --export 51716619E084DAB9 | sudo apt-key add -


# Reinstall python and R packages

# may not work right away untested script
R_packages_list.R -r -d "~/.backups/"

sudo apt-get install python3-pip
pip3 install (~/.backups/pip3_package_list_old)
pip install (~/.backups/pip2_package_list_old)

# github: manual installations?

# wrenlab
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


## SYSTEM, DATA, ...

# Backup (crontab)

# Restore

rsync -a /media/perza/UUI/backup_Osiris_rsync/perza /home/perza
rsync -a /media/perza/UUI/backup_Osiris_rsync/bin /usr/local/bin
rsync -a /media/perza/UUI/backup_Osiris_rsync/opt /opt
rsync -a /media/perza/UUI/backup_Osiris_rsync/gamma_postM /dat1/gamma_postM

