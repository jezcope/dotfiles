# Make $path array ignore non-unique elements
typeset -U path

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

PLATFORM=`uname -s`

if [[ $PLATFORM = 'Darwin' ]]; then
  path=(/Users/jez/Scripts /Users/jez/bin /usr/local/bin $path)
  path=("/Users/jez/Library/Application Support/MultiMarkDown/bin" $path)
  path=(/opt/local/bin /opt/local/sbin $path)
fi

