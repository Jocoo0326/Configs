export EDITOR='vim'
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

git_branch() {
  git status -bs 2> /dev/null | sed -e "s/## \(.*\)\.\.\..*/ (\1)/" | head -n 1
}

if [[ $SHELL = "bash" ]]; then
  export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u \[\e[33m\]\w\[\e[0m\]\[\e[36m\]$(git_branch)\[\e[0m\]\n\[\e[35m\]\$\[\e[0m\] '
fi

export ANDROID_HOME=~/Android/Sdk
export ADB_HOME=$ANDROID_HOME/platform-tools
export PATH=$PATH:~/.scripts:$ADB_HOME:$ANDROID_HOME
export VAGRANT_HOME=/home/jocoo/d/.vagrant.d
# ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export _JAVA_AWT_WM_NONREPARENTING=1
eval "$(dircolors ~/.dircolors)"

vbox_config() {
  VBoxClient --clipboard 2>/dev/null
}
vbox_config

# utils
mem() {
  free -h | awk '/^Mem:/ {print $3 "/" $2}'
}
