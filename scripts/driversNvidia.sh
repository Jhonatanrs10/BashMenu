#!/usr/bin/env sh
installDriverNvidia(){
    aptUpdate
    ubuntu-drivers devices
    echo "Visualizar Drivers: ubuntu-drivers devices
Instalar Drivers: sudo apt install nvidia-driver-X"
}

installDriverNvidiaByKorvahannu(){
    echo "Esse script instala driver nvidia para (GTX 1660 + GRUB) atualizado 14/05/25
alterações com base no link abaixo
https://github.com/korvahannu/arch-nvidia-drivers-installation-guide"
    #
    sudo pacman -Syu
    sudo pacman -S base-devel linux-headers git nano --needed
    myBaseYay
    myBasePacman
    yay -S nvidia nvidia-utils lib32-nvidia-utils nvidia-settings
    # Detecta a versão principal e secundária do kernel
    KERNEL_VERSION=$(uname -r | cut -d. -f1,2)

    # Define as opções do GRUB baseadas na versão do kernel
    if (( $(echo "$KERNEL_VERSION >= 6.11" | bc -l) )); then
        EXTRA_OPTS="nvidia-drm.modeset=1 nvidia-drm.fbdev=1"
    else
        EXTRA_OPTS="nvidia-drm.modeset=1"
    fi

    # Caminho do arquivo GRUB
    GRUB_FILE="/etc/default/grub"

    echo "Editando $GRUB_FILE..."

    # Faz backup do arquivo original
    sudo cp "$GRUB_FILE" "$GRUB_FILE.bak"

    # Usa sed para adicionar as opções, sem duplicar
    sudo sed -i "/^GRUB_CMDLINE_LINUX_DEFAULT=/ {
    s/\"$/ $EXTRA_OPTS\"/
    s/\(.*\)nvidia-drm\.modeset=1//g
    s/\(.*\)nvidia-drm\.fbdev=1//g
}" "$GRUB_FILE"

    # Mostra resultado
    echo "Nova linha GRUB_CMDLINE_LINUX_DEFAULT:"
    grep '^GRUB_CMDLINE_LINUX_DEFAULT=' "$GRUB_FILE"

    # Atualiza o GRUB
    echo "Atualizando configuração do GRUB..."
    sudo grub-mkconfig -o /boot/grub/grub.cfg

    echo "Pronto! Reinicie para aplicar as mudanças."
    #!/bin/bash

    # Nome do driver que você está usando (ajuste se necessário)
    NVIDIA_DRIVER="nvidia"

    echo "Editando /etc/mkinitcpio.conf..."

    # Backup do arquivo original
    sudo cp /etc/mkinitcpio.conf /etc/mkinitcpio.conf.bak

    # Adiciona os módulos da NVIDIA à linha MODULES
    sudo sed -i 's/^MODULES=.*/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf

    # Remove 'kms' da linha HOOKS
    sudo sed -i 's/\<kms\>//g' /etc/mkinitcpio.conf

    echo "Conteúdo atualizado de mkinitcpio.conf:"
    grep -E '^(MODULES|HOOKS)=' /etc/mkinitcpio.conf

    echo "Regenerando initramfs com mkinitcpio -P..."
    sudo mkinitcpio -P

    # Baixar o nvidia.hook
    echo "Baixando o arquivo nvidia.hook..."
    cd ~ || exit
    wget https://raw.githubusercontent.com/korvahannu/arch-nvidia-drivers-installation-guide/main/nvidia.hook -O nvidia.hook

    # Substitui o Target no hook pelo nome do driver usado
    sed -i "s/^Target=nvidia$/Target=$NVIDIA_DRIVER/" nvidia.hook

    echo "Conteúdo do hook atualizado:"
    grep '^Target=' nvidia.hook

    # Move o hook para o diretório correto
    echo "Movendo o hook para /etc/pacman.d/hooks/..."
    sudo mkdir -p /etc/pacman.d/hooks/
    sudo mv ./nvidia.hook /etc/pacman.d/hooks/

    echo "Tudo pronto! Reinicie o sistema para aplicar as mudanças."


}