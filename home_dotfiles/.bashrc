export EDITOR='vim'
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -al'
alias shut='shutdown -h now'
alias bashconfig="$EDITOR ~/.bashrc"
alias zshconfig="$EDITOR ~/.zshrc"
alias stconfig="$EDITOR ~/st/config.h"
alias i3config="$EDITOR ~/.config/i3/config"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias shut='shutdown -h now'
alias ed='emacs --daemon'
alias e='emacsclient -c'

git_branch() {
	git status -bs 2> /dev/null | sed -e "s/## \(.*\)\.\.\..*/ (\1)/" | head -n 1
}

if [[ $SHELL = "bash" ]]; then
  export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u \[\e[33m\]\w\[\e[0m\]\[\e[36m\]$(git_branch)\[\e[0m\]\n\[\e[35m\]\$\[\e[0m\] '
fi

export ANDROID_HOME=~/Android/Sdk
export ADB_HOME=$ANDROID_HOME/platform-tools
export PATH=$ADB_HOME:$ANDROID_HOME:$PATH

vbox_config() {
  VBoxClient --clipboard
}
vbox_config

# utils
mem() {
  free -h | awk '/^Mem:/ {print $3 "/" $2}'
}
