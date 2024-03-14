#!/bin/bash

check_for_config() {
    local app=$1

    if [ -d $HOME/.config/$app]; then
        mv $HOME/.config/$app $HOME/.config/$app.backup
    fi

    if [ $app = "nvim" && -d /root/.config/$app ]; then
        mv /root/.config/$app $HOME/.config/$app.backup
    fi
}

copy_config() { cp -r $1 $HOME/.config/$1 }

build_picom() {
    echo "Cloning Picom...\n"
    git clone -q https://github.com/pijulius/picom.git $HOME/repos/
    cd $HOME/repos/picom

    # Install Dependencies
    echo "Installing Picom dependencies...\n"
    sudo pacman -Syq --noconfirm --needed make cmake gcc python3 meson ninja pkgconf libev uthash

    # Build picom
    echo "Building Picom...\n"
    git submodule update --init --recursive
    meson setup --buildtype=release . build
    ninja -C build

    echo "Done!\n\n"

    # Return to .dotfiles directory
    if [ $(pwd) != "$HOME/repos/.dotfiles" ]; then cd $HOME/repos/.dotfiles fi
}

# Find current distro
if [ -e /usr/bin/rg ]; then
    distro=$(cat /etc/os-release | rg --pcre2 -e '(?!ID_LIKE=)\w+$')
else
    distro=$(cat /etc/os-release | grep --perl-regexp '(?!ID_LIKE=)\w+$')
fi

echo "Installing .dotfiles...\n\n"

# Make "repos" folder
mkdir -p $HOME/repos

# Clone .dotfiles repo
if [ $distro = *"arch"* ]; then sudo pacman -Syq --noconfirm --needed git fi
if [ ! -d $HOME/repos/.dotfiles ]; then
    git clone -q https://github.com/beebeau-chimmy/.dotfiles.git $HOME/repos/
fi
cd $HOME/repos/.dotfiles

# Choose window manager
echo "What Window Manager do you want to use?"
select wm in i3 Hyprland Quit; do
    case $wm in
        "i3")
            if [ $distro = *"arch"* ]; then
                sudo pacman -Syq --noconfirm --needed yay
                yay -Syq --noconfirm --needed i3-rounded i3status i3blocks polybar dunst
            fi
            echo "Copying i3 config...\n"
            check_for_config i3
            copy_config i3
            echo "Copying Polybar config...\n"
            check_for_config polybar
            copy_config polybar
            echo "Setting Up Picom..."
            build_picom
            echo "Copying Picom config...\n"
            check_for_config picom
            copy_config picom
            echo "Copying Dunst config...\n"
            check_for_config dunst
            copy_config dunst
            echo "Done!\n\n";;
        "hyprland")
            if [ $distro = *"arch"* ]; then sudo pacman -Syq --noconfirm --needed hyprland waybar fi
            echo "Copying Hyprland config...\n"
            check_for_config hypr
            copy_config hypr
            echo "Copying Waybar config...\n"
            check_for_config waybar
            copy_config waybar
            echo "Done!\n\n";;
        "Quit")
            echo "Exiting Script..."
            break;;
    esac
done

# ZSH / Oh-My-ZSH
## Install ZSH
echo "Installing ZSH / Oh-My-ZSH...\n"
if [ $distro = *"arch"* ]; then sudo pacman -Syq --noconfirm --needed zsh curl fi
sudo chsh /usr/bin/zsh # Change default shell

if [ -e $HOME/.zshrc ]; mv $HOME/.zshrc.backup fi # Moves existing .zshrc

## Install Oh-My-ZSH
cd $HOME
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm .zshrc # Removes .zshrc created by oh-my-zsh
cp .zshrc $HOME/ # Copy zsh config

## Install ZPlug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

## Source zsh config
source $HOME/.zshrc

cd $HOME/repos/.dotfiles
echo "Done!\n\n"

# Terminal
## Installing Alacritty and TMUX
echo "Installing Alacritty, TMUX, and their configs...\n"

if [ $distro = *"arch"* ]; then sudo pacman -Syq --noconfirm --needed alacritty fi
copy_config alacritty # Copy alacritty config

if [ $distro = *"arch"* ]; then sudo pacman -Syq --noconfirm --needed tmux fi
if [ -e $HOME/.tmux.conf ]; then mv $HOME/.tmux.conf $HOME/.tmux.conf.backup fi
cp .tmux.conf $HOME/ # Copy tmux config

## Install TPM for TMUX plugins
git clone -q https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Done!\n\n"

## Neovim
echo "Installing Neovim and config...\n"
### Install neovim and language dependencies for LSPs
if [[ $distro == *"arch"* ]]; then ## For Arch distros
    sudo pacman -Syq --noconfirm --needed neovim lua go jdk17-openjdk nodejs npm python3
fi

## Move neovim config over
check_for_config nvim
copy_config nvim
cp -r $HOME/repos/.dotfiles/nvim /root/.config/ # Copy config for root

echo "Done!\n\n"

echo "All configs installed, Exiting..."
return 0
