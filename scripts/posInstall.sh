#!/usr/bin/env sh
myBase="base linux linux-firmware base-devel pacman-contrib bzip2 cpio gzip lha xz lzop p7zip tar unace unrar zip unzip wget curl bash bash-completion power-profiles-daemon notification-daemon papirus-icon-theme breeze-gtk capitaine-cursors networkmanager intel-ucode git sof-firmware grub efibootmgr ntfs-3g dosfstools os-prober nano vim fastfetch gufw gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer ffmpeg fwupd flatpak gvfs gvfs-mtp gvfs-smb samba udisks2 polkit polkit-gnome net-tools bluez bluez-tools bluez-utils joyutils man-db gnu-free-fonts ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji wireless_tools imagemagick cmatrix htop"
myLightdm="lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings"
myI3wmApps="lxrandr lxappearance xfce4-taskmanager gpicview xfce4-power-manager font-manager pcmanfm galculator system-config-printer blueman pavucontrol volumeicon network-manager-applet ark xreader rhythmbox dragon kdeconnect gnome-keyring seahorse leafpad"
myI3wm="i3 polybar i3lock i3status dmenu rofi picom nitrogen acpilight scrot xcolor alacritty pulseaudio pulseaudio-bluetooth libnotify"
myXfceToI3="exo garcon xfce4-appfinder xfce4-panel xfce4-session xfce4-settings xfconf xfdesktop xfwm4 xfce4-screenshooter xfce4-pulseaudio-plugin"
myXfce4="xfce4 xfce4-goodies xfce4-docklike-plugin ark"
myKde="plasma sddm dolphin dolphin-plugins dragon elisa kdeconnect ark filelight gwenview kate okular"
myGnome="gnome gnome-tweaks"
myNvidia="nvidia nvidia-settings nvidia-utils lib32-nvidia-utils libva-nvidia-driver cuda opencl-nvidia lib32-opencl-nvidia vdpauinfo clinfo"
myGlobalApps="gimp inkscape shotcut code qbittorrent mpv gparted chromium alacritty bitwarden discord"
myHyprland="hyprland hyprpaper wofi waybar hyprlock"

source dotfiles.sh

myBaseI3wm(){
    sudo pacman -S $myBase $myLightdm $myI3wm $myI3wmApps $myGlobalApps
    enableSystemctl "bluetooth"
    enableSystemctl "NetworkManager"
    enableSystemctl "lightdm"
    enableSystemctl "power-profiles-daemon"
    sudo tee /usr/share/dbus-1/services/org.freedesktop.Notifications.service <<< '[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/notification-daemon-1.0/notification-daemon'
}

myBaseXfce4(){
    yay -S $myBase $myLightdm $myXfce4 $myGlobalApps
    enableSystemctl "bluetooth"
    enableSystemctl "NetworkManager"
    enableSystemctl "lightdm"
}

myBaseGnome(){
    yay -S $myBase $myGnome $myGlobalApps
    enableSystemctl "bluetooth"
    enableSystemctl "NetworkManager"
    enableSystemctl "gdm"
}

myBaseKde(){
    yay -S $myBase $myKde $myGlobalApps
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

i3wmConfig(){
    jrswindowcomfoco="1693CF"
    #MAIN COLOR 005577, bfbfbf
    echo "[COLORS] Black:000000, Gray:808080, White:FFFFFF (not use #)"
    forLength "[COLOR] Bar" "6" "212320"
    jrsbar=$txtForLength
    jrswindowtextosemfoco=$jrsbar
    forLength "[COLOR] Text" "6" "ffffff"
    jrsbartexto=$txtForLength
    jrswindowtextocomfoco=$jrsbartexto
    forLength "[COLOR] Window" "6" "$jrswindowcomfoco"
    jrswindowcomfoco=$txtForLength
    jrswindowsemfoco="7d7d7d"
    cd /proc/sys/net/ipv4/conf/
    zerotierAdapter=$(echo zt*)
    modeDarkLight
    my-dotfiles
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

modeDarkLight(){
    mkdir -p $HOME/.config/gtk-2.0/
    mkdir -p $HOME/.config/gtk-3.0/
    mkdir -p $HOME/.config/gtk-4.0/
    dirSettings0="/etc/lightdm/lightdm-gtk-greeter.conf"
    dirSettings1="$HOME/.gtkrc-2.0"
    dirSettings2="$HOME/.config/gtk-2.0/settings.ini"
    dirSettings3="$HOME/.config/gtk-3.0/settings.ini"
    dirSettings4="$HOME/.config/gtk-4.0/settings.ini"
    notifyValueNow=$jrsbartexto
    sed -i '/gtk-theme-name/d' $dirSettings3
    sed -i '/gtk-icon-theme-name/d' $dirSettings3
    sed -i '/gtk-cursor-theme-name/d' $dirSettings3
    sed -i '/gtk-font-name/d' $dirSettings3
    sed -i '/gtk-theme-name/d' $dirSettings1
    sed -i '/gtk-icon-theme-name/d' $dirSettings1
    sed -i '/gtk-cursor-theme-name/d' $dirSettings1
    sed -i '/gtk-font-name/d' $dirSettings1
    sudo sed -i '/theme-name =/d' $dirSettings0
    sudo sed -i '/icon-theme-name =/d' $dirSettings0
    sudo sed -i '/cursor-theme-name =/d' $dirSettings0
    sudo sed -i '/font-name/d' $dirSettings0
    case $notifyValueNow in
    000000)
        echo "gtk-theme-name=Breeze
gtk-icon-theme-name=Papirus-Light
gtk-cursor-theme-name=capitaine-cursors-light
gtk-font-name=$dotFont 10" >> $dirSettings3
        echo 'gtk-theme-name="Breeze"
gtk-icon-theme-name="Papirus-Light"
gtk-cursor-theme-name="capitaine-cursors-light"
gtk-font-name="'$dotFont' 10"' >> $dirSettings1
        sudo tee -a $dirSettings0 <<< 'theme-name = Breeze
icon-theme-name = Papirus-Light
cursor-theme-name = capitaine-cursors-light
font-name = '$dotFont' 10'
        cp $dirSettings3 $dirSettings2
        cp $dirSettings3 $dirSettings4
      #notify-send --hint int:transient:1 "Theme Mode" "Light" --icon=org.xfce.powermanager
      ;;
    ffffff)
        echo "gtk-theme-name=Breeze-Dark
gtk-icon-theme-name=Papirus-Dark
gtk-cursor-theme-name=capitaine-cursors
gtk-font-name=$dotFont 10" >> $dirSettings3
        echo 'gtk-theme-name="Breeze-Dark"
gtk-icon-theme-name="Papirus-Dark"
gtk-cursor-theme-name="capitaine-cursors"
gtk-font-name="'$dotFont' 10"' >> $dirSettings1
        sudo tee -a $dirSettings0 <<< 'theme-name = Breeze-Dark
icon-theme-name = Papirus-Dark
cursor-theme-name = capitaine-cursors
font-name = '$dotFont' 10'
        cp $dirSettings3 $dirSettings2
        cp $dirSettings3 $dirSettings4
      #notify-send --hint int:transient:1 "Theme Mode" "Dark" --icon=org.xfce.powermanager
      ;;
    *)
      ;;
  esac
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

