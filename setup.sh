#! /bin/bash

echo -e "Iniciando Setup\n"

sudo pacman -S bspwm sxhkd rofi nitrogen rxvt-unicode xorg xorg-xinit unzip gnu-free-fonts

cd /tmp/
git clone https://aur.archlinux.org/polybar
cd /tmp/polybar
makepkg -si

cd /tmp/
git clone https://aur.archlinux.org/picom-ibhagwan-git
cd /tmp/picom-ibhagwan-git
makepkg -si
Ob
cd $HOME

mv $HOME/dotfiles/bspwm $HOME/.config/ && mv $HOME/dotfiles/sxhkd $HOME/.config/ && mv $HOME/dotfiles/polybar $HOME/.config/ && mv $HOME/dotfiles/urxvt/.Xresources $HOME && mv $HOME/dotfiles/picom $HOME/.config/
sudo pacman -Rs $(pacman -Qqdt)

cd $HOME/dotfiles/fonts
unzip Hack.zip
rm Hack.zip
mkdir -p $HOME/.local/share/fonts
mv $HOME/dotfiles/fonts/* $HOME/.local/share/fonts

unzip FiraCode.zip
rm FiraCode.zip
mkdir -p $HOME/.local/share/fonts
mv $HOME/dotfiles/fonts/Fira* $HOME/.local/share/fonts

fc-cache -fv

cd $HOME

mv $HOME/dotfiles/wallpaper $HOME

touch .xinitrc && echo "exec bspwm" >> .xinitrc

echo -e "\nSetup completo"
