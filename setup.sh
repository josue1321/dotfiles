#! /bin/bash

echo -e "Iniciando Setup\n"

sudo pacman -S bspwm sxhkd rofi nitrogen rxvt-unicode xorg xorg-xinit unzip

cd /tmp/
git clone https://aur.archlinux.org/polybar
cd /tmp/polybar
makepkg -si

cd /tmp/
git clone https://aur.archlinux.org/picom-jonaburg-git
cd /tmp/picom-jonaburg-git
makepkg -si

cd $HOME

mkdir $HOME/.config/picom
cp /etc/xdg/picom.conf.example $HOME/.config/picom/picom.conf
mv $HOME/dotfiles/bspwm $HOME/.config/ && mv $HOME/dotfiles/sxhkd $HOME/.config/ && mv $HOME/dotfiles/polybar $HOME/.config/ && mv $HOME/dotfiles/urxvt/.Xresources $HOME
sudo pacman -Rs $(pacman -Qqdt)

cd $HOME/dotfiles/fonts
unzip Hack.zip
rm Hack.zip
mkdir $HOME/.local/share/fonts
mv $HOME/dotfiles/fonts/* $HOME/.local/share/fonts

cd $HOME

touch .xinitrc && echo -e "exec bspwm\nexec sxhkd" >> .xinitrc

echo -e "\nSetup completo"
