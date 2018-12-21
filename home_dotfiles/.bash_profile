#
# ~/.bash_profile
#

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
