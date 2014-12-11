#!/bin/env zsh

# This will init the sliding term with bspwm

bspc rule -a floatingterm floating=true
~/.term/createTerm.zsh

bspc window last -f
