#!/usr/bin/env sh
pastaExiste(){
	if [ -d $1 ];
    then
        $2
    else
        $3
    fi
}
#pastaExiste "$HOME/.Jhonatanrs/Icons" "sudo rm -r $HOME/.Jhonatanrs/Icons" " senao"