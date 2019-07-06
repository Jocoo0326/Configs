alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -al'
alias shut='shutdown -h now'
alias p='sudo pacman'
alias ss='sudo systemctl'

git_branch() {
  git status -bs 2> /dev/null | sed -e "s/## \(.*\)\.\.\..*/ (\1)/" | head -n 1
}

export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u \[\e[33m\]\w\[\e[0m\]\[\e[36m\]$(git_branch)\[\e[0m\]\n\[\e[35m\]\$\[\e[0m\] '

export ANDROID_HOME=~/Android/Sdk
export ADB_HOME=$ANDROID_HOME/platform-tools
export PATH=$ADB_HOME:$ANDROID_HOME:$PATH:~/.scripts

vbox_config() {
  VBoxClient --clipboard
}
vbox_config
