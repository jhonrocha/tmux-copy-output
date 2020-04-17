#!/usr/bin/env bash
#=============================
#   Author: Jhon Rocha
#    Email: jhmrocha@gmail.com
#  Created: 2020-04-12 10:30
#=============================
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# $1: option
# $2: default value
tmux_get() {
    local value
    value="$(tmux show -gqv "$1")"
    [ -n "$value" ] && echo "$value" || echo "$2"
}

key="$(tmux_get '@tco-key' 'g')"
quick_key="$(tmux_get '@tco-quick-key' 'G')"
launcher="$(tmux_get '@tco-launcher' 'fzf-tmux')"
copy="$(tmux_get '@tco-copy' 'xclip -selection clipboard')"

tmux bind-key "$key" run -b "$CURRENT_DIR/tmux-copy-output.sh \"$launcher\" \"$copy\" default";
tmux bind-key "$quick_key" run -b "$CURRENT_DIR/tmux-copy-output.sh \"$launcher\" \"$copy\" quick";

