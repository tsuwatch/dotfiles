#!/bin/bash

[ ! -d ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

DOT_FILES=( .gemrc .zshrc .zshrc.custom .vimrc .vim .gitconfig .gitignore .tmux.conf )
DIR=$(pwd)

for file in ${DOT_FILES[@]}
do
	ln -s $DIR/$file $HOME/$file
done

# neovim config
mkdir -p $HOME/.config
ln -s $DIR/.config/nvim $HOME/.config/nvim

# Nerd Font
brew install --cask font-hack-nerd-font

# CLI tools
brew install ripgrep lazygit
