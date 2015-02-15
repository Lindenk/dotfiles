#!/bin/env sh

## Use this script to stow things rather than using stow. ##

# check if there is a stowinit script for the package and run it
if [ -f $1/stow/preinit ]; then
  $1/stow/preinit
fi

stow --ignore="^stow/" "$@"

if [ -f $1/stow/init ]; then
  $1/stow/init
fi
