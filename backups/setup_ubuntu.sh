#!/bin/bash

## PACKAGES

# Backup list of  packages (crontab)

#dpkg --get-selections > ~/Dropbox/backups/dpkg_package_list
#sudo cp -R /etc/apt/sources.list* ~/Dropbox/backups/
#sudo apt-key exportall > ~/Dropbox/backups/dpkg_repo_keys

# Reinstall packages

sudo apt-key add ~/Dropbox/backups/dpkg_repo_keys
sudo cp -R ~/Dropbox/backups/sources.list* /etc/apt/
sudo apt-get update
sudo apt-get install dselect
sudo dpkg --set-selections < ~/Dropbox/backups/dpkg_package_list
sudo dselect

# Misc

#wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#gpg --keyserver pgpkeys.mit.edu --recv-key 51716619E084DAB9
#gpg -a --export 51716619E084DAB9 | sudo apt-key add -


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

