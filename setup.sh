#! /bin/bash

echo -e "Iniciando Setup\n"

cd /tmp/
git clone https://aur.archlinux.org/paru
cd /tmp/paru
makepkg -si

paru -S bspwm sxhkd rofi nitrogen rxvt-unicode xorg xorg-xinit unzip gnu-free-fonts emacs ly picom-ibhagwan-git polybar

cd $HOME

mv $HOME/dotfiles/bspwm $HOME/.config/ && mv $HOME/dotfiles/sxhkd $HOME/.config/ && mv $HOME/dotfiles/polybar $HOME/.config/ && mv $HOME/dotfiles/urxvt/.Xresources $HOME && mv $HOME/dotfiles/picom $HOME/.config/ && mv $HOME/dotfiles/dunst $HOME/.config/ && mv $HOME/dotfiles/emacs/.spacemacs $HOME

sudo pacman -Rs $(pacman -Qqdt)

cd $HOME/dotfiles/fonts
unzip Hack.zip
rm Hack.zip
mkdir -p $HOME/.local/share/fonts
mv $HOME/dotfiles/fonts/* $HOME/.local/share/fonts

unzip FiraCode.zip
rm FiraCode.zip
mv $HOME/dotfiles/fonts/Fira* $HOME/.local/share/fonts

fc-cache -fv

cd $HOME

mv $HOME/dotfiles/wallpaper $HOME

touch .xinitrc && echo "exec bspwm" >> .xinitrc

echo -e "\nSetup completo"
