#!/usr/bin/env sh
alacrittyConfig(){
  mkdir -p $HOME/.config/alacritty
  criarArqv2 '
[font]
size = 10.0

[font.bold]
family = "'$dotFont'"
style = "Bold"

[font.bold_italic]
family = "'$dotFont'"
style = "Bold Italic"

[font.italic]
family = "'$dotFont'"
style = "Italic"

[font.normal]
family = "'$dotFont'"
style = "Regular"

[colors.primary]
foreground = "#'$jrsbartexto'"
background = "#'$jrsbar'"

[window]
dimensions = { columns = 60, lines = 25}
blur = true
opacity = 0.90
' "$HOME/.config/alacritty/alacritty.toml"
}