#!/usr/bin/bash

#BashMenu Vars
############################
dBashMenu="$HOME/.bashmenu"
nomeRun="run"
DATANOW=$(date "+[%d-%m-%Y][%H-%M]")
############################

## MY BASES ##
myBaseLightdm="lightdm-gtk-greeter lightdm-gtk-greeter-settings lightdm"
myBaseSddm="sddm"
myBaseXfce4="xfce4 xfce4-goodies xfce4-docklike-plugin"
myBaseKde="dolphin dolphin-plugins dragon elisa filelight gwenview leafpad okular kcalc konsole plasma-meta"
myBaseGnome="amberol gnome gnome-tweaks"
myBaseWmApps="polkit-gnome feh nwg-look lxappearance font-manager pcmanfm galculator system-config-printer cmus gnome-keyring seahorse network-manager-applet pavucontrol blueman"
myBaseHyprland="hyprland wofi waybar hyprlock hyprpaper hypridle hyprpicker wl-clipboard xdg-desktop-portal-hyprland grim slurp swaylock"
myBaseBspwm="bspwm sxhkd polybar rofi picom scrot xcolor lxrandr"
myBaseI3wm="i3 i3lock xss-lock i3status dmenu"
myBaseGlobalApps="gimp inkscape shotcut code neovim qbittorrent mpv gparted chromium alacritty bitwarden discord ark libreoffice-fresh xreader kdeconnect"
myBaseSteam="steam"
myBaseMangoHud="mangohud lib32-mangohud"
myBaseGamescope="gamemode lib32-gamemode gamescope"
myBaseOBS="app/com.obsproject.Studio/x86_64/stable runtime/com.obsproject.Studio.Plugin.MoveTransition/x86_64/stable"
myBaseRetroarch="retroarch retroarch-assets-xmb retroarch-assets-ozone libretro-snes9x libretro-mgba libretro-beetle-psx"
##
myBaseKernel="base linux linux-firmware intel-ucode sof-firmware"
myBaseKernelZen="base linux-zen linux-zen-headers linux-firmware intel-ucode sof-firmware"
myBaseBootloader="grub efibootmgr os-prober"
myBaseFileSystem="ntfs-3g exfat-utils dosfstools"
myBaseNetwork="networkmanager"
myBaseFirewall="gufw"
myBaseUtilitys="nano brightnessctl fastfetch stow curl jq imagemagick cmatrix htop xsel pacman-contrib base-devel git ffmpeg fwupd samba udisks2 gvfs gvfs-mtp gvfs-smb polkit net-tools joyutils man-db wireless_tools"
myBaseNvidia="dkms nvidia-dkms xorg-server xorg-xinit nvidia-settings nvidia-utils lib32-nvidia-utils libva-nvidia-driver cuda opencl-nvidia lib32-opencl-nvidia vdpauinfo clinfo"
myBaseIntelOld="xf86-video-intel vulkan-intel libva-intel-driver libvdpau-va-gl"
myBaseIntel="vulkan-intel libva-intel-driver libvdpau-va-gl"
myBaseAmdOld="xf86-video-ati"
myBaseAmd="mesa vulkan-radeon libva-mesa-driver libvdpau-va-gl lib32-mesa lib32-vulkan-radeon lib32-libva-mesa-driver"
myBaseBluetooth="bluez bluez-tools bluez-utils"
myBaseAudioPipeware="pipewire pipewire-alsa pipewire-audio pipewire-jack pipewire-pulse"
myBaseAudioPulse="pulseaudio pulseaudio-alsa pulseaudio-jack pulseaudio-bluetooth"
myBaseCodecs="gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer"
myBaseXorg="xorg xorg-xsetroot xorg-xhost"
myBaseWayland="wayland egl-wayland"
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
