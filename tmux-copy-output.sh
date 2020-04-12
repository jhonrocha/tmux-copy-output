#!/usr/bin/env bash
# Using capture-pane on tmux, give a fzf prompt of recent commands,
# allowing the user to copy the output of one.
# fzf-tmux and xclip required for this script.
# By Jaywalker, Luke and Jhon

fzf_cmd() {
    fzf-tmux -d 35% --multi --exit-0 --cycle --reverse --bind='ctrl-r:toggle-all' --bind='ctrl-s:toggle-sort' --no-preview
}

tmpfile=$(mktemp /tmp/st-cmd-output.XXXXXX)
trap 'rm "$tmpfile"' 0 1 15
tmux capture-pane -p > $tmpfile
content="$(tmux capture-pane -p)"
# Get PS1 prompt
ps1="$(echo "$content" |
        grep "\S" |
        tail -n 1 |
        sed 's/^\s*//' |
        cut -d' ' -f1)"
# Choose
chosen="$(echo "$content" |
          grep -F "$ps1" |
          sed '$ d' |
          tac |
          fzf_cmd |
          sed 's/[^^]/[&]/g; s/\^/\\^/g')"
eps1="$(echo "$ps1" | sed 's/[^^]/[&]/g; s/\^/\\^/g')"

echo "$content" |
  awk "/^$chosen$/{p=1;print;next} p&&/$eps1/{p=0};p" |
  xclip -selection clipboard
