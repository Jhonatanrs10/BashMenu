#!/usr/bin/env sh
wofiConfig(){
  mkdir -p $HOME/.config/wofi
  criarArqv2 'mode=drun
width=50%
height=40%
bonder=3
allow_images=true
drun-display_generic=true
image_size=20
colors=colors
filter_rate=100
allow_markup=true
dinamic_lines=true
lines=11
no_actions=true
parse_search=true
prompt= Type to filter' "$HOME/.config/wofi/config"
##############
criarArqv2 '* {
    border-radius: 15px;
    color:#'$jrsbartexto';
}

#inner-box {
    background-color: alpha(aqua, 0);
}

#outer-box {
    background-color: alpha(red, 0);
    padding: 0 0 0 0;
    margin: 10 0 10 0;
}

window {
    font-size: 16px;
    font-family: "FreeMono";
    background-color: alpha(#'$jrsbar', 0.9);
    color: "#'$jrsbartexto'";
    border: 3px solid alpha(#'$jrswindowcomfoco', 1);
}

#entry {
    border-radius: 0px;
    padding: 0.25em;
}

#entry:selected {
    background-color: alpha(#'$jrswindowcomfoco', 1);
    color: "#'$jrsbartexto'";
    border-radius: 0;
}

#text:selected {
    color: "#'$jrsbartexto'";
}

#input {
    background-color: alpha(#'$jrsbar', 0);
    color: "#'$jrsbartexto'";
    border-top: 0px solid blue;
    border-bottom: 1px solid #'$jrsbartexto';
    border-left: 0px solid blue;
    border-right: 0px solid blue;
    border-radius: 0;
    margin: 0 20 10 20;
}

image {
    margin-left: .25em;
    margin-right: .25em;
}' "$HOME/.config/wofi/style.css"
}