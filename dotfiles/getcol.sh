#!/usr/bin/env sh
getcol(){
  #xsel package requerid
    mkdir -p $HOME/.config/jrs
    criarArq '#!/bin/sh
getcol=$(rm /tmp/getcol.png
scrot -s /tmp/getcol.png
convert /tmp/getcol.png \
-define histogram:unique-colors=true \
-format %c histogram:info:- | \
sort -nr | \
sed -n '"'""1s/[^#]*\([^ ]*\).*/\1/p""'"')
echo $getcol | xsel -bi
' "$HOME/.config/jrs/getcol.sh"
    sudo chmod +x $HOME/.config/jrs/getcol.sh
}