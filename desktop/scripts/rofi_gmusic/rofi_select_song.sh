#!/bin/bash

cd $(dirname $(readlink -f $0))

#query
QUERY=`echo "" | rofi -dmenu -p "Search for song: "`
test -z "$QUERY" && exit 1

SONGS=`./get_gmusic_tracks.py "$QUERY"`
test -z "$SONGS" && exit 1

#display tracks to choose from
SELECTION=$(echo "$SONGS" | cut -d ':' -f2 | rofi -i -dmenu -l 10 -no-custom -format d)
test -z "$SELECTION" && exit 1

SONG_ID=`echo "$SONGS" | head -$SELECTION | tail -1 | cut -d ':' -f1`

HTTP_QUERY="http://localhost:9999/get_new_station_by_id?id=$SONG_ID&type=song&num_tracks=50"

PLAYLIST_NAME="Google_Music_Station.m3u"
curl -s "$HTTP_QUERY" | grep -v ^# > ~/Playlists/"$PLAYLIST_NAME"

mpc update
mpc clear
mpc load "${PLAYLIST_NAME%.*}"
mpc play
