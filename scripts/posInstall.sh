#!/usr/bin/env sh
posInstallDeb(){
        yesorno "Deseja testar conexao?" "teste_internet"
        travas_apt
        justAptUpdate
        addArchi386
        yesorno "Instalar o Flatpak?" "supFlatpak"
        echo "PACOTES:
samba gparted neofetch blueman mpv vlc git wget openjdk-8-jdk openjdk-11-jdk openjdk-17-jdk htop qbittorrent"
        read pacotes
        installPacotes "$pacotes"
        baixaDebs "Chrome" "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
        baixaDebs "vscode" "https://go.microsoft.com/fwlink/?LinkID=760868"
        baixaDebs "Discord" "https://discord.com/api/download?platform=linux&format=deb"
        baixaDebs "Steam" "https://cdn.akamai.steamstatic.com/client/installer/steam.deb"
        yesorno "Deseja instalar os .deb?" "installDebs $diretorioBaixaDebs"
        yesorno "Deseja apagar a pasta dos .deb?" "rm -r $diretorioBaixaDebs"
}

posInstall(){
        while [ "$resp" != "" ];
        do
                clear
                echo "[PosInstall]
[1]Configurar I3WM
[2]Configurar Bluetooth
[3]Configurar Network [ARCH]
[4]Configurar Funcionalidades
[5]Configurar NVIDIA [ARCH]
[6]Configuracoes Manuais
[7]Configurar Touchpad"
                read resp
                if [ "$resp" = "1" ]; then
                        installPacotes "dmenu rofi i3lock i3status feh nitrogen lxrandr htop light pcmanfm falkon scrot terminology"
                        i3wmConfig
                elif [ "$resp" = "2" ]; then
                        echo "[ARCH] Bluetooth"
                        #sudo systemctl enable bluetooth.service
                        #sudo systemctl start bluetooth.service --now
                        enableSystemctl "bluetooth"
                        echo "INSTALAR blueberry"
                        installPacotes "blueberry"
                elif [ "$resp" = "3" ]; then
                        echo "[ARCH] Network"
                        echo "INSTALAR NETWORKMANAGER"
                        installPacotes "networkmanager nm-connection-editor network-manager-applet"
                        #sudo systemctl enable NetworkManager.service
                        #sudo systemctl start NetworkManager.service --now
                        enableSystemctl "NetworkManager"
                        echo "REMOVER IWD (wifi terminal archinstall)"
                        removePacotes "iwd"
                elif [ "$resp" = "4" ]; then
                        clear
                        echo "##################################"
                        echo "Funcionalidades"
                        echo "##################################"
                        echo "Aplicativos"
                        installPacotes "nano git neofetch"
                        echo "FireWall"
                        installPacotes "gufw"
                        echo "[ARCH] Plugins Multimedia"
                        installPacotes "gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer ffmpeg fwupd"
                        echo "Samba para pastas na rede"
                        installPacotes "samba gvfs-smb"
                        echo "[ARCH] Suporte a Flatpak"
                        installPacotes "flatpak"
                        echo "[ARCH] Suporte a NTFS, FAT"
                        installPacotes "ntfs-3g dosfstools"
                        echo "[ARCH] Default MTP device"
                        installPacotes "mtpfs"
                        echo "[ARCH] Gnome MTP device"
                        installPacotes "gvfs gvfs-mtp gvfs-smb"
                        echo "[ARCH] Manipular Discos"
                        installPacotes "udisks2"
                        echo "[ARCH] IFCONFIG"
                        installPacotes "net-tools"
                elif [ "$resp" = "5" ]; then
                        echo "[ARCH] NVIDIA"
                        #https://github.com/lutris/docs/blob/master/InstallingDrivers.md#arch--manjaro--other-arch-linux-derivatives
                        #causa crash no gdm o pacote: nvidia-dkms
                        #https://codigocristo.github.io/driver_nvidia.html
                        installPacotes "nvidia nvidia-settings nvidia-utils lib32-nvidia-utils cuda opencl-nvidia lib32-opencl-nvidia vdpauinfo clinfo"   
                elif [ "$resp" = "6" ]; then
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
"
                        read enterprasair
                elif [ "$resp" = "7" ]; then
                        i3touchpad
                else
                        echo "OPCAO NAO ENCONTRADA!"
                        sleep 1
                fi
        done
        clear
}

i3touchpad(){
        sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
EndSection

EOF
}
#Pacotes da loja GNOME
#sudo pacman -S gnome-software-packagekit-plugin
#Pacotes da loja KDE
#sudo pacman -S packagekit-qt5
#Yay e Paru para gerenciar AUR

