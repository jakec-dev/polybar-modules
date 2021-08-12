#!/bin/bash

is_open=$(i3-msg [class="scratchpadVimwiki"] scratchpad show | grep true)
[[ ! $is_open ]] && $TERMINAL --class scratchpadVimwiki vim -c "set nonumber norelativenumber" -c VimwikiIndex
