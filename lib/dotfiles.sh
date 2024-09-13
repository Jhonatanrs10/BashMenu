#!/usr/bin/env sh
my-dotfiles(){
    i3-config
    xfce4-config
    i3status-config
    rofi-config
    picom-config
    getcol-file
    polybar-launch
    polybar-config
    power-profiles
    mangohud-config
    set-wallpaper-to-lock
}

i3-config(){
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
#set $refresh_i3status killall -SIGUSR1 i3status
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
exec --no-startup-id picom --config ~/.config/i3/picom.conf
exec_always --no-startup-id $HOME/.config/i3/polybar.sh
exec --no-startup-id dex --autostart --environment i3
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork
exec --no-startup-id nm-applet
exec --no-startup-id blueman-applet
exec --no-startup-id volumeicon
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
bindsym Mod1+F4 kill
bindsym --whole-window $mod+button2 floating toggle
bindsym $mod+x exec --no-startup-id $appFiles
bindsym $mod+c exec --no-startup-id $appBrowser
bindsym $mod+n exec --no-startup-id $appF7 && convert -resize "$(xrandr | grep "*" | awk '"'"'{ print $1 }'"'"')!" -blur 0x10 $(cat .config/nitrogen/bg-saved.cfg | sed -n '"'"'2 p'"'"' | sed '"'"'s/file=//'"'"') /usr/share/backgrounds/main.png, mode "default"
#bindsym 7 exec --no-startup-id $appF7 && convert -resize "$(xrandr | grep "*" | awk '"'"'{ print $1 }'"'"')!" -blur 0x10 $(cat .config/nitrogen/bg-saved.cfg | sed -n '"'"'2 p'"'"' | sed '"'"'s/file=//'"'"') $HOME/.config/i3/wallpaperI3Lock.png, mode "default"
bindsym $mod+Ctrl+p exec --no-startup-id picom --config ~/.config/i3/picom.conf, mode "default"
bindsym $mod+Shift+p exec --no-startup-id killall picom
bindsym $mod+Ctrl+b bar mode toggle
bindsym $mod+b exec --no-startup-id polybar-msg cmd toggle
bindsym $mod+p exec --no-startup-id $HOME/.config/i3/powerProfiles.sh

###Power###
bindsym $mod+l exec --no-startup-id $Locker
bindsym $mod+Shift+e exec --no-startup-id i3-msg exit
bindsym $mod+Ctrl+7 exec --no-startup-id $Locker && systemctl suspend
bindsym $mod+Ctrl+l exec --no-startup-id dm-tool lock
bindsym $mod+Ctrl+8 exec --no-startup-id $Locker && systemctl hibernate
bindsym $mod+Ctrl+9 exec --no-startup-id systemctl reboot
bindsym $mod+Ctrl+0 exec --no-startup-id systemctl poweroff -i

###Print###
bindsym --release $mod+Print exec --no-startup-id mkdir -p ~/Pictures/PrtSc | scrot ~/Pictures/PrtSc/Screenshot_%Y-%m-%d_%H-%M-%S.png
bindsym --release Print exec --no-startup-id mkdir -p ~/Pictures/PrtSc | scrot -f -s ~/Pictures/PrtSc/Cutshot_%Y-%m-%d_%H-%M-%S.png
bindsym --release $mod+z exec --no-startup-id $HOME/.config/i3/getcol.sh

###Window###
bindsym Mod1+Tab focus right
bindsym $mod+g focus left
bindsym $mod+h focus down
bindsym $mod+j focus up
bindsym $mod+k focus right
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right
bindsym $mod+m move absolute position center
bindsym $mod+Shift+g move left
bindsym $mod+Shift+h move down
bindsym $mod+Shift+j move up
bindsym $mod+Shift+k move right
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

###Brightness and Sound###
#bindsym $mod+Ctrl+Up exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ 100%
#bindsym $mod+Ctrl+Down exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ 50% 
bindsym $mod+Ctrl+Up exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%
bindsym $mod+Ctrl+Down exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% 
bindsym $mod+Ctrl+m exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle 
bindsym $mod+Ctrl+Right exec --no-startup-id xbacklight -dec 5
bindsym $mod+Ctrl+Left exec --no-startup-id xbacklight -inc 5
#bindsym 4 exec --no-startup-id light -A 5 && echo `light` > $HOME/.config/i3/brightness
#bindsym 5 exec --no-startup-id light -U 5 && echo `light` > $HOME/.config/i3/brightness
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
#bar {
#	status_command i3status --config ~/.config/i3/i3status.conf
#	position top
#	mode dock
#	#tray_output primary
#    #tray_output HDMI-0
#	tray_padding 2
#	workspace_buttons yes
#	workspace_min_width 25
#	separator_symbol ":"
#	strip_workspace_numbers yes
#	strip_workspace_name no
#	binding_mode_indicator yes
#	padding 0 0 5 0
#	colors {
#	    #i3bar
#	    background '$jrsbar'
#	    statusline '$jrsbartexto'
#	    separator '$jrsbartexto'
#	    focused_workspace  '$jrswindowcomfoco' '$jrsbar' '$jrsbartexto'
#	    active_workspace   '$jrsbar' '$jrsbar' '$jrsbartexto'
#	    inactive_workspace '$jrsbar' '$jrsbar' '$jrsbartexto'
#	    urgent_workspace   '$jrsbar'  #900000  '$jrsbartexto'
#       binding_mode       '$jrsbar' '$jrsbar' '$jrsbartexto'
#    }
#}
#class                  borda       background  texto         indicator   child_border
client.focused          '$jrswindowcomfoco' '$jrswindowcomfoco' '$jrswindowtextocomfoco' '$jrswindowcomfoco' '$jrswindowcomfoco'
client.focused_inactive '$jrswindowsemfoco' '$jrswindowsemfoco' '$jrswindowtextosemfoco' '$jrswindowsemfoco' '$jrswindowsemfoco'
client.unfocused        '$jrswindowsemfoco' '$jrswindowsemfoco' '$jrswindowtextosemfoco' '$jrswindowsemfoco' '$jrswindowsemfoco'
client.urgent           #2f343a #900000 #ffffff #900000 #900000
client.placeholder      #000000 #0c0c0c #ffffff #000000 #0c0c0c
client.background       #ffffff

###MODOS###
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
' "$HOME/.config/i3/config"
}

