#
# Executes commands at the start of an interactive session.
#

bindkey -e
bindkey '\e[3~' delete-char
bindkey '^J' self-insert
bindkey '^Z' undo

export WORDCHARS='*?_-[]~&;!#$%^(){}<>'
export MOSH_TITLE_NOPREFIX=1

zstyle ':completion:*' menu select=2

autoload -U url-quote-magic
zle -N self-insert url-quote-magic

source "$HOME/.antigen/antigen.zsh"
export PURE_GIT_PULL=0
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle robbyrussell/oh-my-zsh plugins/safe-paste
antigen apply

alias t='python $HOME/Executables/t/t.py --task-dir ~/ --list Todo.txt --delete-if-empty'
alias bell='fg ; ""'
alias zshrc='$EDITOR $HOME/.zshrc'

