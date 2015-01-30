Install
=======
``` sh
cd $HOME
git clone git@github.com:jooize/Dotfiles
cd Dotfiles
git submodule init
git submodule update
stow Git Tmux Zsh Vim
```

If you don't have Stow available:
``` sh
find $(find Dotfiles -type d -mindepth 1 -maxdepth 1) -name '.*' -mindepth 1 -maxdepth 1 -exec ln -s {} . \;
```
