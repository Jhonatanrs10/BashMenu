#!/usr/bin/env sh
enableSystemctl(){
    echo "Ativar $1? [s]/[n]"
    read resp
    if [ $resp = "s" ]; then
        sudo systemctl enable $1
        sudo systemctl start $1 --now
    else
        echo "Nada a fazer."
    fi 
}
#enableSystemctl "processo"
#exemplo smbd bluetooth