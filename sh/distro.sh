#!/bin/bash
master=$(dirname $(dirname $(readlink -fm "$0")))
dotfiles="$HOME/dotfiles"
DIR_QTILE="$HOME/.config/qtile/"
DIR_ROFI="$HOME/.config/rofi/"

git clone https://github.com/nestor784/dotfiles.git ${dotfiles}

# QTILE
if [ -d "$DIR_QTILE" ];then
	rm -rf .config/qtile/*
fi
cp -r ${HOME}/dotfiles/.config/qtile/ ${DIR_QTILE}

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
cp -r ${HOME}/dotfiles/.config/rofi/  ${DIR_ROFI}
