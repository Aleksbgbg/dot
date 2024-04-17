#!/bin/bash

git config --global include.path "$(realpath "$(dirname "$0")/.gitconfig")"
