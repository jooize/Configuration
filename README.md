Install
=======
``` sh
cd $HOME
git clone git@github.com:jooize/Configuration
cd Configuration
git submodule init
git submodule update
stow Git Tmux Zsh Vim
vim +PlugInstall +qall
```

If you don't have Stow available:
``` sh
cd $HOME
find $(find Dotfiles -type d -mindepth 1 -maxdepth 1) -name '.*' -mindepth 1 -maxdepth 1 -exec ln -s {} . \;
```
