#!/bin/sh

# get an value
tmux show-option -gqv '@tmux_ssh_mode_current_host'
tmux set-option -g '@tmux_ssh_mode_current_host' foo
