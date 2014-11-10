#!/bin/env zsh

# This will remove the given desktop if there are no windows on it, and 
# if it isn't the only desktop on the monitor

MONITOR=$(bspc query -M -d $1)

if [[ $(bspc query -D -m $MONITOR | wc -l) > 1 ]] && [[ -z $(bspc query -W -d $1) ]]; then
  bspc monitor $MONITOR -r $1
fi
