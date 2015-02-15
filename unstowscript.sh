#!/bin/env bash

if [ -f $1/stow/del ]; then
  $1/stow/del
fi

stow -D --ignore="^stow/" "$@"
