PLATFORM=`uname -s`

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle :compinstall filename "~/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt sharehistory appendhistory extendedglob notify histignorealldups
bindkey -e
# End of lines configured by zsh-newuser-install

# Set up locale
export LANG=en_GB.UTF-8

# Set up prompt
PS1="[%h] %n %# "
autoload -U promptinit
promptinit
prompt bart

# Enable colour in programs that notice $CLICOLOR
export CLICOLOR=1

# Some useful aliases
alias g=git
alias r=rails
alias rvim='gvim --remote'

# Platform-specific sections
if [[ $PLATFORM = 'Darwin' ]]; then
  alias l=launch
  alias gitx='launch -i nl.frim.GitX'
fi
