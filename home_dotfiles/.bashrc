export EDITOR='nvim'
export TERMINAL='st'
hash nvim && alias vim='nvim'
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -al'
alias shut='shutdown -h now'
alias bashconfig="$EDITOR ~/.bashrc"
alias zshconfig="$EDITOR ~/.zshrc"
alias stconfig="$EDITOR ~/st/config.h"
alias i3config="$EDITOR ~/.config/i3/config"
alias i3barconfig="$EDITOR ~/.config/i3status/config"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias shut='shutdown -h now'
alias ed='emacs --daemon'
alias e='emacsclient -c'
alias p='pacman'
alias sp='sudo pacman'
alias s='systemctl'
alias ss='sudo systemctl'
alias sqlite3='sqlite3 -column -header'
alias inst='adb install'
alias instr='adb install -r'
alias sl='ss-local'
alias shut5='shutdown 5'
alias gs='git status'
alias gpl='git pull'
alias gps='git push'
alias gc='git commit'
alias in='adb shell input text'
alias sd='sudo docker'

git_branch() {
  git status -bs 2> /dev/null | sed -e "s/## \(.*\)\.\.\..*/ (\1)/" | head -n 1
}

if [[ $SHELL = "bash" ]]; then
  export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u \[\e[33m\]\w\[\e[0m\]\[\e[36m\]$(git_branch)\[\e[0m\]\n\[\e[35m\]\$\[\e[0m\] '
fi

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export ANDROID_JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export ANDROID_HOME=~/d/android/Sdk
export NDK_HOME=~/d/android/ndk/android-ndk-r20
export ADB_HOME=$ANDROID_HOME/platform-tools
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export FLUTTER_HOME=~/d/workspace/flutter
export DART_SDK_ROOT=~/d/workspace/flutter/bin/cache/dart-sdk
export PATH=$PATH:~/.scripts:$ADB_HOME:$ANDROID_HOME:$NDK_HOME:$FLUTTER_HOME/bin:$DART_SDK_ROOT/bin
export VAGRANT_HOME=/home/jocoo/d/.vagrant.d
export _JAVA_AWT_WM_NONREPARENTING=1
export JETTY_HOME=~/d/jetty/current
eval "$(dircolors ~/.dircolors)"
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"

vbox_config() {
  VBoxClient --clipboard 2>/dev/null
}
#vbox_config

# utils
mem() {
  free -h | awk '/^Mem:/ {print $3 "/" $2}'
}

# disable system beep
xset b off
