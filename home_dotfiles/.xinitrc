xrandr --output VGA-1 --mode 1366x768
feh --bg-scale .config/wall.jpg &
compton -b &
source .scripts/time &
exec dwm
