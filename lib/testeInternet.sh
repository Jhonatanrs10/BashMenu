#!/usr/bin/env sh
teste_internet(){
	echo -e "[INFO] - VERIFICANDO CONEXAO COM A REDE - [INFO]"
	if ! ping -c 1 8.8.8.8 -q &> /dev/null; 
	then
	  echo -e "[INFO] - SEM CONEXAO COM INTERNET - [INFO]"
	  exit 1
	else
	  echo -e "[INFO] - CONEXAO COM INTERNET FUNCIONANDO NORMALMENTE - [INFO]"
	fi
}