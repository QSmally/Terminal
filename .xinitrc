#!/bin/bash

while true; do
    xsetroot -name "  $(date +'%a %d %b %T')  "
    sleep 1
done &

exec dwm
