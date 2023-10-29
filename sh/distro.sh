#!/bin/bash
master=$(dirname $(dirname $(readlink -fm "$0")))
dotfiles="$HOME/dotfiles"
DIR_QTILE="$HOME/.config/qtile/"
DIR_ROFI="$HOME/.config/rofi/"

git clone --depth=1 https://github.com/nestor784/dotfiles.git ${dotfiles}

# QTILE
if [ -d "$DIR_QTILE" ];then
	rm -rf .config/qtile/*
fi
cp -rf ${HOME}/dotfiles/.config/qtile/ ${DIR_QTILE}

# ROFI
if [ -d "$DIR_ROFI" ];then
	rm -rf .config/rofi/*
fi
FONT_DIR="$HOME/.local/share/fonts"
if [[ -d "$FONT_DIR" ]];then 
	cp -rf ${master}/files/rofi/fonts/* ${FONT_DIR}
else
	mkdir -p ${FONT_DIR}
	cp -rf ${master}/files/rofi/fonts/* ${FONT_DIR}
fi
fc-cache
cp -rf ${HOME}/dotfiles/.config/rofi/  ${DIR_ROFI}

# GRUB
git clone --depth=1 https://github.com/vinceliuice/grub2-themes ${HOME}/grub2-themes
cp -rf ${master}/files/grub/background.jpg ${HOME}/grub2-themes/background.jpg
cd ${HOME}/grub2-themes
sudo ./install.sh -s 1080p -t vimix -i white
vbeinfo="1366x768"
sudo sed -i "/GRUB_GFXMODE/ s/1920x1080,auto/$vbeinfo,auto/" /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

# SDDM
yay -S sddm-sugar-dark
sddm --example-config > ${HOME}/tmpfile
sudo mv ${HOME}/tmpfile /etc/sddm.conf
sudo sed -i "/Current=/ s/=/=sugar-dark/" /etc/sddm.conf
sudo systemctl enable sddm.service
