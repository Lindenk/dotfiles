#!/bin/env zsh

. ./vars.zsh

termite -c ~/.config/termite/config --class=floatingterm &

sleep .1

id=$(xdotool search --class floatingterm)
echo $id

xdotool windowsize $id $WIDTH $HEIGHT
xdotool windowmove -- $id -$WIDTH 0
