#!/bin/bash
#
master=$(dirname $(readlink -fm "$0"))
#ln -sf
#yes | cp -rf

sudo yes | cp -rf ${master}/etc/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
sudo yes | cp -rf ${master}/etc/20-amdgpu.conf /etc/X11/xorg.c/onf.d/20-amdgpu.conf
sudo cp -fv /etc/X11/xinit/xinitrc ${HOME}/.xinitrc
echo -e "exec qtile start" >> ${HOME}/.xinitrc
sudo chown -R nestor:users ${HOME}/.xinitrc
sudo chown -R nestor:users ${HOME}/.config

yay -S - < ${master}/etc/pkgdistro.txt
