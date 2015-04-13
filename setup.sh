#!/bin/bash

DOT_FILES=( .gemrc .zshrc .zshrc.custom .vimrc .gitconfig .gitignore .tmux.conf )
DIR=$(pwd)

if [ -e $HOME/.vim ]
then
  for filepath in $DIR/.vim/*
  do
    filename=`basename $filepath`
    rm -r $HOME/.vim/$filename
    ln -s $filepath $HOME/.vim/$filename
  done
else
  ln -s $DIR/.vim $HOME/.vim
fi

for file in ${DOT_FILES[@]}
do
	ln -s $DIR/$file $HOME/$file
done


[ ! -d ~/.oh-my-zsh ] && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ ! -d ~/.vim/bundle/neobundle.vim ] && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
