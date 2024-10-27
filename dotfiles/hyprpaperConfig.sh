#!/usr/bin/env sh
hyprpaperConfig(){
  mkdir -p $HOME/.config/hypr
  criarArqv2 'preload = /home/jhonatanrs/Pictures/Wallpapers/arvore-rosa.png
wallpaper = , /home/jhonatanrs/Pictures/Wallpapers/arvore-rosa.png
' "$HOME/.config/hypr/hyprpaper.conf"
}