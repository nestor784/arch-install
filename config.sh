#!/usr/bin/env bash

function test()
{
	eval "${1}" && echo "Succeeded" || echo "Fail"	
}

#ln -sf
#yes | cp -rf

test "sudo yes | cp -rf etc/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf"
read -p "Press any key to resume ..."

test "sudo yes | cp -rf etc/20-amdgpu.conf /etc/X11/xorg.conf.d/20-amdgpu.conf"
read -p "Press any key to resume ..."

echo "### Qtile Installing ###"
test "yay -S qtile"
test "sudo cp -fv /etc/X11/xinit/xinitrc ${HOME}/.xinitrc"
test "echo -e \"exec qtile start\" >> ${HOME}/.xinitrc"
test "sudo chown -R nestor:users ${HOME}/.xinitrc"
test "sudo chown -R nestor:users ${HOME}/.config"

