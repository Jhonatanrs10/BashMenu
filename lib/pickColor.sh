#!/usr/bin/env sh
pickColor(){
    echo "$1 [Default:$2]"
    read pickedColor
    lengthColor=${#pickedColor}
    if [ $lengthColor -lt 6 ]; then
        pickedColor=$2
    fi
	if [ ${pickedColor:0:1} = "#" ]; then
        pickedColor=${pickedColor:1:6}
    else
        pickedColor=${pickedColor:0:6}
    fi

     echo "Picked Color: $pickedColor" 
}
#pickColor "Texto" "default color"