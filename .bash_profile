
alias gimme="brew install"
alias update="brew update && brew upgrade && brew autoremove && brew cleanup"
alias checkpoint="git stash save --include-untracked \"checkpoint $(openssl rand -base64 12)\""
alias restore="git stash pop"
alias drop="git checkout ."
alias archive="tar -cvf Archive.tar"
alias extract="tar -xvf"
alias fetch="neofetch && cpufetch"

export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/usr/local/sbin:$PATH"

if [ -d "/opt/homebrew" ]; then
	eval $(/opt/homebrew/bin/brew shellenv)
fi

