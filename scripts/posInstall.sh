#!/usr/bin/env sh
myBase="pacman-contrib bzip2 cpio gzip lha xz lzop p7zip tar unace unrar zip unzip wget curl bash bash-completion power-profiles-daemon notification-daemon papirus-icon-theme breeze-gtk capitaine-cursors ntfs-3g dosfstools os-prober nano vim git fastfetch gufw gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer ffmpeg fwupd flatpak gvfs gvfs-mtp gvfs-smb samba udisks2 polkit polkit-gnome net-tools bluez bluez-tools bluez-utils joyutils man-db gnu-free-fonts ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji wireless_tools imagemagick cmatrix htop "
myLightdm="lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings"
myI3wmApps="lxrandr lxappearance xfce4-taskmanager gpicview xfce4-power-manager font-manager pcmanfm galculator system-config-printer blueman pavucontrol volumeicon network-manager-applet ark xreader lxmusic gnome-keyring seahorse leafpad"
myI3wm="i3 polybar i3lock i3status dmenu rofi picom nitrogen acpilight scrot xsel alacritty cpupower pulseaudio pulseaudio-bluetooth libnotify"
myXfceToI3="exo garcon xfce4-appfinder xfce4-panel xfce4-session xfce4-settings xfconf xfdesktop xfwm4 xfce4-screenshooter xfce4-pulseaudio-plugin"
myXfce4="xfce4 xfce4-goodies xfce4-docklike-plugin ark"
myKde="plasma sddm dolphin dolphin-plugins dragon elisa kdeconnect ark filelight gwenview kate okular"
myGnome="gnome gnome-tweaks gnome-shell-extension-gsconnect"
myNvidia="nvidia nvidia-settings nvidia-utils lib32-nvidia-utils libva-nvidia-driver cuda opencl-nvidia lib32-opencl-nvidia vdpauinfo clinfo"
myGlobalApps="gimp inkscape shotcut code qbittorrent mpv gparted chromium alacritty bitwarden"

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

appPosMixMy(){
    packagesManager "$javaPackages"
    packagesManager "discord gimp inkscape shotcut code qbittorrent"
    packagesManager "steam mangohud lib32-mangohud gamemode lib32-gamemode gamescope"
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

appPosLightdmConfig(){
    sudo mkdir -p /usr/share/backgrounds
    sudo chmod 777 /usr/share/backgrounds
    sudo tee /etc/lightdm/lightdm-gtk-greeter.conf <<< '[greeter]
theme-name = Breeze-Dark
icon-theme-name = Papirus-Dark
cursor-theme-name = capitaine-cursors
indicators = ~session;~spacer;~clock;~spacer;~power
background = /usr/share/backgrounds/main.png
font-name = FreeMono 10'
}

i3wmConfig(){
    jrswindowcomfoco="#1693CF"
    #MAIN COLOR 005577, bfbfbf
    echo "[COLORS] Black:#000000, Gray:#808080, White:#FFFFFF"
    forLength "[COLOR] Bar" "7" "#212320"
    jrsbar=$txtForLength
    jrswindowtextosemfoco=$jrsbar
    forLength "[COLOR] Text" "7" "#ffffff"
    jrsbartexto=$txtForLength
    jrswindowtextocomfoco=$jrsbartexto
    forLength "[COLOR] Window" "7" "$jrswindowcomfoco"
    jrswindowcomfoco=$txtForLength
    jrswindowsemfoco="#7d7d7d"
    cd /proc/sys/net/ipv4/conf/
    zerotierAdapter=$(echo zt*)
    my-dotfiles
    #sudo chmod +s /usr/bin/light
    echo 'ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp wheel $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"' | sudo tee /etc/udev/rules.d/backlight.rules
    #criarArq 'light' "$HOME/.config/i3/brightness"
    i3 restart
    sleep 0
}

xfce4Config(){
    xfce4-panel --quit
    pkill xfconfd
    rm -rf ~/.config/xfce4/panel
    rm -rf ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
    xfce4-config
    xfce4-panel &
}

