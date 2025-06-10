#!/bin/bash
installVideoDriver(){
echo "==== Instalação de Drivers de Vídeo no Arch Linux ===="

# Loop de seleção
while true; do
  echo "Escolha o driver que deseja instalar:"
  echo "1 - NVIDIA"
  echo "2 - Intel (moderno)"
  echo "3 - Intel (antigo / xf86-video-intel )"
  echo "4 - AMD (moderno)"
  echo "5 - AMD (antigo)"
  read -rp "Digite o número da opção desejada: " choice

  case $choice in
    1) DRIVER_NAME="NVIDIA"; DRIVER_PACKAGES=$myBaseNvidia; break ;;
    2) DRIVER_NAME="Intel (moderno)"; DRIVER_PACKAGES=$myBaseIntel; break ;;
    3) DRIVER_NAME="Intel (antigo)"; DRIVER_PACKAGES=$myBaseIntelOld; break ;;
    4) DRIVER_NAME="AMD (moderno)"; DRIVER_PACKAGES=$myBaseAmd; break ;;
    5) DRIVER_NAME="AMD (antigo)"; DRIVER_PACKAGES=$myBaseAmdOld; break ;;
    *) echo "Opção inválida. Tente novamente." ;;
  esac
done

echo "Você escolheu: $DRIVER_NAME"
echo "Pacotes que serão instalados: $DRIVER_PACKAGES"

# Atualiza o sistema e instala pacotes básicos
sudo pacman -Syu --noconfirm
sudo pacman -S base-devel linux-headers git nano --needed --noconfirm

# Instala os pacotes do driver escolhido
sudo pacman -S $DRIVER_PACKAGES --needed --noconfirm

# Se for NVIDIA, faz configurações adicionais
if [[ "$DRIVER_NAME" == "NVIDIA" ]]; then
  echo "Configurando GRUB para NVIDIA..."

  KERNEL_VERSION=$(uname -r | cut -d. -f1,2)

  if (( $(echo "$KERNEL_VERSION >= 6.11" | bc -l) )); then
    EXTRA_OPTS="nvidia-drm.modeset=1 nvidia-drm.fbdev=1"
  else
    EXTRA_OPTS="nvidia-drm.modeset=1"
  fi

  GRUB_FILE="/etc/default/grub"
  sudo cp "$GRUB_FILE" "$GRUB_FILE.bak"

  sudo sed -i "/^GRUB_CMDLINE_LINUX_DEFAULT=/ {
    s/\"$/ $EXTRA_OPTS\"/
    s/\(.*\)nvidia-drm\.modeset=1//g
    s/\(.*\)nvidia-drm\.fbdev=1//g
  }" "$GRUB_FILE"

  echo "Atualizando GRUB..."
  sudo grub-mkconfig -o /boot/grub/grub.cfg

  echo "Configurando mkinitcpio para NVIDIA..."
  sudo cp /etc/mkinitcpio.conf /etc/mkinitcpio.conf.bak
  sudo sed -i 's/^MODULES=.*/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
  sudo sed -i 's/\<kms\>//g' /etc/mkinitcpio.conf

  echo "Regenerando initramfs..."
  sudo mkinitcpio -P

  echo "Instalando hook do driver NVIDIA..."
  cd ~ || exit
  wget https://raw.githubusercontent.com/korvahannu/arch-nvidia-drivers-installation-guide/main/nvidia.hook -O nvidia.hook
  sed -i "s/^Target=nvidia$/Target=nvidia/" nvidia.hook
  sudo mkdir -p /etc/pacman.d/hooks/
  sudo mv nvidia.hook /etc/pacman.d/hooks/
fi

echo "✅ Instalação concluída! Reinicie o sistema para aplicar as mudanças."
}