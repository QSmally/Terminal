#!/bin/bash

files=( ".bash_profile" ".vimrc" )

declare -i linked_file_count=0

for file in "${files[@]}"; do
    if [ -e ~/$file ]; then
        echo "File $file ignored because it already exists in ~"
    else
	    ln -s $(pwd)/$file ~/$file
        if [ $? -eq 0 ]; then
            linked_file_count+=1
            echo "Symlinked $file to ~"
        fi
    fi
done

echo "Symlinked a total of $linked_file_count configuration files to ~"

