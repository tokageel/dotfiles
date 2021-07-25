# JDK
#CORRETTO_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home"
#[ -f "${CORRETTO_HOME}" ] && export JAVA_HOME="${CORRETTO_HOME}"
#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
#export PATH=${PATH}:${JAVA_HOME}/bin

# Git
# GIT_COMPLETION_PATH="/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash"
# [ -f "${GIT_COMPLETION_PATH}" ] && . "${GIT_COMPLETION_PATH}"
fpath=(~/.zsh $fpath)

# LuaRocks
export LUA_PATH="${HOME}/.luarocks/share/lua/5.1/?.lua;${HOME}.luarocks/share/lua/5.1/?/init.lua;/usr/local/Cellar/luarocks/3.0.1/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;/usr/local/lib/lua/5.1/?.lua;/usr/local/lib/lua/5.1/?/init.lua;./?.lua;./?/init.lua"
export LUA_CPATH="${HOME}/.luarocks/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/loadall.so;./?.so"
export PATH=${PATH}:"${HOME}/.luarocks/bin"

# Go
export GOPATH="${HOME}/.go"
export PATH=$PATH:$GOPATH/bin

# Android
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/build-tools/28.0.3
export PATH=${PATH}:${ANDROID_HOME}/emulator
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:${ANDROID_HOME}/tools
export ANDROID_HVPROTO=ddm

# .NET
export PATH=${PATH}:"/usr/local/share/dotnet"

# grep
export GREP_OPTIONS="--color=always"

# Alias
alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -laG"

alias luarocks="luarocks --lua-dir=/usr/local/opt/lua@5.1"
alias python=python3

# added by travis gem
[ -f /Users/tkgs/.travis/travis.sh ] && source /Users/tkgs/.travis/travis.sh

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"
export PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I/usr/local/opt/tcl-tk/include' --with-tcltk-libs='-L/usr/local/opt/tcl-tk/lib -ltcl8.6 -ltk8.6'"

export PATH="$HOME/.pyenv/shims:$PATH"
