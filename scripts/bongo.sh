#!/usr/bin/env sh
bongo(){
    bongocat="https://github.com/kuroni/bongocat-osu/archive/refs/heads/master.zip"
    uninstallPastaAtalhoBinMesmoNome "winBongo"
    installPacotes "g++ gcc libxdo xdotool libxdo-dev libsdl2-dev libsfml-dev sdl2 sfml x11 xrandr make"
    echo -e "[INFO] - INSTALANDO BONGOCAT - [INFO]"
    criaDiretorio "diretorioBongo" "$dBashMenu/winBongo"
    cd $diretorioBongo
    criaPastaBaixaExtrai "$diretorioBongo" "$bongocat" "bongo.zip"
    mv $diretorioBongo/*/* .
    #cp -r $diretorioBongo/*/* .
    cp Makefile.linux Makefile
    make
    mv $diretorioBongo/bin/bongo $diretorioBongo/bongo
    criarArq "#!/usr/bin/env sh
cd $diretorioBongo
./bongo" "$diretorioBongo/bongo.sh"
    criarArq '//COMO CONFIGURAR
//no diretorio src voce deve encontrar um arquivo data.cpp
//so editar igual ao windows
//apos configuracao executar um make no diretorio e pegar o novo executavel na pasta bin
//vale tentar criar um config.json no mesmo local do executavel
//########################################################
//configuracao padrao
{
 "mode": 1,
    "resolution": {
        "letterboxing": false,
        "width": 1920,
        "height": 1080,
        "horizontalPosition": 0,
        "verticalPosition": 0
    },
    "decoration": {
        "leftHanded": false,
        "rgb": [255, 255, 255],
        "offsetX": [0, 11],
        "offsetY": [0, -65],
        "scalar": [1.0, 1.0]
    },
    "osu": {
        "mouse": true,
        "toggleSmoke": false,
        "paw": [198, 235, 254],
        "pawEdge": [2, 77, 164],
        "key1": [83, 68],
        "key2": [87, 65],
        "smoke": [59],
        "wave": [220]
    },
    "taiko": {
        "leftCentre": [88],
        "rightCentre": [67],
        "leftRim": [90],
        "rightRim": [86]
    },
    "catch": {
        "left": [37],
        "right": [39],
        "dash": [16]
    },
    "mania": {
        "4K": true,
        "key4K": [68, 70, 74, 75],
        "key7K": [83, 68, 70, 32, 74, 75, 76]
    },
    "custom": {
        "background": "img/osu/mousebg.png",
        "mouse": false,
        "mouseImage": "img/osu/mouse.png",
        "mouseOnTop": true,
        "offsetX": 0,
        "offsetY": 0,
        "scalar": 1.0,
        "paw": [255, 255, 255],
        "pawEdge": [0, 0, 0],
        "keyContainers": []
    },
    "mousePaw": {
        "mousePawComment": "coordinates start in the top left of the window",
        "pawStartingPoint": [211, 159],
        "pawEndingPoint": [258, 228]
    }
}
' "$diretorioBongo/config.json"
    criaAtalho "BongoCat" "WEBCAM Avatar" "bash $diretorioBongo/bongo.sh" "$diretorioBongo" "false" "winBongo" "$diretorioBongo/ico/bongo.ico"
    criaAtalhoBin "$diretorioBongo/bongo.sh" "winBongo"
}
