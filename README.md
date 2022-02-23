# tmux-ssh-mode

tmux plugin to open new pane/window in ssh hosts where the host is selected according to the current host vim-like mode.

`set -w default-command 'ssh me@foo'

create a script to change the current host and bind it to a key: `tmux bind-key x run-shell -b 'script.sh arg1 arg2'
