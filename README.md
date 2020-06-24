# tmux-copy-output

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://wfxr.mit-license.org/2018)
![version 0.0.1](https://img.shields.io/badge/version-0.0.1-red.svg)

`tmux-copy-output` is a tmux plugin for copying command's outputs inside a pane.


## Dependencies

- Launcher: Make sure you have a launcher or finder to be able to select:
  - [fzf](https://github.com/junegunn/fzf) [Recommended]
  - [dmenu](https://github.com/junegunn/fzf)
- [`xclip`](https://github.com/astrand/xclip)

## Install

### Via [TPM](https://github.com/tmux-plugins/tpm) (Recommend)

Add this line to your tmux config file, then hit `prefix + I`:

``` tmux
set -g @plugin 'jhonrocha/tmux-copy-output'
```

### Manually

Clone this repo somewhere and source `tmux-copy-output.tmux` at the config file.

## Usage

The default key-binding is `g`(of course prefix hit is needed), it can be modified by setting value to `@tco-key` at tmux config file.
There is also an option to set which launcher to use. By default it is `fzf-tmux`, you can use `dmenu` or any custom command.

The default copy to clipboard command is `xclip` for Linux systems. It's possible to override the command with `@tco-copy`.

There is also a quick key to copy the last command executed on the pane, being `G` by default. It is possible to override it with `@tco-quick-key`.

``` tmux
set -g @tco-key 'k'
set -g @tco-launcher 'dmenu -c -l 30 -bw 2'
set -g @tco-copy 'pbcopy'
set -g @tco-quick-key 'K'
```

## Acknowledgements
Copy script hugely inspired on:

- [tmux-fzf-url](https://github.com/wfxr/tmux-fzf-url) plugin
- [`Luke Smith`](https://lukesmith.xyz/) script to [copy from external pipe on st](https://github.com/LukeSmithxyz/st/blob/master/st-copyout)

## Contibutors

- [Thales Mello](https://github.com/thalesmello)
- [Jhon Rocha](https://github.com/jhonrocha)

## License

[MIT](https://github.com/jhonrocha/tmux-copy-output/blob/master/LICENSE)