xfce4-config(){
    criarArqv2 '<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfce4-panel" version="1.0">
  <property name="configver" type="int" value="2"/>
  <property name="panels" type="array">
    <value type="int" value="1"/>
    <property name="dark-mode" type="bool" value="true"/>
    <property name="panel-1" type="empty">
      <property name="position" type="string" value="p=8;x=683;y=753"/>
      <property name="length" type="uint" value="100"/>
      <property name="position-locked" type="bool" value="true"/>
      <property name="icon-size" type="uint" value="16"/>
      <property name="size" type="uint" value="34"/>
      <property name="plugin-ids" type="array">
        <value type="int" value="16"/>
        <value type="int" value="22"/>
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
      <property name="background-style" type="uint" value="0"/>
      <property name="background-rgba" type="array">
        <value type="double" value="0"/>
        <value type="double" value="0"/>
        <value type="double" value="0"/>
        <value type="double" value="1"/>
      </property>
    </property>
  </property>
  <property name="plugins" type="empty">
    <property name="plugin-3" type="string" value="separator">
      <property name="expand" type="bool" value="true"/>
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-5" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-6" type="string" value="systray">
      <property name="square-icons" type="bool" value="true"/>
      <property name="known-legacy-items" type="array">
        <value type="string" value="networkmanager applet"/>
        <value type="string" value="xfce4-power-manager"/>
        <value type="string" value="wi-fi network connection “davi3” active: davi3 (75%)"/>
        <value type="string" value="wi-fi network connection “davi3” active: davi3 (65%)"/>
        <value type="string" value="blueberry-tray.py"/>
        <value type="string" value="wi-fi network connection “davi3” active: davi3 (66%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (61%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (100%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (76%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (80%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (89%)"/>
        <value type="string" value="wi-fi network connection “casa 01” active: casa 01 (79%)"/>
      </property>
      <property name="known-items" type="array">
        <value type="string" value="KDE Connect Indicator"/>
        <value type="string" value="blueman"/>
      </property>
    </property>
    <property name="plugin-8" type="string" value="pulseaudio">
      <property name="enable-keyboard-shortcuts" type="bool" value="true"/>
      <property name="show-notifications" type="bool" value="true"/>
      <property name="known-players" type="string" value="Chrome;org.kde.kdeconnect.app"/>
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
    <property name="plugin-7" type="string" value="showdesktop"/>
    <property name="plugin-16" type="string" value="whiskermenu">
      <property name="recent" type="array">
        <value type="string" value="code-oss.desktop"/>
        <value type="string" value="bitwarden.desktop"/>
        <value type="string" value="xfce4-power-manager-settings.desktop"/>
        <value type="string" value="org.kde.kdeconnect.nonplasma.desktop"/>
        <value type="string" value="org.kde.kdeconnect.app.desktop"/>
        <value type="string" value="xfce-settings-manager.desktop"/>
        <value type="string" value="xfce4-taskmanager.desktop"/>
        <value type="string" value="Alacritty.desktop"/>
        <value type="string" value="google-chrome.desktop"/>
      </property>
      <property name="button-icon" type="string" value="org.xfce.panel.whiskermenu"/>
    </property>
    <property name="plugin-22" type="string" value="docklike"/>
  </property>
</channel>' "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml"
}

