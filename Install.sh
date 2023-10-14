#!/bin/bash

declare -i linked_file_count=0

install() {
    path="$1"
    filename=$(basename $path)
    directory=$(dirname $path)

    if [ -e $path ]; then
        echo "File $filename ignored because it already exists in $directory"
        return 1
    fi

    if [ ! -d $directory ]; then
        mkdir -p $directory
        echo "Intermediate directory $directory created"
    fi

    ln -s $(pwd)/$filename $directory/$2

    if [ $? -eq 0 ]; then
        linked_file_count+=1
        echo "Symlinked $filename to $directory"
    fi
}

dependency() {
    if [ ! $(which $2 2> /dev/null) ]; then
        echo "Caveat: $1 may require executable $2, but it's not in PATH"
    fi
}

mkdir -p ~/.cache

install ~/.gitconfig
install ~/.gitignore
install ~/.gittemplate/hooks/commit-msg
install ~/.vim/colors/default-dark.vim
install ~/.vimrc

dependency vim vim
dependency git git

if [ $(uname) == "Linux" ]; then
    # Debian: default bashrc loads bash_aliases, use bash_local for locals
    install ~/.bash_profile .bash_aliases
    install ~/.xinitrc
    dependency xorg startx
    dependency xorg dwm
else
    install ~/.bash_profile
fi

dependency vim ack
dependency vim curl
dependency vim ctags
dependency vim docker
dependency vim xpdf

echo "Installed a total of $linked_file_count configuration files"
