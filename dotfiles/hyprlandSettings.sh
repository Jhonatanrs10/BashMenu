#!/usr/bin/env sh
hypranim(){
  mkdir -p $HOME/.config/hypr
  criarArqv2 '#!/bin/bash
notifyValueNow=$(cat $HOME/.config/hypr/hyprland.conf | grep -n ^ | grep ^35 | cut -d: -f2)
case $notifyValueNow in
  "    enabled = true")
    sed -i '35s/'"enabled = true"'/'"enabled = false"'/g' "$HOME/.config/hypr/hyprland.conf" 
    dunstify -t 1000 --hints int:transient:1 "Hyprland" "Animations: Off" --icon=picom
    ;;
  *)
    sed -i '35s/'"enabled = false"'/'"enabled = true"'/g' "$HOME/.config/hypr/hyprland.conf" 
    dunstify -t 1000 --hints int:transient:1 "Hyprland" "Animations: On" --icon=picom
    ;;
esac' "$HOME/.config/jrs/hypranim.sh"
sudo chmod +x $HOME/.config/jrs/hypranim.sh
}