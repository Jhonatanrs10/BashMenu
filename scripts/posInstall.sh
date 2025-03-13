#!/usr/bin/bash

## MY BASES ##
myBaseLightdm="lightdm-gtk-greeter lightdm-gtk-greeter-settings lightdm"
myBaseSddm="sddm"
myBaseXfce4="xfce4 xfce4-goodies xfce4-docklike-plugin"
myBaseKde="dolphin dolphin-plugins dragon elisa kdeconnect filelight gwenview leafpad okular kcalc konsole plasma-meta"
myBaseGnome="gnome gnome-tweaks"
myBaseHyprland="hyprland wofi waybar hyprlock hyprpicker wl-clipboard grim slurp azote swaybg polkit-gnome acpilight nwg-look lxappearance xfce4-taskmanager gpicview font-manager pcmanfm galculator system-config-printer xreader rhythmbox dragon kdeconnect gnome-keyring seahorse leafpad network-manager-applet pavucontrol blueman"
myBaseBspwm="bspwm sxhkd polkit-gnome polybar rofi picom nitrogen acpilight scrot xcolor nwg-look lxappearance lxrandr xfce4-taskmanager gpicview xfce4-power-manager font-manager pcmanfm galculator system-config-printer xreader rhythmbox dragon kdeconnect gnome-keyring seahorse leafpad network-manager-applet pavucontrol blueman"
myBaseI3wm="i3 i3lock i3status dmenu polkit-gnome polybar rofi picom nitrogen acpilight scrot xcolor nwg-look lxappearance lxrandr xfce4-taskmanager gpicview xfce4-power-manager font-manager pcmanfm galculator system-config-printer xreader rhythmbox dragon kdeconnect gnome-keyring seahorse leafpad network-manager-applet pavucontrol blueman"
myBaseGlobalApps="gimp inkscape shotcut code neovim qbittorrent mpv gparted chromium alacritty bitwarden discord ark"
myBaseSteam="steam"
myBaseMangoHud="mangohud lib32-mangohud"
myBaseGamescope="gamemode lib32-gamemode gamescope"
myBaseOBS="app/com.obsproject.Studio/x86_64/stable runtime/com.obsproject.Studio.Plugin.MoveTransition/x86_64/stable"
myBaseRetroarch="retroarch retroarch-assets-xmb retroarch-assets-ozone libretro-snes9x libretro-mgba libretro-beetle-psx"
##
myBaseKernel="base linux linux-firmware intel-ucode sof-firmware"
myBaseBootloader="grub efibootmgr os-prober"
myBaseFileSystem="ntfs-3g exfat-utils dosfstools"
myBaseNetwork="networkmanager"
myBaseFirewall="gufw"
myBaseUtilitys="nano fastfetch stow curl jq imagemagick cmatrix htop xsel pacman-contrib base-devel git ffmpeg fwupd samba udisks2 gvfs gvfs-mtp gvfs-smb polkit net-tools joyutils man-db wireless_tools"
myBaseNvidia="nvidia-open nvidia-settings nvidia-utils lib32-nvidia-utils libva-nvidia-driver cuda opencl-nvidia lib32-opencl-nvidia vdpauinfo clinfo"
myBaseBluetooth="bluez bluez-tools bluez-utils"
myBaseAudioPipeware="pipewire pipewire-alsa pipewire-audio pipewire-jack pipewire-pulse"
myBaseAudioPulse="pulseaudio pulseaudio-bluetooth"
myBaseCodecs="gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer"
myBaseXorg="xorg xorg-xsetroot xorg-xhost"
myBaseWayland="wayland gl-wayland"
myBaseIcons="papirus-icon-theme"
myBaseThemes="breeze-gtk capitaine-cursors"
myBaseFonts="gnu-free-fonts ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-font-awesome"
myBaseRar="bzip2 cpio gzip lha xz lzop p7zip tar unace unrar zip unzip"
myBaseNotify="libnotify dunst"
myBaseDaemons="notification-daemon power-profiles-daemon"
myBaseFlatpak="flatpak"
myBaseShell="bash bash-completion"
##
myFullBase="$myBaseKernel $myBaseBootloader $myBaseFileSystem $myBaseNetwork $myBaseFirewall $myBaseUtilitys $myBaseBluetooth $myBaseAudioPipeware $myBaseCodecs $myBaseXorg $myBaseWayland $myBaseIcons $myBaseThemes $myBaseFonts $myBaseRar $myBaseNotify $myBaseDaemons $myBaseFlatpak $myBaseShell"

## LIB FUNCTIONS ##

lightdmConfig(){
    echo "[greeter]
theme-name = Breeze-Dark
icon-theme-name = Papirus-Dark
cursor-theme-name = capitaine-cursors
indicators = ~session;~spacer;~clock;~spacer;~power
background = /usr/share/backgrounds/main.png
font-name = Freemono 10" | sudo tee -a /etc/lightdm/lightdm-gtk-greeter.conf
}

sambaSetup(){
    echo "Samba Config
[1]Yes [2]No"
    read resp
    case $resp in
        1)
        sudo mv /etc/samba/smb.conf /etc/samba/smb-bkp$DATANOW.conf
        sudo smbpasswd -a $USER
        mkdir -p $HOME/Samba/User
        sudo chmod 777 $HOME/Samba
        sudo mkdir -p /home/samba
        sudo chmod 777 /home/samba
        echo "[global]
    workgroup = WORKGROUP
    netbios name = Samba
    server string = Samba Server
    server role = standalone server
    security = user
    map to guest = bad user
    guest account = nobody
    log file = /var/log/samba/%m
    log level = 1
    dns proxy = no
