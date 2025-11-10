#!/usr/bin/env bash

set -euo pipefail

echo "==> WELCOME! Time to customize Arch-base Terminal"
echo "==> Created by: atno11"

cd ~

echo "==> Updating system packages..."
sudo pacman -Syu --noconfirm

echo "==> Setting locale..."
sudo sed -i "/^#pt_BR.UTF-8 UTF-8/s/^#//" /etc/locale.gen
sudo locale-gen
sudo localectl set-locale LANG=pt_BR.UTF-8

echo "==> Downloadind terminal tools..."
sudo pacman -S --noconfirm --needed base-devel git
echo "==> Downloading and installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepgk -si --noconfirm
cd ~
rm -rf ~/yay

pacman_packages=(
	# System monitoring and terminal visuals
	btop cmatrix cowsay fastfetch
	# Essential utilities
	make curl wget unzip dpkg ripgrep fd man openssh netcat
	fzf eza bat zoxide neovim tmux stow
	lazydocker lazygit
	# CTF tools
	perl-image-exiftool gdb ascii ltrace strace checksec patchelf upx binwalk
	# Programming languages
	nodejs pnpm
	# Shell customization
	zsh
)

aur_packages=(
	# System monitoring and terminal visuals
	cbonsai pipes.sh oh-my-posh
	# CTF Tools
	pwninit
)

sudo pacman -S --noconfirm "${pacman_packages[@]}"
yay  -S --noconfirm "${aur_packages[@]}"

echo "==> Downloading config files"
git clone --depth=1 https://github.com/atno11/dotfiles.git ~/dotfiles
git clone --depth=1 https://github.com/tmux-plugins/tpm ~/dotfiles/.tmux/plugins.tpm

echo "==> Stow"
cd ~/dotfiles
./.config/atno11/backup_config.sh
stow -t ~ .
cd ~

echo "==> Changing shell"
ZSH_PATH="$(which zsh)"
grep -qxF "$ZSH_PATH" /etc/shells || echo "$ZSH_PATH" | sudo tee -a /etc/shells
chsh -s "$ZSH_PATH"

echo
echo "==> Done! Reboot for apply the new config."
echo

