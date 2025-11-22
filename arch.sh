#!/usr/bin/env bash

set -euo pipefail

. "$(dirname "$0")/variables.sh"

echo -e "${PINK}
██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗
██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝
██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗
██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝
╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗
 ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝
 █████╗ ██╗   ██╗████████╗ ██████╗ ███████╗███████╗████████╗██╗   ██╗██████╗
██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
███████║██║   ██║   ██║   ██║   ██║███████╗█████╗     ██║   ██║   ██║██████╔╝
██╔══██║██║   ██║   ██║   ██║   ██║╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝
██║  ██║╚██████╔╝   ██║   ╚██████╔╝███████║███████╗   ██║   ╚██████╔╝██║
╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝
𝚃𝚒𝚖𝚎 𝚝𝚘 𝚌𝚞𝚜𝚝𝚘𝚖𝚒𝚣𝚎 𝚝𝚑𝚎 𝚊𝚛𝚌𝚑-𝚋𝚊𝚜𝚎𝚍 𝚝𝚎𝚛𝚖𝚒𝚗𝚊𝚕.
𝙲𝚛𝚎𝚊𝚝𝚎𝚍 𝚋𝚢: 𝚊𝚝𝚗𝚘𝟷𝟷
"
echo -e "${YELLOW}[1/8]${PURPLE} => Updating system packages...${WHITE}"

sudo pacman -Syu --noconfirm

echo -e "${YELLOW}[2/8]${PURPLE} => Setting locale...${WHITE}"
echo -e "${PINK}
▗▖    ▗▄▖  ▗▄▄▖ ▗▄▖ ▗▖   ▗▄▄▄▖
▐▌   ▐▌ ▐▌▐▌   ▐▌ ▐▌▐▌   ▐▌
▐▌   ▐▌ ▐▌▐▌   ▐▛▀▜▌▐▌   ▐▛▀▀▘
▐▙▄▄▖▝▚▄▞▘▝▚▄▄▖▐▌ ▐▌▐▙▄▄▖▐▙▄▄▖
"

sudo sed -i "/^#pt_BR.UTF-8 UTF-8/s/^#//" /etc/locale.gen
sudo locale-gen
sudo localectl set-locale LANG=pt_BR.UTF-8

dir=pwd

echo -e "${YELLOW}[3/8]${PURPLE} => Download some terminal tool...${WHITE}"
echo -e "${PINK}
▗▄▄▄▖▗▖  ▗▖ ▗▄▄▖▗▄▄▄▖▗▄▖ ▗▖   ▗▖   ▗▄▄▄▖▗▖  ▗▖ ▗▄▄▖
  █  ▐▛▚▖▐▌▐▌     █ ▐▌ ▐▌▐▌   ▐▌     █  ▐▛▚▖▐▌▐▌
  █  ▐▌ ▝▜▌ ▝▀▚▖  █ ▐▛▀▜▌▐▌   ▐▌     █  ▐▌ ▝▜▌▐▌▝▜▌
▗▄█▄▖▐▌  ▐▌▗▄▄▞▘  █ ▐▌ ▐▌▐▙▄▄▖▐▙▄▄▖▗▄█▄▖▐▌  ▐▌▝▚▄▞▘
▗▖  ▗▖▗▄▖▗▖  ▗▖
 ▝▚▞▘▐▌ ▐▌▝▚▞▘
  ▐▌ ▐▛▀▜▌ ▐▌
  ▐▌ ▐▌ ▐▌ ▐▌
"

rm -rf ~/yay
cd ~
sudo pacman -S --noconfirm --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd dir
rm -rf ~/yay

packages=(
    # System monitoring and terminal visuals
    btop cmatrix fastfetch
    # Essential utilities
    make curl wget unzip dpkg ripgrep fd man openssh netcat
    fzf eza bat zoxide neovim tmux stow
    lazydocker lazygit
    # CTF
    perl-image-exiftool gdb ascii ltrace strace checksec patchelf upx binwalk
    # Programming languages
    nodejs pnpm
    # Shell customization
    zsh
)

