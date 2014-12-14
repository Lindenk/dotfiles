#!/bin/env zsh

cd ~/.term

. ./vars.zsh

id=$(cat windowid)
state=$(cat termState)

if [ "$state" = "hidden" ]; then

  for i in {-$WIDTH..0..100}
  do
    xdotool windowmove -- $id $i 0
  done

  state="visable"
  echo $state >! termState

elif [ "$state" = "visable" ]; then

  for i in {0..-$WIDTH..100}
  do
    xdotool windowmove -- $id $i 0
  done
  xdotool windowmove -- $id -5000 -5000

  state="hidden"
  echo $state >! termState

fi

echo $state
