# TMUX config to create a presentation about TMUX
#
new-session -s presentation "sh -c clear; echo Tmux is a terminal multiplexer; read"
rename-window "Terminal Multiplexer I"
split-window -v -l 24 "sh -c clear; read"
split-window -h -p 80  "sh -c clear; echo It runs independent of its parent process; read"
split-window -h -p 25 "sh -c clear; read"
select-pane -L
split-window -v -p 66 "sh -c clear; echo Which means if you kill that, ; read"
split-window -v -p 50 "sh -c clear; echo it continues running; read"

new-window -n "Terminal Multiplexer II" "sh -c clear; echo That makes it useful for long-running local processes too; read"
split-window -v -l 24 "tail -f /var/log/kernel.log"
split-window -h -p 50 "top"

new-window -n "Terminal Window manager I" "sh -c clear; echo Tmux is a terminal window manager; read"
split-window -v -l 24 "sh -c clear; read"
split-window -h -p 80 "sh -c clear; echo Every process sits in a pane; read"
split-window -h -p 25 "sh -c clear; read"
select-pane -L
split-window -v -p 80 "sh -c clear; echo Every pane sits in a window; read"
split-window -v -p 66 "sh -c clear; echo Every window sits in a session; read"
split-window -v -p 50 "sh -c clear; echo Sessions may have multiple clients; read"

new-window -n "Terminal Window manager II" "sh -c clear; echo As well as your current window; clear"
split-window -v -l 24 "sh -c clear; read"
split-window -h -p 80 "sh -c clear; echo Tmux can show a status bar; read"
split-window -h -p 25 "sh -c clear; read"
select-pane -L
split-window -v -p 50 "sh -c clear; echo \"it's controlled by config and scripts \"; read"

new-window -n "Commands I" "sh -c clear; echo \"Tmux is controlled by commands (and options with the set command)\"; read"
split-window -v -l 30 "sh -c clear; echo a command can be sent in various ways; read"
split-window -v -l 24

new-window -n "Commands II" "sh -c clear; echo You can also source files full of commands; read"
split-window -v -l 30 "sh -c clear; echo \~/.tmux.conf is always sourced; read"

new-window -n "Commands III" "sh -c clear; echo In the other direction..; read"
split-window -v -l 24 "sh -c clear; read"
split-window -h -p 80 "sh -c clear; echo You can send keystrokes to a pane; read"
split-window -h -p 25 "sh -c clear; read"
select-pane -L
split-window -v -p 80 "sh -c clear; echo You can run scripts in a pane; read"
split-window -v -p 66 "sh -c clear; echo You can run terminal apps in a pane; read"
split-window -v -p 50 "sh -c clear; echo You can pipe a pane's contents; read"

new-window -n "Features" "sh -c clear; echo Tmux has some other neat features; clear"
split-window -v -l 24 "sh -c clear; read"
split-window -h -p 80 "sh -c clear; echo You can sync all panes in a window; read"
split-window -h -p 25 "sh -c clear; read"
select-pane -L
split-window -v -p 50 "sh -c clear; echo You can capture input; read"

# TODO window: putting that all together
# run tmux commands
#	write a script that runs tmux commands
#	bind a key to run a script to run tmux commands
#	bind a key to take input, to pass into a script that runs tmux commands
#select-window -t 0

# TODO window: more information
# You can find out more at:
#
# * http://tmux.svn.sourceforge.net/viewvc/tmux/trunk/FAQ
# * http://github.com/eddsteel/df-tmux
# * http://robots.thoughtbot.com/post/2641409235/a-tmux-crash-course
#
# (and for my final trick, I've emailed that to you all.)



