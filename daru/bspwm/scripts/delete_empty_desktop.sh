#!/bin/env bash

# This switches the current desktop then deletes the old one if it's empty

if [ -z $(bspc query -D -d "$1.occupied") ]; then
    bspc desktop "$1" -r
fi

