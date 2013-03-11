#!/bin/sh

dotfiles="$HOME"/.dotfiles

echo 'find $HOME/.dotfiles -name ".*" -not -path "$HOME/.dotfiles" -not -path "$HOME/.dotfiles/.git" -path "*" -prune -exec ln -s -f {} $HOME \;' >> "${dotfiles}"/.git/hooks/post-commit
sh "${dotfiles}"/.git/hooks/post-commit

echo "Symlinked all dotfiles to $HOME and added script to Git post-commit hook which re-symlinks after every commit."

