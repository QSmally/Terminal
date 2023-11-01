
alias ll="ls -lAh --color=always" # [directory]
alias lt="ll -t" # [directory]
alias diff="diff -u --color=always" # <file> <file>
alias usage="du -hd 1" # [directory]

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

# LaTeX
if [ $(which pdflatex 2> /dev/null) ]; then
    alias pdf="[ -d Compilation/ ] || mkdir Compilation; pdflatex -output-directory=Compilation -jobname=Document -interaction=nonstopmode"
fi

# Shell
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/usr/local/sbin:~/.bin:~/.local/bin:$PATH"

if [ -e ~/.bash_local ]; then
    . ~/.bash_local
fi

# Prefix for OSX
if [ $(uname) == "Darwin" ]; then
    PS1='\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

# Cursor underline
printf '\033[3 q'
