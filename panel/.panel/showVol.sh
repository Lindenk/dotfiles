#!/bin/env sh

vol=`ponymix get-volume | awk '{print $1"%"}'`

ponymix is-muted
if [ $? == 0 ]; then
  vol="Muted"
fi

echo $vol | dzen2 -w 50 -h 30 -x 20 -y 20 -p 1 -xs 1
