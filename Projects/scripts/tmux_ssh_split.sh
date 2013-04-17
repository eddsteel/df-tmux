#!/bin/sh
#
# tmux_ssh_split.sh - splits current window into ssh sessions to provided
# servers.
#
# usage e.g. tmux_ssh_split.sh server{1..3}.domain.com

boxes=$*

# TODO look at length of args and split with correct proportions
for box in $boxes; do
	tmux split -h "ssh $box"
	tmux select-layout tiled>/dev/null
done
