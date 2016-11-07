#!/bin/bash

MONITOR=""
test "$1" && MONITOR="$1"

DESKTOP_ID=$(bspc query -T -m "$1" | jshon -e "focusedDesktopId")
$(dirname $0)/desktop_id_to_name.sh "$DESKTOP_ID"
