set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'rkitover/vimpager'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-git'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jooize/vim-colemak'
Bundle 'matchit.zip'
Bundle 'scratch.vim'
Bundle 'ervandew/supertab'
" Added 2012-12-27
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'scrooloose/syntastic'
" Added 2013-01-03
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Added 2013-01-21
Bundle 'vim-scripts/Rainbow-Parentheses-Improved-and2.git'
" Added 2013-03-10
Bundle 'jamesinchina/eclim-vundle'

filetype plugin indent on
