#!/bin/bash

## PACKAGES

# Backup list of  packages (crontab)

#dpkg --get-selections > ~/.backups/dpkg_package_list
#sudo cp -R /etc/apt/sources.list* ~/.backups/
#sudo apt-key exportall > ~/.backups/dpkg_repo_keys

# Reinstall packages

#sudo apt-key add ~/.backups/dpkg_repo_keys
#sudo cp -R ~/.backups/sources.list* /etc/apt/
#sudo apt-get update
#sudo apt-get install dselect
#sudo dpkg --set-selections < ~/.backups/dpkg_package_list
#sudo dselect update
#sudo dselect install # WATCH OUT FOR UPDATING GRUB!! grub-efi-amd64 grub-efi-amd64-signed

# KEYS
# this works in omrf but need to find all the adresses
#wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#gpg --keyserver pgpkeys.mit.edu --recv-key 51716619E084DAB9
#gpg -a --export 51716619E084DAB9 | sudo apt-key add -


#dpkg --get-selection | cut -f1 > packages_on_target_computer
cut -f1 ~/.backups/dpkg_package_list > packages_master

diff -u packages_on_target_computer packages_master | grep "^+[^+]" | cut -c 2-> packages_diff

for package in $( cat packages_diff ); do
	printf "---"$package
	sudo apt-get install $package; # build-essential?
done

### TWEAKS
# gnome-terminal: change profile
# unity tweak tool
# reboot

### Manually installed

# get dropbox for additional files
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd

# vim-py3
sudo apt-get install checkinstall python-dev python3-dev ruby ruby-dev libx11-dev libxt-dev libgtk2.0-dev libncurses5 ncurses-dev
git clone https://vim.googlecode.com/hg/ ~/vim
cd ~/vim

./configure \
--enable-perlinterp \
--enable-python3interp \
--enable-rubyinterp \
--enable-cscope \
--enable-gui=auto \
--enable-gtk2-check \
--enable-gnome-check \
--with-features=huge \
--enable-multibyte \
--with-x \
--with-compiledby="xorpd" \
--with-python3-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu \
--prefix=/opt/vim74

make
make test
sudo checkinstall
sudo ln -s /opt/vim74/bin/vim /usr/bin/vim-py3

## RESTORE R AND python PACKAGES

# R packages ( integrate.to.kalendarz)
# make a script to back this up and cron it
# installedpkgs <- as.vector(tmp[is.na(installed.packages()[,"Priority"]), 1])
# R > install.packages() #syntax?


# pythonpackages
sudo apt-get install python3-pip
sudo pip3 install pandas seaborn scikit-learn scipy pickle jupyter argparse

### OTHER PAKCAGES
# blockify


## SYSTEM, DATA, ...

# Backup (crontab)

#00 03 * * * /usr/bin/rsync -a --exclude .local/share/Trash --exclude VirtualBox\ VMs --exclude .cache/deja-dup --exclude .cache/duplicityi --exclude .cache/spotify /home/perza /media/perza/UUI/backup_Osiris_rsync
#00 04 * * * /usr/bin/rsync -a /usr/local/bin /media/perza/UUI/backup_Osiris_rsync
#00 04 * * * /usr/bin/rsync -a /opt /media/perza/UUI/backup_Osiris_rsync
#00 05 * * * /usr/bin/rsync -a --exclude cache --exclude data/SRAmetadb.sqlite /dat1/gamma_postM /media/perza/UUI/backup_Osiris_rsync 

# Restore

rsync -a /media/perza/UUI/backup_Osiris_rsync/perza /home/perza
rsync -a /media/perza/UUI/backup_Osiris_rsync/bin /usr/local/bin
rsync -a /media/perza/UUI/backup_Osiris_rsync/opt /opt
rsync -a /media/perza/UUI/backup_Osiris_rsync/gamma_postM /dat1/gamma_postM

