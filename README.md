Dotfiles
========
Yeh~

Install
=======
``` sh
cd $HOME
git clone git@github.com:jooize/Dotfiles.git
find $(find Dotfiles -type d -mindepth 1 -maxdepth 1) -name '.*' -mindepth 1 -maxdepth 1 -exec ln -s {} . \;
```
