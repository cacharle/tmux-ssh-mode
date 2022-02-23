# tmux-ssh-mode

Tmux plugin to open new window/pane already ssh'ed in a selected list.

## Installation

With [tpm][1], add the following to your `tmux.conf`:

```tmux
set -g @plugin 'cacharle/tmux-ssh-mode'
```

## Usage

Set `@tmux_ssh_mode_hosts` to your list of hosts:

```tmux
set -g '@tmux_ssh_mode_hosts' 'cacharle@some-server,jean@wow'
```

[1]: https://github.com/tmux-plugins/tpm
