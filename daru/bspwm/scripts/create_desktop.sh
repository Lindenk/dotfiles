#!/bin/env bash

# This script will create a desktop if it doesn't exist
if [[ -z $(bspc query -D | grep -x $1) ]]; then
  bspc monitor -a $1
fi
