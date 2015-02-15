#!/bin/env bash

HERE=$(readlink -f $0 | xargs dirname)

. $HERE/VARS.sh

wget -O - "http://steamcommunity.com/id/$1/games?tab=all&l=english&xml=1" > $DATA_DIR/games.xml
