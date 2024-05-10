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
    RetroArchCores="/usr/lib/libretro"
    echo "Escolha um Core"
    ls $RetroArchCores
    read RetroArchCore
    echo "Diretorio/Game.zip"
    read RetroArchDiretorioGame
    echo "NomedoGame (tudo junto)"
    read RetroArchGameName
    criaAtalho "$RetroArchGameName" "Retroarch Game" "retroarch -f -L $RetroArchCores/$RetroArchCore $RetroArchDiretorioGame" "" "false" "$RetroArchGameName" "retroarch"
}

#remove quebra de linha (arquivos SVG)
#https://miniwebtool.com/br/remove-line-breaks/
# cria um atalho .desktop
#criaAtalho "nomedoatalho" "comentario" "execucao" "$diretorioInstall" "terminaltrueoufalse" "nomedoarquivo" '$HOME/.Jhonatanrs/Icons/nome.svg'