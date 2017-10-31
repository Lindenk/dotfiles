#!/bin/bash

_PWORDS=$(find ~/.password-store | grep .gpg | sed -r -n 's/.*\.password-store\/(.*)\.gpg$/\1/p')
_SELECTION=$(echo "$_PWORDS" | rofi -dmenu -p "Pass: ")

echo "$_SELECTION"
test -z "$_SELECTION" && exit 0

echo "Got here"

pass -c "$_SELECTION"
