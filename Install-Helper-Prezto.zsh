#!/usr/bin/env zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.dotfiles/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "$HOME"/.dotfiles/.zprezto/runcoms/^README.md(.N); do
	ln -s "$rcfile" "$HOME/.dotfiles/.${rcfile:t}"
done

echo -n "Change default shell to Zsh by running: "
echo "chsh -s \$(which zsh)"

