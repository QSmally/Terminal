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
    filename="$(basename "$1")"
    directory="$(dirname "$1")"
    target="$([ -z $2 ] && echo $filename || echo $2)"

    if [ -e "$directory/$target" ]; then
        echo "File $filename ignored because $target already exists in $directory"
        return 1
    fi

    if [ ! -d "$directory" ]; then
        mkdir -p "$directory"
        echo "Intermediate directory $directory created"
    fi

    ln -s "$(pwd)/$filename" "$directory/$target"

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

download() {
    directory="$1"
    url="$2"
    unpack="$3"

    if [ -d "$directory" ]; then
        echo "Download $directory ignored because directory already exists"
        return 1
    fi

    mkdir -p "$directory"
    echo "Downloading $url to $directory..."
    cd "$directory"

    curl -q "$url" | tar -xf- -C . || exit 1

    if [ ! -z "$unpack" ]; then
        mv $unpack/* . || exit 1
        rm -r $unpack || exit 1
    fi

    echo "Installed content in $directory"
    linked_file_count+=1
}

mkdir -p ~/.cache

install ~/.ackrc
install ~/.gitconfig
install ~/.vim/colors/default-dark.vim
install ~/.vimrc

if [ ! $server ]; then
    install ~/.gitignore
    install ~/.gittemplate/hooks/commit-msg
    install ~/.gnupg/gpg.conf
    install ~/.latexmkrc
    install ~/.vim/snippet/all.snippets
    install ~/.vim/snippet/tex.snippets
    install ~/.vim/snippet/zig.snippets

    chmod 700 ~/.gnupg
fi

dependency vim vim
dependency git git

if [ $(uname) == "Linux" ]; then
    # Debian: default bashrc loads bash_aliases, use bash_local for locals
    install ~/.bash_profile .bash_aliases

    if [ ! $server ]; then
        # *: bash_profile is loaded on login shell
        install ~/.profile .bash_profile
        install ~/.xinitrc
        dependency xorg startx
        dependency xorg xclip
        dependency xorg dwm
    fi
else
    install ~/.bash_profile
fi

dependency vim ack
dependency vim curl
dependency vim node
dependency vim python3

if [ ! $server ]; then
    dependency bash fzf
    dependency bash gs
    dependency bash pandoc
    dependency git gpg
    dependency vim ctags
    dependency vim docker
    dependency vim latexmk
    dependency vim xpdf
fi

if [ ! $server ]; then
    download ~/.vim/thesaurus "https://www.openoffice.org/lingucomponent/MyThes-1.zip" "MyThes-1.0"
fi

echo "Installed a total of $linked_file_count configuration files"
