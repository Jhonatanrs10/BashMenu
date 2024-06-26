#!/usr/bin/env sh
myBase="pulseaudio pulseaudio-bluetooth cpupower xarchiver bzip2 cpio gzip lha xz lzop p7zip tar unace unrar zip unzip wget curl bash bash-completion papirus-icon-theme breeze-gtk capitaine-cursors ntfs-3g dosfstools os-prober nano vim git fastfetch gufw gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer ffmpeg fwupd flatpak gvfs gvfs-mtp gvfs-smb samba udisks2 polkit polkit-gnome net-tools bluez bluez-tools bluez-utils joyutils man-db gnu-free-fonts ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji wireless_tools imagemagick cmatrix htop alacritty"
myLightdm="lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings"
myGlobalApps="lxrandr lxappearance xfce4-taskmanager xfce4-power-manager font-manager pcmanfm galculator system-config-printer blueman pavucontrol volumeicon network-manager-applet xreader mpv gparted chromium gnome-keyring seahorse leafpad"
myI3wm="i3 i3lock i3status dmenu rofi picom feh nitrogen acpilight scrot xsel"
myXfce="exo garcon xfce4-appfinder xfce4-panel xfce4-session xfce4-settings xfconf xfdesktop xfwm4 xfce4-screenshooter xfce4-pulseaudio-plugin"
myGnome="gnome gdm"
myNvidia="nvidia nvidia-settings nvidia-utils lib32-nvidia-utils libva-nvidia-driver cuda opencl-nvidia lib32-opencl-nvidia vdpauinfo clinfo"

appPosMyBase(){
    sudo pacman -S $myBase $myLightdm $myI3wm $myGlobalApps
    enableSystemctl "bluetooth"
    enableSystemctl "NetworkManager"
    enableSystemctl "lightdm"
}

appPosMyBaseUtils(){
    menu12345 "[1] MYBASE
[2] LIGHTDM
[3] I3WM
[4] XFCE
[5] GLOBAL APPS
" "sudo pacman -S $myBase
" "sudo pacman -S $myLightdm
" "sudo pacman -S $myI3wm
" "sudo pacman -S $myXfce
" "sudo pacman -S $myGlobalApps"
    
}
                        
appPosNetwork(){
    echo "[ARCH] Network"
    echo "INSTALAR NETWORKMANAGER"
    installPacotes "networkmanager nm-connection-editor network-manager-applet"
    #sudo systemctl enable NetworkManager.service
    #sudo systemctl start NetworkManager.service --now
    enableSystemctl "NetworkManager"
    #echo "REMOVER IWD (wifi terminal archinstall)"
    #removePacotes "iwd"
}
                       
appPosVirtManager(){
    installPacotes "qemu libvirt ebtables dnsmasq bridge-utils openbsd-netcat virt-manager" "VirtManager"
    enableSystemctl "libvirtd"  
    sudo virsh net-autostart default
    #sudo virsh net-start default  
}

appPosMix(){
    installPacotes "gufw" "FireWall"
    installPacotes "gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer ffmpeg fwupd" "Plugins Multimedia"
    installPacotes "samba gvfs-smb" "Rede Share"
    installPacotes "flatpak"
    installPacotes "ntfs-3g dosfstools" "Suporte a NTFS e FAT"
    installPacotes "mtpfs" "Default MTP device"
    installPacotes "gvfs gvfs-mtp gvfs-smb" "MTP device"
    installPacotes "udisks2" "Manipular Discos Terminal"
}

appPosMixMy(){
    installPacotes "discord gimp inkscape shotcut code qbittorrent" "myAppsUtils [pacman]"
    installPacotes "steam mangohud lib32-mangohud gamemode lib32-gamemode cpupower gamescope" "Steam e Game Utils"
    installPacotes "app/com.obsproject.Studio/x86_64/stable runtime/com.obsproject.Studio.Plugin.MoveTransition/x86_64/stable" "Obs e Plugins"
    installPacotes "retroarch retroarch-assets-xmb retroarch-assets-ozone libretro-snes9x libretro-mgba libretro-beetle-psx" "Retroarch"
}
 
