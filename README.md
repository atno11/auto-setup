# Auto Setup Linux Terminal
A simple script to automate the setup of my personalized Linux terminal environment.


## Table of Contents
- [Important Notes](#important-notes)
- [Installation](#installation)
	- [Arch-based Distributions](#arch-based-distributions)
- [Dotfiles Repo](#dotfiles-repo)

## Important Notes
> [!IMPORTANT]
> Make sure you used **Nerd Fonts**

> [!IMPORTANT]
> Install a backup tool and create a system backup before using this script.

> [!NOTE]
> This script does not include package uninstallation, as some packages may already exist on your system by default. Creating an uninstallation script could potentially affect your current setup.

## Installation
### Arch-based Distributions
*Example: Arch Linux, EndeavourOS, Manjaro, etc.*
``` bash
sudo pacman -Syu --noconfirm
bash -c "$(curl -fSL https://raw.githubusercontent.com/atno11/auto-setup/main/arch.sh)"
```

## Dotfiles Repo
This repo contains all my dotfiles: [`Dotfiles`](https://github.com/atno11/dotfiles).

## Feedback
If you find this repo useful or have any suggestions, feel free to open an issue or submit a pull request.
