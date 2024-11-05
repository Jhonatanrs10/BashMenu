#!/usr/bin/env sh
enableSystemctl(){
    echo "Ativar $1? [s]/[n]"
    read resp
    if [ "$resp" = "s" ]; then
        sudo systemctl enable $1 --now
    elif [ "$resp" = "n" ]; then
        sudo systemctl disable $1
    fi
}
#enableSystemctl "processo"
#exemplo smbd bluetooth