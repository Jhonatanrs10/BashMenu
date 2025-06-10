#!/usr/bin/env sh

# Cores ANSI
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
RESET="\033[0m"

source ./lib/sourceFolder.sh
sourceFolder "LIBs" "./lib"
sourceFolder "Scripts" "./scripts"

option=""

while [ "$option" != "0" ]; do
  clear
  echo -e "${CYAN}==============================================${RESET}"
  echo -e "${GREEN}          MENU DE SCRIPTS - SELECIONE           ${RESET}"
  echo -e "${CYAN}==============================================${RESET}"
  echo -e "${YELLOW}Digite o número da opção desejada ou '0' para sair.${RESET}\n"

  echo -e " ${GREEN}[01]${RESET} Pos Install"
  echo -e " ${GREEN}[02]${RESET} Grub"
  echo -e " ${GREEN}[03]${RESET} Pacman"
  echo -e " ${GREEN}[04]${RESET} Montar NTFS"
  echo -e " ${GREEN}[05]${RESET} Linkar Home"
  echo -e " ${GREEN}[06]${RESET} Yay"
  echo -e " ${GREEN}[07]${RESET} Video Driver"
  echo -e " ${GREEN}[08]${RESET} VirtManager"
  echo -e " ${GREEN}[09]${RESET} Diretório Inode Padrão"
  echo -e " ${GREEN}[10]${RESET} Git Auto Push"
  echo -e " ${GREEN}[11]${RESET} Configuração Git"
  echo -e " ${GREEN}[12]${RESET} Dependências Atalho"
  echo -e " ${GREEN}[13]${RESET} Bongo"
  echo -e " ${GREEN}[14]${RESET} Pokexgames"
  echo -e " ${GREEN}[15]${RESET} Minecraft"
  echo -e " ${GREEN}[16]${RESET} Servidor Minecraft"
  echo -e " ${GREEN}[17]${RESET} FiveM"
  echo -e " ${GREEN}[18]${RESET} Servidor Unturned"
  echo -e " ${GREEN}[19]${RESET} Servidor SA-MP"
  echo -e " ${GREEN}[20]${RESET} Servidor Terraria"
  echo -e " ${GREEN}[21]${RESET} Hamachi"
  echo -e " ${GREEN}[22]${RESET} ZeroTier"
  echo -e " ${GREEN}[23]${RESET} Ngrok"
  echo -e " ${GREEN}[24]${RESET} Node LTS"
  echo -e " ${GREEN}[25]${RESET} Java Install/Version"
  echo -e " ${GREEN}[26]${RESET} Gamepads Virtuais"
  echo -e " ${GREEN}[27]${RESET} Atalho Desktop"
  echo -e " ${GREEN}[28]${RESET} Atalho Desktop Retroarch (Arch)"
  echo -e " ${GREEN}[29]${RESET} Criar Arquivo de Execução por Diretório"
  echo -e " ${GREEN}[30]${RESET} Atalho Terminal"
  echo -e " ${GREEN}[31]${RESET} Setup AppImage"
  echo -e " ${GREEN}[32]${RESET} Remover Atalhos JRS"
  echo -e " ${GREEN}[33]${RESET} Pasta Compartilhada (User)"
  echo -e " ${GREEN}[34]${RESET} Pasta Compartilhada (Guest)"
  echo -e " ${GREEN}[35]${RESET} Execução PulseAudio Virtual"
  echo -e " ${GREEN}[36]${RESET} Pós-Rede"
  echo -e " ${GREEN}[37]${RESET} Pós-Configuração Manual"
  echo -e " ${GREEN}[38]${RESET} Pós-Fix Bluetooth"
  echo -e " ${GREEN}[39]${RESET} Pós-Teclado"
  echo -e " ${GREEN}[40]${RESET} Pós-Hora (NTP)"
  echo -e " ${GREEN}[41]${RESET} Pós-Touchpad (i3)"
  echo -e " ${GREEN}[42]${RESET} Reparar Pacman"
  echo -e " ${GREEN}[43]${RESET} Assistir com MPV"
  echo -e " ${GREEN}[44]${RESET} Samba Setup"
  echo -e " ${RED}[0]${RESET} Sair\n"

  printf "${CYAN}Opção:${RESET} "
  read option

  case $option in
      1) myBasePosInstall ;;
      2) myBaseGrub ;;
      3) myBasePacman ;;
      4) myBaseMountNTFS ;;
      5) myBaselnHome ;;
      6) myBaseYay ;;
      7) installVideoDriver ;;
      8) installVirtManager ;;
      9) defaultInodeDirectory ;;
      10) gitAutoPush ;;
      11) gitconfig ;;
      12) dependenciasAtalho ;;
      13) bongo ;;
      14) installPokexgames ;;
      15) installMinecraft ;;
      16) installMinecraftServer ;;
      17) installFivem ;;
      18) installUnturnedServer ;;
      19) sampServer ;;
      20) terrariaServer ;;
      21) hamachi ;;
      22) zerotier ;;
      23) installNgrok ;;
      24) nodejslts ;;
      25) installJava ;;
      26) virtualGamepads ;;
      27) criaAtalhoDesktop ;;
      28) criaAtalhoDesktopRetroarchArch ;;
      29) criaArqRunDiretorioInstall ;;
      30) AtalhoTerminalBin ;;
      31) setupAppimage ;;
      32) removeDesktopJRS ;;
      33) criaPastaShareUser ;;
      34) criaPastaShareGuest ;;
      35) virtualPulseAudioExec ;;
      36) appPosNetwork ;;
      37) appPosManualConfig ;;
      38) appPosBluetoothFix ;;
      39) appPosTecladoConfig ;;
      40) appPosTimeNTP ;;
      41) appPosI3Touchpad ;;
      42) repairPM ;;
      43) assistirMpv ;;
      44) sambaSetup ;;
      0)
        echo -e "${RED}Saindo do menu. Até logo!${RESET}"
        exit 0
        ;;
      *)
        echo -e "${RED}Opção inválida! Tente novamente.${RESET}"
        sleep 1
        ;;
  esac

  echo -e "\nPressione Enter para continuar..."
  read
done
