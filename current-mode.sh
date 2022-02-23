#!/bin/sh

tmux show-option -gqv '@tmux_ssh_mode_hosts' | tr ',' '\n' | head -n 1
