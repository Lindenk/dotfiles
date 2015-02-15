#!/bin/env sh

## This script will setup everything needed to sanely start ##
## stowing configs.                                         ##


mkdir -p $HOME/.config $HOME/bin $HOME/scripts $HOME/.data/dotfiles/deps

stow -V > /dev/null
if [ ! $? ]; then
  echo "Stow is not installed. Please install stow."
fi
