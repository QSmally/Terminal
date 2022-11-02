
alias gimme="brew install"
alias packages="brew leaves"
alias update="brew update && brew upgrade && brew autoremove && brew cleanup"
alias save="git stash save --include-untracked -m"
alias checkpoint="git stash save --include-untracked -m \"checkpoint $(openssl rand -base64 12)\""
alias restore="git stash pop"
alias drop="git checkout ."
alias archive="tar -cvf Archive.tar"
alias compress="tar -czvf Archive.tar.gz"
alias extract="tar -xvf"
alias fetch="neofetch && cpufetch"

export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/usr/local/sbin:$PATH"

if [ -d "/opt/homebrew" ]; then
	eval $(/opt/homebrew/bin/brew shellenv)
fi