xfce-config(){
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
}

i3status-config(){
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

#order += "cpu_usage"
#order += "memory"
#order += "disk /"
#order += "disk /home"
#order += "ethernet '$zerotierAdapter'"
#order += "wireless _first_"
#order += "ethernet _first_"
#order += "volume master"
#order += "read_file BRIGHTNESS"
#order += "battery all"
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
    format = "[RAM/%percentage_used]"
    threshold_degraded = "1G"
    format_degraded = "[RAM/%percentage_used]"
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
' "$HOME/.config/i3/i3status.conf"
}

rofi-config(){
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
    font: "FreeMono 12";
}

window {
    background-color: @corbar;
    border-color: @corcomfoco;
    border: 3;
    border-radius: 0;
    padding: 0;
    width: 50%;
    height: 40%;
}
mainbox {
    border: 0;
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
}

picom-config(){
    criarArq 'shadow = false;
fading = false;
fade-in-step = 0.1;
fade-out-step = 1;
fade-delta = 10;
inactive-opacity = 1 ;
frame-opacity = 1;
menu-opacity = 0.9;
inactive-opacity-override = false;
vsync = false;
unredir-if-possible = false;
backend = "xrender";
opacity-rule = [
        "95:class_g = '"'i3bar'"'",
        "95:class_g = '"'Alacritty'"'",
        "95:class_g = '"'Rofi'"'",
        "95:class_g = '"'Pcmanfm'"'"
];
' "$HOME/.config/i3/picom.conf"
}

getcol-file(){
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
    sudo chmod +x $HOME/.config/i3/getcol.sh
}

polybar-launch(){
    criarArqv2 '#!/usr/bin/env bash
# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar
# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log
polybar -c $HOME/.config/i3/polybar.ini 2>&1 | tee -a /tmp/polybar1.log & disown
echo "Bars launched..."' "$HOME/.config/i3/polybar.sh"
    sudo chmod +x $HOME/.config/i3/polybar.sh
}

polybar-config(){
    criarArq '[colors]
color_bad = #FF0000
color_degraded = #FFFF00
color_bar = '$jrsbar'
color_text = '$jrsbartexto'
color_main = '$jrswindowcomfoco'

[bar/jrs]
width = 100%
height = 22pt
radius = 6
border-top-size = 5pt
border-left-size = 5pt
border-right-size = 5pt
border-bottom-size = 1pt
border-color = #00000000
module-margin = 0
line-size = 2.5pt
;dpi = 66%
background = ${colors.color_bar}
foreground = ${colors.color_text}
bottom = false
padding-left = 0
padding-right = 0
separator =
separator-foreground = ${colors.color_main}

font-0 = FreeMono:style=Regular:size=8;2

modules-left = xworkspaces xwindow
modules-center = date
modules-right = xkeyboard systray
#modules-right = xkeyboard cpu memory filesystem zerotier wlan eth pulseaudio battery date systray

cursor-click = pointer
cursor-scroll = ns-resize

enable-ipc = true

[module/systray]
type = internal/tray
format-margin = 2pt
tray-spacing = 2pt
tray-size = 66%

[module/i3]
type = internal/i3
pin-workspaces = true
strip-wsnumbers = true
index-sort = true
enable-click = true
enable-scroll = false
wrapping-scroll = false
reverse-scroll = false
fuzzy-match = false

label-mode = %mode%
label-mode-padding = 2
label-mode-background = ${colors.color_bad}

label-focused = %name%
label-focused-background = ${colors.background}
label-focused-underline = ${colors.primary}
label-focused-padding = 2

label-unfocused = %index%: %name%
label-unfocused-padding = 2

label-urgent = %index%: %name%
label-urgent-background = ${colors.color_bad}
label-urgent-padding = 2

[module/xworkspaces]
type = internal/xworkspaces

label-active = %name%
label-active-background = ${colors.color_bar}
label-active-underline= ${colors.color_main}
label-active-padding = 1.5

label-occupied = %name%
label-occupied-padding = 1

label-urgent = %name%
label-urgent-background = ${colors.color_bad}
label-urgent-padding = 1

label-empty = %name%
label-empty-foreground = ${colors.color_degraded}
label-empty-padding = 1

[module/xwindow]
type = internal/xwindow
label = " %title:0:60:...%"

[module/filesystem]
type = internal/fs
interval = 25
fixed-values = true
spacing = 0
warn-percentage = 85
mount-0 = /
mount-1 = /run/media/jhonatanrs/JR
label-mounted = [SSD/%percentage_used%%]
label-unmounted = 
label-unmounted-foreground = ${colors.color_degraded}

[module/battery]
type = internal/battery
full-at = 99
low-at = 5
battery = BAT1
adapter = ACAD
poll-interval = 5
label-charging = [CHR/%percentage%%]
label-discharging = [BAT/%percentage%%]
label-full = [FULL/%percentage%%]

[module/pulseaudio]
type = internal/pulseaudio

format-volume-prefix = [♪/
format-volume-prefix-foreground = ${colors.color_text}
format-volume = <label-volume>]

label-volume = %percentage%%

label-muted = [♪/muted]
label-muted-foreground = ${colors.color_degraded}

[module/xkeyboard]
type = internal/xkeyboard

format-spacing = 0

label-layout =
label-indicator = [%name%]
label-layout-foreground = ${colors.color_text}

label-indicator-padding = 0
label-indicator-margin = 0
label-indicator-foreground = ${colors.color_text}
label-indicator-background = ${colors.color_bar}

[module/memory]
type = internal/memory
interval = 5
warn-percentage = 75
format-prefix = [RAM/
format-prefix-foreground = ${colors.color_text}
label = %percentage_used:2%%]

[module/cpu]
type = internal/cpu
interval = 5
warn-percentage = 75
format-prefix = [CPU/
format-prefix-foreground = ${colors.color_text}
label = %percentage:1%%]

[network-base]
type = internal/network
interval = 5
format-connected = <label-connected>
format-disconnected = <label-disconnected>
label-disconnected = 

[module/zerotier]
inherit = network-base
interface = ztugaqpmi7
label-connected = [Z/%local_ip%]

[module/wlan]
inherit = network-base
interface-type = wireless
label-connected = [W/%local_ip%]

[module/eth]
inherit = network-base
interface-type = wired
label-connected = [E/%local_ip%]

[module/date]
type = internal/date
interval = 5

date-alt = %H:%M:%S
date = %a.%d %b %H:%M

label = %date%
label-foreground = ${colors.color_text}

[settings]
screenchange-reload = true
pseudo-transparency = true
' "$HOME/.config/i3/polybar.ini"
}

