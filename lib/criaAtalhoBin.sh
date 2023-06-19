#!/usr/bin/env sh
criaAtalhoBin(){
    varCriaAtalhoBin="n"
    echo "Criar AtalhoBin? ($2) [s/n]"
    read varCriaAtalhoBin
    if [ $varCriaAtalhoBin = "s" ]; then
        chmod +x $1
        chmod 777 $1
	    sudo ln -s $1 /usr/bin/jrs-$2  
    fi
}

criaAtalhoDiretorio(){
    varcriaAtalhoDiretorio="n"
    echo "Criar AtalhoDiretorio? ($2) [s/n]"
    read varcriaAtalhoDiretorio
    if [ $varcriaAtalhoDiretorio = "s" ]; then
        echo "Diretorio:"
        read dp
        echo "Diretorio/atalho:"
        read da
	    ln -s $dp $da  
    fi
}

AtalhoBinExec(){
    sudo rm /usr/bin/jrs
    chmod +x $1
    chmod 777 $1
    sudo ln -s $1 /usr/bin/jrs
}
# cria atalho no bin possibilitando o uso do script em qualquer diretorio
#criaAtalhoBin "$diretorio/nome.txt" "nome do atalho para pasta /usr/bin/"
#AtalhoBinExec "diretorio/nome.txt"