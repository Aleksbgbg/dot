#!/bin/bash

# Config
mkdir -p ~/.config/nvim
ln -s "$(realpath "$(dirname "$0")/init.vim")" ~/.config/nvim/init.vim

# Treesitter
git clone https://github.com/nvim-treesitter/nvim-treesitter ~/.local/share/nvim/site/pack/treesitter/start/nvim-treesitter
