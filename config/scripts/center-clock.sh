#!/bin/bash
# Simple centered clock for i3bar

# Get terminal width to calculate padding
get_width() {
    if command -v tput &>/dev/null; then
        tput cols 2>/dev/null || echo 80
    else
        echo 80
    fi
}

while true; do
    # Get current time
    time=$(date +"%H:%M")
    
    # Calculate padding to center (assuming bar width ~80 chars)
    # Remove 4 chars for the time itself
    width=$(get_width)
    pad=$(((width - ${#time}) / 2))
    
    # Build the string with spaces
    printf "%*s%s\n" $pad "" "$time"
    
    sleep 1
done
