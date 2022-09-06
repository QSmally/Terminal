
alias gimme="brew install"
alias fetch="neofetch && cpufetch"
alias update="brew update && brew upgrade && brew autoremove && brew cleanup"
alias checkpoint="git stash --include-untracked"

export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="/usr/local/sbin:$PATH"

if [ -d "/opt/homebrew" ]; then
	eval $(/opt/homebrew/bin/brew shellenv)
fi

