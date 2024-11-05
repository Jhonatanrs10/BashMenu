#!/usr/bin/env sh
i3Config(){
    mkdir -p $HOME/.config/i3
    criarArq '######Jhonatanrs I3-WM config######
set $mod Mod4
set $textFont '$dotFont' 8
set $appMenu2 dmenu_run
set $appMenu rofi -show drun
set $appTerminal alacritty
set $appFiles pcmanfm
set $appBrowser "xdg-open https:"
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
exec --no-startup-id picom
exec_always --no-startup-id $HOME/.config/polybar/polybar.sh
exec --no-startup-id dex --autostart --environment i3
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork
exec --no-startup-id nm-applet
exec --no-startup-id blueman-applet
#exec --no-startup-id volumeicon
exec --no-startup-id xfce4-power-manager
exec --no-startup-id nitrogen --restore
#exec --no-startup-id feh --bg-scale ~/.config/i3/wallpaperI3.png
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
exec --no-startup-id /usr/bin/dunst
exec --no-startup-id xset -b
exec --no-startup-id kdeconnect-indicator

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
bindsym $mod+Ctrl+p exec --no-startup-id killall picom & dunstify -t 1000 --hints int:transient:1 "Picom" "Stopped" --icon=picom
bindsym $mod+Ctrl+b bar mode toggle
bindsym $mod+b exec --no-startup-id polybar-msg cmd toggle
bindsym $mod+p exec --no-startup-id $HOME/.config/jrs/powerprofiles.sh
bindsym $mod+s exec --no-startup-id $HOME/.config/jrs/picomsync.sh
bindsym $mod+t exec --no-startup-id $HOME/.config/jrs/themeMode.sh

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
bindsym --release $mod+z exec --no-startup-id xcolor -s
#bindsym --release $mod+z exec --no-startup-id $HOME/.config/jrs/getcol.sh

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
bindsym $mod+q layout stacking
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
#	status_command i3status --config ~/.config/i3status/config
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
#	    background '#$jrsbar'
#	    statusline '#$jrsbartexto'
#	    separator '#$jrsbartexto'
#	    focused_workspace  '#$jrswindowcomfoco' '#$jrsbar' '#$jrsbartexto'
#	    active_workspace   '#$jrsbar' '#$jrsbar' '#$jrsbartexto'
#	    inactive_workspace '#$jrsbar' '#$jrsbar' '#$jrsbartexto'
#	    urgent_workspace   '#$jrsbar'  #900000  '#$jrsbartexto'
#       binding_mode       '#$jrsbar' '#$jrsbar' '#$jrsbartexto'
#    }
#}
#class                  borda       background  texto         indicator   child_border
client.focused          '#$jrswindowcomfoco' '#$jrswindowcomfoco' '#$jrswindowtextocomfoco' '#$jrswindowcomfoco' '#$jrswindowcomfoco'
client.focused_inactive '#$jrswindowsemfoco' '#$jrswindowsemfoco' '#$jrswindowtextosemfoco' '#$jrswindowsemfoco' '#$jrswindowsemfoco'
client.unfocused        '#$jrswindowsemfoco' '#$jrswindowsemfoco' '#$jrswindowtextosemfoco' '#$jrswindowsemfoco' '#$jrswindowsemfoco'
client.urgent           #2f343a #900000 #ffffff #900000 #900000
client.placeholder      #000000 #0c0c0c #ffffff #000000 #0c0c0c
client.background       #ffffff

#Resize
bindsym Mod1+Left resize shrink width 10 px or 10 ppt
bindsym Mod1+Down resize grow height 10 px or 10 ppt
bindsym Mod1+Up resize shrink height 10 px or 10 ppt
bindsym Mod1+Right resize grow width 10 px or 10 ppt
' "$HOME/.config/i3/config"

case $DESKTOP_SESSION in
	"i3")
		i3 restart
	;;
	*)
esac

}
