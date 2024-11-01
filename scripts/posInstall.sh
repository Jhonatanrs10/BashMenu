#!/usr/bin/env sh
myBase="base linux linux-firmware base-devel pacman-contrib bzip2 cpio gzip lha xz lzop p7zip tar unace unrar zip unzip wget curl bash bash-completion power-profiles-daemon notification-daemon papirus-icon-theme breeze-gtk capitaine-cursors networkmanager intel-ucode git sof-firmware grub efibootmgr ntfs-3g dosfstools os-prober nano vim fastfetch gufw gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer ffmpeg fwupd flatpak gvfs gvfs-mtp gvfs-smb samba udisks2 polkit polkit-gnome net-tools bluez bluez-tools bluez-utils joyutils man-db gnu-free-fonts ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji wireless_tools imagemagick cmatrix htop libnotify dunst pulseaudio pulseaudio-bluetooth xsel"
myLightdm="lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings"
mySddm="sddm"
myI3wmApps="lxrandr nwg-look xfce4-taskmanager gpicview xfce4-power-manager font-manager pcmanfm galculator system-config-printer ark xreader rhythmbox dragon kdeconnect gnome-keyring seahorse leafpad"
myI3wm="i3 polybar i3lock i3status dmenu rofi picom nitrogen acpilight scrot xcolor blueman pavucontrol volumeicon network-manager-applet gnome-keyring seahorse"
myXfceToI3="exo garcon xfce4-appfinder xfce4-panel xfce4-session xfce4-settings xfconf xfdesktop xfwm4 xfce4-screenshooter xfce4-pulseaudio-plugin"
myXfce4="xfce4 xfce4-goodies xfce4-docklike-plugin ark"
myKde="plasma"
myKdeApps="dolphin dolphin-plugins dragon elisa kdeconnect ark filelight gwenview kate okular"
myGnome="gnome gnome-tweaks"
myNvidia="nvidia nvidia-settings nvidia-utils lib32-nvidia-utils libva-nvidia-driver cuda opencl-nvidia lib32-opencl-nvidia vdpauinfo clinfo gl-wayland"
myGlobalApps="gimp inkscape shotcut code qbittorrent mpv gparted chromium alacritty bitwarden discord"
myHyprland="hyprland wofi waybar hyprlock hyprpicker wl-clipboard xorg-xhost azote swaybg blueman pavucontrol network-manager-applet gnome-keyring seahorse"
myHyprlandApps="nwg-look xfce4-taskmanager gpicview font-manager pcmanfm galculator system-config-printer ark xreader rhythmbox dragon kdeconnect leafpad"

dotFont="Freemono" 

sourceFolder "DotFiles" "./dotfiles"

myBaseHyprland(){
    packagesManager "$myBase"
    packagesManager "$myGlobalApps"
    packagesManager "$myHyprland"
    packagesManager "$myHyprlandApps"
    packagesManager "$mySddm"
    enableSystemctl "bluetooth"
    enableSystemctl "NetworkManager"
    enableSystemctl "sddm"
    enableSystemctl "power-profiles-daemon"
    sudo tee /usr/share/dbus-1/services/org.freedesktop.Notifications.service <<< '[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/notification-daemon-1.0/notification-daemon'
}

myBaseI3wm(){
    packagesManager "$myBase"
    packagesManager "$myGlobalApps"
    packagesManager "$myI3wm"
    packagesManager "$myI3wmApps"
    packagesManager "$myLightdm"
    enableSystemctl "bluetooth"
    enableSystemctl "NetworkManager"
    enableSystemctl "lightdm"
    enableSystemctl "power-profiles-daemon"
    sudo tee /usr/share/dbus-1/services/org.freedesktop.Notifications.service <<< '[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/notification-daemon-1.0/notification-daemon'
}

myBaseXfce4(){
    packagesManager "$myBase"
    packagesManager "$myGlobalApps"
    packagesManager "$myXfce4"
    packagesManager "$myLightdm"
    enableSystemctl "bluetooth"
    enableSystemctl "NetworkManager"
    enableSystemctl "lightdm"
}

myBaseGnome(){
    packagesManager "$myBase"
    packagesManager "$myGlobalApps"
    packagesManager "$myGnome"
    enableSystemctl "bluetooth"
    enableSystemctl "NetworkManager"
    enableSystemctl "gdm"
}

