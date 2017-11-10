#!/bin/bash

# Get task text
TASK=`rofi -dmenu -p "Task: " -theme purple -lines 0`

test -z "$TASK" && exit 1

todoist q "$TASK"