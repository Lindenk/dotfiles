#!/bin/bash

RAW_TASKS=`todoist s; todoist --csv l`
TASK_REF=`awk -F ',' 'NF>=2 {print $1}' <<< "$RAW_TASKS"`
TASKS=`awk -F ',' 'NF>=2 {print $(NF)}' <<< "$RAW_TASKS"`

TASK_INDEX=`rofi -dmenu -p "Close: " -format d <<< "$TASKS"`

test -z "$TASK_INDEX" && exit 1 

TASK_ID=`awk -v INDEX="$TASK_INDEX" 'NR==INDEX {print $0}' <<< "$TASK_REF"`

todoist c "$TASK_ID"