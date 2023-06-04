#!/usr/bin/env sh
criaAtalhoBin(){
    chmod +x $1
    chmod 777 $1
	sudo ln -s $1 /usr/bin/jrs-$2
}
# cria atalho no bin possibilitando o uso do script em qualquer diretorio
#criaAtalhoBin "$diretorio/nome.txt" "nome do atalho para pasta /usr/bin/"