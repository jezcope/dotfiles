# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' max-errors 3
zstyle :compinstall filename '/home/jez/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install

PS1="[%h] %n %# "

autoload -U promptinit
promptinit
prompt bart

alias g=git
alias r=rails

alias rvim='gvim --remote'
