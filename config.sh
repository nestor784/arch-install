sudo echo -e "Section \"InputClass\"\n\t\tIdentifier \"system-keyboard\"\n\t\tMatchIsKeyboard \"on\"\n\t\tOption \"XkbLayout\" \"latam\"\n\t\tOption \"XkbVariant\" \",winkeys\"\nEndSection" >| /etc/X11/xorg.conf.d/00-keyboard.conf && echo "KBOARD XORG succeeded" || echo "Command failed"
read -p "Press any key to resume ..."

sudo echo -e "Section \"OutputClass\"\n\tIdentifier \"AMD\"\n\tMatchDriver \"amdgpu\"\n\tDriver \"amdgpu\"\nEndSection" >| /etc/X11/xorg.conf.d/20-amdgpu.conf && echo "AMD XORG succeeded" || echo "Command failed"
read -p "Press any key to resume ..."
