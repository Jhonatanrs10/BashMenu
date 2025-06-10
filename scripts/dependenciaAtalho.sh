#!/usr/bin/env sh
dependenciasAtalho(){
    echo "INSTALAR ATALHO BASHMENU 
Diretório atual:
$PWD
Este é o diretório do $nomeRun.sh (s/n)"
    read resp
    if [ "$resp" = "s" ]; then
        wrapper="$dBashMenu/.jrs.sh"

        echo "Criando wrapper em: $wrapper"

        cat <<EOF > "$wrapper"
#!/usr/bin/env bash
cd "$PWD"
bash "$nomeRun.sh"
EOF

        chmod +x "$wrapper"
        sudo ln -sf "$wrapper" /usr/bin/jrs

        echo "Atalho 'jrs' criado! Agora você pode rodar o script de qualquer lugar com:"
        echo -e "  ${GREEN}jrs${RESET}"
    fi
}


