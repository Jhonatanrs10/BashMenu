#!/usr/bin/env sh
criaSeuUsuarioSamba(){
   #pra ter usuario no samba tem que ter usuario no sistema
   echo "CRIAR USUARIO ($USER) NO SAMBA [s]/[n]"
   read resp
   if [ "$resp" = "s" ]; then
      sudo smbpasswd -a $USER
   fi 
}
criaDiretorioSamba(){
   mkdir -p $HOME/Samba
   sudo chmod 777 $HOME/Samba
}
criaDiretorioShare(){
   #criaSmbDefault
   echo "CRIANDO PASTA SE NAO EXISTIR..."
   sudo mkdir -p $1
   sudo $USER
   #sudo chown $USER: $1
   sudo chmod 777 $1
   echo "CONFIGURANDO PASTA NO SAMBA..."
   echo "[$2]
   comment = Pasta Compartilhada na Rede
   path = $1
   browseable = yes
   read only = yes
   guest ok = $3
   write list = $USER
   force directory mode = 0777
   directory mode = 0777
   create mode = 0777" | sudo tee -a /etc/samba/smb.conf
	#COMANDO QUE CRIA USUARIO NO LINUX
	#adduser usuario
	#COMANDO QUE REMOVE USUARIO DO SAMBA
	#smbpasswd -x usuario
	#edite o arquivo /etc/samba/smb.conf abra com sudo para remover sua pasta da rede
    
}
#criaSeuUsuarioSamba
#criaDiretorioShare "diretorio/pasta" "nomePasta" "guest ok"

criaSmbDefault(){

   echo "CRIAR SMB.CONF [s]/[n]"
   read resp
   if [ "$resp" = "s" ]; then
   
   sudo mv /etc/samba/smb.conf /etc/samba/smb-bkp$DATANOW.conf
   criarArq "[global]
   workgroup = WORKGROUP
   netbios name = Samba
   server string = Samba Server
   server role = standalone server
   security = user
   map to guest = bad user
   guest account = nobody
   log file = /var/log/samba/%m
   log level = 1
   dns proxy = no

[printers]
   comment = All Printers
   path = /usr/spool/samba
   browsable = no
   guest ok = no
   writable = no
   printable = yes" "$HOME/criarArq-smb.conf"
   sudo mv $HOME/criarArq-smb.conf /etc/samba/smb.conf
   fi 
}