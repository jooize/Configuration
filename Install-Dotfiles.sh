#!/bin/sh

git clone git://github.com/jooize/Dotfiles.git $HOME/.dotfiles
zsh "`dirname $0`"/Install-Helper-Prezto.zsh
sh "`dirname $0`"/Symlink-Dotfiles.sh
git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
vim +BundleInstall +qall

