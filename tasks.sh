#!/bin/bash

color_ok=$(xgetres color2)
color_warning=$(xgetres color3)
color_attention=$(xgetres color1)

function count_inbox() {
    inbox_count=$(task +inbox status:pending count rc.context:none 2>/dev/null)
    if [ $inbox_count -ge 25 ]; then
        echo "%{F$color_attention} $inbox_count"
    elif [ $inbox_count -gt 10 ]; then
        echo "%{F$color_warning} $inbox_count"
    elif [ $inbox_count -gt 0 ]; then
        echo "%{F$color_ok} $inbox_count"
    else
        echo "%{F$color_ok}"
    fi
}

function top_task() {
    task_id=$(task next limit:1 2>/dev/null | tail -n +4 | head -n 1 | sed 's/^ //' | cut -d ' ' -f1)
    description=$(task _get $task_id.description)
    urgency=$(task _get $task_id.urgency)
    echo "$description ($(printf "%.0f\n" $urgency))"
    # change color based on status
    # show timer when started
    # click-left to open task list
    # click-right to start/stop task
    # click-right to go to notes/wiki page for task
}

case "$1" in
    top)
        top_task
        ;;
    *)
        count_inbox
        ;;
esac


