#!/usr/bin/env sh
javaVersion(){
    echo "DEBIAN BASE
sudo update-alternatives --config java

ARCH 
archlinux-java --help
    "
    read finalizado
}


installJava() {
  echo "=== Instalação de JRE no Arch Linux ==="
  echo "Escolha a versão do JRE que deseja instalar:"
  echo "1) jre-openjdk (última versão)"
  echo "2) jre8-openjdk (OpenJDK 8)"
  echo "3) jre11-openjdk (OpenJDK 11 LTS)"
  echo "4) jre17-openjdk (OpenJDK 17 LTS)"
  echo "5) Version"
  echo "6) Sair"

  while true; do
    read -rp "Digite o número da opção desejada: " choice

    case $choice in
      1)
        pkg="jre-openjdk"
        break
        ;;
      2)
        pkg="jre8-openjdk"
        break
        ;;
      3)
        pkg="jre11-openjdk"
        break
        ;;
      4)
        pkg="jre17-openjdk"
        break
        ;;
      5)javaVersion
        exit 0
        ;;
      6)
        echo "Saindo sem instalar nada."
        exit 0
        ;;
      *)
        echo "Opção inválida. Tente novamente."
        ;;
    esac
  done

  echo "Instalando pacote $pkg..."
  sudo pacman -Syu --noconfirm
  sudo pacman -S --needed --noconfirm "$pkg"
  echo "Instalação concluída!"
}