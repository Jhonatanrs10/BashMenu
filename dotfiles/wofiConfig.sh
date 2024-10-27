#!/usr/bin/env sh
wofiConfig(){
  mkdir -p $HOME/.config/wofi
  criarArqv2 'width=50%
height=40%
mode=run
border-color=#000000
bonder=3
border-radius=6' "$HOME/.config/wofi/config"
}