#!/bin/sh
#
# tmux_ssh_split.sh - splits current window into ssh sessions to provided
# servers.
#

boxes=$*
title=$(echo $boxes | cut -c 1-12)

tmux neww
for box in $boxes; do
        # TODO: pull in hostname setting stuff from ssh()
        tmux split -h "ssh \"$box\""
        tmux select-layout tiled>/dev/null
done
tmux kill-pane -t 0
tmux select-layout tiled>/dev/null
tmux rename-window $title
~/bin/tmux_synctoggle.sh
