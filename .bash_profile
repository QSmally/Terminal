
# Homebrew
alias gimme="brew install"
alias packages="brew leaves"
alias casks="brew list --casks"
alias update="brew update && brew upgrade && brew autoremove && brew cleanup"

# Git
alias save="git stash save --include-untracked"
alias checkpoint="git stash save --include-untracked -m \"checkpoint $(openssl rand -base64 12)\""
alias restore="git stash pop"
alias drop="git checkout ."

# Compression
alias archive="tar -cvf Archive.tar"
alias compress="tar -czvf Archive.tar.gz"
alias extract="tar -xvf"

# LaTeX
alias pdf="[ -d Compilation/ ] || mkdir Compilation; pdflatex -output-directory=Compilation -jobname=Document"

# Miscellaneous
alias fetch="neofetch && cpufetch"

# Shell
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/usr/local/sbin:$PATH"

if [ -d /opt/homebrew ]; then
	eval $(/opt/homebrew/bin/brew shellenv)
fi

if [ -e ~/.bash_local ]; then
    . ~/.bash_local
fi