appPosNvidiaDriverProp(){
        #https://github.com/lutris/docs/blob/master/InstallingDrivers.md#arch--manjaro--other-arch-linux-derivatives
        #causa crash no gdm o pacote: nvidia-dkms
        #https://codigocristo.github.io/driver_nvidia.html
        installPacotes "$myNvidia" "Driver NVIDIA Proprietario"
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
        jrswindowcomfoco="#C42428"
        #MAIN COLOR 005577, bfbfbf
        cp $HOME/.config/i3/config $HOME/.config/i3/config-bkp
        echo "[COLORS] Black:#000000, Gray:#808080, White:#FFFFFF"
        forLength "[COLOR] Bar" "7" "#000000"
        jrsbar=$txtForLength
        jrswindowtextosemfoco=$jrsbar
        forLength "[COLOR] Text" "7" "#ffffff"
        jrsbartexto=$txtForLength
        jrswindowtextocomfoco=$jrsbartexto
        forLength "[COLOR] Window" "7" "$jrswindowcomfoco"
        jrswindowcomfoco=$txtForLength
        jrswindowsemfoco="#7d7d7d"
        criarArq '######Jhonatanrs I3-WM config######
set $mod Mod4
set $textFont FreeMono 8
set $appMenu2 dmenu_run
set $appMenu rofi -show combi -config $HOME/.config/i3/rofi.rasi 
set $appTerminal alacritty
set $appFiles pcmanfm
set $appBrowser chromium
set $appF1 pavucontrol
set $appF2 galculator
set $appF3 xfce4-taskmanager
set $appF4 xfce4-power-manager-settings
set $appF5 lxrandr
set $appF6 lxappearance
set $appF7 nitrogen
set $appF8 system-config-printer
set $refresh_i3status killall -SIGUSR1 i3status
set $Locker i3lock -c 000000 -i /usr/share/backgrounds/main.png && sleep 1
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"
set $tamanhodasbordas 3px
set $espacoentrejanelas 5px

###Font###
font pango:$textFont

###AutoStart###
exec --no-startup-id dex --autostart --environment i3
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork
exec --no-startup-id nm-applet
exec --no-startup-id blueman-applet
#exec --no-startup-id volumeicon
exec --no-startup-id xfce4-power-manager
exec --no-startup-id nitrogen --restore
#exec --no-startup-id feh --bg-scale ~/.config/i3/wallpaperI3.png
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
exec --no-startup-id xset -b

###Binds###
bindsym $mod+d exec --no-startup-id $appMenu
bindsym $mod+Shift+d exec --no-startup-id $appMenu2
bindsym $mod+Return exec --no-startup-id $appTerminal
bindsym $mod+Shift+Return exec --no-startup-id i3-sensible-terminal
bindsym $mod+Shift+q kill
bindsym --whole-window $mod+button2 kill
bindsym $mod+x exec --no-startup-id $appFiles
bindsym $mod+c exec --no-startup-id $appBrowser

###Print###
bindsym --release $mod+Print exec mkdir -p ~/Pictures/PrtSc | scrot ~/Pictures/PrtSc/Screenshot_%Y-%m-%d_%H-%M-%S.png
bindsym --release Print exec mkdir -p ~/Pictures/PrtSc | scrot -f -s ~/Pictures/PrtSc/Cutshot_%Y-%m-%d_%H-%M-%S.png
bindsym --release $mod+z exec $HOME/.config/i3/getcol.sh

###Window###
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right
bindsym $mod+Shift+g move absolute position center
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right
bindsym $mod+v split toggle
bindsym $mod+f fullscreen toggle
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split
bindsym $mod+Shift+space floating toggle
bindsym $mod+space focus mode_toggle
bindsym $mod+a focus parent
bindsym $mod+Shift+w sticky toggle
bindsym $mod+b bar mode toggle

###Brightness and Sound###
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status
#bindsym XF86MonBrightnessUp exec --no-startup-id light -A 5 && echo `light` > $HOME/.config/i3/brightness &&  $refresh_i3status
#bindsym XF86MonBrightnessDown exec --no-startup-id light -U 5 && echo `light` > $HOME/.config/i3/brightness  &&  $refresh_i3status
bindsym XF86MonBrightnessUp exec --no-startup-id xbacklight -dec 5 &&  $refresh_i3status
bindsym XF86MonBrightnessDown exec --no-startup-id xbacklight -inc 5 &&  $refresh_i3status

###Workspaces###
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10
bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart
floating_modifier $mod

###i3Configs###
tiling_drag modifier titlebar
title_align center
hide_edge_borders none
default_border pixel $tamanhodasbordas
for_window [all] title_window_icon padding 5px
default_floating_border pixel $tamanhodasbordas
gaps inner $espacoentrejanelas
gaps outer 0px
smart_gaps off
workspace_layout default
#for_window [class=$appTerminal] floating disable
#for_window [title=$appF2] floating enable
#for_window [instance=nvidia-settings] floating enable
#for_window [instance=$appMenu] floating enable resize set 600 300

###I3BARS###
bar {
	status_command i3status --config ~/.config/i3/i3status.conf
	position top
	mode dock
	#tray_output primary
    #tray_output HDMI-0
	tray_padding 2
	workspace_buttons yes
	workspace_min_width 25
	separator_symbol ":"
	strip_workspace_numbers yes
	strip_workspace_name no
	binding_mode_indicator yes
	padding 0 0 5 0
	colors {
	    #i3bar
	    background '$jrsbar'
	    statusline '$jrsbartexto'
	    separator '$jrsbartexto'
	    focused_workspace  '$jrswindowcomfoco' '$jrsbar' '$jrsbartexto'
	    active_workspace   '$jrsbar' '$jrsbar' '$jrsbartexto'
	    inactive_workspace '$jrsbar' '$jrsbar' '$jrsbartexto'
	    urgent_workspace   '$jrsbar' #900000 '$jrsbartexto'
       	binding_mode       '$jrsbar' '$jrsbar' '$jrsbartexto'
    }
}
#class                  borda       background  texto         indicator   child_border
client.focused          '$jrswindowcomfoco' '$jrswindowcomfoco' '$jrswindowtextocomfoco' '$jrswindowcomfoco' '$jrswindowcomfoco'
client.focused_inactive '$jrswindowsemfoco' '$jrswindowsemfoco' '$jrswindowtextosemfoco' '$jrswindowsemfoco' '$jrswindowsemfoco'
client.unfocused        '$jrswindowsemfoco' '$jrswindowsemfoco' '$jrswindowtextosemfoco' '$jrswindowsemfoco' '$jrswindowsemfoco'
client.urgent           #2f343a #900000 #ffffff #900000 #900000
client.placeholder      #000000 #0c0c0c #ffffff #000000 #0c0c0c
client.background       #ffffff

###MODOS###
set $mode_programs [1/Sound][2/Calc][3/Tasks][4/Energy][5/Display][6/Looks][7/I3Paper][8/Printer][9/Picom]
mode "$mode_programs" {
    bindsym 1 exec --no-startup-id $appF1, mode "default"
    bindsym 2 exec --no-startup-id $appF2, mode "default"
    bindsym 3 exec --no-startup-id $appF3, mode "default"
    bindsym 4 exec --no-startup-id $appF4, mode "default"
    bindsym 5 exec --no-startup-id $appF5, mode "default"
    bindsym 6 exec --no-startup-id $appF6, mode "default"
    bindsym 7 exec --no-startup-id $appF7 && convert -resize "$(xrandr | grep "*" | awk '"'"'{ print $1 }'"'"')!" -blur 0x10 $(cat .config/nitrogen/bg-saved.cfg | sed -n '"'"'2 p'"'"' | sed '"'"'s/file=//'"'"') /usr/share/backgrounds/main.png, mode "default"
    #bindsym 7 exec --no-startup-id $appF7 && convert -resize "$(xrandr | grep "*" | awk '"'"'{ print $1 }'"'"')!" -blur 0x10 $(cat .config/nitrogen/bg-saved.cfg | sed -n '"'"'2 p'"'"' | sed '"'"'s/file=//'"'"') $HOME/.config/i3/wallpaperI3Lock.png, mode "default"
    bindsym 8 exec --no-startup-id $appF8, mode "default"
    bindsym 9 exec --no-startup-id picom --config ~/.config/i3/picom.conf, mode "default"
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+p mode "$mode_programs"

set $mode_sound [Sound and Light]
mode "$mode_sound" {
    bindsym $mod+Up exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ 100% && $refresh_i3status
    bindsym $mod+Down exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ 50% && $refresh_i3status
    bindsym Up exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && $refresh_i3status
    bindsym Down exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && $refresh_i3status
    bindsym m exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
    bindsym Right exec --no-startup-id xbacklight -dec 5 &&  $refresh_i3status
    bindsym Left exec --no-startup-id xbacklight -inc 5 &&  $refresh_i3status
    #bindsym 4 exec --no-startup-id light -A 5 && echo `light` > $HOME/.config/i3/brightness &&  $refresh_i3status
    #bindsym 5 exec --no-startup-id light -U 5 && echo `light` > $HOME/.config/i3/brightness  &&  $refresh_i3status
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+m mode "$mode_sound"

set $mode_system [1/Lock][2/Logout][3/Suspend][4/Switch][5/Hibernate][6/Reboot][7/Shutdown]
mode "$mode_system" {
    bindsym 1 exec --no-startup-id $Locker, mode "default"
    bindsym 2 exec --no-startup-id i3-msg exit, mode "default"
    bindsym 3 exec --no-startup-id $Locker && systemctl suspend, mode "default"
    bindsym 4 exec --no-startup-id dm-tool lock, mode "default"
    bindsym 5 exec --no-startup-id $Locker && systemctl hibernate, mode "default"
    bindsym 6 exec --no-startup-id systemctl reboot, mode "default"
    bindsym 7 exec --no-startup-id systemctl poweroff -i, mode "default"  
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+Shift+e mode "$mode_system"

set $mode_resize [Resize]
mode "$mode_resize" {
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym ccedilla resize grow width 10 px or 10 ppt
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt
        bindsym Return mode "default"
        bindsym Escape mode "default"
}
bindsym $mod+r mode "$mode_resize"
' "$HOME/.config/i3/config-jrsbkp.conf"

cd /proc/sys/net/ipv4/conf/
zerotierAdapter=$(echo zt*)

criarArq '# i3status configuration file.
# see "man i3status" for documentation.

# It is important that this file is edited as UTF-8.
# The following line should contain a sharp s:
# If the above line is not correctly displayed, fix your editor first!

general {
	colors = true
        interval = 5
	color_good = "'$jrsbartexto'"
	color_bad = "#FF0000"
	color_degraded = "#FFFF00"
}

order += "cpu_usage"
order += "memory"
order += "disk /"
#order += "disk /home"
order += "ethernet '$zerotierAdapter'"
order += "wireless _first_"
order += "ethernet _first_"
order += "volume master"
#order += "read_file BRIGHTNESS"
order += "battery all"
order += "tztime local"
#order += "tztime local1"

read_file BRIGHTNESS {
	format = "[☼/%content]"
	#path = "'$HOME'/.config/i3/brightness"
    path = "/sys/class/backlight/intel_backlight/brightness"
	max_characters = 5
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

cpu_usage {
	format = "[CPU/%usage]"
	max_threshold = 75
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

volume master {
	format = "[♪/%volume]"
	format_muted = "[♪/muted]"
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

wireless _first_ {
    format_up = "[W/%ip]"
	format_down = ""
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

ethernet _first_ {
    format_up = "[E/%ip]"
    format_down = ""
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

ethernet '$zerotierAdapter' {
    format_up = "[Z/%ip]"
    format_down = ""
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
    #diretorio com as redes /proc/sys/net/ipv4/conf/
}

battery all {
    format = "[%status/%percentage]"
    format_percentage = "%.00f%s"
    format_down = ""
	status_chr = "CHR"
    status_bat = "BAT"
    status_unk = "?"
	status_full = "FULL"
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

disk "/" {
    format = "[SSD/%used]"
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

disk "/home" {
    format = "[HDD/%used]"
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

load {
    format = "%1min"
}

memory {
    format = "[RAM/%used]"
    threshold_degraded = "1G"
    format_degraded = "[RAM/%used]"
	separator = false
	separator_block_width = 1
	align = "center"
    min_width = 1
}

tztime local {
    format = "[%a.%d %b %H:%M]"
    align = "right"
    min_width = 1
    separator = false
    separator_block_width = 1
}

tztime local1 {
    format = "[%d-%m-%Y %H:%M:%S]"
    align = "right"
    min_width = 1
    separator = false
    separator_block_width = 1
}


' "$HOME/.config/i3/i3status-jrsbkp.conf"

criarArq '* {

    corcomfoco: '$jrswindowcomfoco';
    textocomfoco: '$jrswindowtextocomfoco';
    corsemfoco: '$jrswindowsemfoco';
    textosemfoco: '$jrswindowtextosemfoco';
    corbar: '$jrsbar';
    cortexto: '$jrsbartexto';
  
}

configuration {
    drun {
        display-name: "Desktop";
    }
    run {
        display-name: "Terminal";
    }
    ssh {
        display-name: "ssh";
    }
    window {
        display-name: "Program";
    }
    combi {
        display-name: " Search";
    }

    combi-modi: "drun,ssh,combi";
    window-title: "Rofi";
    scroll-method: 1; 
    show-icons: true;
    combi-display-format: "{text} ({mode})";
}

window {
    background-color: @corbar;
    border-color: @corcomfoco;
    border:           3;
    padding:          0;
    width: 50%;
    height: 40%;
}
mainbox {
    border:  0;
    padding: 0;
}
message {
    border:       0px 0px 0px ;
    border-color: @corcomfoco;
    padding:      1px ;
}
textbox {
    text-color: @textocomfoco;
}
listview {
    fixed-height: 1;
    border:       0px 0px 0px ;
    border-color: @corcomfoco;
    spacing:      0px ;
    scrollbar:    true;
    padding:      0px 0px 10px 0px ;
}
element {
    border:  0;
    padding: 3px 10px 3px 10px ;
}
element-text {
    background-color: inherit;
    text-color:       inherit;
}
element.normal.normal {
    background-color: @corbar;
    text-color:       @textocomfoco;
}
element.normal.urgent {
    background-color: @corbar;
    text-color:       @textocomfoco;
}
element.normal.active {
    background-color: @corbar;
    text-color:       @corcomfoco;
}
element.selected.normal {
    background-color: @corcomfoco;
    text-color:       @textocomfoco;
}
element.selected.urgent {
    background-color: @corbar;
    text-color:       @textocomfoco;
}
element.selected.active {
    background-color: @corcomfoco;
    text-color:       @textocomfoco;
}
element.alternate.normal {
    background-color: @corbar;
    text-color:       @textocomfoco;
}
element.alternate.urgent {
    background-color: @corbar;
    text-color:       @textocomfoco;
}
element.alternate.active {
    background-color: @corbar;
    text-color:       @corcomfoco;
}
scrollbar {
    background-color: @cortexto;
    handle-color: @corsemfoco;
    width:        4px ;
    border:       0;
    handle-width: 3px;
    padding:      0;
}
mode-switcher {
    border:       2px 0px 0px ;
    border-color: @corcomfoco;
}
button.selected {
    background-color: @corbar;
    text-color:       @textocomfoco;
}
inputbar {
    spacing:    5;
    text-color: @textocomfoco;
    padding:    1px ;
}
case-indicator {
    spacing:    2;
    text-color: @textocomfoco;
}
entry {
    spacing:    2;
    text-color: @textocomfoco;
}
prompt {
    spacing:    2;
    text-color: @textocomfoco;
}
inputbar {
    border-color: @cortexto;
    border: 0px 0px 1px 0px;
    margin: 5px 10px 10px 10px;
    padding: 5px 0px 5px 0px;
    children:   [ prompt,textbox-prompt-colon,entry,case-indicator ];
}
textbox-prompt-colon {
    expand:     false;
    str:        ": ";
    margin:     0px ;
    text-color: @textocomfoco;
}

' "$HOME/.config/i3/rofi.rasi"

criarArq 'shadow = false;
fading = false;
fade-in-step = 0.1;
fade-out-step = 1;
fade-delta = 10;
inactive-opacity = 1 ;
frame-opacity = 0.9;
menu-opacity = 0.9;
inactive-opacity-override = false;
vsync = false;
unredir-if-possible = false;
backend = "xrender";
opacity-rule = [
        "90:class_g = '"'Alacritty'"'"
];
' "$HOME/.config/i3/picom.conf"

criarArq '#!/bin/sh
getcol=$(rm /tmp/getcol.png
    scrot -s /tmp/getcol.png
    convert /tmp/getcol.png \
	-define histogram:unique-colors=true \
	-format %c histogram:info:- | \
	sort -nr | \
	sed -n '"'""1s/[^#]*\([^ ]*\).*/\1/p""'"')
echo $getcol | xsel -bi
' "$HOME/.config/i3/getcol.sh"

        sudo chmod 777 $HOME/.config/i3/getcol.sh
        #sudo chmod +s /usr/bin/light
        mv $HOME/.config/i3/i3status-jrsbkp.conf $HOME/.config/i3/i3status.conf
        mv $HOME/.config/i3/config-jrsbkp.conf $HOME/.config/i3/config
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
    criarArqv2 '<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfce4-panel" version="1.0">
  <property name="configver" type="int" value="2"/>
  <property name="panels" type="array">
    <value type="int" value="1"/>
    <property name="dark-mode" type="bool" value="true"/>
    <property name="panel-1" type="empty">
      <property name="position" type="string" value="p=6;x=683;y=14"/>
      <property name="length" type="uint" value="100"/>
      <property name="position-locked" type="bool" value="true"/>
      <property name="icon-size" type="uint" value="16"/>
      <property name="size" type="uint" value="26"/>
      <property name="plugin-ids" type="array">
        <value type="int" value="1"/>
        <value type="int" value="4"/>
        <value type="int" value="2"/>
        <value type="int" value="3"/>
        <value type="int" value="5"/>
        <value type="int" value="6"/>
        <value type="int" value="8"/>
        <value type="int" value="9"/>
        <value type="int" value="10"/>
        <value type="int" value="11"/>
        <value type="int" value="12"/>
        <value type="int" value="13"/>
        <value type="int" value="7"/>
      </property>
      <property name="background-style" type="uint" value="1"/>
      <property name="background-rgba" type="array">
        <value type="double" value="0"/>
        <value type="double" value="0"/>
        <value type="double" value="0"/>
        <value type="double" value="1"/>
      </property>
    </property>
  </property>
  <property name="plugins" type="empty">
    <property name="plugin-2" type="string" value="tasklist">
      <property name="grouping" type="uint" value="1"/>
    </property>
    <property name="plugin-3" type="string" value="separator">
      <property name="expand" type="bool" value="true"/>
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-4" type="string" value="pager"/>
    <property name="plugin-5" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-6" type="string" value="systray">
      <property name="square-icons" type="bool" value="true"/>
      <property name="known-legacy-items" type="array">
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (61%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (100%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (76%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (80%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (89%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (79%)"/>
      </property>
      <property name="known-items" type="array">
        <value type="string" value="blueman"/>
      </property>
    </property>
    <property name="plugin-8" type="string" value="pulseaudio">
      <property name="enable-keyboard-shortcuts" type="bool" value="true"/>
      <property name="show-notifications" type="bool" value="true"/>
    </property>
    <property name="plugin-9" type="string" value="power-manager-plugin"/>
    <property name="plugin-10" type="string" value="notification-plugin"/>
    <property name="plugin-11" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-12" type="string" value="clock">
      <property name="timezone" type="string" value="America/Sao_Paulo"/>
      <property name="command" type="string" value=""/>
    </property>
    <property name="plugin-13" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-1" type="string" value="applicationsmenu">
      <property name="button-icon" type="string" value="desktop-environment-xfce"/>
      <property name="button-title" type="string" value=""/>
      <property name="show-tooltips" type="bool" value="false"/>
      <property name="show-generic-names" type="bool" value="false"/>
      <property name="small" type="bool" value="false"/>
    </property>
    <property name="plugin-7" type="string" value="showdesktop"/>
  </property>
</channel>' "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml"
    xfce4-panel &
}
