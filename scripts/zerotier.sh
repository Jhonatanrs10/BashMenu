#!/usr/bin/env sh
zerotier(){
    echo "Zerotier para Ubuntu[1] ou Arch[2]"
    read escolha
    if [ $escolha = "1" ]; then
        sudo dpkg --configure -a
        curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import && \
        if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
        enableSystemctl "zerotier-one"
        sudo zerotier-cli join d5e5fb6537d99ad3
    elif [ $escolha = "2" ]; then
        echo "PAMAC ou PACMAN"
        installPacotes "zerotier-one"
        enableSystemctl "zerotier-one"
        sudo zerotier-cli join d5e5fb6537d99ad3
    fi 
   
}