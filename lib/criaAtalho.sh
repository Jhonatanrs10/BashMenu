#!/usr/bin/env sh
criaAtalho(){
	echo -e "[Desktop Entry]
	Version=1.0
	Type=Application
	Name=$1
	Comment=$2
	Exec=$3
	Icon=$7
	Path=$4
	Terminal=$5" > $6.desktop
	sudo mv $6.desktop /usr/share/applications
	#remove quebra de linha (arquivos SVG)
	#https://miniwebtool.com/br/remove-line-breaks/
}
# cria um atalho .desktop
#criaAtalho "nomedoatalho" "comentario" "execucao" "$diretorioInstall" "terminaltrueoufalse" "nomedoarquivo" '$HOME/.Jhonatanrs/Icons/nome.svg'