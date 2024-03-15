#!/bin/bash

check_for_config() {
    local app=$1

    if [ -d "$HOME/.config/$app" ]; then
        mv "$HOME/.config/$app" "$HOME/.config/$app.backup"
    fi

    if [ "$app" = "nvim" ] && [ -d "/root/.config/$app" ]; then
        mv "/root/.config/$app" "$HOME/.config/$app.backup"
    fi
}

copy_config() {
    cp -r "$1" "$HOME/.config/$1"
}

build_picom() {
    printf "Cloning Picom...\n"
    git clone -q https://github.com/pijulius/picom.git "$HOME/repos/picom"
    cd "$HOME/repos/picom" || exit

    # Install Dependencies
    printf "Installing Picom dependencies...\n"
    sudo pacman -Syq --noconfirm --needed make cmake gcc python3 meson ninja pkgconf libev uthash libconfig

    # Build picom
    printf "Building Picom...\n"
    git submodule update --init --recursive
    meson setup --buildtype=release . build
    ninja -C build

    printf "Done!\n\n"

    # Return to .dotfiles directory
    if [ "$(pwd)" != "$HOME/repos/.dotfiles" ]; then
        cd "$HOME/repos/.dotfiles" || exit
    fi
}

# Find current distro
if [ -e /usr/bin/rg ]; then
    distro=$(rg --pcre2 -e '(?!ID_LIKE=)\w+$' /etc/os-release)
else
    distro=$(grep --perl-regexp '(?!ID_LIKE=)\w+$' /etc/os-release)
fi

printf "Installing .dotfiles...\n\n"

# Make "repos" folder
mkdir -p "$HOME/repos"

# Clone .dotfiles repo
if [[ $distro == *"arch"* ]]; then
    sudo pacman -Syq --noconfirm --needed git
fi
if [ ! -d "$HOME/repos/.dotfiles" ]; then
    git clone -q https://github.com/beebeau-chimmy/.dotfiles.git "$HOME/repos/.dotfiles"
fi
cd "$HOME/repos/.dotfiles" || exit

# Choose window manager
printf "What Window Manager do you want to use?\n"
select wm in i3 Hyprland Quit; do
    case $wm in
        "i3")
            if [[ $distro == *"arch"* ]]; then
                sudo pacman -Syq --noconfirm --needed yay
                yay -Syq --noconfirm --needed i3-gaps-rounded-git i3lock-fancy i3status i3blocks polybar dunst
            fi
            printf "Copying i3 config...\n"
            check_for_config i3
            copy_config i3
            printf "Copying Polybar config...\n"
            check_for_config polybar
            copy_config polybar
            printf "Setting Up Picom..."
            build_picom
            printf "Copying Picom config...\n"
            check_for_config picom
            copy_config picom
            printf "Copying Dunst config...\n"
            check_for_config dunst
            copy_config dunst
            printf "Done!\n\n"
            break;;
        "hyprland")
            if [[ $distro == *"arch"* ]]; then
                sudo pacman -Syq --noconfirm --needed hyprland waybar
            fi
            printf "Copying Hyprland config...\n"
            check_for_config hypr
            copy_config hypr
            printf "Copying Waybar config...\n"
            check_for_config waybar
            copy_config waybar
            printf "Done!\n\n"
            break;;
        "Quit")
            printf "Exiting Script..."
            exit;;
    esac
done

# ZSH / Oh-My-ZSH
## Install ZSH
printf "Installing ZSH / Oh-My-ZSH...\n"
if [[ $distro == *"arch"* ]]; then
    sudo pacman -Syq --noconfirm --needed zsh curl
fi
sudo chsh /usr/bin/zsh # Change default shell

if [ -e "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi # Moves existing .zshrc

## Install Oh-My-ZSH
cd "$HOME" || exit
if [ -d "$HOME/.oh-my-zsh" ]; then
    read -r -p "Oh-My-Zsh is already installed. Do you want to reinstall? (Yes / No):\n" zsh_reinstall
    if [ "$zsh_reinstall" = "Yes" ]; then
        rm -rf "$HOME/.oh-my-zsh"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh --unattended)"
    fi
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh --unattended)"
fi

rm .zshrc # Removes .zshrc created by oh-my-zsh
cp .zshrc "$HOME/.zshrc" # Copy zsh config

## Install ZPlug
if [ -d "$HOME/.zplug" ]; then
    read -r -p "ZPlug is already installed. Do you want to reinstall? (Yes / No):\n" zplug_reinstall
    if [ "$zplug_reinstall" = "Yes" ]; then
        rm -rf "$HOME/.zplug"
        curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    fi
else
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

## Source zsh config
# source "$HOME/.zshrc"

cd "$HOME/repos/.dotfiles" || exit
printf "Done!\n\n"

# Terminal
## Installing Alacritty and TMUX
printf "Installing Alacritty, TMUX, and their configs...\n"

if [[ $distro == *"arch"* ]]; then
    sudo pacman -Syq --noconfirm --needed alacritty
fi
check_for_config alacritty
copy_config alacritty # Copy alacritty config

if [[ $distro == *"arch"* ]]; then
    sudo pacman -Syq --noconfirm --needed tmux
fi
if [ -e "$HOME/.tmux.conf" ]; then
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.backup"
fi
cp .tmux.conf "$HOME/.tmux.conf" # Copy tmux config

## Install TPM for TMUX plugins
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    read -r -p "TPM is already installed. Do you want to reinstall? (Yes / No):\n" tpm_reinstall
    if [ "$tpm_reinstall" = "Yes" ]; then
        rm -rf "$HOME/.tmux/plugins/tpm"
        git clone -q https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
else
    git clone -q https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

printf "Done!\n\n"

# Move fonts
sudo cp -r misc/fonts/* /usr/share/fonts
fc-cache -fv # Refresh font cache

## Neovim
printf "Installing Neovim and config...\n"
### Install neovim and language dependencies for LSPs
if [[ $distro == *"arch"* ]]; then ## For Arch distros
    sudo pacman -Syq --noconfirm --needed neovim lua go jdk17-openjdk nodejs npm python3
fi

## Move neovim config over
check_for_config nvim
copy_config nvim
sudo cp -r "$HOME/repos/.dotfiles/nvim" /root/.config/ # Copy config for root

printf "Done!\n\n"

printf "All configs installed!! Exiting..."
exit
