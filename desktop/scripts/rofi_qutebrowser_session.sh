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

SESSIONS=$(find "$XDG_DATA_HOME/qutebrowser/sessions" -name '*.yml' -type f -printf "%f\n" |
           sed -r -e 's/\.[^\.]*//' -e '/^$/d' -e '/^_/d')

SESSION=$(rofi -dmenu -p "Session: " <<< "$SESSIONS")

test -z "$SESSION" && exit 1

# Just quit if we don't find it -- TODO: Write a seperate script for making new sessions
find "$XDG_DATA_HOME/qutebrowser/sessions/$SESSION.yml" -type f || exit 2 #|| echo "$NEW_SESSION" > "$XDG_DATA_HOME/qutebrowser/sessions/$SESSION.yml"

~/scripts/qutebrowser_session_wrapper.sh --target window -r "${SESSION}"
