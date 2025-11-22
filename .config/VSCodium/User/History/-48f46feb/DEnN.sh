#!/bin/bash

TERMINAL="kitty"
EDITOR="codium"
BROWSER="zen-browser"
DISCORD="vesktop"
MUSIC="spotify"

hyprctl dispatch workspace 1

$BROWSER &
sleep 2

hyprctl dispatch workspace 2
$EDITOR &
sleep 2

hyprctl dispatch workspace 3
$TERMINAL &
sleep 2

hyprctl dispatch workspace 4
$MUSIC &
sleep 2

hyprctl dispatch workspace 5
$DISCORD &
sleep 4

hyprctl dispatch workspace 1
