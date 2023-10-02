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
        MONITOR=$1 polybar -c $HOME/.config/polybar/bars/dark-config nord-down &
    fi
}

MONITOR_NAME="eDP-1"
EXTERNAL_MONITOR_NAME="HDMI-1"

exec_polybar $MONITOR_NAME

STATUS_EXTERNAL_MONITOR=$(xrandr --query | grep $EXTERNAL_MONITOR_NAME)
if [[ ! $STATUS_EXTERNAL_MONITOR == *disconnected* ]]; then
    exec_polybar $EXTERNAL_MONITOR_NAME
else
    xrandr --output $EXTERNAL_MONITOR_NAME --off
fi

echo "Bars launched..."
