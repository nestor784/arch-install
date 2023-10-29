#!/bin/bash
#
master=$(dirname $(readlink -fm "$0"))
#ln -sf
#yes | cp -rf

sudo cp -rf ${master}/etc/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf
sudo cp -rf ${master}/etc/20-amdgpu.conf /etc/X11/xorg.conf.d/20-amdgpu.conf
head -n -5 /etc/X11/xinit/xinitrc > ${HOME}/xinitrc.tmp && mv ${HOME}/xinitrc.tmp ${HOME}/.xinitrc
echo -e "exec qtile start" >> ${HOME}/.xinitrc
sudo chown -R nestor:users ${HOME}/.xinitrc
sudo chown -R nestor:users ${HOME}/.config

