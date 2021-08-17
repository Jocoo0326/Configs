#!/bin/sh

killall -q picom

while pgrep -x picom >/dev/null; do sleep 1; done

picom --config ~/.config/compton/compton.conf -bf &
