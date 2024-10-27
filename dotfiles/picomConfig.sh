#!/usr/bin/env sh
picomConfig(){
    mkdir -p $HOME/.config/picom
    criarArq 'shadow = false;
fading = false;
fade-in-step = 0.1;
fade-out-step = 1;
fade-delta = 10;
inactive-opacity = 1 ;
frame-opacity = 1;
menu-opacity = 0.9;
inactive-opacity-override = false;
vsync = true;
unredir-if-possible = false;
backend = "xrender";
opacity-rule = [
        "95:class_g = '"'i3bar'"'",
        "95:class_g = '"'Rofi'"'"
];
' "$HOME/.config/picom/picom.conf"
}