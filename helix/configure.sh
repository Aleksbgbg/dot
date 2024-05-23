#!/bin/bash

ln -s "$(dirname "$(realpath "$0")")/config.toml" ~/.config/helix/config.toml
ln -s "$(dirname "$(realpath "$0")")/languages.toml" ~/.config/helix/languages.toml
