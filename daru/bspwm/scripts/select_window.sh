#!/bin/bash

bspc query -N -n .leaf | 
  awk '{"xtitle "$0 |& getline name; print name "`" $0}' |
  $(dirname $0)/rofi_split.sh -i -no-custom -p "Focus:" | 
  xargs bspc node -f