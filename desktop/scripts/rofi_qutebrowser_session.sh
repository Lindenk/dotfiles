#!/bin/zsh

NEW_SESSION='''
windows:
- geometry: !!binary |
    AdnQywACAAAAAAPAAAAAAAAAB38AAAQcAAADwgAAAAIAAAd9AAAEGgAAAAAAAAAAB4A=
  tabs:
  - active: true
    history:
    - active: true
      pinned: false
      scroll-pos:
        x: 0
        y: 0
      title: DuckDuckGo
      url: https://start.duckduckgo.com/
      zoom: 1.0
'''
# For now...
XDG_DATA_HOME="$HOME/.local/share/"

SESSIONS=$(find "$XDG_DATA_HOME/qutebrowser/sessions" -type f -printf "%f\n")

SESSION=$(rofi -dmenu -p "Session: " <<< "$SESSIONS")

test -z "$SESSION" && exit 1

find "$XDG_DATA_HOMEqutebrowser/sessions/$SESSION" -type f || echo "$NEW_SESSION" > "$XDG_DATA_HOME/qutebrowser/sessions/$SESSION.yml"

qutebrowser --target window -r "${SESSION%.*}"
