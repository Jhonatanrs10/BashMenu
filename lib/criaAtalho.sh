#!/usr/bin/env sh
criaAtalho(){
	varCriaAtalho="n"
    echo "Criar Atalho? ($6) [s/n]"
    read varCriaAtalho
    if [ "$varCriaAtalho" = "s" ]; then
        echo -e "[Desktop Entry]
Version=1.0
Type=Application
Name=$1
Comment=$2
Exec=$3
Icon=$7
Path=$4
Terminal=$5" > jrs-$6.desktop
		sudo mv jrs-$6.desktop /usr/share/applications
    fi
}

criaAtalhoDesktop(){
    echo "DIGITE O NOME DO ATALHO (tudo junto sem caracteres)"
    read atalhoName
    echo "DIGITE A DESCRICAO"
    read atalhoDescricao
    echo "DIGITE O DIRETORIO DO ARQUIVO"
    read atalhoDiretorio
    echo "DIGITE O COMANDO"
    read atalhoComando
    echo "DIGITE O DIRETORIO DO ICONE"
    read atalhoIcone
    echo "TERMINAL true OU false"
    read atalhoTerminalTrueOuFalse
    criaAtalho "$atalhoName" "$atalhoDescricao" "$atalhoComando" "$atalhoDiretorio" "$atalhoTerminalTrueOuFalse" "$atalhoName" "$atalhoIcone"
}

criaAtalhoDesktopRetroarchArch(){
    removeAllDesktop "Retroarch"
    RetroArchCores="/usr/lib/libretro"
    RetroArchDiretorioGames="$HOME/Roms"
    echo "ESCOLHA A BIOS/CORE PRA A ROM:"
    listaOptions "$RetroArchCores" "RetroArchCore"
    listaOptions "$RetroArchDiretorioGames" "RetroArchGameName"
    criaAtalho "${RetroArchGameName%.*}" "Retroarch Game" "retroarch -f -L $RetroArchCores/$RetroArchCore $RetroArchDiretorioGames/$RetroArchGameName" "" "false" "Retroarch-${RetroArchGameName%.*}" "retroarch"
}

removeAllDesktop(){
    echoRead "DESEJA APAGAR OS ATALHOS $1 (s/n)" "resp"
    if [ "$resp" = "s" ]; then
        sudo rm /usr/share/applications/jrs-$1-*
    fi
    clear
}

removeDesktopJRS(){
    listaOptions "/usr/share/applications" "ptDesktop" "-d jrs-*"
    echoRead "DESEJA APAGAR O ATALHO $ptDesktop (s/n)" "resp"
    if [ "$resp" = "s" ]; then
        sudo rm /usr/share/applications/$ptDesktop
    fi
}

#removeAllDesktop "palavrachave ex retroarch"

criaAtalhoDesktopAppimage(){
    removeAllDesktop "Appimage"
    appimageFolder="$dBashMenu/Appimage"
    mkdir -p $appimageFolder
    for vApp in `ls $appimageFolder`
        do
            chmod 777 $appimageFolder/$vApp
            criaAtalho "${vApp%.*}" "An Appimage" "./$vApp" "$appimageFolder" "false" "Appimage-${vApp%.*}" "application-default-icon"
        done


}

#remove quebra de linha (arquivos SVG)
#https://miniwebtool.com/br/remove-line-breaks/
# cria um atalho .desktop
#criaAtalho "nomedoatalho" "comentario" "execucao" "$diretorioInstall" "terminaltrueoufalse" "nomedoarquivo" '$HOME/.Jhonatanrs/Icons/nome.svg'