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

Testing
=======
Create a structure as below and run ```cd $HOME/SymlinkTest && find $(find Dotfiles -type d -mindepth 1 -maxdepth 1) -name '.*' -mindepth 1 -maxdepth 1 -exec echo {} \;``` to see that the correct files will be symlinked.

```
~/SymlinkTest ❯❯❯ tree -a
.
└── Dotfiles
    ├── Git
    ├── Tmux
    │   ├── .tmux
    │   │   └── do-not-include
    │   └── .tmux.conf
    ├── Zsh
    │   ├── .SUPPORTSmultiCaSe
    │   ├── .zshenv
    │   ├── .zshrc
    │   └── SKIP-README.md
    └── do-not-include-either
```
