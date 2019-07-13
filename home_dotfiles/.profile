if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x dwm || startx
fi

if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
