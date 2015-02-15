#!/bin/env bash

HERE=$(readlink $0 | xargs dirname)

. $HERE/VARS.sh

games=`$HERE/getGameList.py | sort`
game=$(echo "$games" | cut -d '`' -f1 | dmenu -i)

if [ -z "$game" ]; then
  exit
fi

id=$(echo "$games" | grep "$game" | cut -d '`' -f2)

steam -applaunch $id
