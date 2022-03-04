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
alias xmonadconfig="$EDITOR ~/Configs/xmonad/xmonad.hs"
alias xmobarconfig="$EDITOR ~/Configs/xmonad/.xmobarrc"
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
alias input='adb shell input text'
alias sd='sudo docker'
alias fh='free -h'

git_branch() {
  git status -bs 2> /dev/null | sed -e "s/## \(.*\)\.\.\..*/ (\1)/" | head -n 1
}

if [[ $SHELL = "bash" ]]; then
  export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u \[\e[33m\]\w\[\e[0m\]\[\e[36m\]$(git_branch)\[\e[0m\]\n\[\e[35m\]\$\[\e[0m\] '
fi

export GRADLE_USER_HOME=/home/jocoo/d/.gradle
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export ANDROID_JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export ANDROID_HOME=~/Android/Sdk
export NDK_HOME=~/Android/ndk/android-ndk-r20
export ADB_HOME=$ANDROID_HOME/platform-tools
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export FLUTTER_HOME=~/workspace/flutter
export DART_SDK_ROOT=~/workspace/flutter/bin/cache/dart-sdk
export PATH=$JAVA_HOME/bin:~/.cabal/bin:~/.ghcup/bin:~/.ghcup/ghc/8.10.6/bin:~/.scripts:$ADB_HOME:$ANDROID_HOME:$NDK_HOME:$FLUTTER_HOME/bin:$DART_SDK_ROOT/bin:$PATH
export VAGRANT_HOME=/home/jocoo/.vagrant.d
export _JAVA_AWT_WM_NONREPARENTING=1
export JETTY_HOME=~/jetty/current
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
export http_proxy=''
export https_proxy=''
export ftp_proxy=''
export socks_proxy=''
