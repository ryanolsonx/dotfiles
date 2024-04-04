#!/usr/bin/env bash

rm -rf ~/.vimrc
ln -s ~/dotfiles/.vimrc ~/.vimrc

rm -rf ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

rm -rf ~/.tmux.conf
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

rm -rf ~/.config/kitty
mkdir -p ~/.config/kitty
ln -s ~/dotfiles/kitty.conf ~/.config/kitty/kitty.config
