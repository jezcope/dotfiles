# Mental note: this is sourced for *interactive* sessions

ZSH=$HOME/.zsh/oh-my-zsh
ZSH_THEME="fishy"
plugins=(git extract)
source $ZSH/oh-my-zsh.sh

# Set up completion
fpath=(~/.zsh/zsh-completions $fpath)
setopt dvorak
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle :compinstall filename "~/.zshrc"

autoload -Uz compinit
compinit

# Set up history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt sharehistory appendhistory extendedglob notify histignorealldups

# Set up key bindings
#bindkey -v    # vi-like bindings
#bindkey  history-incremental-search-backward

# Set up locale
export LANG=en_GB.UTF-8

# Enable colour in programs that notice $CLICOLOR
#export CLICOLOR=1

# enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
  #test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  #alias ls='ls --color=auto'
  ##alias dir='dir --color=auto'
  ##alias vdir='vdir --color=auto'

  #alias grep='grep --color=auto'
  #alias fgrep='fgrep --color=auto'
  #alias egrep='egrep --color=auto'
#fi

# A few more options
setopt noclobber multios

# Platform-specific sections
if [[ $PLATFORM = 'Darwin' ]]; then
  alias l=launch
  alias gitx='launch -i nl.frim.GitX'
  alias gvim=mvim
fi
