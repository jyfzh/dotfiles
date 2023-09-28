#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
exec_polybar() {
    if [ "$2" == "light" ]
    then
        MONITOR=$1 polybar -c $HOME/.config/polybar/bars/light-config nord-top &
        MONITOR=$1 polybar -c $HOME/.config/polybar/bars/light-config nord-down &
    else
        MONITOR=$1 polybar -c $HOME/.config/polybar/bars/dark-config nord-top &
        MONITOR=$1 polybar -l info -c $HOME/.config/polybar/bars/dark-config nord-down &
    fi
}

# show on all monitor
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    exec_polybar $m $1
  done
else
  exec_polybar
fi

echo "Bars launched..."
