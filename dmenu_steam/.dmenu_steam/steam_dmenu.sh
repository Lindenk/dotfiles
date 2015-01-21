#!/bin/env bash

here=`dirname $0`

games=`$here/getGameList.py | sort`
game=$(echo "$games" | cut -d '`' -f1 | dmenu -i)

if [ -z "$game" ]; then
  exit
fi

id=$(echo "$games" | grep "$game" | cut -d '`' -f2)

steam -applaunch $id
