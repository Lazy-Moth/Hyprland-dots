#!/bin/bash

#
if pgrep -x "hyprsunset" > /dev/null; then
    # Kill hyprsunset
    killall -9 hyprsunset
    notify-send "Night Light" "Off" -u "low"
else
    # Start hyprsunset
    hyprsunset -t 3500 &
    notify-send "Night Light" "On" -u "low"
fi