[printers]
    comment = All Printers
    path = /usr/spool/samba
    browsable = no
    guest ok = no
    writable = no
    printable = yes
[User]
    comment = Pasta Compartilhada na Rede
    path = $HOME/Samba/User
    browseable = yes
    read only = yes
    guest ok = no
    write list = $USER
    force directory mode = 0777
    directory mode = 0777
    create mode = 0777
[Guest]
    comment = Pasta Compartilhada na Rede
    path = /home/samba
    browseable = yes
    read only = yes
    guest ok = yes
    write list = $USER
    force directory mode = 0777
    directory mode = 0777
    create mode = 0777" | sudo tee -a /etc/samba/smb.conf
        ln -s /home/samba $HOME/Samba/Guest
        ;;
        *)
        ;;
    esac
}


myBaseI3Touchpad(){
    sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
Identifier "touchpad"
MatchIsTouchpad "on"
Driver "libinput"
Option "Tapping" "on"
EndSection
EOF
}

installVirtManager(){
    packagesManager "qemu libvirt ebtables dnsmasq bridge-utils openbsd-netcat virt-manager" "VirtManager"
    enableSystemctl "libvirtd"  
    sudo virsh net-autostart default
    #sudo virsh net-start default  
}

myBaseI3Backlight(){
    #sudo chmod +s /usr/bin/light
    echo 'ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp wheel $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"' | sudo tee /etc/udev/rules.d/backlight.rules
    #criarArq 'light' "$HOME/.config/i3/brightness"
}

## SCRIPT FUNCTIONS ##
myBasePosInstall(){
    echo "INSTALL MYBASE I3WM ?
Options: [1]Yes, [2]No"
    read resp
	case $resp in
		1)
            packagesManager "$myFullBase"
            packagesManager "$myBaseI3wm"
            packagesManager "$myBaseLightdm"
            packagesManager "$myBaseGlobalApps"
            packagesManager "$myBaseOBS"
            packagesManager "$myBaseSteam"
            packagesManager "$myBaseMangoHud"
            packagesManager "$myBaseRetroarch"
            lightdmConfig
            #https://github.com/lutris/docs/blob/master/InstallingDrivers.md#arch--manjaro--other-arch-linux-derivatives
            #causa crash no gdm o pacote: nvidia-dkms
            #https://codigocristo.github.io/driver_nvidia.html
            packagesManager "$myBaseNvidia"
            sudo rm -f /usr/share/applications/rofi*
            if [[ -e "/usr/share/applications/xfce4-power-manager-settings.desktop" ]]; then
                sudo sed -i 's/OnlyShowIn=XFCE;//g' /usr/share/applications/xfce4-power-manager-settings.desktop
            fi  
            myBaseI3Backlight
            myBaseI3Touchpad
            enableSystemctl "smb"
            enableSystemctl "nmb"
            enableSystemctl "bluetooth"
            enableSystemctl "NetworkManager"
            enableSystemctl "power-profiles-daemon"
            enableSystemctl "lightdm"
            sambaSetup 
            ;;
		*)
	esac
}

myBaseGrub(){
        echo "Grub Config
Options: [1]Yes, [2]No"
    read resp
	case $resp in
		1)
            sudo cp /etc/default/grub /etc/default/grub$DATANOW.bkp
            sudo cp /boot/grub/grub.cfg /boot/grub/grub$DATANOW.cfg.bkp
            packagesManager "os-prober"
            sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
            sudo sed -i "/GRUB_DISABLE_OS_PROBER=false/"'s/^#//' /etc/default/grub
            sudo grub-mkconfig -o /boot/grub/grub.cfg
            ;;
        *)
        ;;
    esac
}

myBasePacman(){
     echo "Pacman Config
Options: [1]Yes, [2]No"
    read resp
	case $resp in
		1)
            sudo cp /etc/pacman.conf /etc/pacman$DATANOW.conf.bkp
            sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 10\nILoveCandy\nColor/g' /etc/pacman.conf
            sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
            sudo pacman -Syyu
        ;;
        *)
        ;;
    esac
}

myBaseMountNTFS(){
    echo "Mount /media/homec?
Options: [1]Yes, [2]No"
    read resp
	case $resp in
		1)
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
            ;;
        *)
        ;;
    esac
}

myBaselnHome(){
    echo "Gerar /media/homec links ?
Options: [1]Yes, [2]No"
    read resp
	case $resp in
		1)
        ln -s /media/homec/Desktop $HOME
        ln -s /media/homec/Documents $HOME
        ln -s /media/homec/Downloads $HOME
        ln -s /media/homec/Pictures $HOME
        ln -s /media/homec/Videos $HOME
        ln -s /media/homec/Music $HOME
        ln -s /media/homec/Heroic $HOME
        ;;
        *)
        ;;
    esac
    
}

## Olds ##

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

xfce4Config(){
    xfce4-panel --quit
    pkill xfconfd
    rm -rf ~/.config/xfce4/panel
    rm -rf ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
    xfce4-config
    xfce4-panel &
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

