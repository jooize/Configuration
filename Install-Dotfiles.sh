#!/bin/sh

dotfiles="$HOME"/.dotfiles
git clone git://github.com/jooize/Dotfiles.git "${dotfiles}"/.dotfiles
zsh "${dotfiles}"/Install-Helper-Prezto.zsh
sh "${dotfiles}"/Symlink-Dotfiles.sh
git clone https://github.com/gmarik/vundle.git "${dotfiles}"/.vim/bundle/vundle
vim +BundleInstall +qall

