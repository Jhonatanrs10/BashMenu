#!/usr/bin/env sh
waybarConfig(){
  mkdir -p $HOME/.config/waybar
  criarArqv2 '{
	"height": 40,
	"layer": "top",
	"spacing": 4,
	"modules-left": ["hyprland/workspaces","hyprland/window"],
	"modules-center": ["clock"],
	"modules-right": ["temperature","pulseaudio","battery","tray"],
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
    "format": " {icon} {volume}%",
    "format-bluetooth": "  {volume}%",
    "format-muted": " ",
    "format-icons": {
        "alsa_output.pci-0000_00_1f.3.analog-stereo": "",
        "alsa_output.pci-0000_00_1f.3.analog-stereo-muted": "",
        "headphone": " ",
        "hands-free": " ",
        "headset": " ",
        "phone": " ",
        "phone-muted": " ",
        "portable": " ",
        "car": " ",
        "default": ["","",""]

    },
    "scroll-step": 1,
    "on-click": "pavucontrol",
    "ignored-sinks": ["Easy Effects Sink"]
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
},
"battery": {
    "bat": "BAT1",
    "interval": 60,
    "states": {
        "warning": 30,
        "critical": 15
    },
    "format": " {icon} {capacity}%",
    "format-icons": ["", "", "", "", ""],
    "max-length": 25
},
"network": {
    "interface": "wlp2s0",
    "format": "{ifname}",
    "format-wifi": "{essid} ({signalStrength}%) ",
    "format-ethernet": "{ipaddr}/{cidr} 󰊗",
    "format-disconnected": "", //An empty format will hide the module.
    "tooltip-format": "{ifname} via {gwaddr} 󰊗",
    "tooltip-format-wifi": "{essid} ({signalStrength}%) ",
    "tooltip-format-ethernet": "{ifname} ",
    "tooltip-format-disconnected": "Disconnected",
    "max-length": 50
},
 "temperature": {
    // "thermal-zone": 2,
    // "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input",
    // "critical-threshold": 80,
    // "format-critical": "{temperatureC}°C ",
    "format": "  {temperatureC}°C"
}
}' "$HOME/.config/waybar/config"

criarArqv2 '* {
    border: 0;
    border-radius: 0;
    font-family: FreeMono;
    font-size: 11px;
    min-height: 0;
}

.modules-right {
    color: #DFDFDF;
    /*color: #444444;*/
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
killall -SIGUSR2 waybar
}
