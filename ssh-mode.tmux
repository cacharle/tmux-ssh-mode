#!/usr/bin/env bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

hosts="$(tmux show-option -gqv '@tmux_ssh_mode_hosts' | tr ',' '\n')"
echo "$hosts" | grep -q ssh-mode-none || hosts="$(echo "$hosts" | sed '1i\
ssh-mode-none
')"
tmux set-option -g '@tmux_ssh_mode_hosts' "$(echo "$hosts" | tr '\n' ',')"

# hosts="$(tmux show-option -gqv '@tmux_ssh_mode_hosts')"
# echo "$hosts"

tmux bind-key S run-shell "$SCRIPT_DIR/next-mode.sh"

old_status_line="$(tmux show-option -gqv 'status-right')"
placeholder='\#{tmux-ssh-mode}'
script="#($SCRIPT_DIR/current-mode.sh)"
new_status_line=${old_status_line/$placeholder/$script}
tmux set-option -g 'status-right' "$new_status_line"
