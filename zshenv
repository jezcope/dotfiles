# Make $path array ignore non-unique elements
typeset -U path

if [[ -s "$HOME/.rvmrc" ]]; then
  source "$HOME/.rvmrc"
fi
if [[ -s "${rvm_path:=$HOME/.rvm}/scripts/rvm" ]]; then
  source "$rvm_path/scripts/rvm"  # This loads RVM into a shell session.
fi
PATH=$PATH:$rvm_path/bin # Add RVM to PATH for scripting

PLATFORM=`uname -s`

path=($HOME/bin $HOME/bin/shared $path)

export EDITOR=`which vim`

export MAVEN_OPTS='-Xms256m -Xmx645m -XX:PermSize=64m -XX:MaxPermSize=256m'
export JAVA_OPTS='-server -Xms512m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=512m -XX:NewSize=192m -XX:MaxNewSize=384m -Djava.awt.headless=true -Dhttp.agent=Sakai -Dorg.apache.jasper.compiler.Parser.STRICT_QUOTE_ESCAPING=false -Dsun.lang.ClassLoader.allowArraySyntax=true'

export HTML_TIDY=~/.htmltidy.conf

# Platform specific config
if [[ $PLATFORM = 'Darwin' ]]; then
  path=(~/Scripts /usr/local/bin $path)
  path=(~"/Library/Application Support/MultiMarkDown/bin" $path)
  path=(~"/Library/Haskell/bin" $path)
  #path=(/opt/local/bin /opt/local/sbin $path)
  path=(/usr/local/texlive/2011/bin/universal-darwin $path)

  manpath=(/opt/local/share/man $manpath)
elif [[ $PLATFORM = 'Linux' ]]; then
  path=(/usr/local/texlive/2011/bin/x86_64-linux $path)

  whence pacman-color > /dev/null && alias -g pacman=pacman-color
else
  # Exclude some gems from being installed on non-Mac systems
  BUNDLE_WITHOUT=darwin_only
fi

export PATH

whence keychain > /dev/null && eval $(keychain --eval -Q -q id_rsa id_ecdsa jezcope_aws.pem)
