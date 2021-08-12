#!/bin/bash

function open_new_ws() {
    new_ws=1
    for workspace in $(i3-msg -t get_workspaces | jq -r '.[] | @base64'); do
        _jq() {
            echo ${workspace} | base64 --decode | jq -r ${1}
        }
        open_ws=$(_jq '.num')
        if [[ $new_ws == $open_ws ]]; then
            new_ws=$((new_ws + 1))
        elif [[ $open_ws > $new_ws ]]; then
            i3-msg workspace number $new_ws
            return
        else
            i3-msg workspace number $((new_ws + 1))
            return
        fi
    done
    i3-msg workspace number $new_ws
}

case "$1" in
    *)
        open_new_ws
        ;;
esac
