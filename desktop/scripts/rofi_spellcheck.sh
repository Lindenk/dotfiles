#!/bin/bash

INPUT=`echo "" | rofi -dmenu -p "Spell Check: "`
SPCHECK=`echo "$INPUT" | aspell -a`
          
SUGGESTIONS=`echo "$SPCHECK" | grep '^\*'`
if [ -n "$SUGGESTIONS" ]; then
    CHOICE=`echo "Spelling is correct" | rofi -dmenu`
    test -n "$CHOICE" && echo -n "$INPUT" | xclip -selection clipboard
    exit 0
fi
SUGGESTIONS=`echo "$SPCHECK" | grep '^#'`
if [ -n "$SUGGESTIONS" ]; then
    echo "No Matches" | rofi -dmenu
    exit 1
fi
SUGGESTIONS=`echo "$SPCHECK" | grep '^&'`
if [ -n "$SUGGESTIONS" ]; then
    # Got a bunch of matches
    SUGGESTIONS=`echo "$SUGGESTIONS" | python -c 'import sys; x = sys.stdin.read(); print("\n".join([s.strip() for s in x.split(":")[1].split(",")]))'`
    CHOICE=`echo "$SUGGESTIONS" | rofi -dmenu -p "Suggestion to Clipboard: " -no-custom`
    test -n "$CHOICE" && echo -n "$CHOICE" | xclip -selection clipboard
    exit 0
fi

echo "An error occured: "
echo "  INPUT:       $INPUT"
echo "  SPCHECK:     $SPCHECK"
echo "  SUGGESTIONS: $SUGGESTIONS"
exit 1

