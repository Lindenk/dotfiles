#!/bin/env zsh

# have bspwm toggle the term (and focus the right window and such)

id=$(xdotool search --class floatingterm | head -1)
echo $id

bspc window $id -d focused -f

state=$(~/.term/toggleTerm.zsh)
echo $state

if [ "$state" = "hidden" ]; then
  if [ $(bspc query -W -w focused) = $id ]
  bspc window last -f
fi
