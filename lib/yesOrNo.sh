#!/usr/bin/env sh
yesorno(){
    echo -e "[BashMenu] $1 [s/n]"
    read resp
    if [ "$resp" = s ]; then
        $2
    fi
}
#yesorno "Titulo" "Script"