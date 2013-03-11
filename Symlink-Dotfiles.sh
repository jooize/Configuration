#!/bin/sh

scriptdirectory="`dirname $0`"

echo 'find $HOME/.dotfiles -name ".*" -not -path "$HOME/.dotfiles" -not -path "$HOME/.dotfiles/.git" -path "*" -prune -exec ln -s -f {} $HOME \;' >> "${scriptdirectory}"/.git/hooks/post-commit
sh "${scriptdirectory}"/.git/hooks/post-commit

echo "Symlinked all dotfiles to $HOME and added script to Git post-commit hook which re-symlinks after every commit."

