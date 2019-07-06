
if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x dwm || startx
fi
