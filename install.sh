#!/bin/bash

errormsg="Ups... something was wrong."
continuemsg="Press any key to resume"

# YAY
git clone https://aur.archlinux.org/yay.git ${HOME}/yay
chown ${USER} ~/yay/
cd ${HOME}/yay
makepkg -si || echo "$errormsg"

read -p "$continuemsg"

yay -S - < ./pkgfirmware.txt
