#!/usr/bin/env sh
bongocat="https://github.com/kuroni/bongocat-osu/archive/refs/heads/master.zip"
bongo(){
    installPacotes "g++ libxdo libxdo-dev libsdl2-dev libsfml-dev sdl2 sfml x11 xrandr make"
    echo -e "[INFO] - INSTALANDO BONGOCAT - [INFO]"
	criaDiretorio "diretorioBongo" "$dBashMenu"
    criaPastaBaixaExtrai "$diretorioBongo" "$bongocat" "bongo.zip"
    mv $diretorioBongo/bongocat-* $diretorioBongo/bongocat
    cd $diretorioBongo/bongocat
    cp Makefile.linux Makefile
    make
    mv $diretorioBongo/bongocat/bin/bongo $diretorioBongo/bongocat/bongo
    criarArq "#!/usr/bin/env sh
cd $diretorioBongo/bongocat
./bongo" "$diretorioBongo/bongocat/bongo.sh"
    criarArq "#COMO CONFIGURAR
no diretorio src voce deve encontrar um arquivo data.cpp
so editar igual ao windows
########################################################
configuracao padrao
########################################################
  osu: {
        mouse: true,
        toggleSmoke: false,
        paw: [198, 235, 254],
        pawEdge: [2, 77, 164],
        key1: [83, 68],
        key2: [87, 65],
        smoke: [8, 19],
        wave: [220]
########################################################
apos configuracao executar um make no diretorio e pegar o novo executavel na pasta bin
" "$diretorioBongo/bongocat/configurar.txt"
    criaAtalhoBin "$diretorioBongo/bongocat/bongo.sh" "winBongo"
}
