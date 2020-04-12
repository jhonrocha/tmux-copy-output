# tmux-copy-output

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://wfxr.mit-license.org/2018)
![version 0.0.1](https://img.shields.io/badge/version-0.0.1-red.svg)

`tmux-copy-output` is a tmux plugin for copying command's outputs inside a pane.


## Dependencies
Make sure you have:
- [`fzf`](https://github.com/junegunn/fzf)
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

The default key-binding is `g`(of course prefix hit is needed), it can be modified by setting value to `@tmux-copy-output` at the tmux config like this:

``` tmux
set -g @tmux-copy-output 'x'
```
## Acknowledgements
Copy script hugely inspired on:
- [tmux-fzf-url](https://github.com/wfxr/tmux-fzf-url) plugin
- [`Luke Smith`](https://lukesmith.xyz/) script to [copy from external pipe on st](https://github.com/LukeSmithxyz/st/blob/master/st-copyout)

## License

[MIT](https://github.com/jhonrocha/tmux-copy-output/blob/master/README.md)