myBaseKde(){
    packagesManager "$myBase"
    packagesManager "$myGlobalApps"
    packagesManager "$myKde"
    packagesManager "$myKdeApps"
    packagesManager "$mySddm"
    enableSystemctl "bluetooth"
    enableSystemctl "NetworkManager"
    enableSystemctl "sddm"
}
                        
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
                       
appPosVirtManager(){
    packagesManager "qemu libvirt ebtables dnsmasq bridge-utils openbsd-netcat virt-manager" "VirtManager"
    enableSystemctl "libvirtd"  
    sudo virsh net-autostart default
    #sudo virsh net-start default  
}

appPosMix(){
    packagesManager "gufw" "FireWall"
    packagesManager "gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer ffmpeg fwupd" "Plugins Multimedia"
    packagesManager "samba gvfs-smb" "Rede Share"
    packagesManager "flatpak"
    packagesManager "ntfs-3g dosfstools" "Suporte a NTFS e FAT"
    packagesManager "mtpfs" "Default MTP device"
    packagesManager "gvfs gvfs-mtp gvfs-smb" "MTP device"
    packagesManager "udisks2" "Manipular Discos Terminal"
}

appPosInstall(){
    packagesManager ""
    packagesManager "steam"
    packagesManager "mangohud lib32-mangohud"
    packagesManager "gamemode lib32-gamemode gamescope"
    packagesManager "app/com.obsproject.Studio/x86_64/stable runtime/com.obsproject.Studio.Plugin.MoveTransition/x86_64/stable"
    packagesManager "retroarch retroarch-assets-xmb retroarch-assets-ozone libretro-snes9x libretro-mgba libretro-beetle-psx"
}
 
appPosNvidiaDriverProp(){
        #https://github.com/lutris/docs/blob/master/InstallingDrivers.md#arch--manjaro--other-arch-linux-derivatives
        #causa crash no gdm o pacote: nvidia-dkms
        #https://codigocristo.github.io/driver_nvidia.html
        packagesManager "$myNvidia" "Driver NVIDIA Proprietario"
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

hyprconfigs(){
    hyprlandConfig
    wofiConfig
    waybarConfig
    hypranim
}
i3wmConfig(){
    jrswindowcomfoco="1693CF"
    jrswindowsemfoco="7d7d7d"
    #MAIN COLOR 005577, bfbfbf
    echo "[COLORS] Black:000000, Gray:808080, White:FFFFFF (not use #)"
    pickColor "[COLOR] Bar" "212320"
    jrsbar=$pickedColor
    pickColor "[COLOR] Text" "ffffff"
    jrsbartexto=$pickedColor
    pickColor "[COLOR] Window" "$jrswindowcomfoco"
    jrswindowcomfoco=$pickedColor
    jrswindowtextosemfoco=$jrsbar
    jrswindowtextocomfoco=$jrsbartexto
    cd /proc/sys/net/ipv4/conf/
    zerotierAdapter=$(echo zt*)
    lightdmConfig
    i3Config
    i3statusConfig
    rofiConfig
    picomConfig
    polybarsh
    polybarConfig
    powerprofiles
    picomsync
    mangohudConfig
    alacrittyConfig
    fastfetchConfig
    dunstConfig
    hyprconfigs
    themeMode
    sudo rm /usr/share/applications/rofi*
    sudo sed -i 's/OnlyShowIn=XFCE;//g' /usr/share/applications/xfce4-power-manager-settings.desktop
    i3 restart
    sleep 0
}

backlightConfig(){
    #sudo chmod +s /usr/bin/light
    echo 'ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp wheel $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"' | sudo tee /etc/udev/rules.d/backlight.rules
    #criarArq 'light' "$HOME/.config/i3/brightness"
}

xfce4Config(){
    xfce4-panel --quit
    pkill xfconfd
    rm -rf ~/.config/xfce4/panel
    rm -rf ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
    xfce4-config
    xfce4-panel &
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

lnHome(){
    ln -s /media/homec/Desktop $HOME
    ln -s /media/homec/Documents $HOME
    ln -s /media/homec/Downloads $HOME
    ln -s /media/homec/Pictures $HOME
    ln -s /media/homec/Video $HOME
    ln -s /media/homec/Music $HOME
    ln -s /media/homec/Heroic $HOME
}

