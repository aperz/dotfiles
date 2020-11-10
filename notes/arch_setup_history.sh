vim /etc/hostname 

# wireless - ?? 
sudo wifi-menu
sudo netctl start Net2019

ip link list
ip link set wlp0s20f3 down
sudoip link set wlp0s20f3 down
sudo ip link set wlp0s20f3 down

# package manager
mkdir pkg
cd pkg
git clone https://aur.archlinux.org/yay.git
cd yay

makepkg -si
pacman -S go
sudo pacman -Sy

# packages
yay -S google-chrome
yay -S spotify

sudo pacman -S xorg-xinit xorg awesome lain vicious
sudo pacman -S xterm alsa pavucontrol alsa-utils pulseaudio-bluetooth pulseaudio-alsa
sudo pacman -S python-pip
sudo pacman -S hddtemp
sudo pacman -S trash-cli

# Dotfiles
git clone https://www.github.com/aperz/Dotfiles.git
pip install dotfiles
dotfiles -sf

# awesome
vim .config/awesome/rc.lua 

git clone --recursive https://github.com/lcpz/awesome-copycats.git
mv -bv awesome-copycats/* ~/.config/awesome && rm -rf awesome-copycats
vim .config/awesome/rc.lua

vim .config/awesome/rc.lua
ls .config/awesome/themes/
ls .config/awesome/themes/powerarrow

# terminal etc
sudo pacman -S urxvt-term

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim .vimrc
cd ~/.vim/bundle/YouCompleteMe
# git submodule update --init --recursive # do this for others? shouldn't be needed
# ./install.py --clangd-completer
sudo pacman -S cmake npm
./install.py --all

vim .tmux.conf 
vim Dotfiles/oh-my-zsh/themes/spaceship.zsh-theme 
vim Dotfiles/oh-my-zsh/themes/spaceship-my.zsh-theme 

# spaceship theme - just look into the repo for updates instruciotns
#yay -S git npm
#npm install -g spaceship-prompt
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 
#Set ZSH_THEME="spaceship" in your .zshrc.


# sound
amixer
amixer sset Master unmute

sudo pacman -S powerline powerline-fonts
vim /etc/shells
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#sudo sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/uninstall.sh)"


# display mgmt

xlayoutdisplay 
xrandr  --dpi 144  --output eDP-1 --mode 1920x1080 --rate 60 --pos 0x0 --primary  --output DP-1-1.8 --mode 1920x1080 --rate 60 --pos 1920x0  --output DP-1-1.1 --mode 1920x1080 --rate 60 --pos 3840x0 \
autorandr mobile
