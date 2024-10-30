#!/usr/bin/env sh
picomsync(){
    mkdir -p $HOME/.config/jrs
    criarArqv2 '#!/bin/bash
notifyValueNow=$(grep "vsync = true;" $HOME/.config/picom/picom.conf)
case $notifyValueNow in
  "vsync = true;")
    sed -i 's/'"vsync = true;"'/'"vsync = false;"'/g' "$HOME/.config/picom/picom.conf" 
    dunstify -t 1000 --hints int:transient:1 "Picom" "VSync: Off" --icon=picom
    ;;
  *)
    sed -i 's/'"vsync = false;"'/'"vsync = true;"'/g' "$HOME/.config/picom/picom.conf" 
    dunstify -t 1000 --hints int:transient:1 "Picom" "VSync: On" --icon=picom
    ;;
esac' "$HOME/.config/jrs/picomsync.sh"
sudo chmod +x $HOME/.config/jrs/picomsync.sh
}