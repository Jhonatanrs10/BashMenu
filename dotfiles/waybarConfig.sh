#!/usr/bin/env sh
waybarConfig(){
  mkdir -p $HOME/.config/waybar
  criarArqv2 '{
	"height": 40,
	"layer": "top",
	"spacing": 4,
	"modules-left": ["hyprland/workspaces","hyprland/window"],
	"modules-center": ["clock"],
	"modules-right": ["power-profiles-daemon","pulseaudio","tray"],
	"hyprland/workspaces": {
     "format": "{icon}",
     "on-scroll-up": "hyprctl dispatch workspace e+1",
     "on-scroll-down": "hyprctl dispatch workspace e-1"
    },
    "hyprland/window": {
     "format": "{}",
     "max-length": 60
    },
	"clock": {
     "format": "{:%a.%d %b %R}",
     "format-alt": "{:%R}"
    },
  	"tray": {
      "icon-size": 21,
      "spacing": 5
    },	
	"pulseaudio": {
    "format": "{volume}% {icon}",
    "format-bluetooth": "{volume}% {icon}",
    "format-muted": "",
    "format-icons": {
        "default": ["", ""]
    },
    "scroll-step": 1,
    "on-click": "pavucontrol",
    "ignored-sinks": ["Easy Effects Sink"]
},
"pulseaudio/slider": {
    "min": 0,
    "max": 100,
    "orientation": "vertical"
},
"power-profiles-daemon": {
  "format": "{icon}",
  "tooltip-format": "Power profile: {profile}\nDriver: {driver}",
  "tooltip": true,
  "format-icons": {
    "default": "",
    "performance": "",
    "power-saver": ""
  }
}
}' "$HOME/.config/waybar/config"

criarArqv2 '* {
    border: 0;
    border-radius: 0;
    font-family: FreeMono;
    font-size: 11px;
    min-height: 0;
}

window#waybar {
    background: transparent;
    color: #'$jrsbartexto';
    margin: 0;
}

window#waybar:first-child > box {
    margin: 5;	
    padding: 0px 9px 0px 9px;
    border-radius: 6px;
    background-color: alpha(#'$jrsbar', 0.60);
}
#workspaces button {
    margin-bottom: 0;
    padding: 7;
    padding-bottom: 4;
    color: #'$jrsbartexto';
}
#workspaces button.active {
    padding-top: 10;
    border-bottom: 3px solid #'$jrswindowcomfoco';
    padding-bottom: 5;
    color: #'$jrsbartexto';
}
#pulseaudio-slider slider {
    min-height: 2px;
    min-width: 2px;
    opacity: 0;
    background-image: none;
    border: none;
    box-shadow: none;
    background-color: red;
}
#pulseaudio-slider trough {
    min-height: 1px;
    min-width: 5px;
    border-radius: 5px;
    background-color: black;
}
#pulseaudio-slider highlight {
    min-width: 10px;
    border-radius: 5px;
    background-color: green;
}' "$HOME/.config/waybar/style.css"
}