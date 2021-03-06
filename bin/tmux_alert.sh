#!/bin/sh

bg=colour234
grey=colour234
fg=colour234

if tmux list-windows -F"#{window_flags}" | grep '!'>/dev/null; then
        bg=colour124
        fg=colour252
        go=true
fi

if [ $go ]; then
    echo "#[fg=$grey,bold]#[bg=$bg]⮀#[bg=$bg]#[fg=$fg]!#[bg=$grey]#[fg=$bg]⮀"
else
    echo ""
fi
