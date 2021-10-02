
#! /bin/bash

echo "Iniciando Setup"
sudo pacman -S bspwm sxhkd rofi nitrogen rxvt-unicode
#cd /tmp/
#git clone https://aur.archlinux.org/polybar
#cd /tmp/polybar
#makepkg -si
#git clone https://aur.archlinux.org/picom-jonaburg-git
#cd /tmp/picom-jonaburg-git
#makepkg -si
cd $HOME
mkdir $HOME/.config/picom
cp /etc/xdg/picom.conf.example $HOME/.config/picom/picom.conf
mv $HOME/dotfiles/bspwm $HOME/.config/ && mv $HOME/dotfiles/sxhkd $HOME/.config/ && mv $HOME/dotfiles/polybar $HOME/.config/ && mv $HOME/dotfiles/urxvt/.Xresources $HOME
sudo pacman -Rs $(pacman -Qqdt)
echo "Setup completo"
