#!/bin/bash

# Config
mkdir -p ~/.config/nvim/lua
ln -s "$(realpath "$(dirname "$0")/init.vim")" ~/.config/nvim/init.vim
ln -s "$(realpath "$(dirname "$0")/init.lua")" ~/.config/nvim/lua/init.lua
