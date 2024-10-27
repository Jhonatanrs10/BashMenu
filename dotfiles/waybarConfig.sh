#!/usr/bin/env sh
waybarConfig(){
  mkdir -p $HOME/.config/waybar
  criarArqv2 '{
	"height": 30,
	"spacing": 4,
	"modules-left": [
		"hyprland/workspaces",
    "hyprland/window"
	],
	"modules-center": [
		"clock"
	],
	"modules-right": [
    "tray"
	],
  	"tray": {
      "icon-size": 21,
      "spacing": 10,
    },
    "hyprland/workspaces": {
     "format": "{icon}",
     "on-scroll-up": "hyprctl dispatch workspace e+1",
     "on-scroll-down": "hyprctl dispatch workspace e-1"
}
    
  
}' "$HOME/.config/waybar/config"
}