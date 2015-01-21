#!/bin/env bash

here=`dirname $0`

wget -O - "http://steamcommunity.com/id/$1/games?tab=all&l=english&xml=1" > $here/games.xml
