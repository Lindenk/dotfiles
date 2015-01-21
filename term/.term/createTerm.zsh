#!/bin/env zsh

cd ~/.term

. ./vars.zsh

cd ~/

termite -c ~/.config/termite/config -e "tmux" &
#lxterminal -t floatingterm -e "tmux" &

sleep .2

id=$(xdotool getactivewindow)
echo $id
echo $id >! .term/windowid

xdotool windowsize $id $WIDTH $HEIGHT
xdotool windowmove -- $id -$WIDTH 20

echo "hidden" >! .term/termState
