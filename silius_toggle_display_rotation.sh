#!/bin/bash

# Get the name of the connected monitor
MONITOR=$(xrandr | grep " connected" | awk '{ print $1 }')

# Count how many times 'left' appears in the output of xrandr --verbose
LEFT_COUNT=$(xrandr --verbose | grep "$MONITOR connected" -A5 | grep -o "left" | wc -l)

# Check the current rotation based on the count of 'left'
if [ "$LEFT_COUNT" -eq 1 ]; then
    # If 'left' is found once, the monitor is not rotated
    xrandr --output $MONITOR --rotate left
else
    # If 'left' is found > 1 time, monitor is rotated
    xrandr --output $MONITOR --rotate normal
fi
