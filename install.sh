#!/bin/bash



# Actualizar
sudo pacman -Syu
sudo pacman -S systemd-sysvcompat neovim man-db man-pages texinfo elinks sudo git go libmtp gvfs-mtp && echo "Test pacman succeeded" || echo "Command failed"

read -p "Press any key to resume ..."

# Descargar AUR package-manager
git clone https://aur.archlinux.org/yay.git ${HOME}/yay
chown ${USER} ~/yay/
cd ~/yay
makepkg -si && echo "Test YAY install succeeded" || echo "Command failed"

read -p "Press any key to resume ..."

# Instalar firmwares
yay -S amd-ucode ast-firmware linux-firmware-qlogic upd72020x-fw wd719x-firmware aic94xx-firmware && echo "Test firmware succeeded" || echo "Command failed" 
read -p "Press any key to resume ..."

# Video firmware
yay -S libdvdnav cdrdao cdrtools ffmpeg ffmpegthumbnailer ffmpegthumbs xf86-video-amdgpu vulkan-radeon mesa-libgl mesa-vdpau libvdpau-va-gl xf86-video-vesa && echo "Test video firmware succeeded" || echo "Command failed"
read -p "Press any key to resume ..."

# Sonido firmware
yay -S alsa-utils alsa-plugins pulseaudio pulseaudio-alsa gst-plugins-base gst-plugins-base-libs gst-plugins-good gst-plugins-ugly gst-plugins-bad gst-libav alsa-oss && echo "Test sound firmware succeeded" || echo "Command failed"
read -p "Press any key to resume ..."

sudo alsactl init
sudo alsactl store && echo "Test alsactl succeeded" || echo "Command failed"
read -p "Press any key to resume ..."

# Fuentes
sudo pacman -S --asdeps --needed cairo fontconfig freetype2 noto-fonts-emoji figlet lolcat && echo "Test fonts pacman succeeded" || echo "Command failed"
yay -S ttf-fira-code ttf-hack nerd-fonts-complete toilet && echo "Test fonts yay succeeded" || echo "Command failed"
read -p "Press any key to resume ..."

# Bluetooth
sudo pacman -S bluez bluez-utils && echo "Test bluetooth package succeeded" || echo "Command failed"
read -p "Press any key to resume ..."

sudo systemctl enable bluetooth.service && echo "Test bluetooth succeeded" || echo "Command failed"
read -p "Press any key to resume ..."

# Xorg-server
sudo pacman -S xorg-server weston xorg-server-xwayland libx11 libxft libxinerama libxrandr libxss xorg-apps xorg-xinit xorg-xmessage pkgconf xorg-twm xorg-setxkbmap && echo "Test xorg download succeeded" || echo "Command failed"
read -p "Press any key to resume ..."


# Paquetes básicos
sudo pacman -S bash-completion pkgstats bc mlocate neofetch htop zip unzip p7zip jq wget && echo "Some packages downloaded succeeded" || echo "Command failed"
read -p "Press any key to resume ..."

# Aplicaciones
yay -S vlc rhythmbox epdfview qutebrowser networkmanager-dmenu-git && echo "APPS succeeded" || echo "Command failed"
sudo pacman -S thunar zathura leafpad nitrogen viewnior kitty && echo "APPS succeeded" || echo "Command failed"
