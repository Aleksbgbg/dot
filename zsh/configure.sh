#!/bin/bash

mkdir ~/.zsh

git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.zsh/oh-my-zsh
git clone --depth=1 \
  https://github.com/romkatv/powerlevel10k.git \
  ~/.zsh/oh-my-zsh/custom/themes/powerlevel10k

mv ~/.zshrc ~/.zsh/.zshrc.orig
ln -s "$(realpath "$(dirname "$0")")/.zshrc" ~/.zshrc
ln -s "$(realpath "$(dirname "$0")")/.p10k.zsh" ~/.p10k.zsh
ln -n -s "$(realpath "$(dirname "$0")")/include" ~/.zsh/include

chsh -s "$(which zsh)"
