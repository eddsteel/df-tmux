#!/usr/bin/env zsh
if tmux show-window-options | grep "synchronize-panes on">/dev/null; then
	tmux setw window-status-current-fg white >/dev/null
else
	tmux setw window-status-current-fg colour033 >/dev/null
fi
tmux setw synchronize-panes >/dev/null
