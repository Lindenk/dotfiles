#!/bin/bash

ping -6 -c 1 FF02::1%enp6s0 | head -2 | tail -1 | awk '{print substr($4, 1, length($4)-1)}' | xargs ssh $@
