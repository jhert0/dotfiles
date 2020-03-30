#!/bin/bash

delim="|"

datetime(){
    echo "$(date +'%B %d %Y %I:%M %p')"
}

network(){
    status=$(cat /sys/class/net/wlp0s29u1u3/operstate)
    if [ $status = "up" ]; then
        echo "🌎 up"
    else
        echo "🌎 down"
    fi
}

music(){
    song=$(mpc -f "[[%artist% - ] %title%]|[%file%]" 2>/dev/null | grep -v "volume:" | head -n 1)
    if [ "$song" = "" ]; then
        echo "🎵 N/A"
    else
        echo "🎵 $song"
    fi
}

volume(){
    echo "Volume: $(amixer sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')"
}

memory(){
    free | awk '/Mem/ {printf "%0.2f%%\n", ($3 / $2) * 100 }'
}

while true; do
    output="$(music) $delim $(volume) $delim $(memory) $delim $(network) $delim $(datetime)"
    xsetroot -name "$output"
    sleep 1m
done
