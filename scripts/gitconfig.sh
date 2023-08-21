#!/usr/bin/env sh

gitconfig(){
    echo "DESEJA INSTALAR O GIT E O GITHUBCLI? [s/n]"
    read resp
    if [ "$resp" = "s" ]; then
        #https://docs.github.com/pt/get-started/getting-started-with-git/caching-your-github-credentials-in-git
        installPacotes "git gh github-cli"
        gh auth login
        #vars
        echo "DIGITE SEU NOME:"
        read name
        echo "DIGITE SEU EMAIL:"
        read email
        branch = "main"
        #global config
        git config --global user.name "$name"
        git config --global user.email "$email"
        #repositorie config
        #git config user.name "$name"
        #git config user.email "$email"
        #default branch
        git config --global init.defaultBranch $branch
        git branch -m $branch
    fi
}