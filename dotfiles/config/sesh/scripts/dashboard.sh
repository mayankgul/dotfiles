#!/bin/zsh

# Split the current pane horizontally.
# The new right pane occupies 35% of the width.
tmux split-window -h -p 45 -c "$HOME" "pomoru"

# Split the newly created right pane vertically.
# This creates the lower-right shell.
tmux split-window -v -p 30 -c "$HOME" "zsh"

# Return focus to the left pane.
tmux select-pane -t 0

# Launch Taskwarrior in the original pane.
exec taskwarrior-tui
