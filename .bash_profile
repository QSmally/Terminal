
# Homebrew
alias gimme="brew install" # <package>
alias packages="brew leaves | tee"
alias casks="brew list --casks | tee"
alias update="brew update && brew upgrade && brew autoremove && brew cleanup"

# Compression
alias archive="tar -cvf Archive.tar" # <directory>
alias compress="tar -czvf Archive.tar.gz" # <directory>
alias extract="tar -xvf" # <directory>

# LaTeX
alias pdf="[ -d Compilation/ ] || mkdir Compilation; pdflatex -output-directory=Compilation -jobname=Document -interaction=nonstopmode"

# Miscellaneous
alias ll="ls -lAh --color=always" # [directory]
alias lt="ll -t" # [directory]
alias usage="du -hd 1" # [directory]
alias fetch="neofetch && cpufetch"

# Shell
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/usr/local/sbin:~/.bin:~/.local/bin:$PATH"

if [ -d /opt/homebrew ]; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi

if [ -e ~/.bash_local ]; then
    . ~/.bash_local
fi

# Cursor type
printf '\033[3 q'

# Terminal prefix for OSX
if [ $(uname) == "Darwin" ]; then
    PS1='\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi
