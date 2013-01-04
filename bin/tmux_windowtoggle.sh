#!/usr/bin/env zsh
. ~/.zshfunctions/tmux

local=$(hostname -s)
name=$(get_tmux_wvar "hostname" || echo $local)

current=$(get_tmux_wvar "synced")

if [ "$current" = "true" ]; then
	tmux setw window-status-current-fg colour033 >/dev/null
	set_tmux_wvar "synced" "false"
else
	tmux setw window-status-current-fg white >/dev/null
	set_tmux_wvar "synced" "true"
fi
