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

source "$HOME/.antibody/antibody.zsh"
#antibody bundle mafredri/zsh-async
antibody bundle jooize/zsh-async
#antibody bundle sindresorhus/pure
antibody bundle jooize/pure
#antibody bundle zsh-users/zsh-completions
antibody bundle jooize/zsh-completions
#antibody bundle zsh-users/zsh-history-substring-search
antibody bundle jooize/zsh-history-substring-search
#antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle jooize/zsh-syntax-highlighting

alias bell='echo '
alias zshrc='$EDITOR $HOME/.zshrc'

mkdir -p ~/.go
export GOPATH=~/.go
export PATH="$PATH:$GOPATH/bin"

