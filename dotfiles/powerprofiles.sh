#!/usr/bin/env sh
powerprofiles(){
    mkdir -p $HOME/.config/jrs
    criarArqv2 '#!/bin/bash
notifyValueNow=$(powerprofilesctl get)
case $notifyValueNow in
  performance)
    powerprofilesctl set power-saver
    notify-send -t 1000 --hint int:transient:1 "Power Profile" "Power Saver" --icon=org.xfce.powermanager
    ;;
  power-saver)
    powerprofilesctl set performance
    notify-send -t 1000 --hint int:transient:1 "Power Profile" "Performance" --icon=org.xfce.powermanager
    ;;
  balanced)
    powerprofilesctl set performance
    notify-send -t 1000 --hint int:transient:1 "Power Profile" "Performance" --icon=org.xfce.powermanager
    ;;
  *)
    ;;
esac' "$HOME/.config/jrs/powerprofiles.sh"
sudo chmod +x $HOME/.config/jrs/powerprofiles.sh
}