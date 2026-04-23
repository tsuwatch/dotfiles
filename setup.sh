#!/bin/bash

[ ! -d ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

DOT_FILES=( .gemrc .zshrc .zshrc.custom .vimrc .vim .gitconfig .gitignore .tmux.conf )
DIR=$(pwd)

for file in ${DOT_FILES[@]}
do
	ln -s $DIR/$file $HOME/$file
done
