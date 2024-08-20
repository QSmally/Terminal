#!/bin/bash

#
# © 2023 Joey Smalen
#
# Command usage:
#   ./Install.sh
#   ./Install.sh --server
#
# Installation of dotfiles and recommendations of dependencies.
#

declare -i linked_file_count=0
declare server="\"${1:-false}\" == \"--server\""

if [ $server ]; then
    echo "Installing server-based configuration..."
fi

install() {
    filename=$(basename $1)
    directory=$(dirname $1)
    target=$([ -z $2 ] && echo $filename || echo $2)

    if [ -e "$directory/$target" ]; then
        echo "File $filename ignored because it already exists in $directory"
        return 1
    fi

    if [ ! -d $directory ]; then
        mkdir -p $directory
        echo "Intermediate directory $directory created"
    fi

    ln -s $(pwd)/$filename "$directory/$target"

    if [ $? -eq 0 ]; then
        linked_file_count+=1
        echo "Symlinked $target to $directory"
    fi
}

dependency() {
    if [ ! $(which $2 2> /dev/null) ]; then
        echo "Caveat: $1 may require executable $2, but it's not in PATH"
    fi
}

mkdir -p ~/.cache

install ~/.ackrc
install ~/.gitconfig
install ~/.vim/colors/default-dark.vim
install ~/.vimrc

if [ ! $server ]; then
    install ~/.gitignore
    install ~/.gittemplate/hooks/commit-msg
    install ~/.latexmkrc
fi

dependency vim vim
dependency git git

if [ $(uname) == "Linux" ]; then
    # Debian: default bashrc loads bash_aliases, use bash_local for locals
    install ~/.bash_profile .bash_aliases

    if [ ! $server ]; then
        install ~/.profile .bash_profile
        install ~/.xinitrc
        dependency xorg startx
        dependency xorg dwm
    fi
else
    install ~/.bash_profile
fi

dependency vim ack
dependency vim curl

if [ ! $server ]; then
    dependency vim ctags
    dependency vim docker
    dependency vim latexmk
    dependency vim xpdf
fi

echo "Installed a total of $linked_file_count configuration files"
