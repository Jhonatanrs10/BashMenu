#!/usr/bin/env sh
setwl(){
    mkdir -p $HOME/.config/jrs
    criarArq '#!/bin/bash
convert -resize "$(xrandr | grep "*" | awk '"'"'{ print $1 }'"'"')!" -blur 0x10 $(cat '$HOME'/.config/nitrogen/bg-saved.cfg | sed -n '"'"'2 p'"'"' | sed '"'"'s/file=//'"'"') /usr/share/backgrounds/main.png
' "$HOME/.config/jrs/setwl.sh"
}