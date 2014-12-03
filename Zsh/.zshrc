#
# Executes commands at the start of an interactive session.
#

source $HOME/.antigen/antigen.zsh
export PURE_GIT_PULL=0
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

alias t='python $HOME/Executables/t/t.py --task-dir ~/ --list Todo.txt --delete-if-empty'
alias bell='fg ; ""'
alias zshrc='$EDITOR $HOME/.zshrc'

