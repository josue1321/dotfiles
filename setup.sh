
#! /bin/bash

echo "Iniciando Setup\n"

sudo pacman -S bspwm sxhkd rofi nitrogen rxvt-unicode xorg xorg-xinit

cd /tmp/
git clone https://aur.archlinux.org/polybar
cd /tmp/polybar
makepkg -si

git clone https://aur.archlinux.org/picom-jonaburg-git
cd /tmp/picom-jonaburg-git
makepkg -si

cd $HOME
mkdir $HOME/.config/picom
cp /etc/xdg/picom.conf.example $HOME/.config/picom/picom.conf
mv $HOME/dotfiles/bspwm $HOME/.config/ && mv $HOME/dotfiles/sxhkd $HOME/.config/ && mv $HOME/dotfiles/polybar $HOME/.config/ && mv $HOME/dotfiles/urxvt/.Xresources $HOME
sudo pacman -Rs $(pacman -Qqdt)

touch .xinitrc && echo "exec bspwm\nexec sxhkd" >> .xinitrc

echo "\nSetup completo"
