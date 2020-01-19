#!/bin/sh

sudo pacman -S --noconfirm fcitx dunst git emacs vim NetworkManager
ln -sf ~/Configs/home_dotfiles/.bashrc ~/.bashrc
ln -sf ~/Configs/home_dotfiles/.vimrc ~/.vimrc
ln -sf ~/Configs/home_dotfiles/.config/i3 ~/.config/i3
ln -sf ~/Configs/home_dotfiles/.config/i3blocks ~/.config/i3blocks
ln -sf ~/Configs/home_dotfiles/.config/compton ~/.config/compton
ln -sf ~/Configs/home_dotfiles/.config/rofi ~/.config/rofi
