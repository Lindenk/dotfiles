#!/bin/env zsh

# Temp hack for swapping windows
# first arg is the bspc command, second is the desktop name

$BSPWM_DIR/createDesktop.zsh $2
$BSPWM_DIR/cleanUpExec.zsh "bspc $1 $2"
