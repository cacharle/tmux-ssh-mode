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

Add it to your status bar:

```tmux
set -g status-right '#{tmux-ssh-mode}'
```

Press `prefix` and `S` to go to the next host.

Now, when you open a new pane/window, it will be ssh'ed in the selected host.

## TODO

- [ ] Load hosts list from a file
- [ ] Add a configuration variable to change the shortcut
- [ ] Pick host with `fzf` instead of going through them with a shortcut (look at `fzf-tmux` command)

[1]: https://github.com/tmux-plugins/tpm
