#!/bin/env zsh

cd ~/.term

. ./vars.zsh

cd ~/

termite -c ~/.config/termite/config --class=floatingterm &

sleep .2

id=$(xdotool search --class floatingterm)
echo $id

xdotool windowsize $id $WIDTH $HEIGHT
xdotool windowmove -- $id -$WIDTH 0
