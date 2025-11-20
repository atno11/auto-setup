#!/usr/bin/env bash

echo -e "${YELLOW}[7/8]${PURPLE} => Stow..\n${WHITE}"
cd ~/dotfiles
./.config/atno11/backup_config,sh
stow -t ~ .
cd ~