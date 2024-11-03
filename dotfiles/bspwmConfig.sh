#!/usr/bin/env sh
bspwmConfig(){
    mkdir -p $HOME/.config/bspwm
    mkdir -p $HOME/.config/sxhkd
    criarArqv2 '#! /bin/sh

pgrep -x sxhkd > /dev/null || sxhkd &

bspc monitor -d 1 2 3 4 5 6 7 8 9 10

bspc config border_width	3
bspc config window_gap		5
bspc config top_padding		3
bspc config bottom_padding 	3
bspc config left_padding 	3
bspc config right_padding 	3

bspc config automatic_scheme longest_side
bspc config initial_polarity second_child
bspc config removal_adjustment true

bspc config split_ratio          0.5
bspc config borderless_monocle   true
bspc config gapless_monocle      true


bspc config normal_border_color "#'$jrswindowsemfoco'"
	bspc config focused_border_color "#'$jrswindowcomfoco'"
	bspc config focus_follows_pointer true

	#bspc rule -a Gimp desktop="^8" state=floating follow=on
#bspc rule -a Chromium desktop="^2"
#bspc rule -a mplayer2 state=floating
#bspc rule -a Kupfer.py focus=on
#bspc rule -a Screenkey manage=off

#AutoStart
nitrogen --restore &
xfce4-power-manager &
#killall volumeicon && volumeicon &
blueman-applet &
nm-applet &
/usr/bin/dunst &
/usr/bin/polkit-gnome/polkit-gnome-authentucation-agent-1 &
$HOME/.config/polybar/polybar.sh &
picom &' "$HOME/.config/bspwm/bspwmrc"
sudo chmod +x $HOME/.config/bspwm/bspwmrc
criarArqv2 '# terminal emulator
super + Return
	alacritty

# program launcher
super + d
	rofi -show drun

# file manager
super + x
	pcmanfm

# browser
super + c
	chromium

# toggle polybar
super + b 
	polybar-msg cmd toggle

# power profiles
super + p 
	$HOME/.config/jrs/powerprofiles.sh

# picom sync
super + s 
	$HOME/.config/jrs/picomsync.sh

# theme mode
super + t 
	$HOME/.config/jrs/themeMode.sh

# make sxhkd reload its configuration files:
super + shift + r
	pkill -USR1 -x sxhkd; \
	bspc wm -r;

# quit/restart bspwm
super + shift + e
	bspc quit

# close and kill
super + {_,shift + }q
	bspc node -{c,k}

# alternate between the tiled and monocle layout
super + w
	bspc desktop -l next

# set the window state
super + {e,space,f}
	bspc node -t {tiled,floating,fullscreen}

# focus the node in the given direction
super + {_,shift + }{Left,Down,Up,Right}
	bspc node -{f,s} {west,south,north,east}

# focus the node for the given path jump
super + {p,b,comma,period}
	bspc node -f @{parent,brother,first,second}

# focus the next/previous window in the current desktop
alt + Tab
	bspc node -f {next,prev}.local.!hidden.window

# focus the next/previous desktop in the current monitor
super + bracket{left,right}
	bspc desktop -f {prev,next}.local

# focus the last node/desktop
super + {grave,Tab}
	bspc {node,desktop} -f last

# focus the older or newer node in the focus history
super + {o,i}
	bspc wm -h off; \
	bspc node {older,newer} -f; \
	bspc wm -h on

# focus or send to the given desktop
super + {_,shift + }{1-9,0}
	bspc {desktop -f,node -d} '"'"'^{1-9,10}'"'"'

# preselect the direction
super + ctrl + {Left,Down,Up,Right}
	bspc node -p {west,south,north,east}

# preselect the ratio
super + ctrl + {1-9}
	bspc node -o 0.{1-9}

# cancel the preselection for the focused node
super + ctrl + space
	bspc node -p cancel

# expand a window by moving one of its side outward
super + alt + {Left,Down,Up,Right}
	bspc node -z {left -20 0 || bspc node -z right -20 0, \
        bottom 0 20 || bspc node -z top 0 20,\
        top 0 -20 || bspc node -z bottom 0 -20,\
        right 20 0 || bspc node -z left 20 0}

# move a floating window
super + {_,shift + }{Left,Down,Up,Right}
	bspc node -v {-20 0,0 20,0 -20,20 0}' "$HOME/.config/sxhkd/sxhkdrc"

}
