#!/usr/bin/env bash

if [ -z "$MONITOR" ];
then
    echo "Need to set MONITOR"
    exit 1
fi

while true;
do
    if xrandr | grep "$MONITOR connected";
    then
        MONITOR=$MONITOR polybar example
    else
        sleep 5
    fi
done
