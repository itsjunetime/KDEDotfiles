#!/bin/bash

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
if polybar --list-monitors | grep HDMI2; then
	env MONITOR=HDMI2 polybar main -c ~/.config/polybar/config.ini &
fi
polybar main -c ~/.config/polybar/config.ini &
# ~/.config/polybar/scripts/spotify/launchlistener.sh

echo "setting c to zero"
c=0

while ! xdotool search -class 'polybar' ; do
	echo "looping"
        sleep 0.1
        c=$((c+1))
        if [ $c == 50 ] ; then
                exit
        fi
done
class=$(xdotool search -class 'polybar')
echo $class
xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $class
