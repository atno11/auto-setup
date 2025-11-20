#!/usr/bin/env bash

. "$(dirname "$0")/variables.sh"

packages=(
    # System monitoring and terminal visuals
    btop cmatrix fastfetch
    # Essential utilities
    make curl wget unzip dpkg ripgrep fd man openssh netcat
    fzf eza bat zoxide neovim tmux stow
    lazydocker lazygit
    # CTF 
    toolsperl-image-exiftool gdb ascii ltrace strace checksec patchelf upx binwalk
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

${YELLOW}Programming languagess${WHITE}
- nodejs
- pnpm

${YELLOW}Shell customization${WHITE}
- zsh
"

echo -e "${YELLOW}[4/8]${PURPLE} => Downloading pacman packages...\n${WHITE}"


sudo pacman -S --noconfirm "${packages[@]}"