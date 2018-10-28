
if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || xinit $(which i3)
fi

if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
