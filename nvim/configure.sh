#!/bin/bash

# Config
mkdir -p ~/.config/nvim/lua
ln -s -f "$(dirname "$(realpath "$0")")/init.vim" ~/.config/nvim/init.vim
ln -s -f "$(dirname "$(realpath "$0")")/init.lua" ~/.config/nvim/lua/init.lua

# TreeSitter bp grammars
git clone https://git.belanyi.fr/ambroisie/tree-sitter-bp ~/dev/tree-sitter-bp
ln -s ~/dev/tree-sitter-bp/queries ~/.local/share/nvim/lazy/nvim-treesitter/queries/bp

pushd ~/dev/tree-sitter-bp
cargo install tree-sitter-cli
tree-sitter generate
popd
