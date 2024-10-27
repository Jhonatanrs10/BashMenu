#!/usr/bin/env sh
polybarsh(){
    mkdir -p $HOME/.config/polybar
    criarArqv2 '#!/usr/bin/env bash
# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar
# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log
polybar -c $HOME/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar1.log & disown
echo "Bars launched..."' "$HOME/.config/polybar/polybar.sh"
    sudo chmod +x $HOME/.config/polybar/polybar.sh
}