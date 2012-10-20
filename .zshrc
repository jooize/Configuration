# Modeline & Notes {
#     vim: set foldmarker={,} foldlevel=0:
# }
# Unicode {
export LC_ALL=en_US.UTF-8
# }
# Aliases {
alias ls='ls -FG' # BSD. GNU would be "--color=auto --classify"
alias l.='ls -Ad .*'
alias ll='ls -l'
alias llh='ls -lh'

alias ir='ls' # Colemak typo
alias lsa='ls -A' # everything except . & ..
alias lsa.='ls -Ad .*' # only hidden files & folders
alias lsd='ls -d ^.*(-/DN)' # unhidden folders
alias lsd.='ls -d .*(-/DN)' # hidden folders
alias lsda='ls -d *(-/DN)' # all folders

alias grep='grep --color=auto'

# Disable correction for some programs
for cmd in alias cp mv mkdir which;
alias $cmd="nocorrect $cmd"

# Globbing exceptions
for cmd in alias expr find mattrib mcopy mdir mdel which;
alias $cmd="noglob $cmd"

# Git alias for Dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/.git --work-tree=$HOME/.dotfiles'
# }
# Completion {
autoload -U compinit
compinit

# Enable completion listing extensions
zmodload zsh/complist # &> /dev/null
autoload -U complist
# }
# Completion style {
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo matches for: %d%b.'

# Case insensitive completion from lowercase to any case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


zstyle ':completion:*' users resolve
hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*})
zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=30;41'
zstyle ':completion:*:*:*:*:users' list-colors '=*=$color[green]=$color[red]'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose true
zstyle ':completion:*' special-dirs yes # Complete ..<Tab> -> ../
zstyle ':completion:*:cd:*' ignore-parents parent pwd # Ignore parent directory when ../<Tab>
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.(o|c~|zwc)' '*?~' # What does this do?
# Cache
zstyle ':completion:*' use-cache on
# }
# Command history {
HISTFILE=$HOME/.zsh/History.log
HISTSIZE=50
SAVEHIST=0
# }
# Copied from http://dotshare.it/dots/58/
function battery_indicator {
    case $OSTYPE in darwin*) echo $($HOME/.zsh/battery-indicator-mac/battery-indicator-mac.py) 2>/dev/null ;; esac
}
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '•'
}
# Make "backward-word" stop at slashes but all other functions remain untouched
tcsh-backward-word() {
   local WORDCHARS="${WORDCHARS:s@/@}"
   zle backward-word
}
zle -N tcsh-backward-word
# }
# Options {
# Changing directories
setopt autocd # Example: '/home' becomes 'cd /home'
setopt autopushd
setopt pushdignoredups
#setopt pushdminus
#setopt pushdsilent
# Completion
setopt alwaystoend
unsetopt autolist
setopt automenu
setopt autoparamkeys
#setopt autoparamslash
setopt autoremoveslash
setopt bashautolist # If set will require another <Tab> for menu
unsetopt completeinword
unsetopt globcomplete
unsetopt listambiguous
setopt listpacked
setopt listtypes
unsetopt menucomplete # I definitely don't want this
unsetopt recexact # YOU DO NOT WANT THIS "In completion, recognize exact matches even if they are ambiguous."
# Expansion and globbing
#setopt equals # <Z> Enable '=' expansion
unsetopt extendedglob # < > Does this make sense to have?
#setopt glob # <D>
# History
setopt histfindnodups
setopt histignoredups
setopt histignorespace # Prepend any line with space and history will ignore it
setopt histlexwords # More accurately delimited words, might be slow
setopt histnostore
setopt incappendhistory
# Initialisation
# #
# Input/Output
#unsetopt clobber # Don't overwrite existing files with >
#setopt correct
unsetopt flowcontrol
setopt interactivecomments
setopt rmstarwait
# Job control
#unsetopt bgnice # Don't nice backgrounded apps
#unsetopt checkjobs
unsetopt hup
# Empty sections {
# Prompting
# Scripts and functions
# Shell emulation
# Shell state
# }
# ZLE
setopt nobeep # Never BEEP in ZLE
#setopt combiningchars # Might help with NFD/NFC
# }
# Prompt {
#autoload -U promptinit
#promptinit
#prompt pws
PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} $(git_super_status)
$ '
#$(prompt_char) '
RPROMPT='$(battery_indicator)'
# }
# Key bindings {
autoload zkbd
if [ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE ] ; then
    echo 'It is recommended to run `zkbd`.'
else
    source ${ZDOTDIR:-$HOME}/.zkbd/$TERM-$VENDOR-$OSTYPE
fi

bindkey -e
#bindkey -v
bindkey "^J" self-insert
bindkey -M viins "^R" history-incremental-search-backward
bindkey -M vicmd "^R" history-incremental-search-backward
bindkey -M viins "^[f" emacs-forward-word
bindkey -M vicmd "^[f" emacs-forward-word
bindkey -M viins "^[b" emacs-backward-word
bindkey -M vicmd "^[b" emacs-backward-word
bindkey -M viins "^P" up-history
bindkey -M vicmd "^P" up-history
bindkey -M viins "^N" down-history
bindkey -M vicmd "^N" down-history
bindkey -M viins "^[d" delete-word
bindkey -M vicmd "^[d" delete-word
bindkey -M viins "^[^?" backward-kill-word
bindkey -M vicmd "^[^?" backward-kill-word
bindkey -M viins "^[^h" backward-kill-word
bindkey -M vicmd "^[^h" backward-kill-word
#bindkey -M viins "^[[3~" delete-char
#bindkey -M vicmd "^[[3~" delete-char
[[ -n ${key[Backspace]} ]] && bindkey -M vicmd "${key[Backspace]}" backward-delete-char
[[ -n ${key[Delete]} ]] && bindkey -M vicmd "${key[Delete]}" delete-char

[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char
[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
#[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
#[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
# }
# Scripts {
# Fish-like syntax highlighting
. $HOME/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
# Fish-like history search
. $HOME/.zsh/history-substring-search/zsh-history-substring-search.zsh
# Git Prompt
. $HOME/.zsh/git-prompt/zshrc.sh
# }

