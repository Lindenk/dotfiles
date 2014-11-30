#!/bin/bash

xrandr | sed -n 's/ connected//p' | sed -r -n 's/([^ ]+).* ([0-9]+)x[0-9]+\+([0-9]+).*/\1 \2 \3/p' > $(dirname $0)/monitors

