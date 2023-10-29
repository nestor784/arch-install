#!/bin/bash
#
master=$(dirname $(dirname $(readlink -fm "$0")))
yay -S - < ${master}/etc/pkgpersonal.txt

# RANGER
DIR_RGR="$HOME/.config/ranger/"
if [[ ! -d "$DIR_RGR" ]];then
	mkdir ${DIR_RGR}
fi
cd ${DIR_RGR}
ranger --copy-config=all
export RANGER_LOAD_DEFAULT_RC=FALSE
sed -i '/set preview_images/ s/false/true/' ${DIR_RGR}/rc.conf
sed -i '/set preview_images_method/ s/w3m/kitty/' ${DIR_RGR}/rc.conf


