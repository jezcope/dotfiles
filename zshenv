# Make $path array ignore non-unique elements
typeset -U path

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

PLATFORM=`uname -s`

path=($HOME/bin $HOME/bin/shared $path)

export EDITOR=`which vim`

export MAVEN_OPTS='-Xms256m -Xmx645m -XX:PermSize=64m -XX:MaxPermSize=256m'
export JAVA_OPTS='-server -Xms512m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=512m -XX:NewSize=192m -XX:MaxNewSize=384m -Djava.awt.headless=true -Dhttp.agent=Sakai -Dorg.apache.jasper.compiler.Parser.STRICT_QUOTE_ESCAPING=false -Dsun.lang.ClassLoader.allowArraySyntax=true'

if [[ $PLATFORM = 'Darwin' ]]; then
  path=(/Users/jez/Scripts /Users/jez/bin /usr/local/bin $path)
  path=("/Users/jez/Library/Application Support/MultiMarkDown/bin" $path)
  path=(/opt/local/bin /opt/local/sbin $path)
fi

