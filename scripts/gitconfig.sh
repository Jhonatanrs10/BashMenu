#!/usr/bin/env sh

gitconfig(){
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

}

gitAutoPush(){
    cd $HOME/*/GitHub
    echo "[GITs]"
    ls
    read selection
    cd $selection
    git status
    yesorno "PULL" "git pull"
    echo "COMMIT:"
    read textCommit
    yesorno "ADD" "git add ."
    git status
    yesorno "COMMIT ($textCommit)" "git commit -m "$textCommit""
    git status
    yesorno "PUSH" "git push"
    git status
    sleep 5
}