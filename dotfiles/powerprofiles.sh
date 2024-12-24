#!/usr/bin/env sh
powerprofiles(){
    mkdir -p $HOME/.config/jrs
    criarArqv2 '#!/bin/bash
notifyValueNow=$(powerprofilesctl get)
case $notifyValueNow in
  performance)
    powerprofilesctl set power-saver
    dunstify -t 1000 --hints int:transient:1 "Power Profile" "Power Saver" --icon=cpu
    ;;
  power-saver)
    powerprofilesctl set performance
    dunstify -t 1000 --hints int:transient:1 "Power Profile" "Performance" --icon=cpu
    ;;
  balanced)
    powerprofilesctl set performance
    dunstify -t 1000 --hints int:transient:1 "Power Profile" "Performance" --icon=cpu
    ;;
  *)
    ;;
esac' "$HOME/.config/jrs/powerprofiles.sh"
sudo chmod +x $HOME/.config/jrs/powerprofiles.sh

criaAtalho "Power Profile" "Energy Profiles" "bash powerprofiles.sh" "$HOME/.config/jrs" "false" "PowerProfile" "cpu"

}