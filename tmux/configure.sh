#!/bin/bash

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s -f "$(dirname "$(realpath "$0")")/.tmux.conf" ~/.tmux.conf
tmux source ~/.tmux.conf # Remember to use <prefix>+I to install plugins
