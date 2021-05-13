#!/bin/bash

INTERFACE=`ip addr | sed -rn 's/^[0-9]+: (e(\w)+):.*/\1/p' | head -1`

MY_ADDRESS=`ip addr show enp109s0f1 | grep -e 'inet6' | grep -e 'link' | awk '{print $2}' | sed -r 's|/.+||'`

OTHER_ADDRESS=`ping -6 -c 2 FF02::1%$INTERFACE | head -3 | tail -2 | awk '{print substr($4, 1, length($4)-1)}' | sed "/$MY_ADDRESS/d"`

ssh "$OTHER_ADDRESS" $@
