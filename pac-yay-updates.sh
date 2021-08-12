#!/bin/bash

color_ok=$(xgetres color2)
color_attention=$(xgetres color1)

function count_updates() {
    arch_updates=$(checkupdates 2>/dev/null | wc -l)
    aur_updates=$(yay -Qum 2>/dev/null | wc -l)
    updates=$((arch_updates + aur_updates))
}

function check_updates() {
    while true; do
        count_updates
        
        if (( $updates > 15 )); then
            dunstify -u critical "UPDATE YOUR PACKAGES!" "$updates packages are ready to be updated"
        elif (( $updates > 0 )); then
            dunstify -u normal "Updates available!" "$updates packages are ready to be updated"
        fi
        
        # check every 10 seconds if the user has updated the outdated packages
        while (( $updates > 0 )); do
            echo "%{F$color_attention} $updates"    
            sleep 10
            count_updates
        done

        # re-check every 30 mins for updates if no update is currently available (to reduce system resource usage)
        while (( $updates == 0 )); do
            echo "%{F$color_ok}"
            sleep 1800
            count_updates
        done
    done
}

case "$1" in
    update)
        $TERMINAL --class="floatingKitty" bash -c "sudo pacman -Syu; yay -Syu"
        ;;
    *) 
        check_updates 
        ;;
esac

