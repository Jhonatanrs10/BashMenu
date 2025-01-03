#!/usr/bin/bash
themeMode(){
	if [[ -e "/etc/lightdm/lightdm-gtk-greeter.conf" ]]; then
        sudo chmod 777 /etc/lightdm/lightdm-gtk-greeter.conf
	fi
    mkdir -p $HOME/.config/jrs
    mkdir -p $HOME/.local/share/nwg-look
	sudo mkdir -p /usr/share/backgrounds
    sudo chmod 777 /usr/share/backgrounds

    criarArqv2 'mkdir -p $HOME/.config/gtk-2.0/
mkdir -p $HOME/.config/gtk-3.0/
mkdir -p $HOME/.config/gtk-4.0/
dirSettings0="/etc/lightdm/lightdm-gtk-greeter.conf"
dirSettings1="$HOME/.gtkrc-2.0"
dirSettings2="$HOME/.config/gtk-2.0/settings.ini"
dirSettings3="$HOME/.config/gtk-3.0/settings.ini"
dirSettings4="$HOME/.config/gtk-4.0/settings.ini"
dirSettings5="$HOME/.local/share/nwg-look/gsettings"
notifyValueNow=$(grep "gtk-theme" $dirSettings5)
case $notifyValueNow in
	"gtk-theme=Breeze")
  		echo "# Generated by Jhonatanrs
gtk-theme=Breeze-Dark
icon-theme=Papirus-Dark
font-name=FreeMono 10
cursor-theme=capitaine-cursors
cursor-size=24
toolbar-style=both-horiz
toolbar-icons-size=large
font-hinting=medium
font-antialiasing=grayscale
font-rgba-order=rgb
text-scaling-factor=1.0
color-scheme=default
event-sounds=true
input-feedback-sounds=true" > $dirSettings5
		echo "[greeter]
theme-name = Breeze-Dark
icon-theme-name = Papirus-Dark
cursor-theme-name = capitaine-cursors
indicators = ~session;~spacer;~clock;~spacer;~power
background = /usr/share/backgrounds/main.png
font-name = FreeMono 10" > $dirSettings0
		nwg-look -a
		nwg-look -x
		cp $dirSettings3 $dirSettings2
        cp $dirSettings3 $dirSettings4
		case $DESKTOP_SESSION in
			"hyprland")
				hyprctl setcursor capitaine-cursors 24
				;;
			"bspwm")
				bspc wm -r
				;;
			*)
		esac
		dunstify -t 1000 --hints int:transient:1 "Theme Mode" "Dark" --icon=preferences-desktop-theme
	;;
    	"gtk-theme=Breeze-Dark")
		echo "# Generated by Jhonatanrs
gtk-theme=Breeze
icon-theme=Papirus-Light
font-name=FreeMono 10
cursor-theme=capitaine-cursors-light
cursor-size=24
toolbar-style=both-horiz
toolbar-icons-size=large
font-hinting=medium
font-antialiasing=grayscale
font-rgba-order=rgb
text-scaling-factor=1.0
color-scheme=default
event-sounds=true
input-feedback-sounds=true" > $dirSettings5
echo "[greeter]
theme-name = Breeze
icon-theme-name = Papirus-Light
cursor-theme-name = capitaine-cursors-light
indicators = ~session;~spacer;~clock;~spacer;~power
background = /usr/share/backgrounds/main.png
font-name = FreeMono 10" > $dirSettings0
		nwg-look -a
		nwg-look -x
		cp $dirSettings3 $dirSettings2
        cp $dirSettings3 $dirSettings4
		case $DESKTOP_SESSION in
				"hyprland")
					hyprctl setcursor capitaine-cursors-light 24
					;;
				"bspwm")
					bspc wm -r
					;;
				*)
			esac
        dunstify -t 1000 --hints int:transient:1 "Theme Mode" "Light" --icon=preferences-desktop-theme
      	;;
    	*)
      	;;
esac
' "$HOME/.config/jrs/themeMode.sh"
sudo chmod +x $HOME/.config/jrs/themeMode.sh
# criarArqv2 fica entre ' ' e dentro os a sinais de ' devem ser mudados para '"'"'

criaAtalho "Theme Mode" "Dark or Light" "bash themeMode.sh" "$HOME/.config/jrs" "false" "ThemeMode" "preferences-desktop-theme"

}
