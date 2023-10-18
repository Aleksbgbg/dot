#!/bin/bash

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp -f .tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf
