#!/bin/bash
notifyValueNow=$(powerprofilesctl get)
case $notifyValueNow in
  performance)
    powerprofilesctl set power-saver
    dunstify -t 1000 --hints int:transient:1 "Power Profile" "Power Saver" --icon=xfce4-cpugraph-plugin
    ;;
  power-saver)
    powerprofilesctl set performance
    dunstify -t 1000 --hints int:transient:1 "Power Profile" "Performance" --icon=xfce4-cpugraph-plugin
    ;;
  balanced)
    powerprofilesctl set performance
    dunstify -t 1000 --hints int:transient:1 "Power Profile" "Performance" --icon=xfce4-cpugraph-plugin
    ;;
  *)
    ;;
esac
