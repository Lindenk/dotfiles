#!/bin/env zsh

# This program will move all input sinks to thespecified device. Ponymix is used for this movement. $1 should be the device to move 
# everything to

sinks=`ponymix --sink-input list | sed -n -r "s/sink-input ([0-9]+).*/\1/p"`

while read -r s; do
  pactl move-sink-input $s $1
done <<< "$sinks"
