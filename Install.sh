#!/bin/bash

declare -r files=(
    ~/.bash_profile
    ~/.vimrc
    ~/.vim/colors/default-dark.vim
)

declare -i linked_file_count=0

for path in "${files[@]}"; do
    filename=$(basename $path)
    directory=$(dirname $path)

    if [ -e $path ]; then
        echo "File $filename ignored because it already exists in $directory"
        continue
    fi

    if [ ! -d $directory ]; then
        mkdir $directory
        echo "Intermediate directory $directory created"
    fi

    ln -s $(pwd)/$filename $directory

    if [ $? -eq 0 ]; then
        linked_file_count+=1
        echo "Symlinked $filename to $directory"
    fi
done

echo "Installed a total of $linked_file_count configuration files"

