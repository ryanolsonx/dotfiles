#!/usr/bin/env bash

rm -rf ~/.vimrc
ln -s ~/dotfiles/.vimrc ~/.vimrc

rm -rf ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

rm -rf ~/.tmux.conf
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

rm -rf ~/.config/kitty
ln -s ~/dotfiles/kitty ~/.config/kitty

rm -rf ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim
