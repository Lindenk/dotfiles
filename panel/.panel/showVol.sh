#!/bin/env sh

ponymix get-volume | awk '{print $1"%"}' | dzen2 -w 50 -h 30 -x 20 -y 20 -p 1 -xs 1
