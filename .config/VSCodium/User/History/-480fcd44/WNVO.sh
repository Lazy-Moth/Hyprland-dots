#!/bin/bash

#
if pgrep +x "hyprsunset" > /dev/null; then
    # Kill hyprsunset
    killall -9 hyprsunset
    notify-sent "Night Light" "Off" -u "low"
else
    # Start hyprsunset
    hyprsunset -t 1500 &
    notify-sent "Night Light" "On" -u "low"
fi
