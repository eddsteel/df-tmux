#!/bin/sh
#
# tmux_ssh_split.sh - splits current window into ssh sessions to provided
# servers.
#
# usage e.g. tmux_ssh_split.sh server{1..3}.domain.com
#            tmux_ssh_split.sh server-group (where server-group is a file in
#            ~/.host-groups containing a space-separated list of hosts.)

if [ $# -gt 1 ]; then
	boxes=$*
	title=multi-ssh
elif [ $# -eq 1 ]; then
	boxes=$(cat ~/.host-groups/$1)
	title=$(echo $1 | sed 's/\..*$//g')
else
	echo "usage: $0 [host-group|hostnames...] where host-groups are defined in ~/.host-groups"
	echo "available host groups:"
	ls -1 ~/.host-groups
	exit 1
fi

tmux neww
for box in $boxes; do
	tmux split -h "ssh \"$box\""
	tmux select-layout tiled>/dev/null
done
tmux kill-pane -t 0
tmux select-layout tiled>/dev/null
tmux rename-window $title
~/bin/tmux_synctoggle.sh
