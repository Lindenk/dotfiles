#!/bin/env zsh

# This script will save the old desktop, execute the command given to it,
# then run removeEmptyDesktop on it

OLD=$(bspc query -D -d focused)
$SHELL -c $1

if [[ $(bspc query -D -d focused) != $OLD ]]; then
  $BSPWM_DIR/removeEmptyDesktop.zsh $OLD
fi