power-profiles(){
    criarArqv2 '#!/bin/bash
notifyValueNow=$(powerprofilesctl get)
case $notifyValueNow in
  performance)
    powerprofilesctl set power-saver
    sed -i 's/'"vsync = false;"'/'"vsync = true;"'/g' "$HOME/.config/i3/picom.conf" 
    notify-send --hint int:transient:1 "Power Profile" "Power Saver" --icon=org.xfce.powermanager
    ;;
  power-saver)
    powerprofilesctl set balanced
    sed -i 's/'"vsync = false;"'/'"vsync = true;"'/g' "$HOME/.config/i3/picom.conf" 
    notify-send --hint int:transient:1 "Power Profile" "Balanced" --icon=org.xfce.powermanager
    ;;
  balanced)
    powerprofilesctl set performance
    sed -i 's/'"vsync = true;"'/'"vsync = false;"'/g' "$HOME/.config/i3/picom.conf" 
    notify-send --hint int:transient:1 "Power Profile" "Performance" --icon=org.xfce.powermanager
    ;;
  *)
    ;;
esac' "$HOME/.config/i3/powerProfiles.sh"
sudo chmod +x $HOME/.config/i3/powerProfiles.sh
}

set-wallpaper-to-lock(){
    criarArq '#!/bin/bash
convert -resize "$(xrandr | grep "*" | awk '"'"'{ print $1 }'"'"')!" -blur 0x10 $(cat '$HOME'/.config/nitrogen/bg-saved.cfg | sed -n '"'"'2 p'"'"' | sed '"'"'s/file=//'"'"') /usr/share/backgrounds/main.png
' "$HOME/.config/i3/setWL.sh"
}

mangohud-config(){
    criarArqv2 '### pre defined presets
# -1 = default
#  0 = no display
#  1 = fps only
#  2 = horizontal view
#  3 = extended
#  4 = high detailed information
preset=3
### VSync [0-3] 0 = adaptive; 1 = off; 2 = mailbox; 3 = on
vsync=1
### OpenGL VSync [0-N] 0 = off; >=1 = wait for N v-blanks, N > 1 acts as a FPS limiter (FPS = display refresh rate / N)
gl_vsync=0
### Change toggle keybinds for the hud & logging
# toggle_hud=Shift_R+F12
# toggle_hud_position=Shift_R+F11
# toggle_fps_limit=Shift_L+F1
# toggle_logging=Shift_L+F2
# reload_cfg=Shift_L+F4
# upload_log=Shift_L+F3
###
fps_limit=0+24+30+48+60+75+120
fps_limit_method=early
gpu_stats
cpu_stats
fps
frametime
throttling_status
frame_timing
text_outline' "$HOME/.config/MangoHud/MangoHud.conf"
}