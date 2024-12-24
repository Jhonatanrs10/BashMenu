#!/usr/bin/env sh
enableSystemctl(){
    echo "Ativar $1?
Options: [1]Yes, [2]No"
    read resp
    case $resp in
		1)sudo systemctl enable $1 --now;;
        2)sudo systemctl disable $1;;
		*)
	esac
}
enableSystemctlDM(){
    echo "Mudar Desktop Manager ?
Options: [1]Yes, [2]No"
    read resp
    case $resp in
		1)
            echo "Desativar:"
            read resp1
            echo "Ativar:"
            read resp2
            sudo systemctl disable $resp1
            sudo systemctl enable $resp2 --now
            ;;
		*)
	esac
}
#enableSystemctl "processo"
#exemplo smbd bluetooth