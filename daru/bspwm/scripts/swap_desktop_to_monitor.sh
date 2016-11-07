#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Requires direction to switch to"
  exit 1
fi

_DIR="$1"
_D_1=$(bspc query -D -d --names)
_D_2_json=$(bspc query -T -m "$_DIR")

if [ -z "$_D_2_json" ]; then
  echo "No monitor in that direction"
  exit 1
fi

_D_2=$(echo "$_D_2_json" | python -c 'import json,sys; print(json.loads(sys.stdin.read())["focusedDesktopName"])')

bspc desktop "$_D_1" -s "$_D_2"
bspc desktop -f "$_D_1"

bspc desktop "$_D_1" -n '_tmp'; 
bspc desktop "$_D_2" -n "$_D_1"
bspc desktop '_tmp' -n "$_D_2"
