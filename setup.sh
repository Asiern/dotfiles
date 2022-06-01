#!/bin/bash

#### Desktop ####

# TODO add missing install deps
# Install deps
sudo pacman -S xorg xorg-server --noconfirm

# Install awesomewm
sudo pacman -S awesome --noconfirm

# Install gnome
sudo pacman -S gnome --noconfirm

# Terminal deps
sudo pacman -S lsd bat --noconfirm

##### Kitty #####

# Install kitty
sudo pacman -S kitty --noconfirm


###### ZSH ######

# Install zsh
sudo pacman -S zsh --noconfirm

# Set zsh as default shell
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# TODO Copy dotfiles
git clone https://github.com/Asiern/dotfiles /tmp/dotfiles
cp -r /tmp/dotfiles/awesome $(HOME)/.config/awesome 
cp -r /tmp/dotfiles/kitty $(HOME)/.config/kitty
cp /tmp/dotfiles/.zshrc $(HOME)/.zshrc
rm -rf /tmp/dotfiles
