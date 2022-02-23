#!/usr/bin/env bash

tmux show-option -gqv '@tmux_ssh_mode_hosts' | tr ',' '\n' | head -n 1
