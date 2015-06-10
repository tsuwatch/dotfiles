#!/bin/bash

DOT_FILES=( .gemrc .zshrc .zshrc.custom .vimrc .vim .gitconfig .gitignore .tmux.conf )
DIR=$(pwd)

for file in ${DOT_FILES[@]}
do
	ln -s $DIR/$file $HOME/$file
done

[ ! -d ~/.oh-my-zsh ] && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