i3wmConfig(){
        cp $HOME/.config/i3/config $HOME/.config/i3/config-bkp

        echo "Cor do Tema: [ex:005577]"
        read corBase

        if [ "$corBase" = "" ]; then
               corBase=005577
               echo "Valor vazio, Default $corBase"
        elif [ "`expr length $corBase`" = "6" ]; then
               echo "Escolha $corBase"
        else
                corBase=005577
                echo "Necessario 6 digitos, Default $corBase"    
        fi
        sleep 3
        criarArq '# This file has been auto-generated by i3-config-wizard(1).
# It will not be overwritten, so edit it as you like.
# Should you change your keyboard layout some time, delete
# this file and re-run i3-config-wizard(1).
# i3 config file (v4)
# Please see https://i3wm.org/docs/userguide.html for a complete reference!

#VARs
set $mod Mod4
set $textFont DejaVu Sans Mono 8
set $wallpaper '"$HOME"'/.config/i3/Wallpaper.png
#set $appMenu dmenu_run
#set $appMenu rofi -combi-modi window#drun#ssh#combi -font $textFont -show combi -theme Arc -show-icons 
set $appMenu rofi -combi-modi drun#ssh#combi#run -show combi -window-title Rofi -scroll-method 1 -show-icons -combi-display-format "{text} ({mode})" -config '"$HOME"'/.config/i3/rofi.rasi 
set $appTerminal terminology
set $appF1 falkon
set $appF2 pcmanfm
set $appF3 lxrandr
set $appF4 nitrogen
set $appF5 terminology -e htop

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
#font pango:monospace 8

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
#font pango:DejaVu Sans Mono 8

font pango:$textFont

# Start XDG autostart .desktop files using dex. See also
# https://wiki.archlinux.org/index.php/XDG_Autostart
exec --no-startup-id dex --autostart --environment i3

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# move tiling windows via drag & drop by left-clicking into the title bar,
# or left-clicking anywhere into the window while holding the floating modifier.
tiling_drag modifier titlebar

#screenshot
bindsym Print exec scrot $HOME/`date +%Y-%m-%d_%H:%M:%S`.png

# apps
bindsym $mod+F1 exec $appF1
bindsym $mod+F2 exec $appF2
bindsym $mod+F3 exec $appF3
bindsym $mod+F4 exec $appF4
bindsym $mod+F5 exec $appF5

# start a terminal
#set $appTerminal i3-sensible-terminal
bindsym $mod+Return exec $appTerminal
#for_window [class=$appTerminal] floating enable

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
bindsym $mod+d exec --no-startup-id $appMenu
# A more modern dmenu replacement is rofi:
# bindcode $mod+40 exec "rofi -modi drun,run -show drun"
# There also is i3-dmenu-desktop which only displays applications shipping a
# .desktop file. It is a wrapper around dmenu, so you need that installed.
# bindcode $mod+40 exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+b split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
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

# switch to workspace
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

# move focused container to workspace
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

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
#bindsym $mod+Shift+e exec "i3-nagbar -t warning -m '"'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.'"' -B '"'Yes, exit i3'"' '"'i3-msg exit'"'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window s width.
        # Pressing right will grow the window s width.
        # Pressing up will shrink the window s height.
        # Pressing down will grow the window s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym ccedilla resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)

#############CORES#############

#COM FOCO
set $corcomfoco "#'$corBase'"
set $textocomfoco "#ffffff"

#SEM FOCO
set $corsemfoco "#bfbfbf"
set $textosemfoco "#000000"

#BLACK AND WHITE
set $black "#000000"
set $white "#ffffff"

#i3BARs
set $corbar "#000000"
set $cortexto "#ffffff" #alguns itens a cor esta no i3status

#INDICADOR V e H
set $indcomfoco "#009c66"
set $indsemfoco "#a6ffa4"

############TAMANHOS###########

set $tamanhodasbordas 3px
set $espacoentrejanelas 5px

###############################

title_align center
hide_edge_borders none
default_border normal $tamanhodasbordas
default_floating_border normal $tamanhodasbordas
gaps inner $espacoentrejanelas
gaps outer 0px
smart_gaps off
workspace_layout default

bar {
	status_command i3status --config ~/.config/i3/i3status.conf
	position top
	mode dock
	tray_output primary
	tray_padding 0
	workspace_buttons yes
	workspace_min_width 1
	separator_symbol ":"
	strip_workspace_numbers yes
	strip_workspace_name no
	binding_mode_indicator yes
	padding 0px

	colors {
		#i3bar
		background $corbar
	        statusline $cortexto
	        separator $cortexto

		#<colorclass> 	   /border/bground/text0
	        focused_workspace  $corcomfoco $corcomfoco $cortexto
	        active_workspace   $corbar $corbar $cortexto
	        inactive_workspace $corbar $corbar $cortexto
	        #urgent_workspace   #2f343a #900000 #ffffff
       	 	#binding_mode       #2f343a #900000 #ffffff
    	}

}
# class                 borda  background texto    indicator child_border
client.focused          $corcomfoco $corcomfoco $textocomfoco $corsemfoco $corcomfoco
client.focused_inactive $corsemfoco $corsemfoco $textosemfoco $corsemfoco $corsemfoco
client.unfocused        $corsemfoco $corsemfoco $textosemfoco $corsemfoco $corsemfoco
#client.urgent           #2f343a #900000 #ffffff #900000 #900000
#client.placeholder      #000000 #0c0c0c #ffffffff #000000 #0c0c0c
#client.background       #ffffff

#WALLPAPER
#exec --no-startup-id feh --bg-scale $wallpaper
exec --no-startup-id nitrogen --restore
set $Locker i3lock -c 000000 && sleep 1

#MODOS
set $mode_programs (1)Browser, (2)Files, (3)Display, (4)Wallpaper, (5)Tasks
mode "$mode_programs" {
    bindsym 1 exec $appF1, mode "default"
    bindsym 2 exec $appF2, mode "default"
    bindsym 3 exec $appF3, mode "default"
    bindsym 4 exec $appF4, mode "default"
    bindsym 5 exec $appF5, mode "default"
    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

set $mode_sound Sound (Up), (Down), (M) - Light (Left), (Right)
mode "$mode_sound" {
    bindsym Up exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && $refresh_i3status
    bindsym Down exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && $refresh_i3status
    bindsym m exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
    bindsym Right exec --no-startup-id light -A 5 && echo `light` > /home/jhonatanrs/.config/i3/brightness &&  $refresh_i3status
    bindsym Left exec --no-startup-id light -U 5 && echo `light` > /home/jhonatanrs/.config/i3/brightness  &&  $refresh_i3status
    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

set $mode_system System (l) lock, (e) logout, (s) suspend, (h) hibernate, (r) reboot, (Shift+s) shutdown
mode "$mode_system" {
    bindsym l exec --no-startup-id $Locker, mode "default"
    bindsym e exec --no-startup-id i3-msg exit, mode "default"
    bindsym s exec --no-startup-id $Locker && systemctl suspend, mode "default"
    bindsym h exec --no-startup-id $Locker && systemctl hibernate, mode "default"
    bindsym r exec --no-startup-id systemctl reboot, mode "default"
    bindsym Shift+s exec --no-startup-id systemctl poweroff -i, mode "default"  

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

bindsym $mod+Shift+e mode "$mode_system"
bindsym $mod+m mode "$mode_sound"
bindsym $mod+p mode "$mode_programs"

#TECLADO CONFIG
#setxkbmap -query
#setxkbmap -model pc105 -layout br,us -option grp:alt_caps_toggle

#BRILHO DA TELA
bindsym XF86MonBrightnessUp exec --no-startup-id light -A 5 && echo `light` > '"$HOME"'/.config/i3/brightness &&  $refresh_i3status
bindsym XF86MonBrightnessDown exec --no-startup-id light -U 5 && echo `light` > '"$HOME"'/.config/i3/brightness  &&  $refresh_i3status
set $refresh_i3status killall -SIGUSR1 i3status
' "$HOME/.config/i3/config-jrsbkp.conf"
#
#
#
criarArq '# i3status configuration file.
# see "man i3status" for documentation.

# It is important that this file is edited as UTF-8.
# The following line should contain a sharp s:
# If the above line is not correctly displayed, fix your editor first!

general {
	colors = true
        interval = 5
	color_good = "#FFFFFF"
	color_bad = "#FF0000"
	color_degraded = "#FFFF00"
}

order += "cpu_usage"
order += "memory"
order += "disk /"
order += "ethernet ztwdjcf77e"
order += "wireless _first_"
order += "ethernet _first_"
order += "volume master"
order += "read_file BRIGHTNESS"
order += "battery all"
order += "tztime local"

read_file BRIGHTNESS {
	format = "[☼/%content]"
	path = "'$HOME'/.config/i3/brightness"
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

ethernet ztwdjcf77e {
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
        format = "[%d-%m-%Y %H:%M:%S]"
        align = "right"
        min_width = 1
        separator = false
        separator_block_width = 1
}


' "$HOME/.config/i3/i3status-jrsbkp.conf"

criarArq '
* {

    corcomfoco: #'$corBase';
    textocomfoco: #ffffff;
    corsemfoco: #bfbfbf;
    textosemfoco: #000000;
    black: #000000;
    white: #ffffff;
    corbar: #000000;
    cortexto: #ffffff;
  
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
    background-color: @white;
    handle-color: @corcomfoco;
    width:        4px ;
    border:       0;
    handle-width: 5px;
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
    border-color: @white;
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

        sudo chmod +s /usr/bin/light
        mv $HOME/.config/i3/i3status-jrsbkp.conf $HOME/.config/i3/i3status.conf
        mv $HOME/.config/i3/config-jrsbkp.conf $HOME/.config/i3/config
        criarArq 'light' "$HOME/.config/i3/brightness"
        i3 restart
}

