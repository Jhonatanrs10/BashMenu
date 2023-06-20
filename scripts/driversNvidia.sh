#!/usr/bin/env sh
installDriverNvidia(){
    aptUpdate
    ubuntu-drivers devices
    echo "Visualizar Drivers: ubuntu-drivers devices
Instalar Drivers: sudo apt install nvidia-driver-X"
}