echo -e  "${PINK}
▗▄▄▖  ▗▄▖  ▗▄▄▖▗▖  ▗▖ ▗▄▖ ▗▖  ▗▖    ▗▄▄▖ ▗▖ ▗▖ ▗▄▄▖ ▗▄▄▖
▐▌ ▐▌▐▌ ▐▌▐▌   ▐▛▚▞▜▌▐▌ ▐▌▐▛▚▖▐▌    ▐▌ ▐▌▐▌▗▞▘▐▌   ▐▌
▐▛▀▘ ▐▛▀▜▌▐▌   ▐▌  ▐▌▐▛▀▜▌▐▌ ▝▜▌    ▐▛▀▘ ▐▛▚▖ ▐▌▝▜▌ ▝▀▚▖
▐▌   ▐▌ ▐▌▝▚▄▄▖▐▌  ▐▌▐▌ ▐▌▐▌  ▐▌    ▐▌   ▐▌ ▐▌▝▚▄▞▘▗▄▄▞▘

${YELLOW}System monitoring and terminal visuals${WHITE}
- btop
- cmatrix
- fastfetch

${YELLOW}CTF${WHITE}
- toolsperl-image-exiftool
- gdb
- ltrace
- strace
- checksec
- patchelf
- upx
- binwalk

${YELLOW}Programming languages${WHITE}
- nodejs
- pnpm

${YELLOW}Shell customization${WHITE}
- zsh
"
echo -e "${YELLOW}[4/8]${PURPLE} => Downloading pacman packages...${WHITE}"

sudo pacman -S --noconfirm "${packages[@]}"

packages=(
    # System monitoring and terminal visuals
    cbonsai pipes.sh oh-my-posh
    # CTF
    pwninit
)

echo -e " ${PINK}
 ▗▄▖ ▗▖ ▗▖▗▄▄▖     ▗▄▄▖ ▗▖ ▗▖ ▗▄▄▖ ▗▄▄▖
▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌    ▐▌ ▐▌▐▌▗▞▘▐▌   ▐▌
▐▛▀▜▌▐▌ ▐▌▐▛▀▚▖    ▐▛▀▘ ▐▛▚▖ ▐▌▝▜▌ ▝▀▚▖
▐▌ ▐▌▝▚▄▞▘▐▌ ▐▌    ▐▌   ▐▌ ▐▌▝▚▄▞▘▗▄▄▞▘

${YELLOW}System monitoring and terminal visuals${WHITE}
- cbonsai
- pipes.sh
- oh-my-posh

${YELLOW}CTF${WHITE}
- pwninit
"

echo -e "${YELLOW}[5/8]${PURPLE} => Downloading yay packages...${WHITE}"

yay -S --noconfirm "${packages[@]}"

echo -e "${YELLOW}[6/8]${PURPLE} => Downloading file config...${WHITE}"

rm -rf ~/dotfiles
rm -rf ~/dotfiles/.tmux/plugins/tpm

git clone --depth=1 https://github.com/atno11/dotfiles.git ~/dotfiles
git clone --depth=1 https://github.com/tmux-plugins/tpm ~/dotfiles/.tmux/plugins/tpm

echo -e "${YELLOW}[7/8]${PURPLE} => Stow..${WHITE}"
cd ~/dotfiles
./.config/atno11/backup_config,sh
stow -t ~ .
cd ~

echo -e "${YELLOW}[8/8]${PURPLE} => Changing shell..${WHITE}"

ZSH_PATH="$(which zsh)"
grep -qxF "$ZSH_PATH" /etc/shells || echo "$ZSH_PATH" | sudo tee -a /etc/shells
chsh -s "$ZSH_PATH"

echo -e "${RESET}"
