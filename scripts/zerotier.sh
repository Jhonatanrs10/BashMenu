#!/usr/bin/env sh
zerotier(){
    sudo dpkg --configure -a
    curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import && \
    if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
    sudo zerotier-cli join d5e5fb6537d99ad3
    read entrar
}