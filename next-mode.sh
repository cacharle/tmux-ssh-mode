#!/usr/bin/env bash

hosts="$(tmux show-option -gqv '@tmux_ssh_mode_hosts' | tr ',' '\n')"

hosts="$(echo "$hosts" | tail -n +2)
$(echo "$hosts" | head -n 1)"

tmux set-option -g '@tmux_ssh_mode_hosts' $(echo "$hosts" | tr '\n' ',')

top_host="$(echo "$hosts" | head -n 1 | tr -d '\n')"


if [ "$top_host" = 'ssh-mode-none' ]
then
    tmux set-option -w default-command ''
else
    tmux set-option -w default-command "ssh $top_host"
fi
