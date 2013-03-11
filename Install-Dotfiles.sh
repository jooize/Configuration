#!/bin/sh

git clone git://github.com/jooize/Dotfiles.git $HOME/.dotfiles
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.dotfiles/.oh-my-zsh
sh "`dirname $0`"/Symlink-Dotfiles.sh
git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
vim +BundleInstall +qall

