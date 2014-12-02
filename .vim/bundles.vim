set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'rkitover/vimpager'
"Bundle 'mileszs/ack.vim'
"Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
"Bundle 'tpope/vim-repeat' " Maps u
Bundle 'tpope/vim-git'
"Bundle 'altercation/vim-colors-solarized'
Bundle 'jooize/vim-colemak'
Bundle 'matchit.zip'
"Bundle 'scratch.vim'
"Bundle 'ervandew/supertab'
" Added 2012-12-27
"Bundle 'tpope/vim-surround'
"Bundle 'scrooloose/nerdtree'
"Bundle 'git://git.wincent.com/command-t.git'
Bundle 'scrooloose/syntastic'
" Added 2013-01-03
"Bundle 'maxbrunsfeld/vim-yankstack' " Maps u
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Added 2013-03-10
"Bundle 'jamesinchina/eclim-vundle'
" Added 2013-03-23
Bundle 'jooize/Rainbow-Parentheses-Improved-and2'
"Bundle 'jooize/vim-remote-clipboard'
"Bundle 'chrisbra/SudoEdit.vim'
Bundle 'nginx.vim'
Bundle 'othree/html5.vim'
" Added 2013-07-20
"Bundle 'Floobits/floobits-vim'
"Bundle 'sjl/vitality.vim'
Bundle 'ciaranm/securemodelines'
Bundle 'jooize/vim-bracketed-paste'
" Added 2013-10-04
"Bundle 'davidhalter/jedi-vim'
" Added 2013-12-15
Bundle 'hynek/vim-python-pep8-indent'

filetype plugin indent on
