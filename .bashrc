# Git
GIT_COMPLETION_PATH="/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash"
. "${GIT_COMPLETION_PATH}"

# Android
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/build-tools/28.0.3
export PATH=${PATH}:${ANDROID_HOME}/emulator
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:${ANDROID_HOME}/tools

# Alias
alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -laG"

