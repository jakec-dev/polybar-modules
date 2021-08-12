#!/bin/bash

is_open=$(i3-msg [class="scratchpadTasks"] scratchpad show | grep true)
[[ ! $is_open ]] && $TERMINAL --class scratchpadTasks taskwarrior-tui
