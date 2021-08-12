#!/bin/bash

color_ok=$(xgetres color2)
color_attention=$(xgetres color1)

function count_trash() {
    trash_count=$(trash-list | wc -l)
    if [[ $trash_count > 0 ]]; then
        echo "%{F$color_attention} $trash_count"
    else
        echo "%{F$color_ok}"
    fi
}

case "$1" in
    *)
        count_trash
        ;;
esac
