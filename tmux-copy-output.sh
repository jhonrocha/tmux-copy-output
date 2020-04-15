#!/usr/bin/env bash
# Using capture-pane on tmux, give a fzf prompt of recent commands,
# allowing the user to copy the output of one.
# fzf-tmux and xclip required for this script.
# By Jaywalker, Luke and Jhon

launcher_cmd() {
  if [ "$1" = "fzf-tmux" ]; then
    fzf-tmux -d 35% --multi --exit-0 --cycle --reverse --bind='ctrl-r:toggle-all' --bind='ctrl-s:toggle-sort' --no-preview --header="Copy which command's output?"
  elif [ "$1" = "dmenu" ]; then
    dmenu -p "Copy which command's output?" -i -l 10 
  else
    # Simply use the command
    $1
  fi
}

launcher=$1
content="$(tmux capture-pane -pS -32768)"
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
          launcher_cmd "$launcher" |
          sed 's/[^^]/[&]/g; s/\^/\\^/g')"
eps1="$(echo "$ps1" | sed 's/[^^]/[&]/g; s/\^/\\^/g')"

echo "$content" |
  awk "/^$chosen$/{p=1;print;next} p&&/$eps1/{p=0};p" |
  xclip -selection clipboard
