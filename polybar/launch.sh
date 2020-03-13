#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2. Change HDMI2 to your other monitor(s)
if polybar --list-monitors | grep HDMI2; then
	env MONITOR=HDMI2 polybar main -c ~/.config/polybar/config.ini &
fi
polybar main -c ~/.config/polybar/config.ini &

# To start the spotify listener script
~/.config/polybar/scripts/spotify/launchlistener.sh

