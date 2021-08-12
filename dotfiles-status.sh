#!/bin/bash

color_ok=$(xgetres color2)
color_attention=$(xgetres color1)

function count_unstaged() {
    unstaged_count=$(git --git-dir=$HOME/.cfg/ --work-tree=$HOME status -s -uno | wc -l)
    if [ $unstaged_count -gt 0 ]; then
        echo "%{F$color_attention} $unstaged_count"
    else
        echo "%{F$color_ok}"
    fi
}

case "$1" in
    *) 
        count_unstaged
        ;;
esac
