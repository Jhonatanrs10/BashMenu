#!/usr/bin/env sh
wofiConfig(){
  mkdir -p $HOME/.config/wofi
  criarArqv2 'width=50%
height=40%
mode=drun
border-color=#000000
bonder=3
border-radius=6' "$HOME/.config/wofi/config"
##############
criarArqv2 'window {
	font-size: 12px;
	font-family: "FreeMono";
	background-color: rgba(50, 50, 50, 0.9);
	color: white;	
}

#entry:selected {
	background-color: #FF0000;#cor da selecao
	color: #333333;
}

#text:selected {
	color: #FFFF00;#cor do texto selecionado
}' "$HOME/.config/wofi/style.css"
}