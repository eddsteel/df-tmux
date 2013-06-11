#!/bin/bash
#
. ~/.tmux.d/include/functions

project=$1
name=$2
name=${name:=$project}
session="" # current

if tmux list-windows -F "#{window_name}" | grep $name >/dev/null; then 
	tmux select-window -t $name
else
	add_project_to_tmux "$name" "$HOME/Projects/$project">/dev/null
	tmux send-keys C-p
fi
