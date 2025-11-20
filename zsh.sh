#!/usr/bin/env bash

echo -e "${YELLOW}[8/8]${PURPLE} => Changing shell..\n${WHITE}"

ZSH_PATH="$(which zsh)"
grep -qxF "$ZSH_PATH" /etc/shells || echo "$ZSH_PATH" | sudo tee -a /etc/shells
chsh -s "$ZSH_PATH"

