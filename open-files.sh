#!/bin/bash

is_open=$(i3-msg [class="scratchpadLf"] scratchpad show | grep true)
[[ ! $is_open ]] && $TERMINAL --class scratchpadLf $SCRIPTS_HOME/lf/lfrun
