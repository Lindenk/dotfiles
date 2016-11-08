#!/bin/bash

_PWORDS=$(find ~/.password-store | grep .gpg | sed -r -n 's/.*\.password-store\/(.*)\.gpg$/\1/p')
_SELECTION=$(echo "$_PWORDS" | rofi -dmenu)

test -z "$_SELECTION" && exit 0

pass -c "$_SELECTION"