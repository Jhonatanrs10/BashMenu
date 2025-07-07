#!/usr/bin/env sh
criaPastaShareUser(){
        criaSmbDefault
	packagesManager "samba"
        enableSystemctl "smb"
        enableSystemctl "nmb"
        criaSeuUsuarioSamba
        criaDiretorioSamba
        criaDiretorioShare "$HOME/Samba/User" "User" "no"
        
}

criaPastaShareGuest(){
        criaSmbDefault
	packagesManager "samba"
        enableSystemctl "smb"
        enableSystemctl "nmb"
        criaSeuUsuarioSamba
        criaDiretorioSamba
        criaDiretorioShare "/home/samba" "Guest" "yes"
        ln -s /home/samba $HOME/Samba/Guest
}

setupSambaAntigov1(){
        echo "[Setup Samba]
Options: [1]Yes [2]No"
	read resp
        case $resp in
        1)criaSmbDefault
        packagesManager "samba"
        enableSystemctl "smb"
        enableSystemctl "nmb"
        criaSeuUsuarioSamba
        criaDiretorioSamba
        criaDiretorioShare "$HOME/Samba/User" "User" "no"
        criaDiretorioShare "/home/samba" "Guest" "yes"
        ln -s /home/samba $HOME/Samba/Guest
        ;;
        *)
        esac
}

setupSambaAntigov2(){
    echo "Samba Config
[1]Yes [2]No"
    read resp
    case $resp in
        1)
        sudo mv /etc/samba/smb.conf /etc/samba/smb-bkp$DATANOW.conf
        sudo smbpasswd -a $USER
        sudo smbpasswd -e $USER
        mkdir -p $HOME/Samba/User
        sudo chmod 777 $HOME/Samba
        sudo mkdir -p /home/samba
        sudo chmod 777 /home/samba
        echo "[global]
    workgroup = WORKGROUP
    preferred master = no
    local master = no
    domain master = no
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
    printable = yes
[User]
    comment = Pasta Compartilhada na Rede
    path = $HOME/Samba/User
    browseable = yes
    read only = yes
    guest ok = no
    write list = $USER
    force directory mode = 0777
    directory mode = 0777
    create mode = 0777
[Guest]
    comment = Pasta Compartilhada na Rede
    path = /home/samba
    browseable = yes
    read only = yes
    guest ok = yes
    write list = $USER
    force directory mode = 0777
    directory mode = 0777
    create mode = 0777" | sudo tee -a /etc/samba/smb.conf
        ln -s /home/samba $HOME/Samba/Guest
        ;;
        *)
        ;;
    esac
}

sambaSetup(){
    echo "Samba Config
[1]Yes [2]No"
    read -r resp
    case $resp in
        1)
        DATANOW=$(date +%Y%m%d-%H%M%S)

        RAND=$(cat /dev/urandom | tr -dc 'A-Z0-9' | head -c 6)
        NETBIOS_NAME="Samba$RAND"

        echo "Using NetBIOS name: $NETBIOS_NAME"

        sudo mv /etc/samba/smb.conf /etc/samba/smb-bkp$DATANOW.conf
        sudo smbpasswd -a "$USER"
        sudo smbpasswd -e "$USER"
        mkdir -p "$HOME/Samba/User"
        sudo chmod 777 "$HOME/Samba"
        sudo mkdir -p /home/samba
        sudo chmod 777 /home/samba

        echo "[global]
    workgroup = WORKGROUP
    preferred master = no
    local master = no
    domain master = no
    netbios name = $NETBIOS_NAME
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
    printable = yes
[User]
    comment = Pasta Compartilhada na Rede
    path = $HOME/Samba/User
    browseable = yes
    read only = yes
    guest ok = no
    write list = $USER
    force directory mode = 0777
    directory mode = 0777
    create mode = 0777
[Guest]
    comment = Pasta Compartilhada na Rede
    path = /home/samba
    browseable = yes
    read only = yes
    guest ok = yes
    write list = $USER
    force directory mode = 0777
    directory mode = 0777
    create mode = 0777" | sudo tee /etc/samba/smb.conf > /dev/null

        ln -s /home/samba "$HOME/Samba/Guest"
        sudo systemctl restart smbd nmbd
        ;;
        *)
        echo "Canceled."
        ;;
    esac
}


#sudo useradd -m samba
#sudo passwd samba