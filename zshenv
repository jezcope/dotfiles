# Make $path array ignore non-unique elements
typeset -U path

PLATFORM=`uname -s`

path=($HOME/bin $HOME/bin/shared $path)

export MAVEN_OPTS='-Xms256m -Xmx645m -XX:PermSize=64m -XX:MaxPermSize=256m'
export JAVA_OPTS='-server -Xms512m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=512m -XX:NewSize=192m -XX:MaxNewSize=384m -Djava.awt.headless=true -Dhttp.agent=Sakai -Dorg.apache.jasper.compiler.Parser.STRICT_QUOTE_ESCAPING=false -Dsun.lang.ClassLoader.allowArraySyntax=true'

export HTML_TIDY=~/.htmltidy.conf

# Platform specific config
if [[ $PLATFORM = 'Darwin' ]]; then
  path=(/usr/local/sbin ~/Scripts /usr/local/bin $path)
  path=(~"/Library/Application Support/MultiMarkDown/bin" $path)
  path=(~"/Library/Haskell/bin" $path)
  #path=(/opt/local/bin /opt/local/sbin $path)
  path=(/usr/local/texlive/2013/bin/universal-darwin $path)

  manpath=(/opt/local/share/man $manpath)

  export GOPATH=~/Library/Go
elif [[ $PLATFORM = 'Linux' ]]; then
  path=(/usr/local/texlive/2011/bin/x86_64-linux $path)

  whence pacman-color > /dev/null && alias -g pacman=pacman-color

  export GOPATH=~/.go
else
  # Exclude some gems from being installed on non-Mac systems
  BUNDLE_WITHOUT=darwin_only
fi

# Source local rvm config
if [[ -s "$HOME/.rvmrc" ]]; then
  source "$HOME/.rvmrc"
fi

# Try some common options for rvm location
if [[ -z "$rvm_path" ]]; then
  if [[ -s "/usr/local/rvm/scripts/rvm" ]]; then
    rvm_path=/usr/local/rvm
  elif [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    rvm_path=$HOME/.rvm
  fi
fi

export PATH

if [[ -n "$EMACS" ]]; then # If we're running a terminal inside emacs
  export EDITOR=$(which emacsclient)
else
  export EDITOR="$(which emacsclient) -t"
  export ALTERNATE_EDITOR=$(which emacs-terminal.sh)
fi

whence keychain > /dev/null && eval $(keychain --eval --agents ssh --ignore-missing -Q -q id_rsa id_ecdsa jezcope_aws.pem)

if [[ -s "$HOME/.zshenv.local" ]]; then
  source "$HOME/.zshenv.local"
fi

# Create $GOPATH if it doesn't exist
mkdir -p $GOPATH

# Source rvm if it seems to be installed (i.e. $rvm_path set)
if [[ -n "$rvm_path" ]]; then
  source "$rvm_path/scripts/rvm"  # This loads RVM into a shell session.
  PATH=$PATH:$rvm_path/bin # Add RVM to PATH for scripting
fi

# Local Variables:
# mode: sh
# End:
