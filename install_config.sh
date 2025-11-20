#!/usr/bin/env bash

echo -e "${YELLOW}[6/8]${PURPLE} => Downloading file config...\n${WHITE}"

git clone --depth=1 https://github.com/atno11/dotfiles.git ~/dotfiles
git clone --depth=1 https://github.com/tmux-plugins/tpm ~/dotfiles/.tmux/plugins/tpm

