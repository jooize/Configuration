#!/bin/sh

git clone https://github.com/jooize/Dotfiles.git $HOME/.dotfiles

echo 'find $HOME/.dotfiles -name ".*" -not -path "$HOME/.dotfiles" -not -path "$HOME/.dotfiles/.git" -path "*" -prune -exec ln -s -f {} $HOME \;' >> "$(dirname $0)"/.git/hooks/post-commit
sh "$(dirname $0)"/.git/hooks/post-commit

git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
vim +BundleInstall +qall
