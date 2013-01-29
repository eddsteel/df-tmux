#!/usr/bin/env zsh

. ~/.zshrc

local=$(hostname -s)
name=$(get_tmux_wvar "hostname" || echo $local)

current=$(get_tmux_wvar "synced")
echo $current

if [ "$current" = "true" ]; then
	tmux setw window-status-current-fg colour033
	set_tmux_wvar "synced" "false"
else
	tmux setw window-status-current-fg white
	set_tmux_wvar "synced" "true"
fi
