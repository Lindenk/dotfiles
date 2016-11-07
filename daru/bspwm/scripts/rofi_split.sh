#!/bin/bash

# This script takes input in the form a list of value1:value2 seperated
# by \n. It will then display all value1's with rofi and return it's
# assosiated value2. All args are passed to rofi.

_input=$(cat -)

_index=$(echo "$_input" | cut -f1 -d '`' | rofi -dmenu -format 'd' $@)
echo "$_input" | head -n $_index | tail -1 | cut -f1 -d '`' --complement