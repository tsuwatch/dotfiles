#!/bin/bash

DOT_FILES=( .gemrc .zshrc .zshrc.custom .vimrc .vim .gitconfig .gitignore .tmux.conf )
DIR=$(pwd)

#if [ -d $HOME/.vim ]
#then
#  for filepath in $DIR/.vim/*
#  do
#    filename=`basename $filepath`
#    rm -rf $HOME/.vim/$filename
#    ln -s $filepath $HOME/.vim/$filename/
#  done
#else
#  ln -s $DIR/.vim $HOME/.vim
#fi

for file in ${DOT_FILES[@]}
do
	ln -s $DIR/$file $HOME/$file
done


[ ! -d ~/.oh-my-zsh ] && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
