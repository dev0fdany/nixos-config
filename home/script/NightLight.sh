#!/bin/sh

if pgrep -f "wlsunset -T 4501" > /dev/null
then
    pkill wlsunset
    wlsunset -T 6301 -t 6300 -l 0 -L 0 &
    notify-send "Blue Light Filter: OFF" "Screen set to crisp 6300K" -t 700
else
    pkill wlsunset
    wlsunset -T 4501 -t 4500 -l 0 -L 0 &
    notify-send "Blue Light Filter: ON" "Screen set to warm 4500K" -t 700
fi

