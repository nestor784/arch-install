#!/bin/bash

master=$(dirname $(dirname $(readlink -fm "$0")))
errormsg="Ups... something was wrong."
continuemsg="Press any key to resume"

sudo pacman -Syu

# YAY
git clone https://aur.archlinux.org/yay.git ${HOME}/yay
chown ${USER} ~/yay/
cd ${HOME}/yay
makepkg -si || echo "$errormsg"

read -p "$continuemsg"

yay -S - < ${master}/etc/pkgfirmware.txt
sudo alsactl init
sudo alsactl store
