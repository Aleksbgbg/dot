#!/bin/bash

git clone https://github.com/helix-editor/helix ~/dev/helix
pushd ~/dev/helix
cargo install --path helix-term --locked
mkdir -p ~/.config/helix
ln -Ts "$PWD/runtime" ~/.config/helix/runtime
popd
