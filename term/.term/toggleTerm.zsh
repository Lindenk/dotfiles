#!/bin/env zsh

. ./vars.zsh

id=$(xdotool search --class floatingterm)
state=$(cat termState)
echo $state

if [ "$state" == "hidden" ]; then

  for i in {-$WIDTH..0..50}
  do
  xdotool windowmove -- $id $i 0
  done

  echo "visable" >! termState

elif [ "$state" == "visable" ]; then

  for i in {0..-$WIDTH..50}
  do
  xdotool windowmove -- $id $i 0
  done

  echo "hidden" >! termState

fi
