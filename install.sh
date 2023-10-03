#!/bin/bash

# Actualizar
sudo pacman -Syu
sudo pacman -S systemd-sysvcompat neovim man-dv man-pages texinfo elinks sudo git go libmtp gvfs-mtp

# Descargar AUR package-manager
git clone https://aur.archlinux.org/yay.git
chown ${USER} ~/yay/
cd ~/yay
makepkg -si

sleep 5

# Instalar firmwares
yay -S amd-ucode ast-firmware linux-firmware-qlogic upd72020x-fw wd719x-firmware aic94xx-firmware 

# Video firmware
yay -S libdvdnav cdrdao cdrtools ffmpeg ffmpegthumbnailer ffmpegthumbs xf86-video-amdgpu vulkan-radeon mesa-libgl mesa-vdpau libvdpau-va-gl xf86-video-vesa

# Sonido firmware
yay -S alsa-utils alsa-plugins pulseaudio pulseaudio-alsa gst-plugins-base gst-plugins-base-libs gst-plugins-good gst-plugins-ugly gst-plugins-bad gst-libav alsa-oss
sudo alsactl init
sudo alsactl store

# Fuentes
sudo pacman -S --asdeps --needed cairo fontconfig freetype2 noto-fonts-emoji figlet lolcat
yay -S ttf-fira-code ttf-hack nerd-fonts-complete toilet

# Bluetooth
sudo pacman -S bluez bluez-utils
sudo systemctl enable bluetooth.service

# Xorg-server
sudo pacman -S xorg-server weston xorg-server-xwayland libx11 libxft libxinerama libxrandr libxss xorg-apps xorg-xinit xorg-xmessage pkgconf xorg-tmw xorg-setxkbmap

echo "Section \"InputClass\"
	Identifier \"system-keyboard\"
	MatchIsKeyboard \"on\"
	Option \"XkbLayout\" \"latam\"
	Option \"XkbVariant\" \",winkeys\"
EndSection" >| /etc/X11/xorg.conf.d/00-keyboard.conf

echo "Section \"OutputClass\"
	Identifier \"AMD\"
	MatchDriver \"amdgpu\"
	Driver \"amdgpu\"
EndSection" >| /etc/X11/xorg.conf.d/20-amdgpu.conf

# Paquetes básicos
sudo pacman -S bash-completion pkgstats bc mlocate neofetch htop zip unzip p7zip jq wget

# Aplicaciones
# yay -S vlc rhythmbox epdfview qutebrowser networkmanager-dmenu-git
# sudo pacman -S thunar zathura leafpad nitrogen viewnior kitty
