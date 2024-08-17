#!/bin/bash

mkdir ~/.zsh

git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.zsh/oh-my-zsh
git clone --depth=1 \
  https://github.com/romkatv/powerlevel10k.git \
  ~/.zsh/oh-my-zsh/custom/themes/powerlevel10k
git clone --depth=1 \
  https://github.com/jeffreytse/zsh-vi-mode \
  ~/.zsh/oh-my-zsh/custom/plugins/zsh-vi-mode

mv ~/.zshrc ~/.zsh/.zshrc.orig
ln -s -f "$(dirname "$(realpath "$0")")/.zshrc" ~/.zshrc
ln -s -f "$(dirname "$(realpath "$0")")/.p10k.zsh" ~/.p10k.zsh
ln -s -n -f "$(dirname "$(realpath "$0")")/include" ~/.zsh/include

chsh -s "$(which zsh)"
