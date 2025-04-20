#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
 

alias nrb='npm run build'
alias nrd='npm run dev'

alias ls='ls --color=auto'
alias ll="ls -l"
alias la="ls -la"
alias cl="clear"
alias grep='grep --color=auto'
PS1='\[\e[1;34m\]\u@\h\[\e[0m\]:\[\e[1;32m\]\w\[\e[0m\]\$ '

OSH_THEME="agnoster"

alias ls='ls --color=auto'
eval $(dircolors ~/.dircolors)

export CLICOLOR=1

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export EDITOR="nvim"

export PATH="$HOME/.fly/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export CHROME_PATH="/usr/bin/brave"

set -o vi
