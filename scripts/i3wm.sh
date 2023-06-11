#!/usr/bin/env sh
i3wmConfig(){
#exec --no-startup-id feh --bg-scale /home/jhonatanrs/Pictures/Wallpaper.png
#bindsym $mod+l exec i3lock -i /home/jhonatanrs/Pictures/Wallpaper.png
	installPacotes "i3 dmenu i3lock feh lxrandr"
    mv $HOME/.config/i3/config $HOME/.config/i3/config-bkp
    i3touchpad
    i3 restart
}
