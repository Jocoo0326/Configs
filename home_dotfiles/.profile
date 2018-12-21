echo "in .profile"

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || startx
fi

if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
