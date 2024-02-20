#!/usr/bin/env bash

rm -rf ~/.vimrc.full
ln -s ~/dotfiles/.vimrc.full ~/.vimrc.full

rm -rf ~/.vimrc.minimal
ln -s ~/dotfiles/.vimrc.minimal ~/.vimrc.minimal

rm -rf ~/.vimrc.git
ln -s ~/dotfiles/.vimrc.git ~/.vimrc.git

rm -rf ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

rm -rf ~/.ctags
ln -s ~/dotfiles/.ctags ~/.ctags

rm -rf ~/.config/nvim
ln -s ~/dotfiles/.config/nvim ~/.config/nvim

rm -rf ~/.config/tmux
ln -s ~/dotfiles/.config/tmux ~/.config/tmux
