export TERMINAL=st

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || startx
fi

if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

#pgrep -x compton || compton -b
#setbg &
#slstatus &
