#!/usr/bin/env bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

hosts="$(tmux show-option -gqv '@tmux_ssh_mode_hosts' | tr ',' '\n')"
echo "$hosts" | grep -q ssh-mode-none || hosts="$(echo "$hosts" | sed '1i\
ssh-mode-none
')"
tmux set-option -g '@tmux_ssh_mode_hosts' "$(echo "$hosts" | tr '\n' ',')"

# hosts="$(tmux show-option -gqv '@tmux_ssh_mode_hosts')"
# echo "$hosts"

tmux bind-key s run-shell -b "$SCRIPT_DIR/ssh-mode.sh"
