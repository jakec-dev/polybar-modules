#!/bin/bash

color_ok=$(xgetres color2)
color_attention=$(xgetres color1)
redshift_status=$(systemctl --user is-active redshift)

function check_status() {
    if [ $redshift_status == "active" ]; then
        echo "%{F$color_ok}"
    else
        echo "%{F$color_attention}"
    fi
}

function toggle_redshift() {
    if [ $redshift_status == "active" ]; then
        systemctl --user stop redshift
    else
        systemctl --user start redshift
    fi
}

case "$1" in
    toggle) 
        toggle_redshift 
        ;;
    *) 
        check_status 
        ;;
esac
