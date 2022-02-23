#!/usr/bin/env bash

# 1. get hosts
# 2. rotate hosts lines
# 4. set default-command with top host

hosts="$(tmux show-option -gqv '@tmux_ssh_mode_hosts' | tr ',' '\n')"

echo "$hosts"
echo '----------------------'

hosts="$(echo "$hosts" | tail -n +2)
$(echo "$hosts" | head -n 1)"

tmux set-option -g '@tmux_ssh_mode_hosts' $(echo "$hosts" | tr '\n' ',')

echo "$hosts"
echo '----------------------'

top_host="$(echo "$hosts" | head -n 1 | tr -d '\n')"
echo "$top_host"
echo '----------------------'


if [ "$top_host" = 'ssh-mode-none' ]
then
    tmux set-option -w default-command ''
else
    tmux set-option -w default-command "ssh $top_host"
fi

echo "$(tmux show-option default-command)"
