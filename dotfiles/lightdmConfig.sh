#!/usr/bin/env sh
lightdmConfig(){
    sudo mkdir -p /usr/share/backgrounds
    sudo chmod 777 /usr/share/backgrounds
    sudo tee /etc/lightdm/lightdm-gtk-greeter.conf <<< '[greeter]
theme-name = Breeze-Dark
icon-theme-name = Papirus-Dark
cursor-theme-name = capitaine-cursors
indicators = ~session;~spacer;~clock;~spacer;~power
background = /usr/share/backgrounds/main.png
font-name = '$dotFont' 10'
}