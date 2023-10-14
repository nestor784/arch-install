# dots

this is my personal config of linux.
- [x] System packages
- [x] Xorg
- [x] My apps
- [ ] WM Qtile installation
- [ ] Fonts
- [ ] GitHub ssh authentication
- [ ] sddm
- [ ] rofi
- [ ] neovim 
- [ ] kitty themes
- [ ] Thunar icons and theme
- [ ] WM Qtile configuration

## Arch installation 

#### Configuración inicial para instalación

1. Cambiar distribución de teclado
```sh
loadkeys la-latin1 # es us
```
2. Cambiar zona horaria
```sh
timedatectl set-timezone America/Bogota # UTC
```
3. Conectarse a wifi
```sh
iwctl
device list # Ver dispositivos (Si no hay, fallo al reconcer tarjeta de red)
device name-device set-property Powered on
adapter name-adapter set-property Powered on
station name-device scan # No imprime nada pero activa el reconocimiento de redes
station name-device get-networks # Listar los SSID disponibles
station name-device connect SSID # conectarse, la contraseña se introduce despues.
exit
ping -c 1 google.com # Comprobar que tienes internet
```
#### Partición del disco 

1. Particionar disco:
```sh
fdisk -l # Mostrar discos
cfdisk # Interfaz para particionar
```

*Nota*: Mi recomendación personal es dividir el disco en 4 particiones:
* efi <- 300 MB <- efi partition
* swap <- 2GB <- linux swap partition
* / <- 40% restante <- linux filesystem partition
* home <- 60% restante <- linux filesystem partition

2. Dar formato a las particiones y borrar informacion almacenada.
```sh
# Ejemplo: efi -> /dev/sda1 swap -> /dev/sda2 / -> /dev/sda3 home/ -> /dev/sda4
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4
mkswap /dev/sda2
mkfs.fat -F 32 /dev/sda1
```

#### Montar sistema de archivos e instalación base

1. Montaje
```sh
mount /dev/sda3 /mnt # Raiz
mount --mkdir /dev/sda4 /mnt/home # home/
mount --mkdir /dev/sda1 /mnt/boot/efi # Efi
swapon /dev/sda2 # swap
```
2. Instalación de paquetes base con pacstrap.
```sh
pacstrap /mnt linux linux-firmware sof-firmware neovim base base-devel grub efibootmgr networkmanager
```
3. Generar tabla de particiones
```sh
genfstab /mnt > /mnt/etc/fstab
cat /mnt/ect/fstab # Verificar que se genero correctamente la tabla de particiones
```
4. Configuración PC
```sh
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/America/Bogota /etc/localtime # Zona horaria
hwclock --systohc # Generar archivo /etc/adjtime
nvim /etc/locale.gen # Descomentar ES_CO.UTF8, puede que tu caso sea diferente 
locale-gen
nvim /etc/locale.conf # Escribir LANG=es_CO.UTF-8, segun sea el caso, y guardar archivo
nvim /etc/vconsole.conf # Escribir KEYMAP=la-latin1, segun sea el caso, y guardar archivo
nvim /etc/hostname # e.g Arch y guardar archivo.
passwd # Crear contraseña root
useradd -m -G wheel -s /bin/bash usuario1 # Creación usuario 
passwd usuario1 # Contraseña usuario
EDITOR=nvim visudo # descomentar %wheel ALL=(ALL) ALL para que se pueda usar sudo
systemctl enable NetworkManager
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount -a 
reboot
```

*Nota*:Maquina virtual
```sh
nvim /etc/mkinitcpio.conf
# MODULES="virtio virtio_blk virtio_pci virtio_net"
exit 
mount -o bind /dev /mnt/dev
mount -t proc /proc /mnt/proc
mount -t sysfs /sys /mnt/sys
mobprobe dm-mod
arch-chroot /mnt 
pacman-db-upgrade
pacman -Syy
pacman -S grub
grub-install --target=i386-pc --no-floppy /dev/vda --force
grub-mkconfig -o /boot/grub/grub.cfg
```
#### Primer logueo en arch

Instalar git.

```sh
sudo pacman -S git
```
## System packages

Clonar este repositorio e instalar los paquetes básicos como `firmware` y
`tools`.

```sh
git clone https://github.com/nestor784/arch-install.git
./install.sh
```
El gestor de paquetes **AUR** que utilizaré es `yay`.

Este *script* instala los siguientes paquetes:
* neovim
* go
* bash-completion
* bc
* mlocate
* neofetch
* htop 
* zip
* unzip
* p7zip
* jq
* wget
* xorg y más librerias asociadas.

## Xorg
Configuración del teclado y gráficos
```sh
./config.sh
```

## My Apps

Esta es la lista de mis aplicaciones personales:
* vlc (Repreductor video)
* rhythmbox (Repreductor audio)
* epdfview (Visor de PDF)
* qutebrowser (Explorador)
* networkmanager-dmenu-git (Centro de redes)
* thunar (Gestor de archivos)
* leafpad (Lector de texto)
* viewnior (Visor de imagenes)
* kitty (Terminal)
* zathura (Visor de PDF)


## WM Qtile Installation


