#!/bin/bash

ln -s "$(realpath "$(dirname "$0")")/config.toml" ~/.config/helix/config.toml
ln -s "$(realpath "$(dirname "$0")")/languages.toml" ~/.config/helix/languages.toml
