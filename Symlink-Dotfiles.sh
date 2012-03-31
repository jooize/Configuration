#!/bin/sh

echo 'find $HOME/.dotfiles -name ".*" -not -path "$HOME/.dotfiles" -not -path "$HOME/.dotfiles/.git" -path "*" -prune -exec ln -s -f {} $HOME \;' >> "$(dirname $0)"/.git/hooks/post-commit
sh "$(dirname $0)"/.git/hooks/post-commit

echo "Symlinked all dotfiles to $HOME and added script to post-commit hook that does this after every commit."

