#!/usr/bin/env bash

cmd="$(tmux display-message -p '#{pane_current_command}')"

case "$cmd" in
nvim) echo " neovim" ;;
yazi) echo " yazi" ;;
node) echo " node" ;;
python) echo " python" ;;
git) echo "󰆍 git" ;;
lazygit) echo "󰊢 lazygit" ;;
ssh) echo "󰣀 ssh" ;;
zsh) echo "󰆍 shell" ;;
*) echo "$cmd" ;;
esac
