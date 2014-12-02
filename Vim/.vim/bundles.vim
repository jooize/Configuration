set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rkitover/vimpager'
"Plugin 'mileszs/ack.vim'
"Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-repeat' " Maps u
Plugin 'tpope/vim-git'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'jooize/vim-colemak'
Plugin 'matchit.zip'
"Plugin 'scratch.vim'
"Plugin 'ervandew/supertab'
" Added 2012-12-27
"Plugin 'tpope/vim-surround'
"Plugin 'scrooloose/nerdtree'
"Plugin 'git://git.wincent.com/command-t.git'
Plugin 'scrooloose/syntastic'
" Added 2013-01-03
"Plugin 'maxbrunsfeld/vim-yankstack' " Maps u
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Added 2013-03-10
"Plugin 'jamesinchina/eclim-vundle'
" Added 2013-03-23
Plugin 'jooize/Rainbow-Parentheses-Improved-and2'
"Plugin 'jooize/vim-remote-clipboard'
"Plugin 'chrisbra/SudoEdit.vim'
Plugin 'nginx.vim'
Plugin 'othree/html5.vim'
" Added 2013-07-20
"Plugin 'Floobits/floobits-vim'
"Plugin 'sjl/vitality.vim'
Plugin 'ciaranm/securemodelines'
Plugin 'jooize/vim-bracketed-paste'
" Added 2013-10-04
"Plugin 'davidhalter/jedi-vim'
" Added 2013-12-15
Plugin 'hynek/vim-python-pep8-indent'

call vundle#end()
filetype plugin indent on
