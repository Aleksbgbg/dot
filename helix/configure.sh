#!/bin/bash

ln -s -f "$(dirname "$(realpath "$0")")/config.toml" ~/.config/helix/config.toml
ln -s -f "$(dirname "$(realpath "$0")")/languages.toml" ~/.config/helix/languages.toml
