#!/bin/bash

color_ok=$(xgetres color2)
color_attention=$(xgetres color1)

function check_status() {
    is_paused=$(dunstctl is-paused)
    if [[ $is_paused == true ]]; then
        echo "%{F$color_attention}"
    else
        echo "%{F$color_ok}"
    fi
}

case "$1" in
    toggle)
        dunstctl set-paused toggle
        ;;
    show)
        dunstctl history-pop
        ;;
    output)
        check_status
        ;;
esac
