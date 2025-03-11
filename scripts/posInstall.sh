#!/usr/bin/bash
                        
appPosNetwork(){
    echo "[ARCH] Network"
    echo "INSTALAR NETWORKMANAGER"
    packagesManager "networkmanager nm-connection-editor network-manager-applet"
    #sudo systemctl enable NetworkManager.service
    #sudo systemctl start NetworkManager.service --now
    enableSystemctl "NetworkManager"
    #echo "REMOVER IWD (wifi terminal archinstall)"
    #removePacotes "iwd"
}
 
appPosNvidiaDriverProp(){
        #https://github.com/lutris/docs/blob/master/InstallingDrivers.md#arch--manjaro--other-arch-linux-derivatives
        #causa crash no gdm o pacote: nvidia-dkms
        #https://codigocristo.github.io/driver_nvidia.html
        packagesManager "$myBaseNvidia"
}    

appPosManualConfig(){ 
    echo "---------------------
Configuracoes Manuais
---------------------
[PACMAN]
Remover comentarios em: /etc/pacman.conf
#Color
#ParallelDownloads = 10
ILoveCandy
#[multilib]
#Include = /etc/pacman.d/mirrorlist
---------------------
[GNOME]
Remover comentarios em: /etc/gdm3/custom.conf
#WaylandEnable=false
Apos editar, executar:
sudo systemctl restart gdm3
---------------------
[THEME]
Caso de erro com thema no i3 é so apagar as pastas gtk-* em .config na HOME
---------------------
[NVIDIA]
https://github.com/korvahannu/arch-nvidia-drivers-installation-guide
configurar no Xorg com
sudo nvidia-xconfig
---------------------
[GRUB]
sudo nano /etc/default/grub
remover # da opcao 
#GRUB_DISABLE_OS_PROBER=false
apos isso executar
grub-mkconfig -o /boot/grub/grub.cfg
---------------------
[Steam Linux & Windows]
https://github.com/ValveSoftware/Proton/wiki/Using-a-NTFS-disk-with-Linux-and-Windows
"
read enterprasair
}

appPosBluetoothFix(){
    echo "[1]Fix Bluetooth & Network Interference [2]Remove Fix"
    read esco
    if [ "$esco" = "1" ]; then
        sudo tee /etc/modprobe.d/iwlwifi-opt.conf <<< "options iwlwifi bt_coex_active=N"
    elif [ "$esco" = "2" ]; then
        sudo rm /etc/modprobe.d/iwlwifi-opt.conf
    fi
}

appPosTecladoConfig(){
    echo "[ARCH] Keyboard BR"
    setxkbmap -model abnt2 -layout br
    echo "setxkbmap -model abnt2 -layout br" >> ~/.profile
    sudo tee /etc/X11/xorg.conf.d/10-evdev.conf <<< 'Section "InputClass"
Identifier "evdev keyboard catchall"
MatchIsKeyboard "on"
MatchDevicePath "/dev/input/event*"
Driver "evdev"
Option "XkbLayout" "br"
Option "XkbVariant" "abnt2"
EndSection'
}

appPosTimeNTP(){
    sudo timedatectl set-ntp true
    sudo hwclock --systohc
}

appPosI3Touchpad(){
    sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
Identifier "touchpad"
MatchIsTouchpad "on"
Driver "libinput"
Option "Tapping" "on"
EndSection
EOF
}

xfce4Config(){
    xfce4-panel --quit
    pkill xfconfd
    rm -rf ~/.config/xfce4/panel
    rm -rf ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
    xfce4-config
    xfce4-panel &
}

backlightConfig(){
    #sudo chmod +s /usr/bin/light
    echo 'ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp wheel $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"' | sudo tee /etc/udev/rules.d/backlight.rules
    #criarArq 'light' "$HOME/.config/i3/brightness"
}

attGrubWithWindows(){
    sudo cp /etc/default/grub /etc/default/grub$DATANOW.bkp
    sudo cp /boot/grub/grub.cfg /boot/grub/grub$DATANOW.cfg.bkp
    sudo pacman -S os-prober
    sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
    sudo sed -i "/GRUB_DISABLE_OS_PROBER=false/"'s/^#//' /etc/default/grub
    sudo grub-mkconfig -o /boot/grub/grub.cfg
}

editPacmanConfig(){
    sudo cp /etc/pacman.conf /etc/pacman$DATANOW.conf.bkp
    sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 10\nILoveCandy\nColor/g' /etc/pacman.conf
    sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
    sudo pacman -Syyu
}

autoMountNtfs(){
    sudo fdisk -l
    echo "Digite o caminho do disco Ex.: /dev/sdb1"
    read DEVSD
    sudo cp /etc/fstab /etc/fstab$DATANOW.bkp
    sudo mkdir -p /media/homec
    #id -u
    #id -g
    sudo tee -a /etc/fstab <<< '# '$DEVSD'
UUID='$(sudo blkid -s UUID -o value $DEVSD)' /media/homec ntfs uid='$(id -u)',gid='$(id -g)',rw,user,exec,umask=000 0 0'
    cat /etc/fstab
    sleep 5
    #rm -r ~/.steam/steam/steamapps/compatdata
    #mkdir -p ~/.steam/steam/steamapps/compatdata
    #ln -s ~/.steam/steam/steamapps/compatdata /media/gamedisk/Steam/steamapps/
}

defaultInodeDirectory(){
    echo "Default Applications   
[1]Nautilus for FileManager
[2]PCManFM for FileManager"
    read resp
    case $resp in
        1)xdg-mime default org.gnome.Nautilus.desktop inode/directory;;
        2)xdg-mime default pcmanfm.desktop inode/directory;;
        *)
    esac
}

lnHome(){
    ln -s /media/homec/Desktop $HOME
    ln -s /media/homec/Documents $HOME
    ln -s /media/homec/Downloads $HOME
    ln -s /media/homec/Pictures $HOME
    ln -s /media/homec/Videos $HOME
    ln -s /media/homec/Music $HOME
    ln -s /media/homec/Heroic $HOME
}

