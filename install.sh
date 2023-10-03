#!/bin/bash



# Actualizar
sudo pacman -Syu
sudo pacman -S systemd-sysvcompat neovim man-dv man-pages texinfo elinks sudo git go libmtp gvfs-mtp && echo "Command succeeded" || echo "Command failed"

sleep 5

# Descargar AUR package-manager
git clone https://aur.archlinux.org/yay.git
chown ${USER} ~/yay/
cd ~/yay
makepkg -si && echo "Command succeeded" || echo "Command failed"

sleep 5

# Instalar firmwares
yay -S amd-ucode ast-firmware linux-firmware-qlogic upd72020x-fw wd719x-firmware aic94xx-firmware && echo "Command succeeded" || echo "Command failed" 

# Video firmware
yay -S libdvdnav cdrdao cdrtools ffmpeg ffmpegthumbnailer ffmpegthumbs xf86-video-amdgpu vulkan-radeon mesa-libgl mesa-vdpau libvdpau-va-gl xf86-video-vesa && echo "Command succeeded" || echo "Command failed"

# Sonido firmware
yay -S alsa-utils alsa-plugins pulseaudio pulseaudio-alsa gst-plugins-base gst-plugins-base-libs gst-plugins-good gst-plugins-ugly gst-plugins-bad gst-libav alsa-oss && echo "Command succeeded" || echo "Command failed"
sudo alsactl init
sudo alsactl store && echo "Command succeeded" || echo "Command failed"

# Fuentes
sudo pacman -S --asdeps --needed cairo fontconfig freetype2 noto-fonts-emoji figlet lolcat && echo "Command succeeded" || echo "Command failed"
yay -S ttf-fira-code ttf-hack nerd-fonts-complete toilet && echo "Command succeeded" || echo "Command failed"

# Bluetooth
sudo pacman -S bluez bluez-utils && echo "Command succeeded" || echo "Command failed"
sudo systemctl enable bluetooth.service && echo "Command succeeded" || echo "Command failed"

# Xorg-server
sudo pacman -S xorg-server weston xorg-server-xwayland libx11 libxft libxinerama libxrandr libxss xorg-apps xorg-xinit xorg-xmessage pkgconf xorg-twm xorg-setxkbmap && echo "Command succeeded" || echo "Command failed"

echo -e "Section \"InputClass\"\n\t\tIdentifier \"system-keyboard\"\n\t\tMatchIsKeyboard \"on\"\n\t\tOption \"XkbLayout\" \"latam\"\n\t\tOption \"XkbVariant\" \",winkeys\"\nEndSection" >| /etc/X11/xorg.conf.d/00-keyboard.conf

echo -e "Section \"OutputClass\"\n\tIdentifier \"AMD\"\n\tMatchDriver \"amdgpu\"\n\tDriver \"amdgpu\"\nEndSection" >| /etc/X11/xorg.conf.d/20-amdgpu.conf

# Paquetes básicos
sudo pacman -S bash-completion pkgstats bc mlocate neofetch htop zip unzip p7zip jq wget && echo "Command succeeded" || echo "Command failed"

# Aplicaciones
# yay -S vlc rhythmbox epdfview qutebrowser networkmanager-dmenu-git
# sudo pacman -S thunar zathura leafpad nitrogen viewnior kitty
