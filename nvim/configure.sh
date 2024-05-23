#!/bin/bash

# Config
mkdir -p ~/.config/nvim/lua
ln -s -f "$(dirname "$(realpath "$0")")/init.vim" ~/.config/nvim/init.vim
ln -s -f "$(dirname "$(realpath "$0")")/init.lua" ~/.config/nvim/lua/init.lua
