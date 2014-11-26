#!/bin/env bash

echo "Waiting for network..."

# wait for an internet connection
while ! wget http://google.com -O- 2>/dev/null | grep -q Lucky; do
  sleep .1
done

echo "Network connection established."

# launch stuff
chromium &
steam &

echo "Launched stuff"
