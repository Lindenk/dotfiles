#!/bin/env zsh

# This will init the sliding term with bspwm

bspc rule -a termite floating=true border=off -o
~/.term/createTerm.zsh

bspc window last -f
