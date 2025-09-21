
alias diff="diff -u --color=always" # <file> <file>
alias ls="ls --color=always" # [directory]
alias ll="ls -lAh --color=always" # [directory]
alias lll="ls -lh --color=always" # [directory]
alias lt="ll -t" # [directory]
alias usage="du -hd 1" # [directory]

range() { sed "$1!d" $2; } # <range> [file]
cr() { cd "$(git rev-parse --show-toplevel)"; }

alias choochoo="while true; do sl; done"

if [ $(uname) == "Darwin" ]; then
    # copy < file, range x,y file | copy
    alias copy="pbcopy"
fi

# Homebrew
if [ $(which brew 2> /dev/null) ]; then
    eval $(brew shellenv)
elif [ -d /opt/homebrew ]; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi

if [ $(which brew 2> /dev/null) ]; then
    alias gimme="brew install" # <package>
    alias packages="brew leaves | tee"
    alias casks="brew list --casks | tee"
    alias update="brew update && brew upgrade && brew autoremove && brew cleanup"
fi

# Compression
if [ $(which tar 2> /dev/null) ]; then
    alias archive="tar -cvf Archive.tar" # <directory>
    alias compress="tar -czvf Archive.tar.gz" # <directory>
    alias extract="tar -xvf" # <directory>
fi

# Fuzzy finder
if [ $(which fzf 2> /dev/null) ]; then
    eval "$(fzf --bash)"
fi

# LaTeX
if [ $(which pdflatex 2> /dev/null) ]; then
    alias pdf="[ -d Compilation/ ] || mkdir Compilation; pdflatex -output-directory=Compilation -jobname=Document -interaction=nonstopmode" # <files>
fi

if [ $(which gs 2> /dev/null) ]; then
    alias smallify="gs -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile=Document.small.pdf" # <file>
fi

# Pandoc
if [ $(which pandoc 2> /dev/null) ]; then
    alias conv="pandoc -V geometry:margin=0.75in -o Document.pdf" # <files>
fi

# Docker
if [ $(which docker 2> /dev/null) ]; then
    dkrrmc() { docker rm -vf $(docker ps -aq); }
    dkrrmi() { docker rmi -f $(docker images -aq); }
    dkrrmv() { docker volume rm -f $(docker volume ls -q); }
fi

# GPG
if [ $(which gpgconf 2> /dev/null) ]; then
    export GPG_TTY=$(tty)
    gpgconf --launch gpg-agent
fi

# Shell
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/usr/local/sbin:~/.bin:~/.local/bin:$PATH"
export VISUAL=vim
export EDITOR="$VISUAL"

if [ $(which foot 2> /dev/null) ]; then
    export TERMINAL=foot
fi

if [ $(which ghostty 2> /dev/null) ]; then
    export TERMINAL=ghostty
fi

if [ -e ~/.bash_local ]; then
    . ~/.bash_local
fi

# Prefix for OSX
if [ $(uname) == "Darwin" ]; then
    PS1='\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

# Cursor underline
printf '\033[3 q'
