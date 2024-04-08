#!/bin/bash

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s "$(realpath "$(dirname "$0")/.tmux.conf")" ~/.tmux.conf
tmux source ~/.tmux.conf
