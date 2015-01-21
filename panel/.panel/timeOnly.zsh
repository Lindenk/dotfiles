#!/bin/env zsh

# Use bar to draw the time on each screen

function centerTime {
  while true; do
    time=`date +"%a, %b %e %I:%M"`
    echo "%{S0}%{c}$time%{S1}$time"
    sleep 1
  done
}

centerTime | bar -B "#70000000" -F "#FF00F000" -f "-*-*-*-*-15-*-*-*-c-*-*-1"  -g "x20" -p
