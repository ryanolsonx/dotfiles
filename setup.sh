#!/usr/bin/env bash

rm -rf ~/.vimrc
ln -s ~/dotfiles/.vimrc ~/.vimrc

rm -rf ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

rm -rf ~/.ctags
ln -s ~/dotfiles/.ctags ~/.ctags

rm -rf ~/.config/nvim
ln -s ~/dotfiles/.config/nvim ~/.config/nvim

rm -rf ~/.config/tmux
ln -s ~/dotfiles/.config/tmux ~/.config/tmux
