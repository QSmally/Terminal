
# Homebrew
alias gimme="brew install"
alias packages="brew leaves | tee"
alias casks="brew list --casks | tee"
alias update="brew update && brew upgrade && brew autoremove && brew cleanup"

# Git
alias save="git stash save --include-untracked"
alias restore="git stash pop"
alias drop="git checkout ."
alias forward="git merge --ff-only"
alias merge="git merge --no-ff --no-commit"
alias refs="git rev-list --left-right --oneline"
alias submodules="git submodule update --init --recursive"
alias prune="git remote prune origin && git branch -v | grep \"\\[gone\\]\" | awk '{print \$1}' | xargs git branch -D"
alias mods="vim \$(git status --porcelain | awk '{print \$2}')"

# Compression
alias archive="tar -cvf Archive.tar"
alias compress="tar -czvf Archive.tar.gz"
alias extract="tar -xvf"

# LaTeX
alias pdf="[ -d Compilation/ ] || mkdir Compilation; pdflatex -output-directory=Compilation -jobname=Document -interaction=nonstopmode"

# Miscellaneous
alias ll="ls -lAh --color=always"
alias usage="du -hd 1"
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

# Cursor and prefix colours
printf '\033[3 q'
PS1='\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
