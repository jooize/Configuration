# Modeline & Notes {
#     vim: set foldmarker={,} foldlevel=0:
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

export LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';

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
# Functions {
function rc { [[ -n $1 ]] && sudo /etc/rc.d/$1 ${@:/$1} }
function rcl { [[ -n $1 ]] && sudo /usr/local/etc/rc.d/$1 ${@:/$1} }
function mkcd { command mkdir -p "$@" && cd "$@" }
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
setopt autolist
setopt automenu
setopt autoparamkeys
#setopt autoparamslash
setopt autoremoveslash
#setopt bashautolist # If set will require another <Tab> for menu
setopt completeinword
setopt globcomplete
setopt listambiguous
setopt listpacked
setopt listtypes
unsetopt menucomplete # I definitely don't want this
setopt recexact # "In completion, recognize exact matches even if they are ambiguous."
# Expansion and globbing
#setopt equals # <Z> Enable '=' expansion
setopt extendedglob # < > Does this make sense to have?
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
$(prompt_char) '
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
