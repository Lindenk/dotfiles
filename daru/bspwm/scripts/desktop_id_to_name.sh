#!/bin/bash

bspc query -T -d "$1" | jshon -e name -u