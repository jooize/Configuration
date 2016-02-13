#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Default
#
export BLOCKSIZE='K'
export MAIL="/var/mail/$USER"

#
# Terminal type, fix for Tmux race condition. -- http://blog.sanctum.geek.nz/terminal-colour-tolerance/
#
case "$CONTAINING_TERM" in
  *256col*)
    export TERM='screen-256color'
    unset CONTAINING_TERM
    ;;
esac

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'

if [[ -e "$HOME/.vim/bundle/vimpager/vimpager" ]]; then
  export PAGER="$HOME/.vim/bundle/vimpager/vimpager"
else
  export PAGER='less'
fi

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

if [[ "$LC_CTYPE" == 'UTF-8' ]]; then
  export LC_CTYPE='en_US.UTF-8'
fi

#
# Paths
#

typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  /usr/sbin
  $path
  $HOME/Executables
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

#
# Temporary Files
#

if [[ -d "$TMPDIR" ]]; then
  export TMPPREFIX="${TMPDIR%/}/zsh"
  if [[ ! -d "$TMPPREFIX" ]]; then
    mkdir -p "$TMPPREFIX"
  fi
fi

