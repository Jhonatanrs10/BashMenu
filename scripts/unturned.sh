#!/usr/bin/env sh
criaLogaUserSteam(){
        sudo useradd -m steam
        sudo passwd steam 
        sudo -u steam -s
        cd /home/steam
    }

#https://developer.valvesoftware.com/wiki/SteamCMD#Linux
#essa linha corrige possiveis erros restaurando as configuracoes padrao do SteamCMD validando-as
#bash ./steamcmd.sh +login anonymous +app_update 1110390 validate +quit

installUnturnedServer(){
    #cria e loga no usuario steam
    #criaLogaUserSteam

    installName="UnturnedServer"
    uninstallPastaAtalhoBinMesmoNome "$installName"
    criaDiretorioInstall "$dBashMenu/$installName"

    aptSteamCMD(){
        #dependencias
        sudo add-apt-repository multiverse
        sudo apt install software-properties-common
        sudo dpkg --add-architecture i386
        sudo apt update
        #instalando SteamCMD
        sudo apt install lib32gcc-s1 steamcmd
        #baixando dependencias
        steamcmd +login anonymous +app_update 1110390 +quit
    }
    
    manuallySteamCMD(){
        installPacotes "lib32gcc-s1"
        criaPastaBaixaExtrai "$diretorioInstall" "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" "steamcmd.tar.gz"
        #baixando dependencias
        bash ./steamcmd.sh +login anonymous +app_update 1110390 +quit
        installPacotes "tmux screen"
    }
    
    criarArq "Map Ex.(PEI - Germany - Russia - Washington) 
help no console do server para ver comandos
edite o local/diretorio do server em run.sh
mova ou copie o arquivo commands.dat para:
Steam/steamapps/common/U3DS/Servers/JardimRecreio/Server/Commands.dat " "LEIAME.txt"

    criarArq "Name JardimRecreio
Map PEI
Maxplayers 10
Port 27015
perspective both
mode normal
pve
welcome Bem Vindo ao bairro!!
cheats on" "Commands.dat"

    menu12345 "[1]APT [2]MANUALLY" "aptSteamCMD" "manuallySteamCMD"

    criarArq "#!/usr/bin/env sh
bash $diretorioInstall/steamcmd.sh +login anonymous +app_update 1110390 +quit
cd $HOME/Steam/steamapps/common/U3DS
bash ServerHelper.sh +LanServer/JardimRecreio" "$diretorioInstall/run.sh"

    #criaAtalho "$installName" "Description" "bash run.sh" "$diretorioInstall" "false" "$installName" "$dBashMenu/Icons/default.svg"
    criaAtalhoBin "$diretorioInstall/run.sh" "$installName"

}   