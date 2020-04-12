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

key="$(tmux_get '@tmux-copy-output' 'g')"

tmux bind-key "$key" run -b "$CURRENT_DIR/tmux-copy-output.sh";
