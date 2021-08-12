#!/bin/bash

is_open=$(i3-msg [class="scratchpadTerm"] scratchpad show | grep true)
[[ ! $is_open ]] && $TERMINAL --class scratchpadTerm
